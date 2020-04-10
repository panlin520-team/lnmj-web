<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>创客订单</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${basePath!}/layui/css/layui.css"  media="all">
    <link rel="stylesheet" href="${basePath!}/css/index.css" media="all"/>
    <script src="${basePath!}/js/jquery.min.js" type="text/javascript"></script>
    <script src="${basePath!}/layui/layui.js" charset="utf-8"></script>
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
    <#--<div class="layui-btn-group demoTable">-->
    <#--<button class="layui-btn" data-type="addMakerUser">添加用户</button>-->
    <#--<button class="layui-btn" data-type="getCheckData" >获取选中行数据</button>-->
    <#--<button class="layui-btn" data-type="getCheckLength">获取选中数目</button>-->
    <#--<button class="layui-btn" data-type="isAll">验证是否全选</button>-->
    <#--</div>-->
    <div class="demoTable layui-form" lay-filter="demoTable" style="margin-top: 15px">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label resetLabel">联系电话</label>
                <div class="layui-input-inline">
                    <input class="layui-input" type="text" name="mobile" lay-filter="mobile" autocomplete="off" placeholder="输入联系电话">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">创客商品</label>
                <div class="layui-input-inline">
                    <select name="makerProduct" lay-filter="makerProduct" lay-verify="required">
                        <option value="">请选择</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">订单状态</label>
                <div class="layui-input-inline">
                    <select name="orderStatus" lay-filter="orderStatus" lay-verify="required">
                        <option value="">请选择</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">订单来源</label>
                <div class="layui-input-inline">
                    <input class="layui-input" type="text" name="orderSource" lay-filter="orderSource" autocomplete="off" placeholder="输入订单来源">
                </div>
            </div>
            <div class="layui-inline">
                <button class="layui-btn" data-type="search" ><i class="layui-icon layui-icon-search"></i></button>
            </div>
        </div>
    </div>
    <#--表格:显示创客订单-->
    <table id="makerOrder" lay-filter="makerOrder"></table>
</div>
<#-- 按钮 -->
<script type="text/html" id="makerOrderDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="edit">编辑</a>
    <#--<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="useOrder">使用</a>-->
    <#--<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>-->
    <#--<a class="layui-btn layui-btn-xs" lay-event="UseRecord">使用记录</a>-->
</script>
<#-- 按钮 -->
<script type="text/html" id="orderProductDemo">
    <#--<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>-->
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="useProduct">使用</a>
    <#--<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>-->
    <a class="layui-btn layui-btn-xs" lay-event="useRecord">使用记录</a>
</script>

<#--点击编辑后的表单-->
<form id="orderForm" class="layui-form orderForm layui-form-pane layui-personal" action="" lay-filter="orderForm" method="post" hidden="true">
    <div class="layui-form-item" hidden="hidden">
        <label class="layui-form-label">ID</label>
        <div class="layui-input-block">
            <input type="text" name="makerOrderId" lay-verify="required" autocomplete="off" placeholder="请输入ID" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">订单类型</label>
        <div class="layui-input-block">
            <input type="text" name="orderType" lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">订单号</label>
        <div class="layui-input-block">
            <input type="text" name="makerOrderCode" lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-block">
            <input type="text" name="purchaserName" lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">电话号</label>
        <div class="layui-input-block">
            <input type="text" name="mobile" lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">创客商品</label>
        <div class="layui-input-block">
            <input type="text" name="makerProduct" lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商品编码</label>
        <div class="layui-input-block">
            <input type="text" name="productCode" lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">数量</label>
        <div class="layui-input-block">
            <input type="text" name="num" lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">总价</label>
        <div class="layui-input-block">
            <input type="text" name="totalAmount" lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">支付方式</label>
        <div class="layui-input-block">
            <input type="text" name="payType" lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">配送方式</label>
        <div class="layui-input-block">
            <input type="text" name="deliveryWay" lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">配送地址</label>
        <div class="layui-input-block">
            <input type="text" name="receiverAddress" lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">订单来源</label>
        <div class="layui-input-block">
            <input type="text" name="orderSource" lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">订单状态</label>
        <div class="layui-input-block">
            <input type="text" name="orderStatus" lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" hidden="hidden">
        <label class="layui-form-label">状态</label>
        <div class="layui-input-block">
            <input type="text" name="status" lay-verify="required" autocomplete="off" placeholder="1" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">创建人</label>
        <div class="layui-input-block">
            <input type="text" name="createOperator" lay-verify="required" autocomplete="off" placeholder="11" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" hidden="hidden">
        <label class="layui-form-label">创建时间</label>
        <div class="layui-input-block">
            <input type="text" name="createTime" lay-verify="required" autocomplete="off" placeholder="2019-04-26 15:30:43" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">修改人</label>
        <div class="layui-input-block">
            <input type="text" name="modifyOperator" lay-verify="required" autocomplete="off" placeholder="11" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" hidden="hidden">
        <label class="layui-form-label">更新时间</label>
        <div class="layui-input-block">
            <input type="text" name="dataChangeLastTime" lay-verify="required" autocomplete="off" placeholder="2019-04-26 15:30:43" class="layui-input">
        </div>
    </div>
    <#-- 表格：订单项目 -->
    <table id="orderProduct" class="orderProduct" lay-filter="orderProduct" hidden="true"></table>
</form>

<#--表格：显示订单商品使用记录-->
<form class="layui-form layui-form-pane layui-personal" id="productUseRecordForm" action="" lay-filter="productUseRecordForm" method="post" hidden="true">
    <div class="layui-form-item"></div>
    <table id="productUseRecord" class="productUseRecord" lay-filter="productUseRecord"></table>
</form>


<#--使用订单商品-->
<form id="useOrderForm" class="layui-form useOrderForm layui-form-pane layui-personal" action="" lay-filter="useOrderForm" method="post" hidden="true">
    <div class="layui-form-item" hidden="hidden">
        <label class="layui-form-label">ID</label>
        <div class="layui-input-block">
            <input type="text" name="makerProductUseId" lay-verify="required" autocomplete="off" placeholder="请输入ID" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">订单号</label>
        <div class="layui-input-block">
            <input type="text" name="makerOrderCode" lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">用户</label>
        <div class="layui-input-block">
            <input type="text" name="makerUser" lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">电话</label>
        <div class="layui-input-block">
            <input type="text" name="mobile" lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">项目</label>
        <div class="layui-input-block">
            <input type="text" name="product" lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">配送方式</label>
        <div class="layui-input-block">
            <select name="deliveryWay" lay-filter="deliveryWay" lay-verify="required">
                <option value="">请选择</option>
            </select>
        </div>
    </div>
    <#--快递-->
    <div class="layui-form-item">
        <label class="layui-form-label">配送单号</label>
        <div class="layui-input-block">
            <input type="text" name="deliveryNumber" lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">配送地址</label>
        <div class="layui-input-block">
            <input type="text" name="receiverAddress" lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">配送组织</label>
        <div class="layui-input-block">
            <input type="text" name="deliveryOrganization" lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
        </div>
    </div>
    <#--预约-->
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="appointment" class="layui-btn layui-btn-primary" onclick="appointment()">预约</button>
            <#--<input class="btn" type="button" name="reset" value="重置" style="padding: 5px;font-size: 20px;box-shadow: none;background-color:#DAA99B">-->
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">预约时间</label>
        <div class="layui-input-block">
            <input type="text" name="bookingTime" lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" hidden="hidden">
        <label class="layui-form-label">预约美容师</label>
        <div class="layui-input-block">
            <input type="text" name="bookingBeauticianIds" lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">预约美容师</label>
        <div class="layui-input-block">
            <input type="text" name="bookingBeauticianName" lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">业绩比例</label>
        <div class="layui-input-block">
            <input type="text" name="performanceRatio" lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">预约门店</label>
        <div class="layui-input-block">
			<select name="storeName" lay-filter="storeName" lay-verify="required">
                <option value="">请选择</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商品使用状态</label>
        <div class="layui-input-block">
            <select name="productUseStatus" lay-filter="productUseStatus" lay-verify="required">
                <option value="">请选择</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item" hidden="hidden">
        <label class="layui-form-label">状态</label>
        <div class="layui-input-block">
            <input type="text" name="status" lay-verify="required" autocomplete="off" placeholder="1" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">创建人</label>
        <div class="layui-input-block">
            <input type="text" name="createOperator" lay-verify="required" autocomplete="off" placeholder="11" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" hidden="hidden">
        <label class="layui-form-label">创建时间</label>
        <div class="layui-input-block">
            <input type="text" name="createTime" lay-verify="required" autocomplete="off" placeholder="2019-04-26 15:30:43" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">修改人</label>
        <div class="layui-input-block">
            <input type="text" name="modifyOperator" lay-verify="required" autocomplete="off" placeholder="11" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" hidden="hidden">
        <label class="layui-form-label">更新时间</label>
        <div class="layui-input-block">
            <input type="text" name="dataChangeLastTime" lay-verify="required" autocomplete="off" placeholder="2019-04-26 15:30:43" class="layui-input">
        </div>
    </div>
