<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>label</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${basePath!}/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${basePath!}/css/index.css" media="all"/>
    <script src="${basePath!}/layui/layui.js" charset="utf-8"></script>
    <script src="${basePath!}/js/jquery.min.js" type="text/javascript"></script>
    <script src="${basePath!}/js/host.js" type="text/javascript"></script>
    <#include "../baseFtl/pageAuth.ftl" />
</head>
<body>

<div class="layui-fluid">
    <div class="demoTable layui-form">
        <div class="layui-inline">
            <label class="layui-form-label" style="width: auto">请选择商品类型</label>
            <div class="layui-input-inline">
                <select lay-filter="status">
                    <option>全部</option>
                    <option value="1">已审核</option>
                    <option value="2">未审核</option>
                </select>
            </div>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="time" placeholder="请输入申请时间">
            </div>
            <div class="layui-inline">
                <button class="layui-btn" id="keyWord" data-type="search"><i class="layui-icon layui-icon-search"></i>
                </button>
            </div>
        </div>
    </div>
</div>

<table id="drawmoney" lay-filter="demo"></table>

<form class="layui-form" id="detailForm" action="" lay-filter="example" method="post" hidden="true">

    <div class="layui-form-item">
        <label class="layui-form-label">提成种类</label>
        <span name="bonusTypeId"></span>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">订单号</label>
        <span name="orderNumber"></span>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">下单时间</label>
        <span name="orderTime"></span>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">姓名</label>
        <span name="name"></span>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">会员等级</label>
        <span name="membershipLevel"></span>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">订单价格</label>
        <span name="orderPrice"></span>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">提成金额</label>
        <span name="amount"></span>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">提成状态</label>
        <span name="bonusStatus"></span>
    </div>

</form>

<script type="text/html" id="barDemo">
    <a name="shenhe" class="layui-btn layui-btn-primary layui-btn-xs" lay-event="examine">审核</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="detail">收入明细</a>
</script>

<#--是否打折自定义显示-->

