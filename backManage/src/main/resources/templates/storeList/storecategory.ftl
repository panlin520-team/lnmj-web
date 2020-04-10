<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
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
    <#include "../baseFtl/pageAuth.ftl" />
    <style>
        .resetLabel {
            width: 56px;
        }
    </style>
</head>
<body>

<div class="layui-fluid">

    <div class="demoTable layui-form">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label resetLabel">分类名称</label>
                <div class="layui-input-inline">
                    <input class="layui-input" type="text" name="keyWordStoreCategoryName" autocomplete="off"
                           placeholder="输入分类名称">
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
    <table id="storeCategory" lay-filter="demo"></table>
</div>

<div id="addeditformdivid" hidden="" class="layui-fluid layui-form-pane layui-personal" style="margin: 15px;">
    <form class="layui-form" action="" id="addeditformid">

        <div class="layui-form-item">
            <label class="layui-form-label">门店分类名称</label>
            <div class="layui-input-block">
                <input type="text" name="storeCategoryName" lay-verify="required" autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="addeditsubmitfilter">立即提交</button>
                <button id="reset" type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>


<script>
    //列表显示
    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#storeCategory'
            , url: storeHost + "/manage/store/storeCategoryList"
            , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , page: true          //显示分页默认不显示
            , method: 'post'
            , id: "listStoreCategoryTable"
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
                , {field: 'storeCategoryId', title: '店铺分类id'}
                , {field: 'storeCategoryName', edit: 'text', title: '店铺分类名称'}
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
        //监听表格复选框选择
        table.on('checkbox(demo)', function (obj) {
        });
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


        //监听添加提交
        form.on('submit(addeditsubmitfilter)', function () {
            //为了防止form中的id值被重置后置空,将编辑的id存放在label中
            $("#editid").val($("#editlabelid").html());
            $("#editlabelid").html("");
            $.ajax({
                type: "POST",
                url: storeHost + "/manage/store/insertStoreCategory",
                data: $('#addeditformid').serialize() + "&createOperator=" + "${currentUser.trueName!}"+ "&companyId=" + "${currentUser.companyId!}"+ "&companyType=" + "${currentUser.companyType!}",
                async: false,
                error: function (request) {
                    layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
                },
                success: function (data) {
                    if (data.responseStatusType.message == 'Success') {
                        layer.open({
                            title: '添加',
                            content: "添加成功",
                            btn: ["确定", "关闭"],
                            yes: function (index) {
                                layer.close(index); //如果设定了yes回调，需进行手工关闭
                            },
                            btn2: function (index) {
                            }, end: function () {
                                $("#reset").click();//重置表单
                                layer.close(addForm);
                                table.reload("listStoreCategoryTable");
                            }
                        });
                    } else {
                        layer.alert(data.responseStatusType.error.errorMsg);
                    }
                }
            });
            return false;
        });


        var $ = layui.$, active = {
            search: function () {
                var keyWordStoreCategoryName = $(".demoTable input[name='keyWordStoreCategoryName']").val();
                table.render({
                    elem: '#storeCategory'
                    , url: storeHost + "/manage/store/storeCategoryList"
                    , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    , page: true          //显示分页默认不显示
                    , method: 'post'
                    , id: "listStoreCategoryTable"
                    , request: {
                        pageName: 'pageNum', //页码的参数名称，默认：page
                        limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    }
                    , where: {
                        keyWordStoreCategoryName: keyWordStoreCategoryName
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
                        , {field: 'storeCategoryId', title: '店铺分类id'}
                        , {field: 'storeCategoryName', edit: 'text', title: '店铺分类名称'}
                        , {fixed: 'right', title: '操作', align: 'center', toolbar: '#barDemo'}
                    ]]
                });
            }
        };

        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    });


    //添加按钮点击事件
    var addForm = null;
    $("#add").click(function () {
        $("#reset").click();//重置表单(新建时在进入表单前要重置一下表单的内容，不然表单打开后会显示上一次的表单的内容。这里调用表单中重置按钮的点击方法来重置)
        addForm = layer.open({//开启表单弹层
            // // skin: 'layui-layer-molv',
            area: '60%',
            type: 1,
            id: "addStoreCategory",
            title: '新建店铺分类',
            content: $('#addeditformdivid'), //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
            success: function () {

            }

        });
    });


    //删除分类按钮事件
    function layerDelete(data, table, $) {
        //删除数据库数据
        var url = storeHost + "/manage/store/deleteStoreCategory";
        var data = {
            storeCategoryId: data.storeCategoryId
        };
        $.post(url, data, function (res) {
            if (res.responseStatusType.message == "Success") {
                layer.open({
                    title: '删除'
                    , content: '删除成功！'
                });
                //重新加载表格
                table.reload("listStoreCategoryTable");
            } else {
                layer.open({
                    title: '删除'
                    , content: '删除失败！'
                });
            }
        })
    }


</script>


<script>
    layui.use('table', function () {
        var table = layui.table;
        //监听单元格编辑
        table.on('edit(demo)', function (obj) {
            var value = obj.value //得到修改后的值
                , data = obj.data //得到所在行所有键值
                , field = obj.field; //得到字段
            layer.msg('[ID: ' + data.postId + '] ' + field + ' 字段更改为：' + value, {
                time: 20000, //20s后自动关闭
                btn: ['确认修改', '取消'],
                yes: function (index, layero) {
                    var url = storeHost + "/manage/store/updateStoreCategory";
                    var params = {
                        storeCategoryId: data.storeCategoryId,
                        storeCategoryName: value,
                        modifyOperator: "${currentUser.trueName!}"
                    };
                    $.post(url, params, function (res) {
                        if (res.responseStatusType.message == "Success") {
                            layer.msg("修改成功")
                            table.reload("listStoreCategoryTable");
                        } else {
                            layer.msg(res.responseStatusType.error.errorMsg, {
                                time: 20000, //20s后自动关闭
                                btn: ['明白了']
                            });
                        }
                    })
                },
                btn2: function () {
                    table.reload("listStoreCategoryTable");
                }
            });
        });
    });

</script>
</body>
</html>