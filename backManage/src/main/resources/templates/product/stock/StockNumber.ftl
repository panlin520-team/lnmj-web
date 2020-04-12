<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>仓库商品</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${basePath!}/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${basePath!}/css/index.css" media="all"/>
    <script src="${basePath!}/js/jquery.min.js" type="text/javascript"></script>
    <script src="${basePath!}/layui/layui.js" charset="utf-8"></script>
    <script src="${basePath!}/js/host.js" type="text/javascript"></script>
    <style>
        .resetLabel {
            width: 30px;
        }
    </style>
</head>
<body>

<div class="layui-fluid">
    <div class="demoTable layui-form" lay-filter="demoTable">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label resetLabel">商品</label>
                <div class="layui-input-inline">
                    <input class="layui-input" type="text" name="productCodeSearch" autocomplete="off" placeholder="输入商品名称">
                </div>
            </div>
            <div class="layui-inline">
                <button class="layui-btn" data-type="search"><i class="layui-icon layui-icon-search"></i></button>
            </div>
        </div>
    </div>
    <#--表格:显示即时库存-->
    <table id="stockProductNumber" lay-filter="stockProductNumber"></table>
</div>
<#--选项卡：当前公司的数量变化-->
    <div class="layui-tab" id = 'show' hidden>
        <ul class="layui-tab-title">
            <li class="layui-this">入  库</li>
            <li >出  库</li>
            <li >库存数量</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <table id="instorageList" lay-filter="instorageList"></table>
            </div>
            <div class="layui-tab-item">
                <table id="outstorageList" lay-filter="outstorageList"></table>
            </div>
            <div class="layui-tab-item">
                <table id="stockPropductList" lay-filter="stockPropductList"></table>
            </div>
        </div>
    </div>
<#--表格:显示门店此商品列表-->
<form class="layui-form layui-form-pane layui-personal" id="storeShowForm" action=""
      lay-filter="storeShowForm" method="post" hidden="true">
    <table id="showStoreList" lay-filter="showStoreList"></table>
</form>

<script type="text/html" id="stockNumberDemo">
    <label class="layui-form-label">{{ d.totalNumber }}</label><a class="layui-btn layui-btn-xs" lay-event="show">详情</a>
</script>
<script type="text/html" id="stockNumberStoreDemo">
    <label class="layui-form-label">{{ d.allStoreNumber }}</label><a class="layui-btn layui-btn-xs" lay-event="showStore">详情</a>
</script>
<script type="text/html" id="storeStockNumberDemo">
    <label class="layui-form-label">{{ d.totalNumber }}</label><a class="layui-btn layui-btn-xs" lay-event="show">详情</a>
</script>


