<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>充值审批管理</title>
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
                <label class="layui-form-label resetLabel">会员卡号</label>
                <div class="layui-input-inline">
                    <input class="layui-input" type="text" name="keyWordMemberNum" autocomplete="off"
                           placeholder="输入会员卡号">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">请选择门店</label>
                <div class="layui-input-inline">
                    <select name="stores" id="stores" lay-filter="stores">
                    </select>
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">审核状态</label>
                <div class="layui-input-inline">
                    <select name="auditStatus" id="auditStatus" lay-filter="auditStatus">
                        <option value="">请选择</option>
                        <option value="0">未审核</option>
                        <option value="1">审核通过</option>
                        <option value="2">审核不通过</option>
                    </select>
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">账户类型</label>
                <div class="layui-input-inline">
                    <select name="accountTypeId" id="accountTypeId" lay-filter="accountTypeId">
                    </select>
                </div>
            </div>

            <div class="layui-inline">
                <button class="layui-btn" data-type="search"><i class="layui-icon layui-icon-search"></i></button>
            </div>

        </div>
    </div>
    <table id="rechargeRecord" lay-filter="rechargeRecord"></table>

    <script type="text/html" id="toolbarDemo">
        <div class="layui-btn-container">
            <button class="layui-btn layui-btn-sm" lay-event="getCheckDataPass">批量审核通过</button>
            <button class="layui-btn layui-btn-sm" lay-event="getCheckDataRefuse">批量审核拒绝</button>
        </div>
    </script>
</div>

<script type="text/html" id="barDemo">
    <button class="layui-btn layui-btn-primary layui-btn-xs" type="button" lay-event="detail">查看</button>
    <button class="layui-btn layui-btn-xs" type="button" lay-event="audit" id="audit">审核</button>
    <button class="layui-btn layui-btn-danger layui-btn-xs" type="button" lay-event="del">删除</button>
</script>

<#--点击单行后的表单-->
    <form class="layui-form" id="editForm" action="" lay-filter="example" method="post" hidden="true">

        <div class="layui-form-item" hidden='true'>
            <label class="layui-form-label">充值记录id</label>
            <span name="rechargeRecordId"></span>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <span name="name"></span>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">电话</label>
            <span name="mobile"></span>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">会员卡号</label>
            <span name="cardNumber"></span>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">订单号</label>
            <span name="orderNo"></span>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">美容师</label>
            <span name="beautician"></span>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">交易时间</label>
            <span name="transactionTime"></span>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">充值金额</label>
            <span name="amount"></span>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">是否返利</label>
            <span name="isintegral"></span>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">是否提成</label>
            <span name="isRoyalty"></span>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">支付类型</label>
            <span name="payType"></span>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">支付状态</label>
            <span name="payStatus"></span>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">失败原因</label>
            <span name="failureCause"></span>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">充值渠道</label>
            <span name="rechargeChannel"></span>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">备注</label>
            <span name="remarks"></span>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">审核状态</label>
            <span name="auditStatus"></span>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">账户类型</label>
            <span name="accountTypeId"></span>
        </div>
    </form>

<#--审核页面-->
<form class="layui-form" id="auditPage" value="" action="" lay-filter="example" method="post" hidden="true">
    <button type="button" id="pass" class="layui-btn layui-btn-sm">审核通过</button>
    <button type="button" id="refuse" class="layui-btn layui-btn-sm layui-btn-danger">审核拒绝</button>
    <div class="remarks">
        <textarea name="failureCause" placeholder="这里填写您的拒绝理由" style="width:99%;height:48px;resize: none;"></textarea>
    </div>
</form>