</form>

<#--预约:护理时间选择-->
<form class="timeForm layui-form-pane layui-personal" id="timeForm" action="" method="post" hidden="true">

    <div class="layui-form">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">护理时间</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" id="nurseDate" placeholder="yyyy-MM-dd" autocomplete="off">
                </div>
            </div>
        </div>
    </div>

    <div class="nore_time_list">
        <div class="time">
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="7">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="09:00">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="8">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="09:10">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="9">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="09:20">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="10">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="09:30">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="11">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="09:40">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="12">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="09:50">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="13">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="10:00">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="14">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="10:10">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="15">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="10:20">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="16">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="10:30">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="17">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="10:40">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="18">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="10:50">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="19">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="11:00">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="20">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="11:10">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="21">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="11:20">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="22">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="11:30">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="23">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="11:40">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="24">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="11:50">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="25">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="12:00">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="26">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="12:10">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="27">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="12:20">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="28">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="12:30">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="29">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="12:40">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="30">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="12:50">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="31">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="13:00">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="32">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="13:10">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="33">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="13:20">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="34">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="13:30">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="35">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="13:40">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="36">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="13:50">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="37">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="14:00">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="38">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="14:10">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="39">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="14:20">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="40">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="14:30">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="41">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="14:40">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="42">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="14:50">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="43">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="15:00">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="44">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="15:10">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="45">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="15:20">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="46">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="15:30">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="47">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="15:40">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="48">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="15:50">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="49">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="16:00">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="50">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="16:10">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="51">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="16:20">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="52">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="16:30">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="53">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="16:40">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="54">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="16:50">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="55">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="17:00">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="56">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="17:10">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="57">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="17:20">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="58">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="17:30">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="59">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="17:40">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="60">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="17:50">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="61">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="18:00">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="62">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="18:10">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="63">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="18:20">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="64">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="18:30">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="65">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="18:40">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="66">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="18:50">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="67">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="19:00">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="68">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="19:10">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="69">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="19:20">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="70">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="19:30">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="71">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="19:40">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="72">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="19:50">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="73">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="20:00">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="74">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="20:10">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="75">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="20:20">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="76">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="20:30">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="77">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="20:40">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="78">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="20:50">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="79">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="21:00">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="80">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="21:10">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="81">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="21:20">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="82">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="21:30">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="83">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="21:40">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="84">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="21:50">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="85">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="22:00">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="86">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="22:10">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="87">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="22:20">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="88">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="22:30">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="89">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="22:40">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="90">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="22:50">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="91">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="23:00">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="92">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="23:10">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="93">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="23:20">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="94">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="23:30">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="95">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="23:40">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="96">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="23:50">
            </div>
            <div class="basetime_list">

                <input type="hidden" name="timeid" value="97">
                <input type="hidden" name="isfree" value="">
                <input class="basetime freebg" type="text" name="basetime" value="24:00">
            </div>
        </div>

        <div class="button_branchman">
            <input class="shiftbutton" type="button" value="自动分配" name="shiftbutton">
            <input type="hidden" value="0" name="ifshift">
            <input class="shiftbutton ismixed" name="addbranchman" type="button" value="添加美容师" style="display: inline;">
            <input class="shiftbutton ismixed" name="delbranchman" type="button" value="删除美容师" style="display: inline;">
        </div>


        <div class="nore_time_branchman">
            <label>美容师　：</label>
            <select id="branchman" name="branchman" onchange="branchman_option_change(this);">
            </select>
            <input class="performance_rate" type="text" name="performance_rate" value="1">业绩占比
            <input type="radio" name="ismainbranchman" checked="" value="0">是否为主美容师
        </div>

    </div>
</form>

