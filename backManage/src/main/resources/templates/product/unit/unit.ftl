<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>单位管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${basePath!}/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${basePath!}/css/index.css" media="all"/>
    <script src="${basePath!}/layui/layui.js" charset="utf-8"></script>
    <script src="${basePath!}/js/jquery.min.js" type="text/javascript"></script>
    <script src="${basePath!}/js/Sortable.js" type="text/javascript"></script>
    <script src="${basePath!}/js/host.js" type="text/javascript"></script>
    <#include "../../baseFtl/pageAuth.ftl" />
    <style>
        .resetLabel {
            width: 30px;
        }

        label.xrequired:before {
            content: '* ';
            color: red;
        }
    </style>
</head>
<body>

<div class="layui-fluid">
    <div class="demoTable layui-form">
        <div class="layui-btn-group" align="left">
            <button class="layui-btn" id="addUnit">添加单位</button>
        </div>
        <table id="unit" lay-filter="demo"></table>
    </div>
</div>


<form id="form" class="layui-form layui-form-pane layui-personal" action="" lay-filter="form" method="post" hidden="true">

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label xrequired">单位编码</label>
            <div class="layui-input-inline">
                <input type="text" name="unitCode" lay-verify="required" autocomplete="off" placeholder="请输入单位编码"
                       class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label xrequired">单位名称</label>
            <div class="layui-input-block">
                <input type="text" name="unitName" lay-verify="required" autocomplete="off" placeholder="请输入单位名称"
                       class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired">所属单位组</label>
        <div class="layui-input-inline">
            <select name="UnitGroup" lay-filter="UnitGroup" lay-verify="required">
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired">舍入类型</label>
        <div class="layui-input-inline">
            <select name="Froundtype" lay-filter="Froundtype" lay-verify="required">
            </select>
        </div>
    </div>
    <div class="layui-form-item" id="createOperator">
        <div class="layui-inline">
            <label class="layui-form-label">创建人</label>
            <div class="layui-input-block">
                <input type="text" name="createOperator" autocomplete="off" placeholder="请输入创建人"
                       class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item" id="modifyOperator">
        <div class="layui-inline">
            <label class="layui-form-label">修改人</label>
            <div class="layui-input-block">
                <input type="text" name="modifyOperator" autocomplete="off" placeholder="请输入修改人"
                       class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item" hidden="hidden">
        <div class="layui-input-block">
            <button id="reset" type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>