<script>
    //列表显示
    var list = loadFindAccountType();
    var storeArray = loadSubCompanyStore()
    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#rechargeRecord'
            , url: walletHost + "/manage/wallet/selectRechargeList"
            , id: "rechargeRecordReload"
            , toolbar: '#toolbarDemo'
            , defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                title: '提示'
                , layEvent: 'LAYTABLE_TIPS'
                , icon: 'layui-icon-tips'
            }]
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
            , where: {
                storeId: JSON.stringify(storeArray)
            }
            , cols: [[
                {type: 'checkbox', fixed: 'left', width: 40}
                , {field: 'orderNo', title: '订单号'}
                , {field: 'amount', title: '充值金额'}
                , {
                    field: 'accountTypeId', title: '账户类型', templet: function (d) {
                        for (var p in list) {
                            if (d.accountTypeId == list[p].accountTypeId) {
                                AccountTypeName = list[p].accountType;
                                return "<span id='rechargeTypeName'>" + AccountTypeName + "</span>"
                            } else {

                            }
                        }
                    }, unresize: true
                }
                , {field: 'name', title: '姓名'}
                , {field: 'mobile', title: '电话'}
                , {field: 'cardNumber', title: '会员卡号'}
                , {field: 'beauticianName', title: '充值员工'}
                , {field: 'rechargeChannelName', title: '充值渠道'}
                , {
                    field: 'auditStatus', title: '审核状态', templet: function (d) {
                        var auditStatusName = "";
                        var color = "";
                        if (d.auditStatus == 0) {
                            auditStatusName = "未审核"
                            color = "gray"
                        } else if (d.auditStatus == 1) {
                            auditStatusName = "审核通过"
                            color = "green"
                        } else if (d.auditStatus == 2) {
                            auditStatusName = "审核未通过"
                            color = "red"
                        }
                        return "<span id='rechargeTypeName'" + "style='color: " + color + "'" + ">" + auditStatusName + "</span>"
                    }, unresize: true
                }
                , {field: 'remarks', title: '备注'}
                , {fixed: 'right', title: '操作', width: 170, align: 'center', toolbar: '#barDemo'}
            ]]
            , done: function (res, curr, count) {
                for (var i = 0; i < res.data.length; i++) {
                    if (res.data[i].auditStatus != 0) {//如果此行已经审核过了
                        $("tbody tr:eq(" + i + ")").children().find("#audit").attr("class", "layui-btn layui-btn-xs layui-btn-disabled")
                        $("tbody tr:eq(" + i + ")").children().find("#audit").attr("disabled", true)
                    }
                }
            }
        });


        //头工具栏事件-批量审核
        table.on('toolbar(rechargeRecord)', function (obj) {
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
    });


    //增删改查操作实现
    layui.use(['table', 'layer', 'jquery', 'form'], function () {
        var table = layui.table,
            layer = layui.layer,
            $ = layui.jquery,
            form = layui.form;

        loadAccountType(form)
        //监听表格复选框选择
        table.on('checkbox(demo)', function (obj) {
            console.log(obj)
        });
        //监听工具条
        table.on('tool(rechargeRecord)', function (obj) {
            var data = obj.data;
            if (obj.event === 'detail') {
                rechargeRecordShow(data, table, $)
            } else if (obj.event === 'del') {
                if (data.auditStatus == 0) {
                    layer.msg("未审核，无法删除")
                    return
                }
                layer.confirm('真的删除行么', function (index) {
                    deleteRechargeRecord(data, table, $);
                    obj.del();
                    layer.close(index);
                });
            } else if (obj.event === 'audit') {//审核按钮
                openAudit(data)

            }


        });

        var $ = layui.$, active = {
            search: function () {
                var keyWordMemberNum = $(".demoTable input[name='keyWordMemberNum']").val();
                var storeId = $("select[name='stores'] option:selected").val() == 0 ? JSON.stringify(storeArray) : $("select[name='stores'] option:selected").val();
                var auditStatus = $("select[name='auditStatus'] option:selected").val();
                var accountTypeId = $("select[name='accountTypeId'] option:selected").val();
                table.render({
                    elem: '#rechargeRecord'
                    , toolbar: '#toolbarDemo'
                    , defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                        title: '提示'
                        , layEvent: 'LAYTABLE_TIPS'
                        , icon: 'layui-icon-tips'
                    }]
                    , url: walletHost + "/manage/wallet/selectRechargeList"
                    , id: "rechargeRecordReload"
                    , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    , page: true          //显示分页默认不显示
                    , method: 'post'
                    , request: {
                        pageName: 'pageNum', //页码的参数名称，默认：page
                        limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    }
                    , where: {
                        keyWord: keyWordMemberNum,
                        auditStatus: auditStatus,
                        accountTypeId: accountTypeId,
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
                        , {field: 'orderNo', title: '订单号'}
                        , {field: 'amount', title: '充值金额'}
                        , {
                            field: 'accountTypeId', title: '账户类型', templet: function (d) {
                                for (var p in list) {
                                    if (d.accountTypeId == list[p].accountTypeId) {
                                        AccountTypeName = list[p].accountType;
                                        return "<span id='rechargeTypeName'>" + AccountTypeName + "</span>"
                                    } else {

                                    }
                                }
                            }, unresize: true
                        }
                        , {field: 'name', title: '姓名'}
                        , {field: 'mobile', title: '电话'}
                        , {field: 'cardNumber', title: '会员卡号'}
                        , {field: 'beauticianName', title: '充值员工'}
                        , {field: 'rechargeChannelName', title: '充值渠道'}
                        , {
                            field: 'auditStatus', title: '审核状态', templet: function (d) {
                                var auditStatusName = "";
                                var color = "";
                                if (d.auditStatus == 0) {
                                    auditStatusName = "未审核"
                                    color = "gray"
                                } else if (d.auditStatus == 1) {
                                    auditStatusName = "审核通过"
                                    color = "green"
                                } else if (d.auditStatus == 2) {
                                    auditStatusName = "审核未通过"
                                    color = "red"
                                }
                                return "<span id='rechargeTypeName'" + "style='color: " + color + "'" + ">" + auditStatusName + "</span>"
                            }, unresize: true
                        }
                        , {field: 'remarks', title: '备注'}
                        , {fixed: 'right', title: '操作', width: 170, align: 'center', toolbar: '#barDemo'}
                    ]]
                });
            }
        };

        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    });

    //打开审核弹窗
    var AuditPage;

    function openAudit(data) {
        //页面弹框
        AuditPage = layer.open({
            type: 1,
            title: '审核',
            content: $('#auditPage'),
            area: ['270', '145px'],
            success: function (layero) {
                //成功后给页面绑定id
                var json = {
                    "rechargeRecordId": data.rechargeRecordId,
                    "userId": data.userId,
                    "accountTypeId": data.accountTypeId,
                    "amount": data.amount
                }
                $('#auditPage').val(json)
            }
        });
    }


    //通过审核
    $(document).on("click", "#pass", function () {
        var url = walletHost + "/manage/wallet/audit";
        var rechargeRecordId = $('#auditPage').val().rechargeRecordId;
        var userId = $('#auditPage').val().userId;
        var accountTypeId = $('#auditPage').val().accountTypeId;
        var amount = $('#auditPage').val().amount;
        var modifyOperator = "${currentUser.trueName!}"
        var auditStatus = 1
        var data = {
            "auditStatus": auditStatus,
            "modifyOperator": modifyOperator,
            "rechargeRecordId": rechargeRecordId,
            "userId": userId,
            "accountTypeId": accountTypeId,
            "amount": amount
        };
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                layer.open({
                    title: '提示'
                    , content: result.result
                    , btn: ["关闭"]
                    , yes: function (index) {
                        layer.closeAll();
                        window.location.reload();
                    }
                });
            } else {
                layer.open({
                    title: '提示'
                    , content: result.responseStatusType.error.errorMsg
                    , btn: ["关闭"]
                    , yes: function (index) {
                        layer.closeAll();
                        window.location.reload();
                    }
                });
            }
        })
    });


    //拒绝审核
    $(document).on("click", "#refuse", function () {
        var url = walletHost + "/manage/wallet/audit";
        var rechargeRecordId = $('#auditPage').val().rechargeRecordId;
        var modifyOperator = "${currentUser.trueName!}"
        var auditStatus = 2
        var failureCause = $("textarea[name='failureCause']").val()
        var data = {
            "failureCause": failureCause,
            "auditStatus": auditStatus,
            "modifyOperator": modifyOperator,
            "rechargeRecordId": rechargeRecordId
        };
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                layer.open({
                    title: '提示'
                    , content: result.result
                    , btn: ["关闭"]
                    , yes: function (index) {
                        layer.closeAll();
                        window.location.reload();
                    }
                });
            } else {
                layer.open({
                    title: '提示'
                    , content: result.responseStatusType.error.errorMsg
                    , btn: ["关闭"]
                    , yes: function (index) {
                        layer.closeAll();
                        window.location.reload();
                    }
                });
            }
        })
    });


    //删除充值记录事件
    function deleteRechargeRecord(data, table, $) {

        //删除数据库数据
        var url = walletHost + "/manage/wallet/deleteRechargeRecord";
        var data = {
            rechargeRecordId: data.rechargeRecordId,
            modifyOperator: "${currentUser.trueName!}"
        };
        $.post(url, data, function (res) {
            if (res.responseStatusType.message == "Success") {
                layer.open({
                    title: '删除'
                    , content: '删除成功！'
                });
                //重新加载表格
                table.reload("user");
            } else {
                layer.open({
                    title: '删除'
                    , content: '删除失败！'
                });
            }
        })
    }

    /*获取充值类型id对应的名字*/
    function loadFindAccountType() {
        var url = walletHost + "/manage/wallet/selectWalletAccountList";
        var data = {};
        var resultList = new Array();
        $.ajax({
            url: url,
            type: "post",
            data: data,
            async: false,
            success: function (result) {
                if (result.responseStatusType.message == "Success") {
                    resultList = result.result;    //返回的数据
                } else {
                }
            }
        });
        return resultList
    }

    /*获取支付类型id对应的名字*/
    function loadFindPayType() {
        var url = payHost + "/manage/payment/selectPayTypeList";
        var data = {};
        var resultList = new Array();
        $.ajax({
            url: url,
            type: "post",
            data: data,
            async: false,
            success: function (result) {
                if (result.responseStatusType.message == "Success") {
                    resultList = result.result;    //返回的数据
                } else {
                }
            }
        });
        return resultList
    }


    /*充值记录查看事件*/
    function rechargeRecordShow(data, table, $) {

        //页面弹框
        var a2 = layer.open({
            type: 1,
            title: '充值记录详情',
            content: $('#editForm'),
            scrollbar: true,
            area: ['600px', '700px'],
            closeBtn: 1,
            btn: ['关闭'],
            btn2: function () {

            },
            success: function (layero) {
                layero.find("span[name='rechargeRecordId']").text(data.rechargeRecordId);
                layero.find("span[name='name']").text(data.name);
                layero.find("span[name='mobile']").text(data.mobile);
                layero.find("span[name='cardNumber']").text(data.cardNumber);
                layero.find("span[name='orderNo']").text(data.orderNo);
                layero.find("span[name='beautician']").text(data.beautician);
                layero.find("span[name='transactionTime']").text(data.transactionTime);
                layero.find("span[name='amount']").text(data.amount);
                var isintegral = ""
                if (data.isintegral == 1) {
                    isintegral = "是"
                } else {
                    isintegral = "否"
                }
                layero.find("span[name='isintegral']").text(isintegral);
                var isRoyalty = ""
                if (data.isRoyalty == 1) {
                    isRoyalty = "是"
                } else {
                    isRoyalty = "否"
                }
                layero.find("span[name='isRoyalty']").text(isRoyalty);
                var payTypeList = loadFindPayType();
                var payTypeName = "";
                for (var n in payTypeList) {
                    if (payTypeList[n].payTypeId == data.payType) {
                        payTypeName = payTypeList[n].payTypeName;
                    }
                }
                layero.find("span[name='payType']").text(payTypeName);
                var payStatus = ""
                if (data.payStatus == 1) {
                    payStatus = "已支付"
                } else {
                    payStatus = "待支付"
                }
                layero.find("span[name='payStatus']").text(payStatus);
                layero.find("span[name='failureCause']").text(data.failureCause);
                var rechargeChannel = ""
                if (data.rechargeChannel == 1) {
                    rechargeChannel = "门店"
                } else {
                    rechargeChannel = "平台管理员"
                }
                layero.find("span[name='rechargeChannel']").text(rechargeChannel);
                layero.find("span[name='remarks']").text(data.remarks);
                var auditStatus = ""
                if (data.auditStatus == 0) {
                    auditStatus = "待审核"
                    layero.find("span[name='auditStatus']").css("color", "gray");
                } else if (data.auditStatus == 1) {
                    auditStatus = "审核通过"
                    layero.find("span[name='auditStatus']").css("color", "green");
                } else {
                    auditStatus = "审核未通过"
                    layero.find("span[name='auditStatus']").css("color", "red");
                }
                layero.find("span[name='auditStatus']").text(auditStatus);

                var accountTypeList = loadFindAccountType();
                var accountTypeName = "";
                for (var p in accountTypeList) {
                    if (accountTypeList[p].accountTypeId == data.accountTypeId) {
                        accountTypeName = accountTypeList[p].accountType;
                    }
                }
                layero.find("span[name='accountTypeId']").text(accountTypeName);
                layui.form.render();
            }, end: function () {

            }

        });
    }

    //初始化子公司分组列表

    function loadSubCompanyStore() {
        var url = storeHost + "/manage/store/selectSubCompanyAndStoreNoPage";
        var data = {companyId: "${currentUser.companyId!}", companyType: "${currentUser.companyType!}"};
        var storeArray = new Array();
        $.ajax({
            url: url,
            type: "post",
            data: data,
            async: false,
            success: function (result) {
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
                            optgroup.appendChild(option);
                            storeArray.push(storeVOList[n].storeId);
                        }
                        server.appendChild(optgroup);           //给select添加option子标签
                    }

                } else {
                }

            }
        });
        return storeArray

    }

    //批量审核-通过
    function batchAuditPass(data, table) {
        var url = walletHost + "/manage/wallet/batchAudit";
        var data = {"walletRechargeRecordList": data, "auditStatus": 1};
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
                    table.reload("rechargeRecordReload");
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
        var url = walletHost + "/manage/wallet/batchAudit";
        var data = {"walletRechargeRecordList": data, "auditStatus": 2};
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
                    table.reload("rechargeRecordReload");
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


    //加载账户类型-充值
    function loadAccountType(form) {
        var url = walletHost + "/manage/wallet/selectWalletAccountList";
        var data = {};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("accountTypeId"); //server为select定义的name
                server.innerHTML = "<option value='' selected='true'>请选择</option>";
                for (var p in list) {
                    var option = document.createElement("option");  // 创建添加option属性
                    option.setAttribute("value", list[p].accountTypeId); // 给option的value添加值
                    option.innerText = list[p].accountType;     // 打印option对应的纯文本
                    server.appendChild(option);           //给select添加option子标签
                }

            } else {

            }
            form.render();
        })
    }
</script>


</body>
</html>