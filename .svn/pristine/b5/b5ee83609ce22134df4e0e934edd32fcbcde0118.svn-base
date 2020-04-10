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
            width: 56px;
        }
    </style>
</head>
<body>

<div class="layui-fluid">
    <div class="demoTable layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label resetLabel" style="width: 100px;">选择要添加优惠券的类型</label>
            <div class="layui-inline">
                <select id="couponsTypeBeforeAdd" name="couponsTypeBeforeAdd" lay-filter="couponsTypeBeforeAdd">
                </select>
            </div>
            <button class="layui-btn" id="addCoupons" type="button">添加优惠券</button>
        </div>
    </div>
    <br>
    <div class="demoTable layui-form">
        <div class="layui-form-item">

            <label class="layui-form-label">优惠券类型</label>
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
    </div>
    <table id="coupons" lay-filter="demo"></table>
</div>


<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="edit">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="soldOut">下架</a>
</script>


<#--点击单行后的表单-修改-->
    <form class="layui-form layui-form-pane layui-personal" id="editForm" action="" lay-filter="editForm" method="post" hidden="true">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label" style="font-weight:bold;color:#0000FF">基本信息</label>
            </div>
        </div>
        <div class="layui-form-item">

            <div class="layui-form-item" hidden="true">
                <div class="layui-inline">
                    <label class="layui-form-label">优惠券id</label>
                    <div class="layui-input-block">
                        <input type="text" name="couponsId" lay-verify="required" autocomplete="off"
                               placeholder="请输入优惠券id" class="layui-input">
                    </div>
                </div>
            </div>


            <div class="layui-inline">
                <label class="layui-form-label">优惠券名称</label>
                <div class="layui-input-block">
                    <input type="text" name="couponsName" lay-verify="required" autocomplete="off"
                           placeholder="请输入优惠券名称" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">优惠券副标题</label>
                <div class="layui-input-block">
                    <input type="text" name="couponsSubheading" lay-verify="required" autocomplete="off"
                           placeholder="请输入优惠券副标题" class="layui-input">
                </div>
            </div>
        </div>


        <div class="layui-form-item" id="lijianEdit">
            <div class="layui-inline">
                <label class="layui-form-label">立减金额</label>
                <div class="layui-input-block">
                    <input type="text" name="immediatelyDiscount" lay-verify="required" autocomplete="off"
                           placeholder=""
                           class="layui-input">
                </div>
            </div>
        </div>


        <div class="layui-form-item" id="zhekouEdit">
            <div class="layui-inline">
                <label class="layui-form-label">折扣比例</label>
                <div class="layui-input-block">
                    <input type="text" name="discount" lay-verify="required" autocomplete="off" placeholder=""
                           class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item" id="manjianEdit">
            <div class="layui-inline">
                <label class="layui-form-label">满</label>
                <div class="layui-input-block">
                    <input type="text" name="fullAmount" lay-verify="required" autocomplete="off" placeholder=""
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">减</label>
                <div class="layui-input-block">
                    <input type="text" name="reductionAmount" lay-verify="required" autocomplete="off" placeholder=""
                           class="layui-input">
                </div>
            </div>
        </div>


        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">发放数量</label>
                <div class="layui-input-block">
                    <input type="text" name="provideAmount" lay-verify="required" autocomplete="off"
                           placeholder="请输入发放数量" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">使用说明</label>
                <div class="layui-input-block">
                    <input type="text" name="instructions" lay-verify="required" autocomplete="off"
                           placeholder="请输入使用说明" class="layui-input">
                </div>
            </div>
        </div>


        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label" style="font-weight:bold;color:#0000FF">基本规则</label>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">用户类型</label>
                <div class="layui-input-block" style="width:150px;">
                    <select name="userType" id="userType" lay-filter="userType" lay-verify="required">
                        <option value="1">新用户</option>
                        <option value="2">老用户</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">每人限领数量</label>
                <div class="layui-input-block">
                    <input type="text" name="oneLimit" lay-verify="required" autocomplete="off" placeholder="请输入每人限领数量"
                           class="layui-input">
                </div>
            </div>
        </div>


        <div class="layui-inline">
            <div class="layui-inline">
                <input type="radio" name="effectiveTypeEdit" checked="" value="1" lay-filter="effectiveType">
                <label class="layui-form-label">固定日期：有效日期</label>
                <div class="layui-input-inline">
                    <input name="effectiveDate" type="text" class="layui-input" id="effectiveDateEdit"
                           placeholder=" - " lay-verify="required">
                </div>
            </div>
            <div class="layui-inline">
                <input type="radio" name="effectiveTypeEdit" value="2" lay-filter="effectiveType">
                <label class="layui-form-label">领取后，当天生效，有效天数</label>
                <div class="layui-input-block">
                    <input type="text" name="effectiveDay" id="effectiveDayEdit" lay-verify="required"
                           autocomplete="off"
                           placeholder="请输入有效天数" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-inline">
            <div class="layui-inline">
                <label class="layui-form-label">跳转链接</label>
                <div class="layui-input-block">
                    <input type="text" name="jumpLink" lay-verify="required" autocomplete="off" placeholder="请输入跳转链接"
                           class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="editsubmitfilter">立即修改</button>
                <button id="reset" type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>


    </form>

