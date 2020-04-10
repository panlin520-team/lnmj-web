<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>客户评测详情</title>
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
    <style>
        .resetLabel {
            width: 56px;
        }
    </style>
</head>
<body>

<div class="layui-fluid">
    <div class="demoTable layui-form">
        <#--表格:显示客户评测-->
        <table id="evaluatingDetail" lay-filter="demo"></table>
    </div>
</div>

<script>
    var evaluatingData;
    loadEvaluatingData();
    //列表显示
    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#evaluatingDetail'
            , url: dataHost + "/evaluating/selectEvaluatingDetailedList"
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
                , {field: 'evaluatingDetailedEvaluatingID', title: ' 客户评测名称',  fixed: 'left',templet:function (d) {
                        for (var p in evaluatingData) {
                            if (d.evaluatingDetailedEvaluatingID == evaluatingData[p].evaluatingID) {
                                return evaluatingData[p].evaluatingName;
                            }
                        }
                    }}
                , {field: 'evaluatingDetailedAmount', title: '金额/个数', sort: true, fixed: 'left'}
                , {field: 'evaluatingDetailedRechargeOrderID', title: '储值订单', sort: true, fixed: 'left'}
                , {field: 'evaluatingDetailedOrderID', title: '支付订单', sort: true, fixed: 'left'}
                , {field: 'userId', title: ' 用户',  fixed: 'left'}
                , {field: 'remark', title: ' 备注',  fixed: 'left'}
            ]]
        });
    });


    /*-------------------加载客户评测-------------------*/
    function loadEvaluatingData() {
        var url = dataHost + "/evaluating/selectEvaluatingList";
        $.post(url, function (res) {
            if (res.responseStatusType.message == "Success") {
                evaluatingData = res.result.list;
            }
        })
    }

    // /*-------------------加载订单-------------------*/
    // function loadEvaluatingData() {
    //     var url = orderHost + "/order/selectOrderList";
    //     $.post(url, function (res) {
    //         if (res.responseStatusType.message == "Success") {
    //             orderData = res.result;
    //         }
    //     })
    // }

    /*-------------------加载所有用户-------------------*/
    // function loadUserData() {
    //     var url = orderHost + "/order/selectOrderList";
    //     $.post(url, function (res) {
    //         if (res.responseStatusType.message == "Success") {
    //             orderData = res.result;
    //         }
    //     })
    // }

    /*-------------------加载订单类型---------------*/
    // function loadOrderType() {
    //     var url = orderHost + "/order/selectOrderTypeList";
    //     $.post(url, function (res) {
    //         if (res.responseStatusType.message == "Success") {
    //             var orderType = res.result;
    //             for (var p in orderType) {
    //                 var option = "<option value='" + p + "'>" + orderType[p] + "</option>";
    //                 $("select[name='evaluatingType']").append(option);
    //             }
    //             // layui.form.render();
    //         }
    //     })
    // }
</script>


</body>
</html>