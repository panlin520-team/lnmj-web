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
    <#include "../../baseFtl/pageAuth.ftl" />
    <style>
        .resetLabel {
            width: 78px;
        }
    </style>
</head>
<body>



<div class="layui-fluid">
    <div class="demoTable layui-form">
        <label class="layui-form-label resetLabel">优惠券类型</label>
        <div class="layui-inline">
            <select id="keyWordCouponsType" name="keyWordCouponsType" lay-filter="keyWordCouponsType">
            </select>
        </div>

        <div class="layui-inline">
            <label class="layui-form-label">优惠券名称</label>
            <div class="layui-input-inline">
                <input class="layui-input" type="text" name="keyWordCouponsName" autocomplete="off"
                       placeholder="输入优惠券名称">
            </div>
        </div>
        <div class="layui-inline">
            <button class="layui-btn" data-type="search"><i class="layui-icon layui-icon-search"></i></button>
        </div>
    </div>

    <table id="couponsGetRecord" lay-filter="demo"></table>
</div>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>


<#--点击处理后的表单-显示-->
<form class="layui-form layui-form-pane layui-personal" id="showForm" action="" lay-filter="showForm" method="post" hidden="true">
    <div class="layui-form-item">
        <label class="layui-form-label">领取方式</label>
        <span name="getType"></span>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">领取时间</label>
        <span name="getDate"></span>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">用户名称</label>
        <span name="memberName"></span>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">优惠券Code</label>
        <span name="couponsCode"></span>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">优惠券名称</label>
        <span name="couponsName"></span>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">优惠券副标题</label>
        <span name="couponsSubheading"></span>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">优惠券类型</label>
        <span name="couponsTypeId"></span>
    </div>
    <div class="layui-form-item" id="showLiJian">
        <label class="layui-form-label">立减金额</label>
        <span name="immediatelyDiscount"></span>
    </div>
    <div class="layui-form-item" id="showZheKou">
        <label class="layui-form-label">折扣比例</label>
        <span name="discount"></span>
    </div>
    <div class="layui-form-item" id="showMan">
        <label class="layui-form-label">满</label>
        <span name="fullAmount"></span>
    </div>
    <div class="layui-form-item" id="showJian">
        <label class="layui-form-label">减</label>
        <span name="reductionAmount"></span>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">发放数量</label>
        <span name="provideAmount"></span>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">使用说明</label>
        <span name="instructions"></span>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">使用用户类型</label>
        <span name="userType"></span>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">每人限领数量</label>
        <span name="oneLimit"></span>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">固定日期：有效日期</label>
        <span name="effectiveDate"></span>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">领取后，当天生效，有效天数</label>
        <span name="effectiveDay"></span>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">跳转链接</label>
        <span name="jumpLink"></span>
    </div>
</form>