<script>

    var Group;
    var froundType;

    //列表显示
    layui.use('table', function () {
        loadUnitGroup();
        loadFroundType();
        var table = layui.table;
        table.render({
            elem: '#unit'
            , url: productHost + "/unit/selectUnitList"
            , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , page: true          //显示分页默认不显示
            , method: 'post'
            , request: {
                pageName: 'pageNum', //页码的参数名称，默认：page
                limitName: 'pageSize' //每页数据量的参数名，默认：limit
            }
            , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                return {
                    "code": 0, //解析接口状态
                    "msg": "", //解析提示文本
                    "count": res.result == null ? 0 : res.result.total, //解析数据长度
                    "data": res.result == null ? 0 : res.result.list //解析数据列表
                };
            }
            ,where: {
                storeId:"${currentUser.storeId!}"
            }
            , id: 'unitRender'
            , cols: [[
                // {type: 'checkbox', fixed: 'left', width: 40},
                {field: 'unitCode', title: '单位编码',  fixed: 'left'}
                , {field: 'unitName', title: '单位名称',  fixed: 'left'}
                , {field: 'unitGroupId', title: '所属单位组',fixed: 'left',templet: function (d) {
                        for (var n in Group) {
                            if (n == d.unitGroupId) {
                                return Group[n];
                            }
                        }
                    }}
                , {field: 'froundtypeId', title: '舍入方式', fixed: 'left', templet: function (d) {
                        for (var n in froundType) {
                            if (n == d.froundtypeId) {
                                return froundType[n];
                            }
                        }
                    }}
                , {fixed: 'right', title: '操作',width: 180, align: 'center', toolbar: '#barDemo'}
            ]]
        });

    });

    //增删改查操作实现
    layui.use(['table', 'layer', 'jquery', 'form'], function () {
        var table = layui.table,
            layer = layui.layer,
            $ = layui.jquery,
            form = layui.form;
        //监听工具条
        var data = null;

        table.on('tool(demo)', function (obj) {
            data = obj.data;
            if (obj.event === 'detail') {
                $("#createOperator").removeAttr("hidden");
                $("#modifyOperator").removeAttr("hidden");
                layerShow(data, table, $, form)
            } else if (obj.event === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    layerDelete(data, table, $);
                    obj.del();
                    layer.close(index);
                });
            } else if (obj.event === 'edit') {
                $("#createOperator").attr("hidden", "hidden");
                $("#modifyOperator").attr("hidden", "hidden");
                layerShowAndEdit(data, table, $, form);
            }
        })

        //----------------------添加单位点击事件--------------------------
        $(document).on('click', '#addUnit', function () {
            $("#createOperator").attr("hidden", "hidden");
            $("#modifyOperator").attr("hidden", "hidden");
            $("#reset").click();
            var a = layer.open({
                type: 1,
                title: '添加单位',
                content: $('#form'),
                area: ['450px', '400px'],
                closeBtn: 1,
                btn: ['确定', '取消'],
                success: function (layero) {
                    // 校验方法添加（追加class，filter属性）
                    layero.addClass('layui-form');
                    layero.find('.layui-layer-btn0').attr('lay-filter', 'formVerify').attr('lay-submit', '');
                    layui.form.render();
                },
                yes: function (index, layero) {
                    layui.form.on('submit(formVerify)', function (data) {
                        var url = productHost + "/unit/addUnit";

                        var unitCode = layero.find("input[name='unitCode']").val();
                        var unitName = layero.find("input[name='unitName']").val();
                        var unitGroupId = $("select[name='UnitGroup'] option:selected").val();
                        var froundtypeId = $("select[name='Froundtype'] option:selected").val();
                        var params = {
                             unitCode: unitCode
                            ,unitName: unitName
                            ,unitGroupId: unitGroupId
                            ,froundtypeId: froundtypeId
                            ,createOperator: "${currentUser.trueName!}"
                        };
                        var index = null
                        $.ajax({
                            url: url,
                            data: params,
                            async: true,
                            type: "POST",
                            beforeSend: function () {
                                index = layer.load(3, {
                                    shade: [0.9, '#fff'] //0.1透明度的白色背景
                                });
                            },
                            error: function (request) {
                                layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
                                layer.close(index);    //返回数据关闭loading
                            },
                            success: function (res) {
                                layer.close(index);
                                if (res.responseStatusType.message == "Success") {
                                    //重新加载表格
                                    layer.msg(res.result);
                                    //重新加载表格
                                    table.reload('unitRender', {
                                        page: {
                                            curr: 1 //重新从第 1 页开始
                                        }
                                    }, 'data');
                                    layer.close(a);
                                } else {
                                    layer.open({
                                        title: '添加'
                                        , content: '添加失败！'
                                        , btn: ["关闭"]
                                    });
                                }
                            }
                        });
                        return false;
                    })
                },
                btn2: function () {
                    layer.closeAll();
                },
            });
        });

    });

    //删除用户按钮事件
    function layerDelete(data, table, $) {
        //删除数据库数据
        var url = productHost + "/unit/deleteUnit";
        var data = {
            unitId: data.unitId,
            modifyOperator: "${currentUser.trueName!}"
        };
        $.post(url, data, function (res) {
            if (res.responseStatusType.message == "Success") {
                layer.open({
                    title: '删除'
                    , content: '删除成功！'
                });
                //重新加载表格
                //重新加载表格
                table.reload('unitRender', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                }, 'data');
            } else {
                layer.open({
                    title: '删除'
                    , content: '删除失败！'
                });
            }
        })
    }

    //修改按钮事件
    function layerShowAndEdit(data, table, $, form) {
        //页面弹框
        var a1 = layer.open({
            type: 1,
            title: '单位编辑',
            content: $('#form'),
            area: ['450px', '400px'],
            closeBtn: 1,
            btn: ['提交', '取消'],

            btn2: function () {
                layer.close(a1);
            },
            success: function (layero) {
                //表单赋值
                form.val('form', {
                    "unitCode": data.unitCode
                    , "unitName": data.unitName
                    , "UnitGroup": data.unitGroupId
                    , "Froundtype": data.froundtypeId
                    , "createOperator": data.createOperator
                    , "modifyOperator": data.modifyOperator
                });
                layui.form.render();
            }
            ,yes: function (index, layero) {
                    var url = productHost + "/unit/editUnit";
                    var unitCode = layero.find("input[name='unitCode']").val();
                    var unitName = layero.find("input[name='unitName']").val();
                    var unitGroupId = $("select[name='UnitGroup'] option:selected").val();
                    var froundtypeId = $("select[name='Froundtype'] option:selected").val();

                    var params = {
                        "unitId": data.unitId
                        ,"unitCode": unitCode
                        , "unitName": unitName
                        , "unitGroup": unitGroupId
                        , "froundtype": froundtypeId
                        , modifyOperator: "${currentUser.trueName!}"
                    };
                    $.post(url, params, function (res) {
                        if (res.responseStatusType.message == "Success") {
                            //重新加载表格
                            layer.msg("修改成功");
                            layer.close(index);
                            //重新加载表格
                            table.reload('unitRender', {
                                page: {
                                    curr: 1 //重新从第 1 页开始
                                }
                            }, 'data');
                        } else {
                            layer.msg(res.responseStatusType.error.errorMsg, {
                                time: 20000, //20s后自动关闭
                                btn: ['修改失败']
                            });
                        }
                    })
                }
        });
    }

    //查看按钮事件
    function layerShow(data, table, $, form) {
        //页面弹框
        var a2 = layer.open({
            type: 1,
            title: '单位详情',
            content: $('#form'),
            area: ['450px', '400px'],
            closeBtn: 1,
            btn: ['关闭'],
            btn2: function () {
                layer.close(a2);
            },
            success: function (layero) {
                //表单赋值
                form.val('form', {
                    "unitCode": data.unitCode
                    , "unitName": data.unitName
                    , "UnitGroup": data.unitGroupId
                    , "Froundtype": data.froundtypeId
                    , "createOperator": data.createOperator
                    , "modifyOperator": data.modifyOperator
                });
            }
        });
    }

    function loadUnitGroup() {
        var url = productHost + "/unit/selectUnitGroup";
        $.post(url, function (res) {
            var option1;
            if (res.responseStatusType.message == "Success") {
                var list = res.result;    //返回的数据
                Group = res.result;
                option1 = "<option value='' selected='selected'>请选择</option>";
                $("select[name='UnitGroup']").append(option1);
                for (var p in list) {
                    var option = "<option value='" + p + "'>" + list[p] + "</option>";
                    $("select[name='UnitGroup']").append(option);
                }
                layui.form.render();
            } else {
                option1 = "<option value='' selected='selected'>没有对应的单位组</option>";
                $("select[name='UnitGroup']").append(option1);
                option1 = "<option value='' selected='selected'>没有对应的单位组</option>";
                $("select[name='UnitGroup']").empty();
                $("select[name='UnitGroup']").append(option1);
                layui.form.render();
            }
        })
    }

    function loadFroundType() {
        var url = productHost + "/unit/selectFroundType";
        $.post(url, function (res) {
            var option1;
            if (res.responseStatusType.message == "Success") {
                var list = res.result;    //返回的数据
                froundType = res.result;    //返回的数据
                option1 = "<option value='' selected='selected'>请选择</option>";
                $("select[name='Froundtype']").append(option1);
                for (var p in list) {
                    var option = "<option value='" + p + "'>" + list[p] + "</option>";
                    $("select[name='Froundtype']").append(option);
                }
                layui.form.render();
            } else {
                option1 = "<option value='' selected='selected'>没有对应的舍入类型</option>";
                $("select[name='Froundtype']").append(option1);
                option1 = "<option value='' selected='selected'>没有对应的舍入类型</option>";
                $("select[name='Froundtype']").empty();
                $("select[name='Froundtype']").append(option1);
                layui.form.render();
            }
        })
    }

</script>
</body>
</html>