<script>
    var stock = [], product = [], table, form,element, companyType = "${currentUser.companyType!}",
        companyId = "${currentUser.companyId!}", stockId, dataUnit;
    //数据显示,分页实现
    layui.use(['table', 'form','element'], function () {
        table = layui.table;
        form = layui.form;
        element =layui.element;

        //加载商品和仓库
        stockId = loadStock(companyType, companyId);
        // loadProduct();
        table.render({
            elem: '#stockProductNumber'
            , url: productHost + "/stock/selectProductNumberList"
            , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , page: true          //显示分页默认不显示
            , method: 'post'
            , request: {
                pageName: 'pageNum', //页码的参数名称，默认：page
                limitName: 'pageSize' //每页数据量的参数名，默认：limit
            }
            , where: {
                stock: stockId
            }
            , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                return {
                    "code": 0, //解析接口状态
                    "msg": res.responseStatusType.error.errorMsg, //解析提示文本
                    "count": res.result == null ? 0 : res.result.total, //解析数据长度
                    "data": res.result == null ? 0 : res.result.list //解析数据列表
                }
            }
            , cols: [[
                {type: 'checkbox', fixed: 'left', width: 40, hide: true}
                , {field: 'stock', title: '仓库', sort: true, fixed: 'left'}
                , {field: 'productName', title: '商品'}
                , {field: 'unitName', title: '单位'}
                , {field: 'totalNumber', title: '总数量',templet:'#stockNumberDemo'}
               /* , {field: 'allStoreNumber', title: '门店总数量',templet:'#stockNumberStoreDemo'}*/
            ]]
            , id: 'stockProductReload'
        });

        //表格的操作
        table.on('tool(stockProductNumber)', function (obj) {
            var data = obj.data;
            // if(obj.event === 'show'){
            //     // showInstorage(data);
            // }else
            if (obj.event === 'show') {
                show(data);
            } else if (obj.event === 'showStore') {
                showStore(data);
            }
        });

        var $ = layui.$, active = {
            search: function () {
                var
                    // stockIdSearch = $(".demoTable select[name='stockSearch'] option:selected").val(),
                    productCode = $(".demoTable input[name='productCodeSearch']").val();
                // if(stock==0){
                //     stock = null;
                // }
                if (productCode == 0) {
                    productCode = null;
                }
                table.reload('stockProductReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    , where: {
                        stock: stockId,
                        productName: productCode
                    }
                }, 'data');
            }
        };

        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

    });
    //显示商品数量的入库出库
    function show(data){
        layer.open({
            type: 1
            ,id: 'showReload'
            ,title: '详情'
            ,content: $('#show')
            ,btn: '关闭'
            // ,btnAlign: 'c' //按钮居中
            // ,shade: 0 //不显示遮罩
            ,area: ['980px', '400px']
            ,yes: function(index, layero){
                layer.close(index);
            }
            ,success: function (layero) {
                //加载表格
                table.render({
                    elem: '#instorageList'
                    , data: data.instorageList
                    // ,url: productHost+"/stock/selectInstorageList"
                    , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    , page: true          //显示分页默认不显示
                    // ,method: 'post'
                    // ,request: {
                    //     pageName: 'pageNum', //页码的参数名称，默认：page
                    //     limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    // }
                    , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                        return {
                            "code": 0, //解析接口状态
                            "msg": "", //解析提示文本
                            "count": res == null ? 0 : res.length, //解析数据长度
                            "data": res == null ? 0 : res //解析数据列表
                        }
                    }
                    ,  cols: [[
                        {type: 'checkbox', fixed: 'left', width: 40, hide: true}
                        , {
                            field: 'inStorageType', title: '入库方式'
                        }
                        , {field: 'inStorageNumber', title: '入库编号'}
                        , {field: 'inStorageDate', title: '入库日期',templet:function (d) {
                                return d.inStorageDate.split(" ")[0];
                            }}
                        , {
                            field: 'inStorageStatus', title: '单据状态', templet: function (d) {
                                var statusName = "";
                                var color = "";
                                if (d.invalidStatus == 0) {
                                    statusName = "已作废";
                                    color = "red"
                                    return "<span style='color: " + color + "'" + ">" + statusName + "</span>"
                                }
                                if (d.inStorageStatus == 1) {
                                    statusName = "已审核";
                                    color = "green"
                                    return "<span style='color: " + color + "'" + ">" + statusName + "</span>"
                                } else if (d.inStorageStatus == 2) {
                                    statusName = "未通过";
                                    color = "red"
                                    return "<span style='color: " + color + "'" + ">" + statusName + "</span>"
                                } else if (d.inStorageStatus == 0) {
                                    statusName = "待审核";
                                    color = "gray"
                                    return "<span style='color: " + color + "'" + ">" + statusName + "</span>"
                                }

                            }
                        }
                        , {
                            field: 'inventoryWay', title: '入库方向', templet: function (d) {
                                var inventoryWayName = "";
                                if (d.inventoryWay == "RETURN") {
                                    inventoryWayName = "退货";
                                    return "<span>" + inventoryWayName + "</span>"
                                } else if (d.inventoryWay == "GENERAL") {
                                    inventoryWayName = "普通";
                                    return "<span>" + inventoryWayName + "</span>"
                                } else if (d.inventoryWay === '') {
                                    inventoryWayName = "普通";
                                    return "<span>" + inventoryWayName + "</span>"
                                }
                            }
                        }
                       /* ,{field: 'auditorTime', title: '审核时间'}*/
                    ]]
                });
                table.render({
                    elem: '#outstorageList'
                    , data: data.outstorageList
                    // ,url: productHost+"/stock/selectInstorageList"
                    , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    , page: true          //显示分页默认不显示
                    // ,method: 'post'
                    // ,request: {
                    //     pageName: 'pageNum', //页码的参数名称，默认：page
                    //     limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    // }
                    , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                        return {
                            "code": 0, //解析接口状态
                            "msg": "", //解析提示文本
                            "count": res == null ? 0 : res.length, //解析数据长度
                            "data": res == null ? 0 : res //解析数据列表
                        }
                    }
                    , cols: [[
                        {type: 'checkbox', fixed: 'left', width: 40, hide: true}
                        , {field: 'outStorageType', title: '出库方式'}
                        , {field: 'outStorageNumber', title: '出库编号'}
                        , {field: 'outStorageDate', title: '出库日期',templet: function(d){
                                return d.outStorageDate.split(" ")[0];
                            }}
                        /*, {
                            field: 'outStorageStatus', title: '单据状态', templet: function (d) {
                                var statusName = "";
                                var color = "";
                                if (d.outStorageStatus == 1) {
                                    statusName = "已审核";
                                    color = "green"
                                    return "<span style='color: " + color + "'" + ">" + statusName + "</span>"
                                } else if (d.outStorageStatus == 2) {
                                    statusName = "未通过";
                                    color = "red"
                                    return "<span style='color: " + color + "'" + ">" + statusName + "</span>"
                                } else if (d.outStorageStatus == 0) {
                                    statusName = "待审核";
                                    color = "gray"
                                    return "<span style='color: " + color + "'" + ">" + statusName + "</span>"
                                }
                            }
                        }*/
                        /*,{field: 'auditorTime', title: '审核时间'}*/
                    ]]
                });
                table.render({
                    elem: '#stockPropductList'
                    , data: data.stockProductList
                    , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    , page: true          //显示分页默认不显示
                    // , method: 'post'
                    // , request: {
                    //     pageName: 'pageNum', //页码的参数名称，默认：page
                    //     limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    // }
                    // , where: {
                    //     stock: stockId
                    //     ,productCode: data.productCode
                    // }
                    , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                        return {
                            "code": 0, //解析接口状态
                            "msg": res.responseStatusType.error.errorMsg, //解析提示文本
                            "count": res.result == null ? 0 : res.result.total, //解析数据长度
                            "data": res.result == null ? 0 : res.result.list //解析数据列表
                        }
                    }
                    , cols: [[
                        {type: 'checkbox', fixed: 'left', width: 40, hide: true}
                        , {field: 'stock', title: '仓库', sort: true, fixed: 'left'}
                        , {field: 'batchNumber', title: '批号'}
                        , {field: 'productName', title: '商品'}
                        , {field: 'aveailableNumber', title: '可用量'}
                        , {field: 'number', title: '数量'}
                       /* , {
                            field: 'unit', title: '单位', templet: function (d) {
                                var unitName = "";
                                for (var i in dataUnit) {
                                    if (d.unit == dataUnit[i].unitId) {
                                        unitName = dataUnit[i].unitName
                                    }
                                }
                                return unitName;
                            }
                        }*/
                        , {field: 'status', title: '状态', hide: true}
                    ]]
                });
            }
        });

    }



    //显示此商品在门店的数量的入库出库
    function showStore(data) {
        var productNumberStockVOList = data.productNumberStockVOList;
        layer.open({
            type: 1
            , id: 'storeShowFormReload'
            , title: '详情'
            , content: $('#storeShowForm')
            , btn: '关闭'
            // ,btnAlign: 'c' //按钮居中
            // ,shade: 0 //不显示遮罩
            , area: ['980px', '400px']
            , yes: function (index, layero) {
                layer.close(index);
            }
            , success: function (layero) {
                //加载表格
                table.render({
                    elem: '#showStoreList'
                    , data: productNumberStockVOList
                    // ,url: productHost+"/stock/selectInstorageList"
                    , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    , page: true          //显示分页默认不显示
                    // ,method: 'post'
                    // ,request: {
                    //     pageName: 'pageNum', //页码的参数名称，默认：page
                    //     limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    // }
                    , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                        return {
                            "code": 0, //解析接口状态
                            "msg": "", //解析提示文本
                            "count": res == null ? 0 : res.length, //解析数据长度
                            "data": res == null ? 0 : res //解析数据列表
                        }
                    }
                    , cols: [[
                        {type: 'checkbox', fixed: 'left', width: 40, hide: true}
                        , {field: 'stock', title: '仓库', sort: true, fixed: 'left'}
                        , {field: 'productName', title: '商品'}
                        , {field: 'unitName', title: '单位'}
                        , {field: 'totalNumber', title: '总数量', templet: '#storeStockNumberDemo'}
                    ]]
                });
            }
        });
    }

    //加载仓库
    function loadStock(comT, comI) {
        var stockcode = null,
            param = {
                companyType: comT,
                companyId: comI
            };
        $.ajax({
            url: productHost + "/stock/selectStockList",
            data: param,
            method: "POST",
            async: false,
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    var stock = res.result;
                    for (var p in stock) {
                        stockcode = stock[p].stockCode;
                    }
                }
            }
        });
        return stockcode;
    }
    //加载商品
    function loadProduct() {
        product = [];
        var param1 = {
            companyType: companyType,
            companyId: companyId,
            type: "1",
            productStatus: '1',
            status: 1,
            isHoutai: 0
        };

        $.ajax({
            url: productHost + "/manage/product/selectProductList",
            data: param1,
            method: "POST",
            async: false,
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    product.push(res.result.list);
                }
            }
        });
        var param2 = {
            companyType: companyType,
            companyId: companyId,
            type: "2",
            productStatus: '1',
            status: 1,
            isHoutai: 0
        };
        $.ajax({
            url: productHost + "/manage/product/selectProductList",
            data: param2,
            method: "POST",
            async: false,
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    product.push(res.result.list);
                }
            }
        });
    }

    // function loadSearchSelect() {
    //     // $(".demoTable select[name='stockSearch']").val("<option value='0' checked>请选择</option>");
    //     $(".demoTable select[name='productCodeSearch']").val("<option value='0' checked>请选择</option>");
    //     // for (var p in stock) {
    //     //     var option = "<option value='" + stock[p].stockCode + "'>" + stock[p].company + "</option>";
    //     //     $(".demoTable select[name='stockSearch']").append(option);
    //     // }
    //     for (var p in product) {
    //         for (var i in product[p]) {
    //             var option = "<option value='" + product[p][i].productCode + "'>" + product[p][i].productName + "</option>";
    //             $(".demoTable select[name='productCodeSearch']").append(option);
    //         }
    //     }
    //     form.render("select", "demoTable");
    // }

    //加载单位
    function loadUnit() {
        dataUnit = [];
        $.ajax({
            url: productHost + "/unit/selectUnitListNoPage",
            method: "POST",
            async: false,
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    dataUnit = res.result;
                }
            }
        });
    }

    //加载公司
    function loadCompanyDown(id) {
        var company = [];
        if (id == 1) {    //总公司
            $.ajax({
                url: storeHost + "/manage/store/selectSubCompanyAndStoreNoPage",
                data: {companyId: "${currentUser.companyId!}", companyType: "${currentUser.companyType!}"},
                method: "POST",
                async: false,
                success: function (res) {
                    if (res.responseStatusType.message == "Success") {
                        company = res.result;
                    }
                }
            });
            return company;
        }
        if (id == 2) {    //子公司
            $.ajax({
                url: storeHost + "/manage/store/selectStoreListNoPage",
                data: {"subCompanyId": companyId},
                method: "POST",
                async: false,
                success: function (res) {
                    if (res.responseStatusType.message == "Success") {
                        company = res.result;
                    }
                }
            });
            return company;
        }
    }
</script>
</body>
</html>