<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    var couponTypeList = loadCouponTypeNameList()
    var accountNameList = loadAccountNameList()
    //列表显示
    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#couponsGetRecord'
            , url: productHost + "/coupons/selectCouponsGetRecordList"
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
                , {
                    field: 'memberNum', title: '用户名称', templet: function (d) {
                        for (var p in accountNameList) {
                            if (d.memberNum == accountNameList[p].memberNum) {
                                memberName = accountNameList[p].name;
                                return "<span id='userName'>" + memberName + "</span>"
                            } else {

                            }
                        }
                    }, unresize: true
                }
                , {field: 'couponsCode', title: '优惠券券码'}
                , {field: 'couponsName', title: '优惠券名称'}
                , {
                    field: 'couponsTypeId', title: '优惠券类型', templet: function (d) {
                        for (var p in couponTypeList) {
                            if (d.couponsTypeId == couponTypeList[p].couponsTypeId) {
                                CouponsTypeName = couponTypeList[p].couponsTypeName;
                                return "<span id='couponsTypeName'>" + CouponsTypeName + "</span>"
                            } else {

                            }
                        }
                    }, unresize: true
                }
                , {field: 'createTime', title: '领取时间'}
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
        loadCouponsType(form)
        //监听表格复选框选择
        table.on('checkbox(demo)', function (obj) {
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
            }
        });


        var $ = layui.$, active = {
            search: function () {
                var keyWordCouponsName = $(".demoTable input[name='keyWordCouponsName']").val();
                var keyWordCouponsType = $("select[name='keyWordCouponsType'] option:selected").val();
                table.render({
                    elem: '#couponsGetRecord'
                    , url: productHost + "/coupons/selectCouponsGetRecordList"
                    , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    , page: true          //显示分页默认不显示
                    , method: 'post'
                    , request: {
                        pageName: 'pageNum', //页码的参数名称，默认：page
                        limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    }
                    , where: {
                        keyWordCouponsType: keyWordCouponsType,
                        keyWordCouponsName: keyWordCouponsName
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
                        , {
                            field: 'memberNum', title: '用户名称', templet: function (d) {
                                for (var p in accountNameList) {
                                    if (d.memberNum == accountNameList[p].memberNum) {
                                        memberName = accountNameList[p].name;
                                        return "<span id='userName'>" + memberName + "</span>"
                                    } else {

                                    }
                                }
                            }, unresize: true
                        }
                        , {field: 'couponsCode', title: '优惠券券码'}
                        , {field: 'couponsName', title: '优惠券名称'}
                        , {
                            field: 'couponsTypeId', title: '优惠券类型', templet: function (d) {
                                for (var p in couponTypeList) {
                                    if (d.couponsTypeId == couponTypeList[p].couponsTypeId) {
                                        CouponsTypeName = couponTypeList[p].couponsTypeName;
                                        return "<span id='couponsTypeName'>" + CouponsTypeName + "</span>"
                                    } else {

                                    }
                                }
                            }, unresize: true
                        }
                        , {field: 'createTime', title: '领取时间'}
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


    //删除优惠券领取记录按钮事件
    function layerDelete(data, table, $) {
        //删除数据库数据
        var url = productHost + "/coupons/deleteCouponsGetRecord";
        var data = {
            "couponsGetRecordId": data.couponsGetRecordId
        };
        $.post(url, data, function (res) {
            if (res.responseStatusType.message == "Success") {
                layer.open({
                    title: '删除'
                    , content: '删除成功！'
                });
                //重新加载表格
                table.reload("couponsGetRecord");
            } else {
                layer.open({
                    title: '删除'
                    , content: '删除失败！'
                });
            }
        })
    }


    //查看优惠券领取记录按钮事件
    function layerShow(data, table, $) {
        //页面弹框
        var a2 = layer.open({
            type: 1,
            title: '优惠券领取详情',
            content: $('#showForm'),
            area: ['400px', '600px'],
            closeBtn: 1,
            scrollbar: true,
            btn: ['关闭'],
            btn2: function () {
            },

            success: function (layero) {
                if (data.couponsTypeId == 1) {
                    $("#showZheKou").attr("hidden", true)
                    $("#showLiJian").attr("hidden", true)
                    $("#showMan").attr("hidden", false)
                    $("#showJian").attr("hidden", false)
                } else if (data.couponsTypeId == 2) {
                    $("#showZheKou").attr("hidden", false)
                    $("#showLiJian").attr("hidden", true)
                    $("#showMan").attr("hidden", true)
                    $("#showJian").attr("hidden", true)
                } else if (data.couponsTypeId == 3) {
                    $("#showZheKou").attr("hidden", true)
                    $("#showLiJian").attr("hidden", false)
                    $("#showMan").attr("hidden", true)
                    $("#showJian").attr("hidden", true)
                }
                layero.find("span[name='couponsCode']").text(data.couponsCode);

                for (var p in couponTypeList) {
                    if (data.couponsTypeId == couponTypeList[p].couponsTypeId) {
                        CouponsTypeName = couponTypeList[p].couponsTypeName;
                        layero.find("span[name='couponsTypeId']").text(CouponsTypeName);
                    } else {

                    }
                }
                layero.find("span[name='couponsName']").text(data.couponsName);

                layero.find("span[name='couponsSubheading']").text(data.couponsSubheading);

                for (var p in accountNameList) {
                    if (data.memberNum == accountNameList[p].memberNum) {
                        MemberNum = accountNameList[p].name;
                        layero.find("span[name='memberName']").text(MemberNum);
                    } else {

                    }
                }
                layero.find("span[name='getType']").text(data.getType);
                layero.find("span[name='discount']").text(data.discount);
                layero.find("span[name='immediatelyDiscount']").text(data.immediatelyDiscount);
                layero.find("span[name='fullAmount']").text(data.fullAmount);
                layero.find("span[name='reductionAmount']").text(data.reductionAmount);
                layero.find("span[name='provideAmount']").text(data.provideAmount);
                layero.find("span[name='instructions']").text(data.instructions);
                layero.find("span[name='userType']").text(data.userType == 1 ? "新用户" : "老用户");
                layero.find("span[name='oneLimit']").text(data.oneLimit);
                layero.find("span[name='effectiveDate']").text(data.effectiveDate);
                layero.find("span[name='effectiveDay']").text(data.effectiveDay);
                layero.find("span[name='jumpLink']").text(data.jumpLink);
                layero.find("span[name='getDate']").text(data.createTime);

            }

        });
    }

    //加载优惠券类型信息-匹配优惠券类型名称
    function loadCouponTypeNameList() {
        var url = productHost + "/coupons/couponsTypeList";
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
                }
            }
        });
        return resultList
    }

    //加载用户信息-匹配用户id名称
    function loadAccountNameList() {
        var url = accountHost + "/manage/memberUser/listByNoPage";
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
                }
            }
        });
        return resultList
    }

    //加载优惠券类型信息-下拉选-搜索
    function loadCouponsType(form) {
        var url = productHost + "/coupons/couponsTypeList";
        var data = {};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("keyWordCouponsType"); //server为select定义的id
                server.innerHTML = "<option value='0' selected='true'>请选择</option>";
                for (var p in list) {
                    var option = document.createElement("option");  // 创建添加option属性
                    option.setAttribute("value", list[p].couponsTypeId); // 给option的value添加值
                    option.innerText = list[p].couponsTypeName;     // 打印option对应的纯文本
                    server.appendChild(option);           //给select添加option子标签
                }
                form.render();
            } else {

            }
        })
    }
</script>
</body>
</html>