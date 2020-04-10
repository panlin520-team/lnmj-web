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
            <label class="layui-form-label resetLabel">所属门店</label>
            <div class="layui-inline">
                <select id="storeId" name="storeId" lay-filter="storeId">
                    <option value="0" selected="selected">请选择</option>
                </select>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">电话</label>
                <div class="layui-input-inline">
                    <input class="layui-input" type="text" name="keyWordPhone" autocomplete="off" placeholder="输入电话">
                </div>
            </div>
            <div class="layui-inline">
                <button class="layui-btn" data-type="search"><i class="layui-icon layui-icon-search"></i></button>
            </div>
        </div>
    </div>
    <table id="complaint" lay-filter="demo"></table>
</div>


<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="handle">处理</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<#--点击单行后的表单-->
    <form class="layui-form layui-form-pane layui-personal" id="editForm" action="" lay-filter="example" method="post" hidden="true">

        <div class="layui-form-item">
            <label class="layui-form-label">用户姓名</label>
            <span name="userName"></span>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">用户电话</label>
            <span name="phoneNumber"></span>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">消费时间</label>
            <span name="consumptionTime"></span>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">消费项目</label>
            <span name="consumptionProject"></span>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">消费门店</label>
            <span name="consumptionStore"></span>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">负责人</label>
            <span name="responsibility"></span>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">投诉标题</label>
            <span name="complaintTitle"></span>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">投诉原因</label>
            <span name="complaintReason"></span>
        </div>


    </form>

<#--点击处理后的表单-添加-->
    <form class="layui-form layui-form-pane layui-personal" id="handleForm" action="" lay-filter="example" method="post" hidden="true">
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">处理方案</label>
            <div class="layui-input-block">
                <textarea id="handleMethod" placeholder="请输入内容" class="layui-textarea"></textarea>
            </div>
        </div>
    </form>

<#--处理方案的表单-只是显示-->
    <form class="layui-form layui-form-pane layui-personal" id="handleFormShow" action="" lay-filter="example" method="post" hidden="true">
        <div class="layui-form-item">
            <label class="layui-form-label">处理方案</label>
            <span name="handleMethod"></span>
        </div>
        <button id="addHandleDo" type="button" class="layui-btn">添加方案实施</button>
        <button id="checkHandleDo" type="button" class="layui-btn">查看方案实施情况</button>
        <button id="addHandleResult" type="button" class="layui-btn">添加处理结果</button>
    </form>


<#--点击添加处理实施的表单-添加-->
    <form class="layui-form layui-form-pane layui-personal" id="handleTrackForm" action="" lay-filter="example" method="post" hidden="true">
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">方案实施</label>
            <div class="layui-input-block">
                <textarea id="handleDo" placeholder="请输入内容" class="layui-textarea"></textarea>
            </div>
        </div>
    </form>

<#--点击添加处理实施的表单-查看-->
    <form class="layui-form layui-form-pane layui-personal" id="handleTrackFormTable" action="" lay-filter="example" method="post" hidden="true">
        <table id="complaintTrackTable" lay-filter="demo"></table>
    </form>


<#--点击添加处理实施结果的表单-添加-->
<form class="layui-form layui-form-pane layui-personal" id="handleResultForm" action="" lay-filter="example" method="post" hidden="true">
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">方案实施结果</label>
        <div class="layui-input-block">
            <textarea id="handleResult" placeholder="请输入内容" class="layui-textarea"></textarea>
        </div>
    </div>