<script>
    //数据显示,分页实现
    var table,form,laydate,layer,dataMakerProduct,dataOrderType,
        dataPayType,dataDelivery,dataOrderStatus,dataProductDetail,dataProductUseStatus;
    layui.use(['table','laydate'], function(){
        table = layui.table;
        laydate = layui.laydate;

        loadProductDetail();
        loadPayType();
        loadOrderType();
        loadUseStatus();
        loadOrderStatus();
        loadDeliveryMethod();
        loadProduct();
        loadProdctStatus();
        showSelect();

        table.render({
            elem: '#makerOrder'
            ,url: systemHost+"/manage/maker/order/selectMakerOrderByCondition"     // selectAllMemberList(状态为0的也查询)
            ,cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            ,page:true          //显示分页默认不显示
            ,method: 'post'
            ,request: {
                pageName: 'pageNum', //页码的参数名称，默认：page
                limitName: 'pageSize' //每页数据量的参数名，默认：limit
            }
            ,parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                return {
                    "code": 0, //解析接口状态
                    "msg": res.responseStatusType.error.errorMsg, //解析提示文本
                    "count": res.result==null?0:res.result.total, //解析数据长度
                    "data": res.result==null?0:res.result.list //解析数据列表
                }
            }
            ,cols: [[
                {type: 'checkbox', fixed: 'left',width:40}
                ,{field: 'makerOrderId', title: '序号', width:75, sort: true, fixed: 'left'}
                ,{field: 'makerOrderCode', title: '订单号'}
                ,{field: 'purchaserName', title: '用户', sort:true}
                ,{field: 'mobile', title: '电话号', sort:true}
                ,{field: 'makerProduct', title: '商品',templet: function (d) {
                        for(var p in dataMakerProduct){
                            if(dataMakerProduct[p].makerProductId == d.makerProduct){
                                return dataMakerProduct[p].makerProduct
                            }
                        }
                        return ""
                    }, sort:true}
                ,{field: 'productCode', title: '商品编号'}
                ,{field: 'num', title: '数量'}
                ,{field: 'totalAmount', title: '总价'}
                ,{field: 'payType', title: '支付方式',hide:true}
                ,{field: 'deliveryWay', title: '配送方式',hide:true}
                ,{field: 'receiverAddress', title: '配送地址',hide:true}
                ,{field: 'orderSource', title: '订单来源'}
                ,{field: 'orderStatus', title: '订单状态',templet: function (d) {
                        for(var p in dataOrderStatus){
                            if(p == d.orderStatus){
                                return dataOrderStatus[p]
                            }
                        }
                        return ""
                    }, sort:true}
                ,{field: 'status', title: '状态',hide:true}
                ,{field: 'createOperator', title: '创建人',hide:true}
                ,{field: 'createTime', title: '创建时间',hide:true}
                ,{field: 'modifyOperator', title: '修改人',hide:true}
                ,{field: 'dataChangeLastTime', title: '更新时间',hide:true}
                ,{fixed: 'right',title: '操作', width: 230, align: 'center',toolbar: '#makerOrderDemo'}
            ]]
            ,id: 'makerOrderReload'
        });
    });
    //增删改查操作实现
    layui.use(['table','layer','form'], function(){
        table = layui.table;
        form = layui.form;
        layer=layui.layer;
        //监听表格复选框选择
        // table.on('checkbox(demo)', function(obj){
        // });
        //监听工具条-订单
        table.on('tool(makerOrder)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                detailMakerOrder(data);
                // layer.msg('ID：'+ data.membershipLevelId + ' 的查看操作');
            } else if(obj.event === 'edit'){
                editMakerOrder(data);
                // layer.alert('编辑行：<br>'+ JSON.stringify(data))
            }
        });
        //订单使用
        table.on('tool(orderProduct)', function(obj){
            var data = obj.data;
            if(obj.event === 'useProduct'){
                useProduct(data);
                // layer.msg('ID：'+ data.membershipLevelId + ' 的查看操作');
            } else if(obj.event === 'useRecord'){
                useRecord(data);
                // layer.alert('编辑行：<br>'+ JSON.stringify(data))
            }
        });

        var $ = layui.$, active = {
            // getCheckData: function(){ //获取选中数据
            //     var checkStatus = table.checkStatus('member')
            //         ,data = checkStatus.data;
            //     layer.alert(JSON.stringify(data));
            // }
            // ,getCheckLength: function(){ //获取选中数目
            //     var checkStatus = table.checkStatus('member')
            //         ,data = checkStatus.data;
            //     layer.msg('选中了：'+ data.length + ' 个');
            // }
            // ,isAll: function(){ //验证是否全选
            //     var checkStatus = table.checkStatus('member');
            //     layer.msg(checkStatus.isAll ? '全选': '未全选')
            // },
            search: function (){
                var mobile =  $(".demoTable input[name='mobile']").val(),
                    orderSource =  $(".demoTable input[name='orderSource']").val(),
                    makerProduct = $(".demoTable select[name='makerProduct'] option:selected").val(),
                    orderStatus = $(".demoTable select[name='orderStatus'] option:selected").val();
                table.reload('makerOrderReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        makerProduct: makerProduct,
                        mobile:mobile,
                        orderSource:orderSource,
                        orderStatus:orderStatus
                    }
                }, 'data');
            }
        };

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    });
    //预约
    var currentNurseDate = "";
    var currentNurseTime = "";
    var selectedBeauticianId;
    // var madeId;
    var jsonArray;
    var duration;//护理时长
    function appointment(){
        layui.use('laydate', function() {
            var laydate = layui.laydate;
            loadPost();
            laydate.render({
                elem: '#nurseDate'
                , done: function (value, date) {
                    currentNurseDate = value;
                    currentNurseTime = "";
                    $(".basetime").attr("class", "basetime freebg")
                    //匹配排班时间
                    matchOrderTime(currentNurseDate, currentNurseTime)
                }
            });
        })
        duration = selectDurationById(data);
        useCustomade(table,data,duration);
    }
    var orderWorkList;//所有美容师排版情况
    var beauticians;
    var beauticianIds;
    var performanceRates;
    function useCustomade(table,data,duration) {
        isMatch = 0
        $(".basetime").css("background-color", "#5A7C48")
        orderWorkList = loadBeauticianOrderWork();
        var c1 = layer.open({
            type: 1,
            title: '护理时间',
            content: $("#timeForm"),
            area: ['700px', '700px'],
            btn: ['提交', '取消'],
            success: function (layero) {
                $(".basetime").prev().val("");
                selectedBeauticianId = new Array();
                $(".basetime").attr("readonly", "true")
                $(".basetime").attr("class", "basetime freebg")
                $("#nurseDate").val("")
                currentNurseDate = ""
                currentNurseTime = ""
                $(document).off("click", ".basetime").on("click", ".basetime", function () {
                    var thisdata = $(this);
                    var restTimeMan = new Array();
                    var busyTimeMan = new Array();
                    if (currentNurseDate == "") {
                        layer.msg("请选择护理日期")
                        selectedBeauticianId = new Array();
                    } else {
                        for (var i = 0; i < orderWorkList.length; i++) {
                            if (orderWorkList[i].orderworkDate == currentNurseDate) {

                            }
                        }
                        if (thisdata.prev().val() == "busy") {
                            layer.msg("美容师繁忙是否强制分配", {
                                time: 20000, //20s后自动关闭
                                btn: ['是', '否'],
                                yes: function (index, layero) {
                                    for (var i = 0; i < orderWorkList.length; i++) {
                                        if (orderWorkList[i].busyTimeNodes.indexOf(thisdata.val()) != -1 && orderWorkList[i].orderworkDate == currentNurseDate) {
                                            busyTimeMan.push(orderWorkList[i].beauticianId)
                                        }
                                    }
                                    layer.close(index);
                                    $(".basetime").attr("class", "basetime freebg")
                                    thisdata.attr("class", "basetime freebg clickbg")
                                    currentNurseTime = thisdata.val();
                                },
                                btn2: function () {

                                }

                            });
                        } else if (thisdata.prev().val() == "rest") {
                            layer.msg("美容师休息是否强制分配", {
                                time: 20000, //20s后自动关闭
                                btn: ['是', '否'],
                                yes: function (index, layero) {
                                    for (var i = 0; i < orderWorkList.length; i++) {
                                        if (orderWorkList[i].restTimeNodes.indexOf(thisdata.val()) != -1 && orderWorkList[i].orderworkDate == currentNurseDate) {
                                            restTimeMan.push(orderWorkList[i].beauticianId)
                                        }
                                    }
                                    layer.close(index);
                                    $(".basetime").attr("class", "basetime freebg")
                                    thisdata.attr("class", "basetime freebg clickbg")
                                    currentNurseTime = thisdata.val();
                                },
                                btn2: function () {

                                }
                            });
                        } else {
                            for (var i = 0; i < orderWorkList.length; i++) {
                                if (orderWorkList[i].busyTimeNodes.indexOf(thisdata.val()) != -1 && orderWorkList[i].orderworkDate == currentNurseDate) {
                                    busyTimeMan.push(orderWorkList[i].beauticianId)
                                }
                            }
                            for (var i = 0; i < orderWorkList.length; i++) {
                                if (orderWorkList[i].restTimeNodes.indexOf(thisdata.val()) != -1 && orderWorkList[i].orderworkDate == currentNurseDate) {
                                    restTimeMan.push(orderWorkList[i].beauticianId)
                                }
                            }
                            $(".basetime").attr("class", "basetime freebg")
                            thisdata.attr("class", "basetime freebg clickbg")
                            currentNurseTime = thisdata.val();
                        }

                        selectedBeauticianId = new Array();
                        all_selected_branchman()
                        if (isMatch == 0) {
                            //没有排班匹配时才校验美容师
                            if ($("input[name='Storage']:checked").val() == 1) {
                                loadBeauticianForOrderWork(restTimeMan, busyTimeMan, postMeirongId)
                            } else {
                                loadBeauticianForOrderWork(restTimeMan, busyTimeMan, postMeifaId)
                            }

                        } else if (selectedBeauticianId.length == 0) {
                            if ($("input[name='Storage']:checked").val() == 1) {
                                loadBeauticianForOrderWork(restTimeMan, busyTimeMan, postMeirongId)
                            } else {
                                loadBeauticianForOrderWork(restTimeMan, busyTimeMan, postMeifaId)
                            }
                        }
                    }
                });
                //添加美容师事件绑定
                $(document).off("click", "input[name='addbranchman']").on("click", "input[name='addbranchman']", function () {
                    if (currentNurseTime != "") {
                        layer.msg("该项目的护理时间已经分配完成 不能添加美容师")
                        return
                    }
                    selectedBeauticianId = new Array();
                    $(".nore_time_branchman:last").after($(".nore_time_branchman:last").clone());
                });
                //删除美容师事件绑定
                $(document).off("click", "input[name='delbranchman']").on("click", "input[name='delbranchman']", function () {
                    selectedBeauticianId = new Array();
                    if ($(".nore_time_branchman").length > 1) {
                        $(".nore_time_branchman:last").remove();
                    }
                    all_selected_branchman()
                    //匹配排班时间
                    if (selectedBeauticianId.length != 0) {
                        //如果至少选择了一个美容师才匹配排班
                        matchOrderTime(currentNurseDate, currentNurseTime, 1)
                    }
                });

                //美容师下拉框赋值
                loadBeauticianForOrder(postMeirongId);
            },
            yes: function (index, layero) {
                selectedBeauticianId = new Array();
                all_selected_branchman()
                if (currentNurseDate == "") {
                    layer.msg("请选择护理日期")
                    selectedBeauticianId = new Array();
                    return
                }
                if (currentNurseTime == "") {
                    layer.msg("请选择护理时间")
                    selectedBeauticianId = new Array();
                    return
                }
                //获取主美容师
                var main = $('input[name="ismainbranchman"]:checked').parent().find("select option:selected").val()
                var flag = false;
                if (selectedBeauticianId.length == 0 || flag) {
                    layer.msg("请选择美容师")
                    selectedBeauticianId = new Array();
                } else if (isRepeat(selectedBeauticianId)) {
                    layer.msg("请勿选择相同的美容师")
                    selectedBeauticianId = new Array();
                } else {
                    if (typeof (main) == "undefined") {
                        layer.msg("请选择主美容师")
                        selectedBeauticianId = new Array();
                        return;
                    }
                    //获取业绩占比，然后添加到选定美容师数组对象中
                    get_performance_ratio()
                    //判断业绩占比总和是否为1
                    var total = 0;
                    for (var i = 0; i < selectedBeauticianId.length; i++) {
                        total = total + selectedBeauticianId[i].performanceRate * 1
                    }
                    if (total != 1) {
                        layer.msg("业绩占比分配有误")
                        selectedBeauticianId = new Array();
                        return;
                    }
                    beauticians = new Array();
                    beauticianIds = new Array();
                    performanceRates = new Array();
                    for (var m = 0; m < selectedBeauticianId.length; m++) {
                        if (selectedBeauticianId[m].beauticianId == main) {
                            beauticians.push(selectedBeauticianId[m].name + "(主)")
                            beauticianIds.push(selectedBeauticianId[m].beauticianId + "(主)")
                            performanceRates.push(selectedBeauticianId[m].performanceRate);
                        } else {
                            beauticians.push(selectedBeauticianId[m].name)
                            beauticianIds.push(selectedBeauticianId[m].beauticianId)
                            performanceRates.push(selectedBeauticianId[m].performanceRate);
                        }
                    }
                    //赋值
                    $("#useOrderForm input[name='bookingTime']").val(currentNurseDate+" "+currentNurseTime+":00");
                    $("#useOrderForm input[name='bookingBeauticianIds']").val(JSON.stringify(beauticianIds));
                    $("#useOrderForm input[name='bookingBeauticianName']").val(JSON.stringify(beauticians));
                    $("#useOrderForm input[name='performanceRatio']").val(JSON.stringify(performanceRates));
                    layer.msg("预约成功");
                    $('.nore_time_branchman').not($(".nore_time_branchman:first")).remove();
                    layer.close(c1);
                }
                // table.render();
            },
            btn2: function () {
                $('.nore_time_branchman').not($(".nore_time_branchman:first")).remove();
                isMatch = 0
            },
            end: function() {
                //刷新页面,
                location.reload();
            }
        });
    }
    //获取业绩占比
    function get_performance_ratio() {

        var nore_time_branchman = $(".nore_time_branchman");
        for (var i = 0; i < nore_time_branchman.length; i++) {
            var performanceRate = $(nore_time_branchman[i]).find("input[type='text']").val();
            selectedBeauticianId[i].performanceRate = performanceRate
        }
    }
    //匹配排班时间
    var isMatch=0;
    function matchOrderTime(currentNurseDate, currentNurseTime, isDelete) {
        $(".basetime").css("background-color", "#5A7C48")
        $(".basetime").prev().val("");
        if ((currentNurseDate != "" && currentNurseTime == "") || (currentNurseDate != "" && isDelete == 1)) {
            //如果选择了日期，没有选择时间节点，那么匹配排班
            var jsonArray = new Array();
            for (var i = 0; i < selectedBeauticianId.length; i++) {
                for (var n = 0; n < orderWorkList.length; n++) {
                    if (selectedBeauticianId[i].beauticianId == orderWorkList[n].beauticianId && orderWorkList[n].orderworkDate == currentNurseDate) {
                        var json = {};
                        json.beauticianId = selectedBeauticianId[i].beauticianId
                        json.busyTimeNodesArray = orderWorkList[n].busyTimeNodes
                        json.restTimeNodesArray = orderWorkList[n].restTimeNodes
                        jsonArray.push(json)
                    }
                }
            }

            for (var b = 0; b < jsonArray.length; b++) {
                $(".basetime_list").each(function () {
                    var busyTimeNodesArray = new Array()
                    busyTimeNodesArray = jsonArray[b].busyTimeNodesArray;
                    if (busyTimeNodesArray.indexOf($(this).find("input[name='basetime']").val()) != -1) {
                        $(this).find("input[name='basetime']").css("background-color", "#F58100")
                        $(this).find("input[name='isfree']").val("busy")
                    }
                })
            }


            for (var r = 0; r < jsonArray.length; r++) {
                $(".basetime_list").each(function () {
                    var restTimeNodesArray = new Array()
                    restTimeNodesArray = jsonArray[r].restTimeNodesArray;
                    if (restTimeNodesArray.indexOf($(this).find("input[name='basetime']").val()) != -1) {
                        $(this).find("input[name='basetime']").css("background-color", "#B2B2B2")
                        $(this).find("input[name='isfree']").val("rest")
                    }
                })
            }
            //标记为已经匹配了时间节点
            isMatch = 1;
        }
    }
    //加载美容师排班时间
    function loadBeauticianOrderWork() {
        var url = storeHost + "/manage/orderwork/selectOrderworkAll";
        var data = {"storeId":storeId};
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
    //加载美容师信息
    function loadBeauticianForOrder() {
        var url = storeHost + "/manage/beautician/selectBeauticianByStoreId";
        var data = {"storeId": getUrlParam('storeId')};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("branchman"); //server为select定义的name
                server.innerHTML = "<option selected='true'>请选择</option>";
                for (var p in list) {
                    var option = document.createElement("option");  // 创建添加option属性
                    option.setAttribute("value", list[p].beauticianId); // 给option的value添加值
                    option.innerText = list[p].name;     // 打印option对应的纯文本
                    server.appendChild(option);           //给select添加option子标签
                }
            }
        })
    }
    //加载美容师信息-下单-点击时间判断排班后
    function loadBeauticianForOrderWork(restTimeMan, busyTimeMan, postType) {
        var url = storeHost + "/manage/beautician/selectBeauticianList";
        var data = {"storeId": storeId};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result.list;    //返回的数据
                $("select[name='branchman']").each(function () {
                    $(this).html("<option value='0' selected='true'>请选择</option>");
                    for (var p in list) {
                        if (list[p].postId == postType) {
                            var option = document.createElement("option");  // 创建添加option属性
                            option.setAttribute("value", list[p].beauticianId); // 给option的value添加值
                            if (restTimeMan.indexOf(list[p].beauticianId) != -1) {
                                option.innerText = list[p].name + "(休)";     // 打印option对应的纯文本
                                option.style.color = "#4963ff"
                                option.setAttribute("data-isdisable", "no");
                            } else if (busyTimeMan.indexOf(list[p].beauticianId) != -1) {
                                option.innerText = list[p].name + "(忙)";     // 打印option对应的纯文本
                                option.style.color = "#ff4646"
                                option.setAttribute("data-isdisable", "no");
                            } else {
                                option.innerText = list[p].name
                            }
                            $(this).append(option);
                        }
                    }
                })
            } else {

            }
        })
    }
    //判断数组是否有重复
    function isRepeat(arr) {
        var newArray = new Array();
        for (var i = 0; i < arr.length; i++) {
            newArray.push(arr[i].beauticianId)
        }
        var nary = newArray.sort();
        for (var i = 0; i < newArray.length; i++) {
            if (nary[i] == nary[i + 1]) {
                return true;
            }
        }
    }
    //美容师变化时
    function branchman_option_change(data) {
        selectedBeauticianId = new Array();
        all_selected_branchman()
        console.log(selectedBeauticianId);
        //匹配排班时间
        if (currentNurseTime == "") {
            //如果还没选择时间节点-显示美容师排版情况
            jsonArray =matchOrderTime(currentNurseDate, currentNurseTime, 0)
            // return
        }

        if (selectedBeauticianId.length == 0) {
            $(".basetime").css("background-color", "#5A7C48")
            $(".basetime").prev().val("");
        }
    }
    //获取所有选中美容师
    function all_selected_branchman() {

        var nore_time_branchman = $(".nore_time_branchman");
        for (var i = 0; i < nore_time_branchman.length; i++) {
            if ($(nore_time_branchman[i]).find("select option:selected").val() != 0) {
                var beauticianId = $(nore_time_branchman[i]).find("select option:selected").val()
                var beauticianName = $(nore_time_branchman[i]).find("select option:selected").text()
                var json = {"beauticianId": beauticianId, "name": beauticianName, "performanceRate": ""}
                selectedBeauticianId.push(json)
            }
        }
    }
    function selectDurationById(data) {
        var url = storeHost + "/store/selectDurationById";
        var param = {
            serviceProductIds: data.productId
        };
        var duration = "";
        $.ajax({
            type : "post",
            url : url,
            data : param,
            async : false,
            success : function(res){
                if (res.responseStatusType.message == "Success") {
                    duration = res.result.list[0].duration;    //返回的数据
                }
            }
        });

        return duration;
    }
    //加载职位信息
    var postMeirongId
    var postMeifaId
    function loadPost() {
        var url = storeHost + "/manage/beautician/selectPost";
        var data = {};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result.list;    //返回的数据
                for (p in list) {
                    if (list[p].name == "美容师") {
                        postMeirongId = list[p].postId
                    } else if (list[p].name == "美发师") {
                        postMeifaId = list[p].postId
                    }
                }
            }
        })
    }

    //使用订单
    function useProduct(data) {
        //数据获取
        var dataOrderBtn = $("#orderProduct").attr("data-order")
        var b2 = layer.open({
            type: 1,
            title: '使用订单',
            content: $('#useOrderForm'),
            closeBtn: 1,
            btn: ['提交','取消'],
            yes: function (index, layero) {
                var deliveryWay = layero.find("select[name='deliveryWay']");
                    deliveryWay = deliveryWay.find("option:selected").val();
                var store = layero.find("input[name='storeName']"),
                    storeId = store.find("option:selected").val(),
                    storeName = store.find("option:selected").text();
                var url = systemHost+"/manage/maker/order/insertMakerOrderUse",
                    params = {
                        makerOrderCode: dataOrderBtn.makerOrderCode,
                        makerUserId: dataOrderBtn.makerUserId,
                        mobile: dataOrderBtn.mobile,
                        product: data.makerProductDetailId,
                        productCode: dataOrderBtn.productCode,
                        deliveryWay: deliveryWay,
                        receiverAddress: layero.find("input[name='receiverAddress']").val(),
                        deliveryNumber: layero.find("input[name='deliveryNumber']").val(),
                        deliveryOrganization: layero.find("input[name='deliveryOrganization']").val(),
                        bookingTime: layero.find("input[name='bookingTime']").val(),
                        bookingBeauticianIds: layero.find("input[name='bookingBeauticianIds']").val(),
                        bookingBeauticianName: layero.find("input[name='bookingBeauticianName']").val(),
                        storeId: storeId,
                        storeName: storeName,
                        performanceRatio: layero.find("input[name='performanceRatio']").val(),
                        createOperator: "${currentUser.trueName!}",
                        modifyOperator: "${currentUser.trueName!}"
                    };
                $.post(url,params,function(res){
                    if(res.responseStatusType.message=="Success"){
                        layer.open({
                            title: '使用订单'
                            ,content: '使用订单成功！'
                            ,btn: ["关闭"]
                            ,yes: function(index){
                                layer.close(index)
                                layer.close(b2);
                            }
                        });
                        //重新加载表格
                        table.reload("orderProductUseReload");
                    }else{
                        layer.open({
                            title: '使用订单'
                            ,content: '使用订单失败！'
                            ,btn: ["关闭"]
                        });
                    }
                })
            },
            btn2: function(index,layero){
                layer.close(index);
            },
            success: function (layero, index) {
                //回显数据
                layero.find("input[name='makerOrderCode']").val(dataOrderBtn.makerOrderCode);
                layero.find("input[name='makerUser']").val(dataOrderBtn.makerUserId);
                layero.find("input[name='mobile']").val(dataOrderBtn.mobile);
                layero.find("input[name='product']").val(dataOrderBtn.product);
                var deliveryWay = layero.find("select[name='deliveryWay']");
                deliveryWay.find("option[value='"+dataOrderBtn.deliveryWay+"']").attr("selected",true);
                // layero.find("input[name='receiverAddress']").val(dataOrderBtn.receiverAddress);
                //不能修改
                layero.find("input[name='makerOrderCode']").attr("disabled","disabled");
                layero.find("input[name='makerUser']").attr("disabled","disabled");
                layero.find("input[name='mobile']").attr("disabled","disabled");
                layero.find("input[name='product']").attr("disabled","disabled");
                layero.find("select[name='deliveryWay']").attr("disabled","disabled");
                layero.find("input[name='createOperator']").parent().parent().hide();
                layero.find("input[name='modifyOperator']").parent().parent().hide();
                layero.find("input[name='productUseStatus']").parent().parent().hide();
                //显示按钮：预约和配送
                if(dataOrderBtn.deliveryWay == 1 || dataOrderBtn.deliveryWay == 2){
                    //仅到店，到店并免运费
                    //物流隐藏
                    layero.find("input[name='receiverAddress']").parent().parent().hide();
                    layero.find("input[name='deliveryNumber']").parent().parent().hide();
                    layero.find("input[name='deliveryOrganization']").parent().parent().hide();
                }
            },
            area: ['600px', '500px']
        });
    }
    //使用记录
    function useRecord(data) {
        var b2 = layer.open({
            type: 1,
            title: '创客订单使用记录',
            content: $('#productUseRecordForm'),
            closeBtn: 1,
            btn: ['确定'],
            yes: function (index, layero) {
                layer.close(index);
            },
            success: function (layero, index) {
                table.render({
                    elem: '#productUseRecord'
                    ,url: systemHost+"/manage/maker/order/selectMakerOrderUseByCondition"
                    ,cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    ,page:true          //显示分页默认不显示
                    ,method: 'post'
                    ,request: {
                        pageName: 'pageNum', //页码的参数名称，默认：page
                        limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    }
                    ,where: {
                        makerOrderCode:data.makerOrderCode
                    }
                    ,parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                        return {
                            "code": 0, //解析接口状态
                            "msg": res.responseStatusType.error.errorMsg, //解析提示文本
                            "count": res.result==null?0:res.result.total, //解析数据长度
                            "data": res.result==null?0:res.result.list //解析数据列表
                        }
                    }
                    ,cols: [[
                        {type: 'checkbox', fixed: 'left',width:40}
                        ,{field: 'makerProductUseId', title: '序号', width:75, sort: true, fixed: 'left'}
                        ,{field: 'makerOrderCode', title: '订单号', sort:true}
                        ,{field: 'mobile', title: '用户', sort:true}
                        ,{field: 'productCode', title: '创客商品', sort:true, templet: function (d) {
                            var makerProduct = "";
                            for(var p in dataMakerProduct){
                                if(d.productCode == dataMakerProduct[p].makerProductId){
                                    makerProduct = dataMakerProduct[p].makerProduct
                                }
                            }
                            return makerProduct;
                            }}
                        ,{field: 'product', title: '商品',templet: function (d) {
                            var product = "";
                            for(var p in dataProductDetail){
                                if(d.product == dataProductDetail[p].product){
                                    product =  dataProductDetail[p].productName
                                }
                            }
                            return product;
                            }}
                        ,{field: 'deliveryWay', title: '配送方式', sort:true, templet: function (d) {
                            var deliveryWay = "";
                            for(var p in dataDelivery){
                                if(d.deliveryWay == p){
                                    deliveryWay =  dataDelivery[p]
                                }
                            }
                            return deliveryWay
                            }}
                        ,{field: 'receiverAddress', title: '配送地址', sort:true,hide:true}
                        ,{field: 'deliveryNumber', title: '配送单号', sort:true,hide:true}
                        ,{field: 'deliveryOrganization', title: '配送组织', sort:true,hide:true}
                        ,{field: 'bookingTime', title: '预约时间',hide:true}
                        ,{field: 'storeName', title: '预约门店',hide:true}
                        ,{field: 'performanceRatio', title: '业绩比例',hide:true}
                        ,{field: 'bookingBeauticianName', title: '预约美容师',hide:true}
                        ,{field: 'productUseStatus', title: '商品使用状态', templet: function (d) {
                            var productUseStatus = ""
                            for(var p in dataProductUseStatus){
                                if(d.productUseStatus == p){
                                    productUseStatus = dataProductUseStatus[p]
                                }
                            }
                            return productUseStatus;
                            }}
                        ,{field: 'status', title: '状态',hide:true}
                        ,{field: 'createOperator', title: '创建人',hide:true}
                        ,{field: 'createTime', title: '创建时间',hide:true}
                        ,{field: 'modifyOperator', title: '修改人',hide:true}
                        ,{field: 'dataChangeLastTime', title: '更新时间',hide:true}
                    ]]
                    , id: 'orderProductUseReload'
                });
            },
            area: ['550px', '450px']
        })
    }

    //订单：订单详情
    function detailMakerOrder(data){
        var a2 = layer.open({
            type: 1,
            title: '创客订单',
            content: $('#orderForm'),
            closeBtn: 1,
            btn: ['确定'],
            yes: function(index,layero){
                layer.close(index);
            },
            success: function(layero,index){
                //回显
                layero.find("input[name='makerOrderId']").val(data.makerOrderId);
                var orderType = "";
                for(var p in dataOrderType){
                    if(p==data.orderType){
                        orderType = dataOrderType[p]
                    }
                }
                layero.find("input[name='orderType']").val(orderType);
                layero.find("input[name='makerOrderCode']").val(data.makerOrderCode);
                layero.find("input[name='purchaserName']").val(data.purchaserName);
                layero.find("input[name='mobile']").val(data.mobile);
                var makerProduct = "";
                for(var p in dataMakerProduct){
                    if(dataMakerProduct[p].makerProductId == data.makerProduct){
                        makerProduct = dataMakerProduct[p].makerProduct
                    }
                }
                layero.find("input[name='makerProduct']").val(makerProduct);
                layero.find("input[name='productCode']").val(data.productCode);
                layero.find("input[name='num']").val(data.num);
                layero.find("input[name='totalAmount']").val(data.totalAmount);
                var payType = "";
                for(var p in dataPayType){
                    if(p == data.payType){
                        payType = dataPayType[p]
                    }
                }
                layero.find("input[name='payType']").val(payType);
                var deliveryWay = "";
                for(var p in dataDelivery){
                    if(p == data.deliveryWay){
                        deliveryWay = dataDelivery[p]
                    }
                }
                layero.find("input[name='deliveryWay']").val(deliveryWay);
                // form.render("select","orderForm");
                layero.find("input[name='receiverAddress']").val(data.receiverAddress);
                layero.find("input[name='orderSource']").val(data.orderSource);
                var orderStatus = "";
                for(var p in dataOrderStatus){
                    if(p == data.orderStatus){
                        orderStatus = dataOrderStatus[p]
                    }
                }
                layero.find("input[name='orderStatus']").val(orderStatus);
                layero.find("input[name='status']").val(data.status);
                layero.find("input[name='createOperator']").val(data.createOperator);
                layero.find("input[name='createTime']").val(data.createTime);
                layero.find("input[name='modifyOperator']").val(data.modifyOperator);
                layero.find("input[name='dataChangeLastTime']").val(data.dataChangeLastTime);
                // layero.find("input[name='createOperator']").parent().parent().hide();
                // layero.find("input[name='modifyOperator']").parent().parent().hide();
                //订单项目
                table.render({
                    elem: '#orderProduct'
                    ,url: systemHost+"/manage/maker/product/selectMakerProductDetailByCondition"     // selectAllMemberList(状态为0的也查询)
                    ,cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    ,page:true          //显示分页默认不显示
                    ,method: 'post'
                    ,request: {
                        pageName: 'pageNum', //页码的参数名称，默认：page
                        limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    }
                    ,where: {
                        productCode: data.productCode
                    }
                    ,parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                        return {
                            "code": 0, //解析接口状态
                            "msg": res.responseStatusType.error.errorMsg, //解析提示文本
                            "count": res.result==null?0:res.result.total, //解析数据长度
                            "data": res.result==null?0:res.result.list //解析数据列表
                        }
                    }
                    ,cols: [[
                        {type: 'checkbox', fixed: 'left',width:40}
                        ,{field: 'makerProductDetailId', title: 'Id', width:60, sort: true, fixed: 'left'}
                        ,{field: 'productName', title: '商品', sort:true}
                        ,{field: 'useTotalTimes', title: '个数', sort:true}
                        ,{field: 'productStatus', title: '商品状态', sort:true,templet:function(d){
                                //根据订单商品id查看商品是否被使用
                                $.ajax({
                                    url: systemHost+"/manage/maker/order/selectMakerOrderUseByCondition",
                                    data: {makerOrderCode:data.makerOrderCode,product:d.makerProductDetailId},
                                    method: "POST",
                                    async: false,
                                    success: function (res) {
                                        if(res.responseStatusType.message=="Success"){
                                            if(data.deliveryWay == 0){
                                                return "已配送"
                                            }
                                            var a = res.result.list;
                                            return "已使用"+a.length+"次";
                                        }
                                    }
                                })
                            }}
                        // ,{field: 'efficientCondition', title: '条件', sort:true,templet: function (d) {
                        //         var scope = "<div>"+ d.efficientDate +"</div>";
                        //         for(var p in dataScope){
                        //             if(p == d.efficientCondition){
                        //                 scope = "<div>"+dataScope[p]+"</div>"+"<div>"+ d.efficientDate +"</div>";
                        //             }
                        //         }
                        //         return scope;
                        //     }}
                        // ,{field: 'link', title: '分享链接'}
                        // ,{field: 'totalSales', title: '总售价', sort:true}
                        // ,{field: 'forwardTitle', title: '转发标题'}
                        // ,{field: 'forwardDescribe', title: '转发描述'}
                        // ,{field: 'imageUrl', title: '商品图片', templet: function (d) {
                        //         return d.imageUrl == "" || d.imageUrl == null ?
                        //             "<div class='imgs'><img src='/noImg.png' style='width:60px;height: 30px'></div>" :
                        //             "<div class='imgs'><img src=http://" + d.imageUrl + " style='width:60px;height: 30px'></div>";
                        //     }}
                        ,{field: 'status', title: '状态',hide:true}
                        ,{field: 'createOperator', title: '创建人',hide:true}
                        ,{field: 'createTime', title: '创建时间',hide:true}
                        ,{field: 'modifyOperator', title: '修改人',hide:true}
                        ,{field: 'dataChangeLastTime', title: '更新时间',hide:true}
                    ]]
                    // ,id: 'makerProductDetailReload'
                });

            },
            area:['600px', '500px']
        });
    }
    //订单：编辑
    function editMakerOrder(data){
        var a3 = layer.open({
            type: 1,
            title: '创客订单',
            content: $('#orderForm'),
            closeBtn: 1,
            btn: ['确定','取消'],
            yes: function(index,layero){
                var url = systemHost+"/manage/maker/order/updateMakerOrder",
                    params = {
                        makerOrderId: data.makerOrderId,
                        purchaserName: layero.find("input[name='purchaserName']").val(),
                        mobile: layero.find("input[name='mobile']").val(),
                        receiverAddress: layero.find("input[name='receiverAddress']").val(),
                        modifyOperator: "${currentUser.trueName!}"
                    };
                $.post(url,params,function (res) {
                    if(res.responseStatusType.message=="Success"){
                        layer.open({
                            title: '修改'
                            ,content: '修改成功！'
                            ,btn: ["关闭"]
                            ,yes: function (index) {
                                layer.close(index);
                                layer.close(a3);
                            }
                        });
                        //重新加载tree
                        table.reload("makerOrderReload");
                    }else{
                        layer.open({
                            title: '修改'
                            ,content: '修改失败！'
                            ,btn: ["关闭"]
                        });
                    }
                })
            },
            success: function(layero,index){
                //回显
                layero.find("input[name='makerOrderId']").val(data.makerOrderId);
                var orderType = "";
                for(var p in dataOrderType){
                    if(p==data.orderType){
                        orderType = dataOrderType[p]
                    }
                }
                layero.find("input[name='orderType']").val(orderType);
                layero.find("input[name='makerOrderCode']").val(data.makerOrderCode);
                layero.find("input[name='purchaserName']").val(data.purchaserName);
                layero.find("input[name='mobile']").val(data.mobile);
                var makerProduct = "";
                for(var p in dataMakerProduct){
                    if(dataMakerProduct[p].makerProductId == data.makerProduct){
                        makerProduct = dataMakerProduct[p].makerProduct
                    }
                }
                layero.find("input[name='makerProduct']").val(makerProduct);
                layero.find("input[name='productCode']").val(data.productCode);
                layero.find("input[name='num']").val(data.num);
                layero.find("input[name='totalAmount']").val(data.totalAmount);
                var payType = "";
                for(var p in dataPayType){
                    if(p == data.payType){
                        payType = dataPayType[p]
                    }
                }
                layero.find("input[name='payType']").val(payType);
                var deliveryWay = "";
                for(var p in dataDelivery){
                    if(p == data.deliveryWay){
                        deliveryWay = dataDelivery[p]
                    }
                }
                layero.find("input[name='deliveryWay']").val(deliveryWay);
                // form.render("select","orderForm");
                layero.find("input[name='receiverAddress']").val(data.receiverAddress);
                layero.find("input[name='orderSource']").val(data.orderSource);
                var orderStatus = "";
                for(var p in dataOrderStatus){
                    if(p == data.orderStatus){
                        orderStatus = dataOrderStatus[p]
                    }
                }
                layero.find("input[name='orderStatus']").val(orderStatus);
                layero.find("input[name='status']").val(data.status);
                layero.find("input[name='createOperator']").val(data.createOperator);
                layero.find("input[name='createTime']").val(data.createTime);
                layero.find("input[name='modifyOperator']").val(data.modifyOperator);
                layero.find("input[name='dataChangeLastTime']").val(data.dataChangeLastTime);
                //不可编辑
                layero.find("input[name='orderType']").parent().parent().hide();
                layero.find("input[name='makerOrderCode']").parent().parent().hide();
                // layero.find("input[name='purchaserName']").parent().parent().hide();
                // layero.find("input[name='mobile']").parent().parent().hide();
                layero.find("input[name='makerProduct']").parent().parent().hide();
                layero.find("input[name='productCode']").parent().parent().hide();
                layero.find("input[name='num']").parent().parent().hide();
                layero.find("input[name='totalAmount']").parent().parent().hide();
                layero.find("input[name='payType']").parent().parent().hide();
                layero.find("input[name='deliveryWay']").parent().parent().hide();
                // layero.find("input[name='receiverAddress']").parent().parent().hide();
                layero.find("input[name='orderSource']").parent().parent().hide();
                layero.find("input[name='orderStatus']").parent().parent().hide();
                layero.find("input[name='createOperator']").parent().parent().hide();
                layero.find("input[name='modifyOperator']").parent().parent().hide();
                //数据传递
                $("#orderProduct").attr("data-order", data);
                //订单商品
                table.render({
                    elem: '#orderProduct'
                    ,url: systemHost+"/manage/maker/product/selectMakerProductDetailByCondition"     // selectAllMemberList(状态为0的也查询)
                    ,cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    ,page:true          //显示分页默认不显示
                    ,method: 'post'
                    ,request: {
                        pageName: 'pageNum', //页码的参数名称，默认：page
                        limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    }
                    ,where: {
                        productCode: data.productCode
                    }
                    ,parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                        return {
                            "code": 0, //解析接口状态
                            "msg": res.responseStatusType.error.errorMsg, //解析提示文本
                            "count": res.result==null?0:res.result.total, //解析数据长度
                            "data": res.result==null?0:res.result.list //解析数据列表
                        }
                    }
                    ,cols: [[
                        {type: 'checkbox', fixed: 'left',width:40}
                        ,{field: 'makerProductDetailId', title: 'Id', width:60, sort: true, fixed: 'left'}
                        ,{field: 'productName', title: '商品', sort:true}
                        ,{field: 'useTotalTimes', title: '个数', sort:true}
                        ,{field: 'productStatus', title: '商品状态', sort:true,templet:function(d){
                           var str = "";
                            if(data.deliveryWay == 0){
                                str = "已配送";
                                return str;
                            }
                            //根据订单商品id查看商品是否被使用
                            $.ajax({
                                url: systemHost+"/manage/maker/order/selectMakerOrderUseByCondition",
                                data: {makerOrderCode:data.makerOrderCode,product:d.makerProductDetailId},
                                method: "POST",
                                async: false,
                                success: function (res) {
                                    if(res.responseStatusType.message=="Success"){
                                        if(res.result == null){
                                            str = "未使用";
                                            return str;
                                        }else{
                                            var a = res.result.list;
                                            str = "已使用"+a.length+"次";
                                            return str;
                                        }
                                    }else{
                                        str = "未使用";
                                        return str;
                                    }
                                }
                            });
                        }}
                        // ,{field: 'efficientCondition', title: '条件', sort:true,templet: function (d) {
                        //         var scope = "<div>"+ d.efficientDate +"</div>";
                        //         for(var p in dataScope){
                        //             if(p == d.efficientCondition){
                        //                 scope = "<div>"+dataScope[p]+"</div>"+"<div>"+ d.efficientDate +"</div>";
                        //             }
                        //         }
                        //         return scope;
                        //     }}
                        // ,{field: 'link', title: '分享链接'}
                        // ,{field: 'totalSales', title: '总售价', sort:true}
                        // ,{field: 'forwardTitle', title: '转发标题'}
                        // ,{field: 'forwardDescribe', title: '转发描述'}
                        // ,{field: 'imageUrl', title: '商品图片', templet: function (d) {
                        //         return d.imageUrl == "" || d.imageUrl == null ?
                        //             "<div class='imgs'><img src='/noImg.png' style='width:60px;height: 30px'></div>" :
                        //             "<div class='imgs'><img src=http://" + d.imageUrl + " style='width:60px;height: 30px'></div>";
                        //     }}
                        ,{field: 'status', title: '状态',hide:true}
                        ,{field: 'createOperator', title: '创建人',hide:true}
                        ,{field: 'createTime', title: '创建时间',hide:true}
                        ,{field: 'modifyOperator', title: '修改人',hide:true}
                        ,{field: 'dataChangeLastTime', title: '更新时间',hide:true}
                        ,{fixed: 'right', title: '操作', width: 230, align: 'center', toolbar: '#orderProductDemo'}
                    ]]
                    , id: 'orderProductReload'
                });
            },
            area:['600px', '500px']
        });
    }

    function loadProdctStatus(){
        $.ajax({
            url: systemHost+"/manage/maker/order/selectOrderStatusEnum",
            data: {name:"ProductStatusEnum"},
            async:false,
            method: "POST",
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    dataProductStatus = res.result;
                }
            }
        })
    }

    function loadProduct(){
        $.ajax({
            url: systemHost+"/manage/maker/product/selectMakerProductList",
            async:false,
            method: "POST",
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    dataMakerProduct = res.result.list;
                }
            }
        })
    }

    function loadDeliveryMethod(){
        $.ajax({
            url: systemHost+"/manage/maker/order/selectOrderStatusEnum",
            data: {name:"DeliveryMethodEnum"},
            async:false,
            method: "POST",
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    dataDelivery = res.result;
                }
            }
        })
    }

    function loadOrderStatus(){
        $.ajax({
            url: systemHost+"/manage/maker/order/selectOrderStatusEnum",
            data: {name:"OrderStatusEnum"},
            async:false,
            method: "POST",
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    dataOrderStatus = res.result;
                }
            }
        })
    }

    function loadUseStatus(){
        $.ajax({
            url: systemHost+"/manage/maker/order/selectOrderStatusEnum",
            data: {name:"MakerProductUseStatusEnum"},
            async:false,
            method: "POST",
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    dataProductUseStatus = res.result;
                }
            }
        })
    }

    function loadOrderType(){
        $.ajax({
            url: systemHost+"/manage/maker/order/selectOrderStatusEnum",
            data: {name:"OrderTypeEnum"},
            async:false,
            method: "POST",
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    dataOrderType = res.result;
                }
            }
        })
    }

    function loadPayType(){
        $.ajax({
            url: systemHost+"/manage/maker/order/selectOrderStatusEnum",
            data: {name:"PayTypeEnum"},
            async:false,
            method: "POST",
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    dataPayType = res.result;
                }
            }
        })
    }

    function loadProductDetail(){
        dataProductDetail = new Array();
        $.ajax({
            url: productHost + "/manage/product/selectProductListNoPage",
            async:false,
            data: {type: '1',productStatus: '1',status: 1},
            method: "POST",
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    var data = res.result;
                    for(var p in data){
                        dataProductDetail.push({productId:data[p].productId,productName:data[p].productName,data:data[p]});
                    }
                }
            }
        });
        $.ajax({
            url: productHost + "/manage/product/selectProductListNoPage",
            async:false,
            data: {type: '2',productStatus: '1',status: 1},
            method: "POST",
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    var data = res.result;
                    for(var p in data){
                        dataProductDetail.push({productId:data[p].serviceProductId,productName:data[p].productName,data:data[p]});
                    }
                }
            }
        });
        // console.log(dataProduct);
    }

    function showSelect(){
        $(".demoTable select[name='orderStatus']").html("<option value=''>请选择</option>");
        $(".demoTable select[name='makerProduct']").html("<option value=''>请选择</option>");
        for (var p in dataOrderStatus) {
            var option = "<option value='" + p + "'>" + dataOrderStatus[p] + "</option>";
            $(".demoTable select[name='orderStatus']").append(option);
        }
        for (var p in dataMakerProduct) {
            var option = "<option value='" + dataMakerProduct[p].makerProductId + "'>" + dataMakerProduct[p].makerProduct + "</option>";
            $(".demoTable select[name='makerProduct']").append(option);
        }
        form.render("select","demoTable");
    }
</script>

</body>
</html>