<#--点击处理后的表单-添加-->
    <form class="layui-form layui-form-pane layui-personal" id="addForm" action="" lay-filter="addForm" method="post" hidden="true">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label" style="font-weight:bold;color:#0000FF">基本信息</label>
            </div>
        </div>


        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">优惠券名称</label>
                <div class="layui-input-block">
                    <input type="text" name="couponsName" lay-verify="required" autocomplete="off"
                           placeholder="请输入优惠券名称" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">优惠券副标题</label>
                <div class="layui-input-block">
                    <input type="text" name="couponsSubheading" lay-verify="required" autocomplete="off"
                           placeholder="请输入优惠券副标题" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item" id="lijianAdd">
            <div class="layui-inline">
                <label class="layui-form-label">立减金额</label>
                <div class="layui-input-block">
                    <input type="text" name="immediatelyDiscount" lay-verify="required" autocomplete="off"
                           placeholder=""
                           class="layui-input">
                </div>
            </div>
        </div>


        <div class="layui-form-item" id="zhekouAdd">
            <div class="layui-inline">
                <label class="layui-form-label">折扣比例</label>
                <div class="layui-input-block">
                    <input type="text" name="discount" lay-verify="required" autocomplete="off" placeholder=""
                           class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item" id="manjianAdd">
            <div class="layui-inline">
                <label class="layui-form-label">满</label>
                <div class="layui-input-block">
                    <input type="text" name="fullAmount" lay-verify="required" autocomplete="off" placeholder=""
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">减</label>
                <div class="layui-input-block">
                    <input type="text" name="reductionAmount" lay-verify="required" autocomplete="off" placeholder=""
                           class="layui-input">
                </div>
            </div>
        </div>


        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">发放数量</label>
                <div class="layui-input-block">
                    <input type="text" name="provideAmount" lay-verify="required" autocomplete="off"
                           placeholder="请输入发放数量" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">使用说明</label>
                <div class="layui-input-block">
                    <input type="text" name="instructions" lay-verify="required" autocomplete="off"
                           placeholder="请输入使用说明" class="layui-input">
                </div>
            </div>
        </div>


        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label" style="font-weight:bold;color:#0000FF">基本规则</label>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">用户类型</label>
                <div class="layui-input-block" style="width:150px;">
                    <select name="userType" id="userType" lay-filter="userType" lay-verify="required">
                        <option value="1">新用户</option>
                        <option value="2">老用户</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">每人限领数量</label>
                <div class="layui-input-block">
                    <input type="text" name="oneLimit" lay-verify="required" autocomplete="off" placeholder="请输入每人限领数量"
                           class="layui-input">
                </div>
            </div>
        </div>


        <div class="layui-inline">
            <div class="layui-inline">
                <input type="radio" name="effectiveType" checked="" value="1" lay-filter="effectiveType">
                <label class="layui-form-label">固定日期：有效日期</label>
                <div class="layui-input-inline">
                    <input name="effectiveDate" type="text" class="layui-input" id="effectiveDateAdd"
                           placeholder=" - ">
                </div>
            </div>
            <div class="layui-inline">
                <input type="radio" name="effectiveType" value="2" lay-filter="effectiveType">
                <label class="layui-form-label">领取后，当天生效，有效天数</label>
                <div class="layui-input-block">
                    <input type="text" name="effectiveDay" id="effectiveDayAdd" autocomplete="off"
                           placeholder="请输入有效天数" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-inline">
            <div class="layui-inline">
                <label class="layui-form-label">跳转链接</label>
                <div class="layui-input-block">
                    <input type="text" name="jumpLink" lay-verify="required" autocomplete="off" placeholder="请输入跳转链接"
                           class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="addsubmitfilter">立即添加</button>
                <button id="resetAdd" type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>

