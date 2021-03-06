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
            <#--<div class="layui-inline">-->
            <#--<label class="layui-form-label resetLabel">仓库</label>-->
            <#--<div class="layui-input-inline">-->
            <#--<select name="stockSearch" lay-filter="stockSearch" lay-verify="required">-->
            <#--<option value="">请选择</option>-->
            <#--</select>-->
            <#--</div>-->
            <#--</div>-->
            <div class="layui-inline">
                <label class="layui-form-label resetLabel">商品</label>
                <div class="layui-input-inline">
                    <input class="layui-input" type="text" name="productCodeSearch" autocomplete="off" placeholder="输入商品名称">
                    <#--<select name="productCodeSearch" lay-filter="productCodeSearch" lay-verify="required">-->
                        <#--<option value="">请选择</option>-->
                    <#--</select>-->
                </div>
            </div>
            <div class="layui-inline">
                <button class="layui-btn" data-type="search"><i class="layui-icon layui-icon-search"></i></button>
            </div>
        </div>
    </div>
    <#--表格:显示即时库存-->
    <table id="stockProduct" lay-filter="stockProduct"></table>
</div>

<script>
    var stock = [], product = [], table, form, companyType = "${currentUser.companyType!}",
        companyId = "${currentUser.companyId!}", stockId, dataUnit;
    //数据显示,分页实现
    layui.use(['table', 'form'], function () {
        table = layui.table;
        form = layui.form;

        //加载商品和仓库
        stockId = loadStock(companyType, companyId);
        /*loadProduct();*/
        // loadSearchSelect();
        loadUnit();
        table.render({
            elem: '#stockProduct'
            , url: productHost + "/manage/product/selectProductList"
            , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , page: true          //显示分页默认不显示
            , method: 'post'
            , request: {
                pageName: 'pageNum', //页码的参数名称，默认：page
                limitName: 'pageSize' //每页数据量的参数名，默认：limit
            }
            , where: {
                companyId: "${currentUser.companyId!}",
                companyType: "${currentUser.companyType!}",
                productStatus:1,
                isHoutai:0
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
                , {field: 'productName', title: '商品'}
                , {field: 'stockNum', title: '库存数量'}
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
            ]]
            , id: 'stockProductReload'
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
</script>
</body>
</html>