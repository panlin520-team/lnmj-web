<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>财务统计</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${basePath!}/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${basePath!}/css/index.css" media="all"/>
    <script src="${basePath!}/js/jquery.min.js" type="text/javascript"></script>
    <script src="${basePath!}/layui/layui.js" charset="utf-8"></script>
    <script src="${basePath!}/js/host.js" type="text/javascript"></script>
    <#include "../baseFtl/pageAuth.ftl" />
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
    <div class="demoTable layui-form" lay-filter="demoTable">
        <div class="layui-form-item">

            <div class="layui-inline">
                <label class="layui-form-label">日期</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" id="test1" placeholder="yyyy-MM-dd">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">支付方式</label>
                <div class="layui-input-inline">
                    <select name="payType" id="payType" lay-filter="payType">
                    </select>
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">门店</label>
                <div class="layui-input-inline">
                    <select name="storeId" id="storeId" lay-filter="storeId">
                    </select>
                </div>
            </div>

            <div class="layui-inline">
                <button class="layui-btn" data-type="search"><i class="layui-icon layui-icon-search"></i></button>
            </div>


            <span id="cashAmount" style="color: green;"></span>
        </div>
    </div>
    <#--表格:显示商品大类-->
        <table id="financeStatisticsTable" lay-filter="financeStatisticsTable"></table>

        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-sm" lay-event="getCheckDataPass">批量审核通过</button>
                <button class="layui-btn layui-btn-sm" lay-event="getCheckDataRefuse">批量审核拒绝</button>
            </div>
        </script>
    <#--商品大类的表单-->
    <form id="financeStatisticsForm" class="layui-form financeStatisticsForm layui-form-pane layui-personal" action=""
          lay-filter="financeStatisticsForm" hidden="true">
        <div class="layui-form-item" hidden>
            <label class="layui-form-label">商品大类ID</label>
            <div class="layui-input-block">
                <input type="text" name="commodityTypeID" lay-verify="required" autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label xrequired">行业</label>
            <div class="layui-input-block">
                <select name="commodityTypeIndustry" lay-filter="commodityTypeIndustry" lay-verify="required">
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label xrequired">大类名称</label>
            <div class="layui-input-block">
                <input type="text" name="commodityTypeName" lay-verify="required" autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label xrequired">商品分类</label>
            <div class="layui-input-block">
                <select name="commodityProductType" lay-filter="commodityProductType" lay-verify="required">
                    <option value="1">产品</option>
                    <option value="2">服务</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label xrequired">pos端显示</label>
            <div class="layui-input-block">
                <select name="isShowInPos" lay-filter="isShowInPos" lay-verify="required">
                    <option value="1">是</option>
                    <option value="0">否</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item" hidden>
            <label class="layui-form-label">状态</label>
            <div class="layui-input-block">
                <input type="text" name="status" lay-verify="required" autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" hidden>
            <label class="layui-form-label">创建时间</label>
            <div class="layui-input-block">
                <input type="text" name="createTime" lay-verify="required" autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" hidden>
            <label class="layui-form-label">创建人</label>
            <div class="layui-input-block">
                <input type="text" name="createOperator" lay-verify="required" autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" hidden>
            <label class="layui-form-label">修改人</label>
            <div class="layui-input-block">
                <input type="text" name="modifyOperator" lay-verify="required" autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" hidden>
            <label class="layui-form-label">修改时间</label>
            <div class="layui-input-block">
                <input type="text" name="dataChangeLastTime" lay-verify="required" autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>
    </form>
</div>

<#--大类按钮-->
<script type="text/html" id="financeStatisticsDemo">
    <a class="layui-btn layui-btn-xs" lay-event="show">查看</a>
</script>