<#--点击处理后的表单-显示-->
<form class="layui-form layui-form-pane layui-personal" id="showForm" action="" lay-filter="showForm" method="post" hidden="true">
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
        <label class="layui-form-label">用户类型</label>
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


<script>
    var couponTypeList = loadCouponTypeNameList()
    //列表显示
    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#coupons'
            , url: productHost + "/coupons/couponsList"
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
                , {field: 'couponsName', title: '优惠券名称'}
                , {field: 'couponsSubheading', title: '优惠券副标题'}
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
        keyWordCouponsTypeBeforeAdd(form)
        //监听表格复选框选择
        table.on('checkbox(demo)', function (obj) {
            console.log(obj)
        });
        //监听工具条
        table.on('tool(demo)', function (obj) {
            var data = obj.data;
            if (obj.event === 'detail') {
                layerShow(data, table, $)
            } else if (obj.event === 'soldOut') {
                layer.confirm('真的下架行么', function (index) {
                    layerSoldOut(data, table, $);
                    obj.del();
                    layer.close(index);
                });
            } else if (obj.event === 'edit') {
                layerShowAndEdit(data, table, $, form)
            }


        });

        var $ = layui.$, active = {
            search: function () {
                var keyWordCouponsName = $(".demoTable input[name='keyWordCouponsName']").val();
                var keyWordCouponsType = $("select[name='keyWordCouponsType'] option:selected").val();
                table.render({
                    elem: '#coupons'
                    , url: productHost + "/coupons/couponsList"
                    , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    , page: true          //显示分页默认不显示
                    , method: 'post'
                    , request: {
                        pageName: 'pageNum', //页码的参数名称，默认：page
                        limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    }
                    , where: {
                        keyWordCouponsName: keyWordCouponsName,
                        keyWordCouponsType: keyWordCouponsType
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
                        , {field: 'couponsName', title: '优惠券名称'}
                        , {field: 'couponsSubheading', title: '优惠券副标题'}
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
                        , {fixed: 'right', title: '操作', align: 'center', toolbar: '#barDemo'}
                    ]]
                });
            }
        };

        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });


        //监听添加提交(满减，折扣)
        form.on('submit(addsubmitfilter)', function () {
            var chooseEffectiveType = null;
            if ($("#effectiveDayAdd").prop("disabled") == true) {
                chooseEffectiveType = 1
            } else if ($("#effectiveDateAdd").prop("disabled") == true) {
                chooseEffectiveType = 2
            }


            //为了防止form中的id值被重置后置空,将编辑的id存放在label中
            $("#editid").val($("#editlabelid").html());
            $("#editlabelid").html("");
            $.ajax({
                type: "POST",
                url: productHost + "/coupons/addCoupons",
                data: $('#addForm').serialize() + "&chooseEffectiveType=" + chooseEffectiveType + "&couponsTypeId=" + $("#couponsTypeBeforeAdd").find("option:selected").val() + "&createOperator=" + "${currentUser.trueName!}",
                async: false,
                error: function (request) {
                    layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
                },
                success: function (data) {
                    if (data.responseStatusType.message == 'Failure') {
                        layer.alert(data.responseStatusType.error.errorMsg);
                    }
                    if (data.responseStatusType.message == 'Success') {
                        layer.open({
                            // // skin: 'layui-layer-molv',
                            type: 1,
                            area: "10%",
                            content: "添加成功",
                            shadeClose: true,
                            btn: ["关闭"],
                            yes: function (index) {
                                layer.close(index); //如果设定了yes回调，需进行手工关闭
                                layer.close(addFormClose);
                            }, end: function () {
                                $("#reset").click();//重置表单
                                table.reload("coupons");
                            }
                        });

                    }
                }
            });
            return false;
        });

        //监听修改提交(满减，折扣)
        form.on('submit(editsubmitfilter)', function () {
            var chooseEffectiveType = null;
            if ($("#effectiveDayEdit").prop("disabled") == true) {
                chooseEffectiveType = 1
            } else if ($("#effectiveDateEdit").prop("disabled") == true) {
                chooseEffectiveType = 2
            }

            //为了防止form中的id值被重置后置空,将编辑的id存放在label中
            $("#editid").val($("#editlabelid").html());
            $("#editlabelid").html("");
            $.ajax({
                type: "POST",
                url: productHost + "/coupons/updateCoupons",
                data: $('#editForm').serialize() + "&chooseEffectiveType=" + chooseEffectiveType + "&modifyOperator=" + "${currentUser.trueName!}",
                async: false,
                error: function (request) {
                    layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
                },
                success: function (data) {
                    if (data.responseStatusType.message == 'Failure') {
                        layer.alert(data.responseStatusType.error.errorMsg);
                    }
                    if (data.responseStatusType.message == 'Success') {
                        layer.open({
                            // // skin: 'layui-layer-molv',
                            type: 1,
                            area: "10%",
                            content: "修改成功",
                            shadeClose: true,
                            btn: ["关闭"],
                            yes: function (index) {
                                layer.close(index); //如果设定了yes回调，需进行手工关闭
                                layer.close(editFormClose);
                            }, end: function () {
                                $("#reset").click();//重置表单
                                table.reload("coupons");
                            }
                        });
                    }
                }
            });
            return false;
        });
    });


    //监听添加优惠券按钮-显示添加表单(满减，折扣)
    var addFormClose = null;
    $("#addCoupons").click(function () {
        if ($("#couponsTypeBeforeAdd").find("option:selected").val() == 0) {
            alert("请选择优惠券类型")
            return
        }
        $("#resetAdd").click();//重置表单
        if ($("#couponsTypeBeforeAdd").find("option:selected").val() == 1) {//是满减
            $("#zhekouAdd").attr("hidden", true)
            $("#lijianAdd").attr("hidden", true)
            $("#manjianAdd").attr("hidden", false)
            $("input[name='fullAmount']").attr("lay-verify", "required");
            $("input[name='reductionAmount']").attr("lay-verify", "required");
            $("input[name='discount']").removeAttr("lay-verify");
        } else if ($("#couponsTypeBeforeAdd").find("option:selected").val() == 2) {//是折扣
            $("#zhekouAdd").attr("hidden", false)
            $("#manjianAdd").attr("hidden", true)
            $("#lijianAdd").attr("hidden", true)
            $("input[name='fullAmount']").removeAttr("lay-verify");
            $("input[name='reductionAmount']").removeAttr("lay-verify");
            $("input[name='discount']").attr("lay-verify", "required");
        } else if ($("#couponsTypeBeforeAdd").find("option:selected").val() == 3) {//是立减
            $("#zhekouAdd").attr("hidden", true)
            $("#manjianAdd").attr("hidden", true)
            $("#lijianAdd").attr("hidden", false)
            $("input[name='fullAmount']").removeAttr("lay-verify");
            $("input[name='reductionAmount']").removeAttr("lay-verify");
            $("input[name='discount']").removeAttr("lay-verify");
            $("input[name='immediatelyDiscount']").attr("lay-verify", "required");
        }


        //页面弹框
        var a2 = layer.open({
            type: 1,
            title: '添加优惠券',
            content: $('#addForm'),
            area: ['900px'],
            closeBtn: 1,
            success: function (layero) {
                var form = layui.form;
                $("#effectiveDateAdd").attr("disabled", false);
                $("#effectiveDayAdd").attr("disabled", true);

                $("#effectiveDateAdd").attr("lay-verify", "required");
                $("#effectiveDayAdd").removeAttr("lay-verify");
                //单选按钮的单击事件
                form.on('radio(effectiveType)', function (data) {
                    var abc = data.value;
                    if (abc == 1) {
                        $("#effectiveDateAdd").attr("disabled", false);
                        $("#effectiveDayAdd").attr("disabled", true);

                        $("#effectiveDateAdd").attr("lay-verify", "required");
                        $("#effectiveDayAdd").removeAttr("lay-verify");
                    } else {
                        $("#effectiveDayAdd").attr("disabled", false);
                        $("#effectiveDateAdd").attr("disabled", true);

                        $("#effectiveDayAdd").attr("lay-verify", "required");
                        $("#effectiveDateAdd").removeAttr("lay-verify");
                    }

                })


            }

        });
        addFormClose = a2;
    });

    //监听修改优惠券按钮-显示修改表单(满减，折扣)
    var editFormClose = null;

    function layerShowAndEdit(data, table, $, form) {
        if (data.couponsTypeId == 1) {//是满减
            $("#zhekouEdit").attr("hidden", true)
            $("#manjianEdit").attr("hidden", false)
            $("#lijianEdit").attr("hidden", true)
            $("input[name='fullAmount']").attr("lay-verify", "required");
            $("input[name='reductionAmount']").attr("lay-verify", "required");
            $("input[name='discount']").removeAttr("lay-verify");
        } else if (data.couponsTypeId == 2) {//是折扣
            $("#zhekouEdit").attr("hidden", false)
            $("#manjianEdit").attr("hidden", true)
            $("#lijianEdit").attr("hidden", true)
            $("input[name='fullAmount']").removeAttr("lay-verify");
            $("input[name='reductionAmount']").removeAttr("lay-verify");
            $("input[name='discount']").attr("lay-verify", "required");
        } else if (data.couponsTypeId == 3) {//是立减
            $("#zhekouEdit").attr("hidden", true)
            $("#manjianEdit").attr("hidden", true)
            $("#lijianEdit").attr("hidden", false)
            $("input[name='fullAmount']").removeAttr("lay-verify");
            $("input[name='reductionAmount']").removeAttr("lay-verify");
            $("input[name='discount']").removeAttr("lay-verify");
            $("input[name='immediatelyDiscount']").attr("lay-verify", "required");
        }
        //页面弹框
        editFormClose = layer.open({
            type: 1,
            title: '修改优惠券',
            content: $('#editForm'),
            scrollbar: true,
            area: ['878px', '356px'],
            closeBtn: 1,
            yes: function (index, layero) {
            },
            btn2: function () {
            },
            success: function (layero) {
                console.log(data)
                //表单初始赋值
                form.val("editForm", {
                    "couponsId": data.couponsId,
                    "couponsName": data.couponsName,
                    "couponsSubheading": data.couponsSubheading,
                    "couponsTypeId": data.couponsTypeId,
                    "fullAmount": data.fullAmount,
                    "reductionAmount": data.reductionAmount,
                    "provideAmount": data.provideAmount,
                    "instructions": data.instructions,
                    "userType": data.userType,
                    "oneLimit": data.oneLimit,
                    "effectiveDate": data.effectiveDate,
                    "effectiveDay": data.effectiveDay,
                    "jumpLink": data.jumpLink,
                    "discount": data.discount,
                    "immediatelyDiscount": data.immediatelyDiscount
                })
                if (data.effectiveDate == null || data.effectiveDate == "") {
                    form.val("editForm", {
                        "effectiveTypeEdit": 2
                    })
                    $("#effectiveDayEdit").attr("disabled", false);
                    $("#effectiveDateEdit").attr("disabled", true);

                    $("#effectiveDayEdit").attr("lay-verify", "required");
                    $("#effectiveDateEdit").removeAttr("lay-verify");
                } else if (data.effectiveDay == null || data.effectiveDay == "") {
                    form.val("editForm", {
                        "effectiveTypeEdit": 1
                    })
                    $("#effectiveDateEdit").attr("disabled", false);
                    $("#effectiveDayEdit").attr("disabled", true);

                    $("#effectiveDateEdit").attr("lay-verify", "required");
                    $("#effectiveDayEdit").removeAttr("lay-verify");
                }


                //单选按钮的单击事件
                form.on('radio(effectiveType)', function (data) {
                    var abc = data.value;
                    if (abc == 1) {
                        $("#effectiveDateEdit").removeAttr("disabled");
                        $("#effectiveDayEdit").attr("disabled", "disabled");

                        $("#effectiveDateEdit").attr("lay-verify", "required");
                        $("#effectiveDayEdit").removeAttr("lay-verify");
                    } else {
                        $("#effectiveDayEdit").removeAttr("disabled");
                        $("#effectiveDateEdit").attr("disabled", "disabled");

                        $("#effectiveDayEdit").attr("lay-verify", "required");
                        $("#effectiveDateEdit").removeAttr("lay-verify");
                    }

                })
                layui.form.render();
            }
        });


    }


    //查看按钮事件
    function layerShow(data, table, $) {
        //页面弹框
        layer.open({
            type: 1,
            title: '优惠券详情',
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
                layero.find("span[name='couponsName']").text(data.couponsName);
                layero.find("span[name='couponsSubheading']").text(data.couponsSubheading);
                for (var p in couponTypeList) {
                    if (data.couponsTypeId == couponTypeList[p].couponsTypeId) {
                        CouponsTypeName = couponTypeList[p].couponsTypeName;
                        layero.find("span[name='couponsTypeId']").text(CouponsTypeName);
                    } else {

                    }
                }
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

            }

        });
    }

    //下架优惠券按钮事件
    function layerSoldOut(data, table, $) {
        //删除数据库数据
        var url = productHost + "/coupons/couponsDown";
        var data = {
            "couponsId": data.couponsId,
            "soldUpDown": 0
        };
        $.post(url, data, function (res) {
            if (res.responseStatusType.message == "Success") {
                layer.open({
                    title: '下架'
                    , content: '下架成功！'
                });
                //重新加载表格
                table.reload("coupons");
            } else {
                layer.open({
                    title: '下架'
                    , content: '下架失败！'
                });
            }
        })
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

    //加载优惠券类型信息-下拉选-添加之前
    function keyWordCouponsTypeBeforeAdd(form) {
        var url = productHost + "/coupons/couponsTypeList";
        var data = {};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("couponsTypeBeforeAdd"); //server为select定义的id
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

    //关于时间范围的js
    layui.use('laydate', function () {
        var laydate = layui.laydate;
        //日期范围
        laydate.render({
            elem: '#effectiveDateEdit'
            , range: true
        });
        laydate.render({
            elem: '#effectiveDateAdd'
            , range: true
        });
    });
</script>


</body>
</html>