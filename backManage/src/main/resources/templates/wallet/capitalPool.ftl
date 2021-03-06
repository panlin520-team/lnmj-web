<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>资金池管理</title>
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
        .layui-form-select dl dd {
            cursor: pointer;
            width: 270px;
        }
    </style>
</head>
<body>

<div class="layui-fluid">
    <div class="demoTable layui-form">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">请选择门店</label>
                <div class="layui-input-inline">
                    <select name="stores" id="stores" lay-filter="stores">
                    </select>
                </div>
            </div>

            <div class="layui-inline">
                <button class="layui-btn" data-type="search"><i class="layui-icon layui-icon-search"></i></button>
            </div>
        </div>
    </div>
    <table id="capitalPool" lay-filter="demo"></table>
</div>


<form class="layui-form layui-form-pane layui-personal" id="showHuaBoOutForm" action="" lay-filter="example" method="post"
      hidden="true">
    <table id="showHuaBoOutTable" lay-filter="demo"></table>
</form>
<form class="layui-form layui-form-pane layui-personal" id="showHuaBoInForm" action="" lay-filter="example" method="post"
      hidden="true">
    <table id="showHuaBoInTable" lay-filter="demo"></table>
</form>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="listHuaBoOut">查看划出情况</a>
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="listHuaBoIn">查看划入情况</a>
</script>

<script>
    //列表显示
    var openId = null;
    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#capitalPool'
            , url: walletHost + "/manage/wallet/listCapPool"
            , id: "capitalPoolReload"
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
                , {field: 'typeName', title: '资金类型'}
                , {field: 'payTypeName', title: '支付方式'}
                , {field: 'advancesReceivedAccountName', title: '预收账户'}
                , {field: 'storeName', title: '门店名称'}
                , {field: 'amount', title: '金额'}
                , {field: 'residueAmount', title: '划拨后剩余金额'}
                , {fixed: 'right', title: '操作', align: 'center', toolbar: '#barDemo'}
            ]]
        });
    });


    layui.use(['table', 'layer', 'jquery', 'form'], function () {
        var table = layui.table,
                layer = layui.layer,
                $ = layui.jquery,
                form = layui.form;
        loadSubCompanyStore(form)
        //监听工具条
        table.on('tool(demo)', function (obj) {
            var data = obj.data;
            if (obj.event === 'listHuaBoOut') {
                selectHuaBoOut(form, layer, data, table, $);
            }else if(obj.event === 'listHuaBoIn'){
                selectHuaBoIn(form, layer, data, table, $);
            }

        });

        var $ = layui.$, active = {
            search: function () {
                var storeId = $(".demoTable select[name='stores'] option:selected").val();
                table.render({
                    elem: '#capitalPool'
                    , url: walletHost + "/manage/wallet/listCapPool"
                    , id: "capitalPoolReload"
                    , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    , page: true          //显示分页默认不显示
                    , method: 'post'
                    , request: {
                        pageName: 'pageNum', //页码的参数名称，默认：page
                        limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    }
                    , where: {
                        storeId: storeId
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
                        , {field: 'typeName', title: '资金类型'}
                        , {field: 'payTypeName', title: '支付方式'}
                        , {field: 'advancesReceivedAccountName', title: '预收账户'}
                        , {field: 'storeName', title: '门店名称'}
                        , {field: 'amount', title: '金额'}
                        , {field: 'residueAmount', title: '划拨后剩余金额'}
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


    function selectHuaBoOut(form, layer, data, table, $) {
        var a1 = layer.open({
            type: 1,
            title: '查看划出情况',
            content: $('#showHuaBoOutForm'),
            area: ['900px', '270px'],
            closeBtn: 1,
            scrollbar: true,
            btn: ['关闭'],
            btn2: function () {
                layer.close(a1);
            },
            success: function (layero) {
                layui.use('table', function () {
                    var table = layui.table;
                    table.render({
                        elem: '#showHuaBoOutTable'
                        , url: walletHost + "/manage/wallet/selectTransferOut"
                        , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                        , page: true          //显示分页默认不显示
                        , method: 'post'
                        , id: "showHuaBoOutTableReload"
                        , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                            return {
                                "code": 0, //解析接口状态
                                "msg": "", //解析提示文本
                                "count": res.result == null ? 0 : res.result.total, //解析数据长度
                                "data": res.result == null ? 0 : res.result.list //解析数据列表
                            };
                        }
                        , where: {
                            storeId: data.storeId,
                            capitalPoolId: data.id
                        }
                        , cols: [[
                            {type: 'checkbox', fixed: 'left', width: 40}
                            , {field: 'transferToStoreName', title: '划出门店名称', fixed: 'left'}
                            , {field: 'amount', title: '划出金额'}
                        ]]
                    });
                });
                form.render();
            }
        });
    }

    function selectHuaBoIn(form, layer, data, table, $) {
        var a1 = layer.open({
            type: 1,
            title: '查看划入情况',
            content: $('#showHuaBoInForm'),
            area: ['900px', '270px'],
            closeBtn: 1,
            scrollbar: true,
            btn: ['关闭'],
            btn2: function () {
                layer.close(a1);
            },
            success: function (layero) {
                layui.use('table', function () {
                    var table = layui.table;
                    table.render({
                        elem: '#showHuaBoInTable'
                        , url: walletHost + "/manage/wallet/selectTransferIn"
                        , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                        , page: true          //显示分页默认不显示
                        , method: 'post'
                        , id: "showHuaBoInTableReload"
                        , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                            return {
                                "code": 0, //解析接口状态
                                "msg": "", //解析提示文本
                                "count": res.result == null ? 0 : res.result.total, //解析数据长度
                                "data": res.result == null ? 0 : res.result.list //解析数据列表
                            };
                        }
                        , where: {
                            capitalPoolId: data.id,
                            storeId: data.storeId
                        }
                        , cols: [[
                            {type: 'checkbox', fixed: 'left', width: 40}
                            , {field: 'transferToStoreName', title: '划入门店名称', fixed: 'left'}
                            , {field: 'amount', title: '划入金额'}
                        ]]
                    });
                });
                form.render();
            }
        });
    }

    //初始化子公司分组列表
    function loadSubCompanyStore(form) {
        var url = storeHost + "/manage/store/selectSubCompanyAndStoreNoPage";
        var data = {companyId: "${currentUser.companyId!}", companyType: "${currentUser.companyType!}"};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("stores"); //server为select定义的id
                server.innerHTML = "<option value='0' selected='selected'>直接选择或搜索选择</option>";
                for (var p in list) {
                    var optgroup = document.createElement("optgroup");  // 创建添加optgroup属性
                    optgroup.setAttribute("label", list[p].subsidiaryName); // 给optgroup的label添加值
                    var storeVOList = list[p].storeVOList;
                    for (var n in storeVOList) {
                        var option = document.createElement("option");  // 创建添加option属性
                        option.setAttribute("value", storeVOList[n].storeId); // 给option的value添加值
                        option.innerText = storeVOList[n].name;     // 打印option对应的纯文本
                        optgroup.appendChild(option)
                    }
                    server.appendChild(optgroup);           //给select添加option子标签
                }
                form.render();
            } else {

            }
        })
    }
</script>




</body>
</html>