<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>门店标签</title>
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
    </style>
</head>
<body>

<div class="layui-fluid">
    <div class="demoTable layui-form">
        <div class="layui-btn-group" align="left">
            <button class="layui-btn" onclick="addLable()" style="float: right">添加标签</button>
        </div>
        <table id="poslabel" lay-filter="demo"></table>
    </div>
</div>


<form id="form" class="layui-form layui-form-pane layui-personal" action="" lay-filter="form" method="post" hidden="true">
    <div class="layui-form-item">
        <label class="layui-form-label">标签名称</label>
        <div class="layui-input-inline">
            <input type="text" name="labelName" lay-verify="required" autocomplete="off" placeholder="请输入标签名称"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">标签描述</label>
        <div class="layui-input-inline">
            <input type="text" name="labelDescribe" lay-verify="required" autocomplete="off" placeholder="请输入标签描述"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">订单类型</label>
        <div class="layui-input-inline">
            <select name="orderType" lay-verify="orderType" lay-filter="orderType"></select>
        </div>
    </div>
    <div class="layui-form-item" id="createOperator">
        <label class="layui-form-label">创建人</label>
        <div class="layui-input-inline">
            <input type="text" name="createOperator" lay-verify="required" autocomplete="off" placeholder="请输入创建人"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" id="modifyOperator">
        <label class="layui-form-label">修改人</label>
        <div class="layui-input-inline">
            <input type="text" name="modifyOperator" lay-verify="required" autocomplete="off" placeholder="请输入修改人"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" hidden="hidden">
        <div class="layui-input-inline">
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
    var orderType;
    //加载订单类型
    loadOrderType();
    //列表显示
    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#poslabel'
            , url: accountHost + "/manage/pos/posLabel/selectLabelList"
            , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , page: true          //显示分页默认不显示
            , method: 'post'
            , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                return {
                    "code": 0, //解析接口状态
                    "msg": "", //解析提示文本
                    "count": res.result == null ? 0 : res.result.total, //解析数据长度
                    "data": res.result == null ? 0 : res.result.list //解析数据列表
                };
            }
            ,id:'label'
            , cols: [[
                {type: 'checkbox', fixed: 'left', width: 40}
                , {field: 'labelName', title: ' 标签名称', sort: true, fixed: 'left'}
                , {field: 'labelDescribe', title: '标签描述'}
                , {
                    field: 'orderType', title: '订单类型', templet: function (d) {
                        if (d.orderType == 1) {
                            return '商品订单';
                        }
                        else if (d.orderType == 2) {
                            return '服务订单-美发';
                        }
                        else if (d.orderType == 3) {
                            return '服务订单-美容';
                        }
                        else if (d.orderType == 4) {
                            return '定制订单';
                        }
                        else if (d.orderType == 5) {
                            return '充值订单';
                        }
                        else if (d.orderType == 6) {
                            return '体验卡订单';
                        }
                        else if (d.orderType == 7) {
                            return '赠送订单';
                        }
                        else if (d.orderType == 8) {
                            return '创客订单';
                        } else {
                            return '无订单类型信息';
                        }
                    }
                }
                , {fixed: 'right', title: '操作', align: 'center', toolbar: '#barDemo'}
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
                $("#reset").click();
                if (data.createOperator == null) {
                    $("#createOperator").hide()
                }else if (data.modifyOperator == null) {
                    $("#modifyOperator").hide()
                }
                layerShow(data, table, $, form);
            } else if (obj.event === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    layerDelete(data, table, $);
                    obj.del();
                    layer.close(index);
                });
            } else if (obj.event === 'edit') {
                $("#reset").click();
                $("#createOperator").attr("hidden", "hidden");
                $("#modifyOperator").attr("hidden", "hidden");
                layerShowAndEdit(data, table, $, form);
            }
        })
    });

    //删除用户按钮事件
    function layerDelete(data, table, $) {
        //删除数据库数据
        var url = accountHost + "/manage/pos/posLabel/deleteLabelById";
        var data = {
            labelId: data.labelId,
            modifyOperator: "${currentUser.trueName!}"
        };
        $.post(url, data, function (res) {
            if (res.responseStatusType.message == "Success") {
                layer.msg("删除成功");
                layer.close(index);
                //重新加载表格
                // table.reload('label', {
                //     page: {
                //         curr: 1 //重新从第 1 页开始
                //     }
                //     , where: {
                //         status: 1
                //     }
                // }, 'data');
                window.location.reload();
            } else {
                layer.msg(res.responseStatusType.error.errorMsg, {
                    time: 20000, //20s后自动关闭
                    btn: ['删除失败']
                });
            }
        })
    }

    //修改按钮事件
    function layerShowAndEdit(data, table, $, form) {
        //页面弹框
        var a1 = layer.open({
            type: 1,
            title: '用户详情',
            content: $('#form'),
            area: ['500px', '600px'],
            closeBtn: 1,
            btn: ['提交', '取消'],
            yes: function (index, layero) {
                var url = accountHost + "/manage/pos/posLabel/updateLabel";
                var labelName = layero.find("input[name='labelName']").val();
                var labelDescribe = layero.find("input[name='labelDescribe']").val();
                var orderType = layero.find("select[name='orderType']");
                orderType = orderType.find("option:selected").val();
                var params = {
                    labelId: data.labelId,
                    labelName: labelName,
                    orderType: orderType,
                    labelDescribe: labelDescribe,
                    modifyOperator: "${currentUser.trueName!}"
                };
                $.post(url, params, function (res) {
                    if (res.responseStatusType.message == "Success") {
                        layer.msg("添加成功")
                        layer.close(index)
                        //重新加载表格
                        // table.reload('label', {
                        //     page: {
                        //         curr: 1 //重新从第 1 页开始
                        //     }
                        //     , where: {
                        //         status: 1
                        //     }
                        // }, 'data');
                    } else {
                        layer.msg(res.responseStatusType.error.errorMsg, {
                            time: 20000, //20s后自动关闭
                            btn: ['修改失败']
                        });
                    }
                })
            },
            btn2: function () {
                layer.close(a1);
            },
            success: function (layero) {
                //表单赋值
                form.val('form', {
                    "labelName": data.labelName
                    ,"orderType": data.orderType
                    , "labelDescribe": data.labelDescribe
                });
                layui.form.render();
            }
            , end: function () {
                window.location.reload();
            }
        });
    }

    //查看按钮事件
    function layerShow(data, table, $, form) {
        //页面弹框
        var a2 = layer.open({
            type: 1,
            title: '门店标签详情',
            content: $('#form'),
            area: ['500px', '600px'],
            closeBtn: 1,
            btn: ['关闭'],
            btn2: function () {
                layer.close(a2);
            },
            success: function (layero) {
                //表单赋值
                form.val('form', {
                    "labelName": data.labelName
                    , "labelDescribe": data.labelDescribe
                    , "orderType": data.orderType
                    , "createOperator": data.createOperator
                    , "modifyOperator": data.modifyOperator
                });
            }
        });
    }

    function addLable() {
        $("#createOperator").attr("hidden", "hidden");
        $("#modifyOperator").attr("hidden", "hidden");
        $("#reset").click();
        layer.open({
            type: 1,
            title: '添加标签',
            content: $('#form'),
            closeBtn: 1,
            area: ['500px', '600px'],
            btn: ['确定', '取消'],
            yes: function (index, layero) {
                var url = accountHost + "/manage/pos/posLabel/addPosLabel";
                var orderType = layero.find("select[name='orderType']");
                orderType = orderType.find("option:selected").val();
                var params = {
                    labelName: layero.find("input[name='labelName']").val(),
                    orderType: orderType,
                    labelDescribe: layero.find("input[name='labelDescribe']").val(),
                    createOperator: "${currentUser.trueName!}"
                };
                $.post(url, params, function (res) {
                    if (res.responseStatusType.message == "Success") {
                        layer.msg("添加成功");
                        layer.close(index);
                        //重新加载表格
                        // table.reload('label', {
                        //     page: {
                        //         curr: 1 //重新从第 1 页开始
                        //     }
                        //     , where: {
                        //         status: 1
                        //     }
                        // }, 'data');
                    } else {
                        layer.msg("添加失败！");
                    }
                })
            },
            btn2: function () {
                layer.closeAll();
            },
            end: function () {
                window.location.reload();
            }
        });
    }

    function loadOrderType() {
        var url = orderHost + "/order/selectOrderTypeList";
        $.post(url, function (res) {
            if (res.responseStatusType.message == "Success") {
                var list = res.result;    //返回的数据
                orderType = list;
                for (var p in list) {
                    var input = "<option value='" + p + "'>" + list[p] + "</option>";
                    $("select[name='orderType']").append(input);
                }
                // layui.form.render();
            } else {
                layer.msg("加载失败！");
            }
        })
    }

</script>
</body>
</html>