<script>
    var table, form, chooseDate;
    //数据显示,分页实现
    layui.use(['table', 'form'], function () {
        table = layui.table;
        form = layui.form;


        loadPayType();
        loadSubCompanyStore(form);
        table.render({
            elem: '#financeStatisticsTable'
            , url: orderHost + "/order/selectAllOrder" //selectCommodityTypeList
            , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , page: true          //显示分页默认不显示
            , method: 'post'
            , id: 'financeStatisticsReload'
            , toolbar: '#toolbarDemo'
            , request: {
                pageName: 'pageNum', //页码的参数名称，默认：page
                limitName: 'pageSize' //每页数据量的参数名，默认：limit
            }
            , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                return {
                    "code": 0, //解析接口状态
                    "msg": res.responseStatusType.error.errorMsg, //解析提示文本
                    "count": res.result == null ? 0 : res.result.total, //解析数据长度
                    "data": res.result == null ? 0 : res.result.orderList, //解析数据列表
                    "totalStr": res.result == null ? 0 : res.result.totalStr
                }
            }
            , cols: [[
                {type: 'checkbox', fixed: 'left', width: 40}
                , {field: 'orderNumber', title: '订单号'}
                , {field: 'payTypeAndAmountStr', title: '支付方式'}
                , {field: 'orderTypeValue', title: '订单类型'}
                , {field: 'payPrice', title: '支付金额'}
                , {
                    field: 'orderStatueValue', title: '支付状态', templet: function (d) {
                        var orderStatueValue = d.orderStatueValue;
                        var color = "green";

                        return "<span id='orderStatueValue'" + "style='color: " + color + "'" + ">" + orderStatueValue + "</span>"
                    }, unresize: true
                }
                , {
                    field: 'auditAmountStatus', title: '审核状态', templet: function (d) {
                        var auditStatusName = "";
                        var color = "";
                        if (d.auditAmountStatus == 0) {
                            auditStatusName = "未审核"
                            color = "gray"
                        } else if (d.auditAmountStatus == 1) {
                            auditStatusName = "审核通过"
                            color = "green"
                        } else if (d.auditAmountStatus == 2) {
                            auditStatusName = "审核未通过"
                            color = "red"
                        }
                        return "<span id='auditAmountStatusName'" + "style='color: " + color + "'" + ">" + auditStatusName + "</span>"
                    }, unresize: true
                }
               /* , {fixed: 'right', title: '操作', width: 180, align: 'center', toolbar: '#financeStatisticsDemo'}*/
            ]]
            , done: function (res, curr, count) {
                console.log(res)
                if (res.totalStr == '') {
                    $("#cashAmount").html("")
                } else {
                    $("#cashAmount").html(res.totalStr)
                }
                for (var i = 0; i < res.data.length; i++) {
                    if (res.data[i].auditStatus != 0) {//如果此行已经审核过了
                        $("tbody tr:eq(" + i + ")").children().find("#audit").attr("class", "layui-btn layui-btn-xs layui-btn-disabled")
                        $("tbody tr:eq(" + i + ")").children().find("#audit").attr("disabled", true)
                    }
                }
               /* loadCashAmount();*/
            }

        });


        //头工具栏事件-批量审核
        table.on('toolbar(financeStatisticsTable)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id);
            switch (obj.event) {
                case 'getCheckDataPass':
                    var data = checkStatus.data;
                    if (data.length === 0) {
                        layer.alert("请选中充值项");
                        break;
                    }
                    batchAuditPass(JSON.stringify(data), table)
                    break;
                case 'getCheckDataRefuse':
                    var data = checkStatus.data;
                    if (data.length === 0) {
                        layer.alert("请选中充值项");
                        break;
                    }
                    batchAuditRefuse(JSON.stringify(data), table)
                    break;
            }
            ;

        });


        //查看，编辑，删除
        table.on('tool(financeStatisticsTable)', function (obj) {
            var data = obj.data;
            if (obj.event === 'show') {
                showCommodityType(data);
                // layer.alert('编辑行：<br>'+ JSON.stringify(data))
            }
        });

        //搜索
        var $ = layui.$, active = {
            search: function () {
                var storeId = $(".demoTable select[name='storeId'] option:selected").val()
                var payType = $(".demoTable select[name='payType'] option:selected").val();
                var params = {
                    storeId: storeId,
                    payType: payType,
                    date: chooseDate
                };
                table.reload('financeStatisticsReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    , where: params
                }, 'data');

            }
        };
        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    });


    function showCommodityType(data) {
        var b1 = layer.open({
            type: 1,
            title: '查看商品大类',
            content: $('#CommodityTypeForm'),
            closeBtn: 1,
            btn: ['确定'],
            yes: function () {
                layer.close(b1);
            },
            success: function (layero) {
                //回显数据
                var commodityTypeIndustry = layero.find("select[name='commodityTypeIndustry']");
                commodityTypeIndustry.find("option[value='" + data.commodityTypeIndustryID + "']").attr("selected", true);
                layero.find("input[name='commodityTypeName']").val(data.commodityTypeName);
                var commodityProductType = layero.find("select[name='commodityProductType']");
                commodityProductType.find("option[value='" + data.commodityProductType + "']").attr("selected", true);
                form.render("select", "CommodityTypeForm");
                if (data.status == 1) {
                    layero.find("input[name='status']").val("正常");
                } else {
                    layero.find("input[name='status']").val("删除");
                }
                layero.find("input[name='createOperator']").val(data.createOperator);
                layero.find("input[name='createTime']").val(data.createTime);
                layero.find("input[name='modifyOperator']").val(data.modifyOperator);
                layero.find("input[name='dataChangeLastTime']").val(data.dataChangeLastTime);
                //查看显示创建人和编辑人
                layero.find("input[name='status']").parent().parent().show();
                layero.find("input[name='createOperator']").parent().parent().show();
                layero.find("input[name='createTime']").parent().parent().show();
                layero.find("input[name='modifyOperator']").parent().parent().show();
                layero.find("input[name='dataChangeLastTime']").parent().parent().show();
            },
            area: ['600px', '500px'],
            // end: function () {
            //     window.location.reload();
            // }
        });
    }

    //加载现金统计
    function loadCashAmount() {
        //删除数据库数据
        var url = orderHost + "/order/selectAllOrder";
        var params = {};
        $.ajax({
            url: url,
            type: "post",
            data: params,
            async: false,
            success: function (result) {
                if (result.responseStatusType.message == "Success") {
                    if (result.result.totalStr == '') {
                        $("#cashAmount").html("")
                    } else {
                        $("#cashAmount").html(result.result.totalStr)
                    }
                } else {
                    layer.open({
                        title: '失败'
                        , content: '现金统计金额加载失败！'
                        , btn: ["关闭"]
                    });
                }
            }
        });
    }

    //加载支付方式信息
    function loadPayType() {
        var url = payHost + "/manage/payment/selectPayTypeList";
        var data = {};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("payType"); //server为select定义的name
                server.innerHTML = "<option value='' selected='true'>请选择</option>";
                for (var p in list) {
                    var option = document.createElement("option");  // 创建添加option属性
                    option.setAttribute("value", list[p].payTypeId); // 给option的value添加值
                    option.innerText = list[p].payTypeName;     // 打印option对应的纯文本
                    server.appendChild(option);           //给select添加option子标签
                }
                layui.form.render();
            } else {

            }
        })
    }


    //初始化子公司分组列表
    function loadSubCompanyStore(form) {
        var url = storeHost + "/manage/store/selectSubCompanyAndStoreNoPage";
        var data = {companyId: "${currentUser.companyId!}", companyType: "${currentUser.companyType!}"};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("storeId"); //server为select定义的id
                server.innerHTML = "<option value='' selected='selected'>直接选择或搜索选择</option>";
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


    layui.use('laydate', function () {
        var laydate = layui.laydate;
        //常规用法
        laydate.render({
            elem: '#test1'
            , done: function (value, date) {
                chooseDate = value;
            }
        });
    });

    //批量审核-通过
    function batchAuditPass(data, table) {
        var url = orderHost + "/order/auditOrderAmount";
        var data = {"orderList": data, "auditStatus": 1};
        var resultList = new Array();
        $.ajax({
            url: url,
            type: "post",
            data: data,
            async: false,
            success: function (result) {
                if (result.responseStatusType.message == "Success") {
                    layer.open({
                        title: '操作成功'
                        , content: '批量审批通过成功！'
                        , btn: ["关闭"],
                        yes: function (index) {
                            layer.close(index); //如果设定了yes回调，需进行手工关闭
                        }
                    });
                    //重新加载表格
                    table.reload("financeStatisticsReload");
                } else {
                    layer.msg(result.responseStatusType.error.errorMsg, {
                        time: 20000, //20s后自动关闭
                        btn: ['明白了']
                    });
                }
            }
        });
        return resultList
    }

    //批量审核-通过
    function batchAuditRefuse(data, table) {
        var url = orderHost + "/order/auditOrderAmount";
        var data = {"orderList": data, "auditStatus": 2};
        var resultList = new Array();
        $.ajax({
            url: url,
            type: "post",
            data: data,
            async: false,
            success: function (result) {
                if (result.responseStatusType.message == "Success") {
                    layer.open({
                        title: '操作成功'
                        , content: '批量审批拒绝成功！'
                        , btn: ["关闭"],
                        yes: function (index) {
                            layer.close(index); //如果设定了yes回调，需进行手工关闭
                        }
                    });
                    //重新加载表格
                    table.reload("financeStatisticsReload");
                } else {
                    layer.msg(result.responseStatusType.error.errorMsg, {
                        time: 20000, //20s后自动关闭
                        btn: ['明白了']
                    });
                }
            }
        });
        return resultList
    }
</script>
</body>
</html>