<script type="text/html" id="cashstatus">
    {{#  if(d.cashStatus == 1){ }}
    未提现
    {{#  }else if(d.cashStatus == 2){ }}
    已提现
    {{#  } }}
</script>

<script>
    layui.use(['table', 'laydate'], function () {
        var table = layui.table;
        var laydate = layui.laydate;

        //日期时间选择器
        laydate.render({
            elem: '#time'
            , type: 'datetime'
        });
        table.render({
            elem: '#drawmoney'
            , url: walletHost + "/manage/wallet/selectCashRecordList"
            , cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
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
                    "count": res.result == null ? 0 : res.result.length, //解析数据长度
                    "data": res.result == null ? 0 : res.result //解析数据列表
                };
            }
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'name', title: '开户姓名'}
                , {field: 'bankName', title: '开户银行'}
                , {field: 'bankCode', title: '银行账号'}
                , {field: 'amount', title: '提现金额'}
                , {field: 'mobile', title: '联系电话'}
                , {field: 'cardNumber', title: '会员卡号'}
                , {field: 'cashTime', title: '申请时间'}
                , {field: 'cashStatus', title: '申请状态', templet: '#cashstatus'}
                , {title: '操作', fixed: 'right', toolbar: '#barDemo'}
            ]]
            , done: function (res, curr, count) {
                for (var i = 0; i < res.data.length; i++) {
                    if (res.data[i].cashStatus == 2) {//审核过了
                        $("tbody tr:eq(" + i + ")").children().find("a[name='shenhe']").attr("class", "layui-btn layui-btn-xs layui-btn-disabled")
                        $("tbody tr:eq(" + i + ")").children().find("a[name='shenhe']").attr("disabled", "disabled")
                        $("a[name='shenhe']").removeAttr("lay-event");

                    }
                }

            }
        });
    });
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
            if (obj.event === 'detail') {
                detail(data,$);
                // location.href = "/admin/wallet/drawmoney_detail?cashRecordId=" + data.cashRecordId
            } else if (obj.event === 'examine') {
                layer.confirm('确定审核吗？', function (index) {
                    examine(table, data);
                });
            }
        });
        form.on('select(status)', function (data) {
            var cashStatus = null;
            if (data == 1) {
                cashStatus = 1;
            } else {
                cashStatus = 2;
            }
            table.render({
                elem: '#drawmoney'
                , url: walletHost + "/manage/wallet/selectCashRecordList"
                , cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                , page: true          //显示分页默认不显示
                , method: 'post'
                , request: {
                    pageName: 'pageNum', //页码的参数名称，默认：page
                    limitName: 'pageSize' //每页数据量的参数名，默认：limit
                }
                , where: {
                    // cashRecordId:data.cashRecordId,
                    status: cashStatus
                }
                , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                    return {
                        "code": 0, //解析接口状态
                        "msg": "", //解析提示文本
                        "count": res.result == null ? 0 : res.result.length, //解析数据长度
                        "data": res.result == null ? 0 : res.result //解析数据列表
                    };
                }
                , cols: [[
                    {type: 'checkbox', fixed: 'left'}
                    , {field: 'name', title: '开户姓名'}
                    , {field: 'bankName', title: '开户银行'}
                    , {field: 'bankCode', title: '银行账号'}
                    , {field: 'amount', title: '提现金额'}
                    , {field: 'mobile', title: '联系电话'}
                    , {field: 'cardNumber', title: '会员卡号'}
                    , {field: 'cashTime', title: '申请时间'}
                    , {field: 'cashStatus', title: '申请状态', templet: '#cashstatus'}
                    , {title: '操作', fixed: 'right', toolbar: '#barDemo'}
                ]]
                , done: function (res, curr, count) {
                    for (var i = 0; i < res.data.length; i++) {
                        if (res.data[i].cashStatus == 2) {//审核过了
                            $("tbody tr:eq(" + i + ")").children().find("a[name='shenhe']").attr("class", "layui-btn layui-btn-xs layui-btn-disabled")
                            $("tbody tr:eq(" + i + ")").children().find("a[name='shenhe']").attr("disabled", "disabled")
                            $("a[name='shenhe']").removeAttr("lay-event");

                        }
                    }

                }
            });
        })
    });

    function examine(table, data) {
        var url = walletHost + "/manage/wallet/examine";
        var data = {
            cashRecordId: data.cashRecordId
        };
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                //重新加载表格
                layer.msg("成功");
                table.reload("drawmoney");
            } else {
                layer.msg("失败");
            }
        })
    }
    function detail(data,$) {
        var url = walletHost + "/manage/wallet/selectCashRecordDetailList";
        var param = {
            cashRecordId: data.cashRecordId
        };
        $.post(url, param, function (result) {
            if (result.responseStatusType.message == "Success") {
                //页面弹框
                var a = layer.open({
                    type: 1,
                    title: '提现审核详情',
                    content: $('#detailForm'),
                    scrollbar: true,
                    area: ['600px', '700px'],
                    closeBtn: 1,
                    btn: ['关闭'],
                    btn2: function () {

                    },
                    success: function (layero) {
                        layero.find("span[name='orderNumber']").text(result.result[0].orderNumber);
                        layero.find("span[name='orderTime']").text(result.result[0].orderTime);
                        layero.find("span[name='name']").text(result.result[0].name);
                        layero.find("span[name='orderPrice']").text(result.result[0].orderPrice);
                        layero.find("span[name='amount']").text(result.result[0].amount);
                        var bonusTypeId = "";
                        if (result.result[0].bonusTypeId == 1) {
                            bonusTypeId = "消费提成";
                        }else if (result.result[0].bonusTypeId == 2) {
                            bonusTypeId = "充值提成";
                        }
                        else if (result.result[0].bonusTypeId == 3){
                            bonusTypeId = "门店服务提成";
                        }
                        else if (result.result[0].bonusTypeId == 4){
                            bonusTypeId = "美容师销售提成";
                        }
                        else if (result.result[0].bonusTypeId == 5) {
                            bonusTypeId = "市场销售提成";
                        } else if (result.result[0].bonusTypeId == 6) {
                            bonusTypeId = "返利提成";
                        }
                        layero.find("span[name='bonusTypeId']").text(bonusTypeId);
                        var membershipLevel = "";
                        if (result.result[0].membershipLevel == 1) {
                            membershipLevel = "一星会员";
                        }else if (result.result[0].membershipLevel == 2) {
                            membershipLevel = "二星会员";
                        }
                        else if (result.result[0].bonusTypeId == 3){
                            membershipLevel = "三星会员";
                        }
                        else if (result.result[0].bonusTypeId == 3){
                            membershipLevel = "四星会员";
                        }
                        else if (result.result[0].bonusTypeId == 3){
                            membershipLevel = "五星会员";
                        }
                        else if (result.result[0].bonusTypeId == 3){
                            membershipLevel = "服务商";
                        }
                        else if (result.result[0].bonusTypeId == 3){
                            membershipLevel = "联盟商";
                        }
                        layero.find("span[name='membershipLevel']").text(membershipLevel);
                        var bonusStatus = "";
                        if (result.result[0].bonusStatus == 0) {
                            bonusStatus = "未提现";
                        }else if (result.result[0].bonusStatus == 1) {
                            bonusStatus = "已提现";
                        }
                        layero.find("span[name='bonusStatus']").text(bonusStatus);
                        layui.form.render();
                    },
                    end: function () {

                    }
                });
            } else {
                layer.msg("查询失败");
            }
        })



    }
</script>
</body>
</html>