<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>行业管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${basePath!}/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${basePath!}/css/index.css" media="all"/>
    <script src="${basePath!}/layui/layui.js" charset="utf-8"></script>
    <script src="${basePath!}/js/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${basePath!}/assets/city-picker.data.js"></script>
    <script type="text/javascript" src="${basePath!}/assets/province.js"></script>
    <script src="${basePath!}/js/host.js" type="text/javascript"></script>
    <#include "../../baseFtl/pageAuth.ftl" />

</head>
<body>

<div class="layui-fluid">
    <div class="demoTable layui-form">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">行业名称</label>
                <div class="layui-input-inline">
                    <input class="layui-input" type="text" name="industryNameKeyword" autocomplete="off"
                           placeholder="请输入公司名称">
                </div>

            </div>

            <div class="layui-inline">
                <button class="layui-btn" data-type="search"><i class="layui-icon layui-icon-search"></i></button>
            </div>
            <div class="layui-inline">
                <div class="layui-btn-group demoTable">
                    <button class="layui-btn" id="add">增加</button>
                </div>
            </div>
        </div>
    </div>
    <table id="industry" lay-filter="demo"></table>

</div>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>


<#--添加表单-->
    <div class="layui-fluid layui-form-pane layui-personal" id="addDiv" hidden="" style="margin: 15px;">
        <form class="layui-form" id="addForm" action="" lay-filter="example" method="post">
            <div class="layui-form-item">
                <label class="layui-form-label">行业名称</label>
                <div class="layui-input-block">
                    <input type="text" name="industryName" lay-verify="required" autocomplete="off"
                           placeholder="请输入行业名称"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit="" lay-filter="addsubmitfilter">立即提交</button>
                    <button id="reset" type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>

<#--<div id="jinduDiv" hidden="hidden" >-->
    <div style="display:none;" id="show">
    <div class="layui-progress layui-progress-big" lay-showpercent="true" lay-filter="demoJinDu" id="demoJinDu"
         hidden="hidden">
        <div class="layui-progress-bar layui-bg-red" lay-percent="0%"></div>
    </div>
</div>

<#--<div style="width: 100%;height: 100%;position: fixed;background: rgba(249, 245, 245, 0.5);display: block;" id="a">-->
<#--<div class="layui-progress layui-progress-big" lay-showpercent="true" lay-filter="demoJinDu" >-->
<#--<div class="layui-progress-bar layui-bg-red" lay-percent="0%"></div>-->
<#--</div>-->
<#--</div>-->