</form>
<script>
    var storeList = loadShopName()

    //列表显示
    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#complaint'
            , url: systemHost + "/complaint/complaintList"
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
            , cols: [[
                {type: 'checkbox', fixed: 'left', width: 40}
                , {field: 'userName', title: '用户名'}
                , {field: 'phoneNumber', title: '用户电话'}
                , {field: 'consumptionTime', title: '消费时间'}
                , {field: 'consumptionProject', title: '服务项目'}
                , {
                    field: 'consumptionStore', title: '消费店铺', templet: function (d) {
                        for (var p in storeList) {
                            if (d.consumptionStore == storeList[p].storeId) {
                                StoreName = storeList[p].name;
                                return "<span id='consumptionStore'>" + StoreName + "</span>"
                            } else {

                            }
                        }
                    }, unresize: true
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
        loadShop(form)
        //监听表格复选框选择
        table.on('checkbox(demo)', function (obj) {
            console.log(obj)
        });
        //监听工具条
        table.on('tool(demo)', function (obj) {
            var data = obj.data;
            if (obj.event === 'detail') {
                layerShow(data, table, $)
            } else if (obj.event === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    layerDelete(data, table, $);
                    obj.del();
                    layer.close(index);
                });
            } else if (obj.event === 'handle') {
                var resultData = checkComplaintHandle(data, table, $);
                if (resultData == null) {
                    complaintHandle(data, table, $);
                } else {
                    //显示查询内容
                    showComplaintHandle(data, resultData, table, $);
                }

            }


        });

        var $ = layui.$, active = {
            getCheckData: function () { //获取选中数据
                var checkStatus = table.checkStatus('complaint')
                    , data = checkStatus.data;
                layer.alert(JSON.stringify(data));
            }
            , getCheckLength: function () { //获取选中数目
                var checkStatus = table.checkStatus('complaint')
                    , data = checkStatus.data;
                layer.msg('选中了：' + data.length + ' 个');
            }
            , isAll: function () { //验证是否全选
                var checkStatus = table.checkStatus('complaint');
                layer.msg(checkStatus.isAll ? '全选' : '未全选')
            }
            , search: function () {
                var keyWordPhone = $(".demoTable input[name='keyWordPhone']").val();
                var keyWordStoreId = $("select[name='storeId'] option:selected").val();
                table.render({
                    elem: '#complaint'
                    , url: systemHost + "/complaint/complaintList"
                    , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    , page: true          //显示分页默认不显示
                    , method: 'post'
                    , request: {
                        pageName: 'pageNum', //页码的参数名称，默认：page
                        limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    }
                    , where: {
                        phoneNumber: keyWordPhone,
                        storeId: keyWordStoreId
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
                        , {field: 'userName', title: '用户名'}
                        , {field: 'phoneNumber', title: '用户电话'}
                        , {field: 'consumptionTime', title: '消费时间'}
                        , {field: 'consumptionProject', title: '服务项目'}
                        , {
                            field: 'consumptionStore', title: '消费店铺', templet: function (d) {
                                for (var p in storeList) {
                                    if (d.consumptionStore == storeList[p].storeId) {
                                        StoreName = storeList[p].name;
                                        return "<span id='consumptionStore'>" + StoreName + "</span>"
                                    } else {

                                    }
                                }
                            }, unresize: true
                        }
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

    //删除投诉按钮事件
    function layerDelete(data, table, $) {
        //删除数据库数据
        var url = systemHost + "/complaint/complaintDel";
        var data = {
            "id": data.id
        };
        $.post(url, data, function (res) {
            if (res.responseStatusType.message == "Success") {
                layer.open({
                    title: '删除'
                    , content: '删除成功！'
                });
                //重新加载表格
                table.reload("complaint");
            } else {
                layer.open({
                    title: '删除'
                    , content: '删除失败！'
                });
            }
        })
    }

    //查看按钮事件
    function layerShow(data, table, $) {
        //页面弹框
        var a2 = layer.open({
            type: 1,
            title: '投诉详情',
            content: $('#editForm'),
            area: ['900px'],
            closeBtn: 1,
            btn: ['关闭'],
            btn2: function () {

            },
            success: function (layero) {
                layero.find("span[name='userName']").text(data.userName);
                layero.find("span[name='phoneNumber']").text(data.phoneNumber);
                layero.find("span[name='consumptionTime']").text(data.consumptionTime);
                layero.find("span[name='consumptionProject']").text(data.consumptionProject);
                layero.find("span[name='consumptionStore']").text(data.consumptionStore);
                layero.find("span[name='responsibility']").text(data.responsibility);
                layero.find("span[name='complaintTitle']").text(data.complaintTitle);
                layero.find("span[name='complaintReason']").text(data.complaintReason);
                for (var p in storeList) {
                    if (data.consumptionStore == storeList[p].storeId) {
                        StoreName = storeList[p].name;
                        layero.find("span[name='consumptionStore']").text(StoreName);
                    } else {

                    }
                }
            }

        });
    }

    //加载店铺信息-下拉选
    function loadShop(form) {
        //加载店铺列表信息
        var url = storeHost + "/manage/store/selectStoreList";
        var data = {};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result.list;    //返回的数据
                var server = document.getElementById("storeId"); //server为select定义的id
                server.innerHTML = "<option value='0' selected='true'>请选择</option>";
                for (var p in list) {
                    var option = document.createElement("option");  // 创建添加option属性
                    option.setAttribute("value", list[p].storeId); // 给option的value添加值
                    option.innerText = list[p].name;     // 打印option对应的纯文本
                    server.appendChild(option);           //给select添加option子标签
                }
                form.render();
            } else {

            }
        })
    }

    //加载店铺信息-匹配店铺名称
    function loadShopName() {
        var url = storeHost + "/manage/store/selectStoreList";
        var data = {};
        var resultList = new Array();
        $.ajax({
            url: url,
            type: "post",
            data: data,
            async: false,
            success: function (result) {
                if (result.responseStatusType.message == "Success") {
                    resultList = result.result.list;    //返回的数据
                }
            }
        });
        return resultList
    }

    //查看投诉是否已经有处理方案
    function checkComplaintHandle(data, table, $) {
        var id = data.id
        var url = systemHost + "/complaint/checkComplaintHandle";
        var data = {"id": id};
        var resulData = null;
        $.ajax({
            url: url,
            type: "post",
            data: data,
            async: false,
            success: function (result) {
                if (result.responseStatusType.message == "Success") {
                    resulData = result.result;    //返回的数据
                }
            }
        });
        return resulData
    }

    //处理投诉
    function complaintHandle(data, table, $) {
        var id = data.id;
        //页面弹框
        var a2 = layer.open({
            type: 1,
            title: '投诉处理',
            content: $('#handleForm'),
            area: ['900px'],
            closeBtn: 1,
            btn: ['提交', '关闭'],
            yes: function (index) {
                //添加数据库数据
                var url = systemHost + "/complaint/addComplaintHandleMethod";
                var data = {
                    "id": id,
                    "handleMethod": $("#handleMethod").val(),
                    "createOperator": "${currentUser.trueName!}"
                };
                $.post(url, data, function (res) {
                    if (res.responseStatusType.message == "Success") {
                        layer.open({
                            title: '处理方案'
                            , content: '添加处理方案成功！'
                            , btn: ["关闭"],
                            yes: function (index) {
                                layer.close(index); //如果设定了yes回调，需进行手工关闭
                                layer.close(a2);
                            }
                        });

                        //重新加载表格
                        table.reload("complaint");
                    } else {
                        layer.open({
                            title: '处理方案'
                            , content: res.responseStatusType.error.errorMsg
                        });
                    }
                })
            },
            btn2: function () {

            },
            success: function (layero) {

            }

        });
    }

    //显示处理方案
    function showComplaintHandle(data, resultData, table, $) {
        //页面弹框
        var a2 = layer.open({
            type: 1,
            title: '投诉处理',
            content: $('#handleFormShow'),
            area: ['900px'],
            closeBtn: 1,
            btn: ['关闭'],
            btn2: function () {

            },
            success: function (layero) {
                layero.find("span[name='handleMethod']").text(resultData.handleMethod);
                $("#handleForm").attr("data-id", resultData.id)
                $("#handleForm").attr("data-phone", data.phoneNumber)
            }
        });
    }

    //监听添加方案实施按钮
    $("#addHandleDo").click(function () {
        //页面弹框
        var a2 = layer.open({
            type: 1,
            title: '投诉追踪',
            content: $('#handleTrackForm'),
            area: ['900px'],
            closeBtn: 1,
            btn: ['提交', '关闭'],
            yes: function (index) {
                //添加数据库数据
                var url = systemHost + "/complaint/addComplaintTrack";
                var data = {
                    "handleId": $("#handleForm").attr("data-id"),
                    "phoneNumber": $("#handleForm").attr("data-phone"),
                    "handle": $("#handleDo").val(),
                    "complaintor": "${currentUser.trueName!}",
                    "createOperator": "${currentUser.trueName!}"
                };
                $.post(url, data, function (res) {
                    if (res.responseStatusType.message == "Success") {
                        layer.open({
                            title: '处理方案实施'
                            , content: '添加处理方案实施成功！'
                            , btn: ["关闭"],
                            yes: function (index) {
                                layer.close(index); //如果设定了yes回调，需进行手工关闭
                                layer.close(a2);
                            }
                        });
                    } else {
                        layer.open({
                            title: '处理方案实施'
                            , content: res.responseStatusType.error.errorMsg
                        });
                    }
                })
            },
            btn2: function () {

            },
            success: function (layero) {

            }

        });
    });

    //监听查看方案实施按钮
    $("#checkHandleDo").click(function () {
        //页面弹框
        var a2 = layer.open({
            type: 1,
            title: '投诉处理情况',
            content: $('#handleTrackFormTable'),
            area: ['900px', '300px'],
            closeBtn: 1,
            btn: ['关闭'],
            btn2: function () {

            },
            success: function (layero) {
                layui.table.render({
                    elem: '#complaintTrackTable'
                    , url: systemHost + "/complaint/complaintTrackList"
                    , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    , page: true          //显示分页默认不显示
                    , method: 'post'
                    , request: {
                        pageName: 'pageNum', //页码的参数名称，默认：page
                        limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    }
                    , where: {
                        "handleId": $("#handleForm").attr("data-id")
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
                        , {field: 'complaintor', title: '实施人'}
                        , {field: 'handle', title: '处理实施内容'}
                        , {field: 'createTime', title: '实施时间'}
                    ]]
                });
            }

        });
    });

    //监听添加方案实施结果按钮
    $("#addHandleResult").click(function () {
        //页面弹框
        var a2 = layer.open({
            type: 1,
            title: '方案实施结果',
            content: $('#handleResultForm'),
            area: ['900px'],
            closeBtn: 1,
            btn: ['提交', '关闭'],
            yes: function (index) {
                //添加数据库数据
                var url = systemHost + "/complaint/addComplaintRecordResult";
                var data = {
                    "handleId": $("#handleForm").attr("data-id"),
                    "result": $("#handleResult").val(),
                    "modifyOperator": "${currentUser.trueName!}"
                };
                $.post(url, data, function (res) {
                    if (res.responseStatusType.message == "Success") {
                        layer.open({
                            title: '添加实施结果'
                            , content: '添加实施结果成功！'
                            , btn: ["关闭"],
                            yes: function (index) {
                                layer.close(index); //如果设定了yes回调，需进行手工关闭
                                layer.close(a2);
                            }
                        });
                    } else {
                        layer.open({
                            title: '添加实施结果'
                            , content: res.responseStatusType.error.errorMsg
                        });
                    }
                })
            },
            btn2: function () {

            },
            success: function (layero) {

            }

        });
    });

</script>


</body>
</html>