<script>
    //列表显示
    var addOpen = null;
    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#industry'
            , url: storeHost + "/manage/industry/selectList"
            , id: "industryReload"
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
            , cols: [[
                {type: 'checkbox', fixed: 'left', width: 40}
                , {field: 'industryID', title: 'id', sort: true, fixed: 'left'}
                , {field: 'industryName', edit: 'text', title: '行业名称'}
                , {fixed: 'right', title: '操作', align: 'center', toolbar: '#barDemo'}

            ]]
        });
    });


    layui.use(['table', 'layer', 'jquery', 'form', 'element'], function () {
        var table = layui.table,
            $ = layui.jquery,
            form = layui.form,
            element = layui.element;
        element.progress('demo', '0%')
        //监听工具条
        table.on('tool(demo)', function (obj) {
            var data = obj.data;
            if (obj.event === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    layerDelete(data, table, $);
                    obj.del();
                    layer.close(index);
                });
            }
        });

        var $ = layui.$, active = {
            search: function () {
                var industryNameKeyword = $(".demoTable input[name='industryNameKeyword']").val();
                table.render({
                    elem: '#industry'
                    , url: storeHost + "/manage/industry/selectList"
                    , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    , page: true          //显示分页默认不显示
                    , method: 'post'
                    , request: {
                        pageName: 'pageNum', //页码的参数名称，默认：page
                        limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    }
                    , where: {
                        industryNameKeyword: industryNameKeyword
                    }
                    , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                        return {
                            "code": 0, //解析接口状态
                            "msg": "", //解析提示文本
                            "count": res.result == null ? 0 : res.result.total, //解析数据长度
                            "data": res.result == null ? 0 : res.result.list //解析数据列表
                        };
                    }
                    , cols: [[
                        {type: 'checkbox', fixed: 'left', width: 40}
                        , {field: 'industryID', title: 'id', sort: true, fixed: 'left'}
                        , {field: 'industryName', edit: 'text', title: '行业名称'}
                        , {fixed: 'right', title: '操作', align: 'center', toolbar: '#barDemo'}

                    ]]
                });
            }
        };
        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        //添加提交
        form.on('submit(addsubmitfilter)', function (data) {
            /* ----------------提交的代码------------------*/
            var url = storeHost + "/manage/industry/addIndustry";
            var params = {
                industryName: $("input[name='industryName']").val(),
                createOperator: "${currentUser.trueName!}"
            };
            $("#demoJinDu").show();

            // layer.open({
            //     type: 3,
            //     area: ['100%', '100%'],
            //     content: $('#jinduDiv')
            // });

            layer.open({
                type: 1,
                content: $("#show"),
                success: function (layero, index) {
                    fun = setInterval(function () {
                        element.progress('demo', t + '%');
                        if (t >= 100) {
                            clearInterval(fun);
                            layer.close(show);
                        } else {
                            t++;
                        }
                    }, 100)
                },
                end: function () {
                    element.progress('demo', '0%');
                    clearInterval(fun);
                }
            })



            $.ajax({
                type: "POST",
                url: url,
                data: params,
                async: true,
                beforeSend: function () {

                },
                error: function (request) {
                    layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
                },

                success: function (data) {
                    if (data.responseStatusType.message == "Success") {
                        // setTimeout(function(){
                        //     $("#demoJinDu").hide();
                        // }, 1000);
                        layer.open({
                            title: '添加'
                            , content: '添加成功！'
                            , btn: ["关闭"]
                            , btn2: function (index) {
                                layer.close(index);

                            }, end: function () {
                                table.reload("industryReload");
                                layer.close(addOpen);
                            }
                        });
                        //重新加载表格
                        layui.form.render();
                    } else {
                        layer.msg(data.responseStatusType.error.errorMsg, {
                            time: 20000, //20s后自动关闭
                            btn: ['明白了']
                        });
                    }
                    element.progress('demoJinDu', '100%')
                    $("#jinduDiv").hide();
                }
            });
            return false;
        });
    });


    //删除行业按钮事件
    function layerDelete(data, table, $) {
        var url = storeHost + "/manage/industry/deleteIndustry";
        var data = {
            industryID: data.industryID,
            modifyOperator: "${currentUser.trueName!}"
        };
        $.post(url, data, function (res) {
            if (res.responseStatusType.message == "Success") {
                layer.open({
                    title: '删除'
                    , content: '删除成功！'
                });
                c
                //重新加载表格
                table.reload("industryReload");
            } else {
                layer.open({
                    title: '删除'
                    , content: '删除失败！'
                });
            }
        })
    }


    $("#add").click(function () {
        $("#reset").click();//重置表单(新建时在进入表单前要重置一下表单的内容，不然表单打开后会显示上一次的表单的内容。这里调用表单中重置按钮的点击方法来重置)
        addOpen = layer.open({//开启表单弹层
            area: '60%',
            type: 1,
            title: '新建行业',
            content: $('#addDiv'), //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
            success: function () {

            }

        });
    });
    //监听单元格编辑
    layui.use('table', function () {
        var table = layui.table;
        table.on('edit(demo)', function (obj) {
            var value = obj.value //得到修改后的值
                , data = obj.data //得到所在行所有键值
                , field = obj.field; //得到字段
            var paramsValue = null;
            if (field == "industryName") {
                paramsValue = {
                    industryID: data.industryID,
                    industryName: value,
                    modifyOperator: "${currentUser.trueName!}"
                };
            }
            layer.msg('[ID: ' + data.postId + '] ' + field + ' 字段更改为：' + value, {
                time: 20000, //20s后自动关闭
                btn: ['确认修改', '取消'],
                yes: function (index, layero) {
                    var url = storeHost + "/manage/industry/updateIndustry";
                    var params = paramsValue;
                    $.post(url, params, function (res) {
                        if (res.responseStatusType.message == "Success") {
                            layer.msg("修改成功")
                            table.reload("industryReload");
                        } else {
                            layer.msg(res.responseStatusType.error.errorMsg, {
                                time: 20000, //20s后自动关闭
                                btn: ['明白了']
                            });
                        }
                    })
                },
                btn2: function () {
                    table.reload("industryReload");
                }
            });
        });
    });
</script>


</body>
</html>