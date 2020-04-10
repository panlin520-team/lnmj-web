<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>创客产品</title>
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
    <div class="demoTable layui-form" lay-filter="demoTable" style="margin-top: 15px">
        <#-- benefactor nursingName storeName employeeCode presentationStatus -->
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label resetLabel">商品状态</label>
                <div class="layui-input-inline">
                    <select name="productStatus" lay-filter="productStatus" lay-verify="required">
                        <option value="">请选择</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">创客分类</label>
                <div class="layui-input-inline">
                    <select name="makerType" lay-filter="makerType" lay-verify="required">
                        <option value="">请选择</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <button class="layui-btn" data-type="search" ><i class="layui-icon layui-icon-search"></i></button>
            </div>
            <div class="layui-inline">
                <div class="layui-btn-group demoTable">
                    <button class="layui-btn" data-type="addMakerProduct">添加创客商品</button>
                    <#--<button class="layui-btn" data-type="getCheckData" >获取选中行数据</button>-->
                    <#--<button class="layui-btn" data-type="getCheckLength">获取选中数目</button>-->
                    <#--<button class="layui-btn" data-type="isAll">验证是否全选</button>-->
                </div>
            </div>
        </div>
    </div>
    <#--表格:显示创客产品-->
    <table id="makerProduct" lay-filter="makerProduct"></table>
</div>

<#-- 按钮:创客产品 -->
<script type="text/html" id="productDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    {{#  if(d.productStatus == 2){ }}
    <#--已下架-->
    <a class="layui-btn layui-btn-xs" lay-event="productUp">上架</a>
    {{#  }else if(d.productStatus == 1){ }}
    <#--已上架-->
    <a class="layui-btn layui-btn-xs" lay-event="productDown">下架</a>
    {{#  } }}
</script>
<#-- 按钮：创客产品详情 -->
<script type="text/html" id="productDetailDemo">
    <#--<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>-->
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<#--表单：添加创客产品-->
<form id="editForm" class="layui-form editForm layui-form-pane layui-personal" action="" lay-filter="editForm" method="post" hidden="true">
    <div class="layui-form-item" hidden="hidden">
        <label class="layui-form-label">ID</label>
        <div class="layui-input-block">
            <input type="text" name="makerProductId" lay-verify="required" autocomplete="off" placeholder="请输入ID" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">限购分类</label>
        <div class="layui-input-block">
            <select name="makerType" lay-filter="makerType" lay-verify="required">
                <option value="">请选择</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商品名</label>
        <div class="layui-input-block">
            <input type="text" name="makerProduct" lay-verify="required" autocomplete="off" placeholder="请输入商品名" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商品编号</label>
        <div class="layui-input-block">
            <input type="text" name="productCode" lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">原价</label>
        <div class="layui-input-block">
            <input type="text" name="originalPrice" lay-verify="required" autocomplete="off" placeholder="10000.00" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">零售价</label>
        <div class="layui-input-block">
            <input type="text" name="retailPrice" lay-verify="required" autocomplete="off" placeholder="100.00" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">折扣</label>
        <div class="layui-input-block">
            <input type="text" name="discount" lay-verify="required" autocomplete="off" placeholder="0" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">积分</label>
        <div class="layui-input-block">
            <input type="text" name="integral" lay-verify="required" autocomplete="off" placeholder="0" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">图片类型</label>
        <div class="layui-input-block">
            <input type="text" name="imageType" lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商品图标</label>
        <div class="layui-input-block">
            <button type="button" class="layui-btn" id="productImage">
                <i class="layui-icon">&#xe67c;</i>请选择图片
            </button>
            <div class="layui-upload-list">
                <img class="layui-upload-img" id="uploadProductImage"  style='width:160px;height: 80px'>
            </div>
            <#--<input type="image" name="productImage" lay-verify="required" autocomplete="off" placeholder="请选择图片" class="layui-input">-->
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">禁止支付方式</label>
        <div class="layui-input-block">
            <input type="checkbox" name="barredPayMethod" lay-skin="primary" title="好友代付">
            <input type="checkbox" name="barredPayMethod" lay-skin="primary" title="储值支付">
            <input type="checkbox" name="barredPayMethod" lay-skin="primary" title="赠送支付">
            <input type="checkbox" name="barredPayMethod" lay-skin="primary" title="返利支付">
            <input type="checkbox" name="barredPayMethod" lay-skin="primary" title="微信支付">
            <input type="checkbox" name="barredPayMethod" lay-skin="primary" title="线下支付">
            <input type="checkbox" name="barredPayMethod" lay-skin="primary" title="共享金支付">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">所属门店</label>
        <div class="layui-input-block">
            <select name="storeName" lay-filter="storeName" lay-verify="required">
                <option value="">请选择</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">更多内容</label>
        <div class="layui-input-block">
            <textarea name="moreContent" placeholder="请输入内容" class="layui-textarea"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">产品有效期</label>
        <div class="layui-input-block">
            <input type="text" name="productUseTime" id="productUseTime" lay-verify="required" autocomplete="off" placeholder=" - " class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商品状态</label>
        <div class="layui-input-block">
            <select name="productStatus" lay-filter="productStatus" lay-verify="required">
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
    <div class="layui-form-item"></div>
    <button id="addMakerProductDetail" type="button" class="layui-btn">添加创客产品项目</button>
    <#--产品项目-->
    <table id="showMakerProductTable" lay-filter="showMakerProductTable"></table>
</form>

<#--表单：查看产品信息及产品项目-->
<form id="showForm" class="layui-form showForm layui-form-pane layui-personal" action="" lay-filter="showForm" method="post" hidden="true">
    <div class="layui-form-item" hidden="hidden">
        <label class="layui-form-label">ID</label>
        <div class="layui-input-block">
            <input type="text" name="makerProductId" lay-verify="required" autocomplete="off" placeholder="请输入ID" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">限购分类</label>
        <div class="layui-input-block">
            <select name="makerType" lay-filter="makerType" lay-verify="required">
                <option value="">请选择</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商品名</label>
        <div class="layui-input-block">
            <input type="text" name="makerProduct" lay-verify="required" autocomplete="off" placeholder="请输入商品名" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商品编号</label>
        <div class="layui-input-block">
            <input type="text" name="productCode" lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">原价</label>
        <div class="layui-input-block">
            <input type="text" name="originalPrice" lay-verify="required" autocomplete="off" placeholder="10000.00" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">零售价</label>
        <div class="layui-input-block">
            <input type="text" name="retailPrice" lay-verify="required" autocomplete="off" placeholder="100.00" class="layui-input">
        </div>
    </div>
   <div class="layui-form-item">
        <label class="layui-form-label">折扣</label>
        <div class="layui-input-block">
            <input type="text" name="discount" lay-verify="required" autocomplete="off" placeholder="0" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">积分</label>
        <div class="layui-input-block">
            <input type="text" name="integral" lay-verify="required" autocomplete="off" placeholder="0" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">图片类型</label>
        <div class="layui-input-block">
            <input type="text" name="imageType" lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商品图标</label>
        <div class="layui-input-block">
            <button type="button" class="layui-btn" id="productImageShow">
                <i class="layui-icon">&#xe67c;</i>请选择图片
            </button>
            <div class="layui-upload-list">
                <img class="layui-upload-img" id="uploadProductImageShow"  style='width:160px;height: 80px'>
            </div>
            <#--<input type="image" name="productImage" lay-verify="required" autocomplete="off" placeholder="请选择图片" class="layui-input">-->
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">禁止支付方式</label>
        <div class="layui-input-block">
            <input type="checkbox" name="barredPayMethod" lay-skin="primary" title="好友代付">
            <input type="checkbox" name="barredPayMethod" lay-skin="primary" title="储值支付">
            <input type="checkbox" name="barredPayMethod" lay-skin="primary" title="赠送支付">
            <input type="checkbox" name="barredPayMethod" lay-skin="primary" title="返利支付">
            <input type="checkbox" name="barredPayMethod" lay-skin="primary" title="微信支付">
            <input type="checkbox" name="barredPayMethod" lay-skin="primary" title="线下支付">
            <input type="checkbox" name="barredPayMethod" lay-skin="primary" title="共享金支付">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">所属门店</label>
        <div class="layui-input-block">
            <select name="storeName" lay-filter="storeName" lay-verify="required">
                <option value="">请选择</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">更多内容</label>
        <div class="layui-input-block">
            <textarea name="moreContent" placeholder="请输入内容" class="layui-textarea"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">产品有效期</label>
        <div class="layui-input-block">
            <input type="text" name="productUseTimeShow" id="productUseTimeShow" lay-verify="required" autocomplete="off" placeholder=" - " class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商品状态</label>
        <div class="layui-input-block">
            <select name="productStatus" lay-filter="productStatus" lay-verify="required">
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
    <#--产品项目-->
    <table id="showMakerProductTableShow" lay-filter="showMakerProductTableShow"></table>
</form>

<#--表格：编辑产品项目-->
<form class="layui-form layui-form-pane layui-personal" id="productForm" action="" lay-filter="productForm" method="post" hidden="true">
    <div class="layui-form-item"></div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <button id="addMakerProductDetail" type="button" class="layui-btn">添加创客产品项目</button>
        </div>
    </div>
    <table id="productDetail" class="productDetail" lay-filter="productDetail"></table>
</form>

<#--表单：产品项目-->
<form id="productDetailForm" class="layui-form productDetailForm layui-form-pane layui-personal" action="" lay-filter="productDetailForm" method="post" hidden="true">
    <div class="layui-form-item" hidden="hidden">
        <label class="layui-form-label">ID</label>
        <div class="layui-input-block">
            <input type="text" name="makerProductDetailId" lay-verify="required" autocomplete="off" placeholder="请输入ID" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商品编号</label>
        <div class="layui-input-block">
            <input type="text" name="productCode" lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">项目</label>
        <div class="layui-input-block">
            <select name="productName" lay-filter="productName" lay-verify="required">
                <option value="">请选择</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">使用期限</label>
        <div class="layui-input-block">
            <input type="text" name="useLimit" id="useLimit" lay-verify="required" autocomplete="off" placeholder="30天" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">个数</label>
        <div class="layui-input-block">
            <input type="text" name="useTotalTimes" lay-verify="required" autocomplete="off" placeholder="100.00" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">使用个数</label>
        <div class="layui-input-block">
            <input type="text" name="useTime" lay-verify="required" autocomplete="off" placeholder="10.00" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">生效条件</label>
        <div class="layui-input-block">
            <select name="efficientCondition" lay-filter="efficientCondition" lay-verify="required">
                <option value="">请选择</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">生效时间</label>
        <div class="layui-input-block">
            <input type="text" name="efficientDate" id="efficientDate" lay-verify="required" autocomplete="off" placeholder="yyyy-mm-dd HH:mm:ss" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">链接</label>
        <div class="layui-input-block">
            <input type="text" name="link" lay-verify="required" autocomplete="off" placeholder="http://xxx/xx" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">总售价</label>
        <div class="layui-input-block">
            <input type="text" name="totalSales" lay-verify="required" autocomplete="off" placeholder="0" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">总提成</label>
        <div class="layui-input-block">
            <input type="text" name="totalCommission" lay-verify="required" autocomplete="off" placeholder="0" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">转发标题</label>
        <div class="layui-input-block">
            <input type="text" name="forwardTitle" lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">转发描述</label>
        <div class="layui-input-block">
            <input type="text" name="forwardDescribe" lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商品图标</label>
        <div class="layui-input-block">
            <button type="button" class="layui-btn" id="productDetailImage">
                <i class="layui-icon">&#xe67c;</i>请选择图片
            </button>
            <div class="layui-upload-list">
                <img class="layui-upload-img" id="uploadProductDetailImage"  style='width:160px;height: 80px'>
            </div>
            <#--<input type="image" name="productDetailImage" lay-verify="required" autocomplete="off" placeholder="请选择图片" class="layui-input">-->
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

<script>
    //数据显示,分页实现
    var table,form,laydate,layer,upload,dataMakerType,dataStore,dataProductStatus,
        dataDelivery,dataMakerProduct,dataScope,file,fileD,dataProduct,
        multipartFile = null,mutipartFileD = null,productDetail = [];
    layui.use(['table','laydate','upload','form'], function(){
        table = layui.table;
        laydate = layui.laydate;
        upload = layui.upload;
        form = layui.form;

        loadMakerType();
        loadStore();
        loadProdctStatus();
        loadDeliveryMethod();
        loadScope();
        loadProduct();
        showSelect();

        table.render({
            elem: '#makerProduct'
            ,url: systemHost+"/manage/maker/product/selectMakerProductByCondition"     // selectAllMemberList(状态为0的也查询)
            ,cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            ,page:true          //显示分页默认不显示
            ,method: 'post'
            ,request: {
                pageName: 'pageNum', //页码的参数名称，默认：page
                limitName: 'pageSize' //每页数据量的参数名，默认：limit
            }
            ,parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                dataMakerProduct = res.result==null?0:res.result.list;
                return {
                    "code": 0, //解析接口状态
                    "msg": res.responseStatusType.error.errorMsg, //解析提示文本
                    "count": res.result==null?0:res.result.total, //解析数据长度
                    "data": res.result==null?0:res.result.list //解析数据列表
                }
            }
            ,cols: [[
                {type: 'checkbox', fixed: 'left',width:40}
                ,{field: 'makerProductId', title: '序号', width:75, sort: true, fixed: 'left'}
                ,{field: 'makerType', title: '创客分类', sort:true,templet: function (d) {
                    var html = "<option value=''>请选择</option>";
                    for (var p in dataMakerType) {
                        var option = "<option value='" + dataMakerType[p].parameterId + "'>" + dataMakerType[p].parameterName + "</option>";
                        if(dataMakerType[p].parameterId == d.makerType){
                            option = "<option value='" + dataMakerType[p].parameterId + "' selected>" + dataMakerType[p].parameterName + "</option>";
                        }
                        html += option;
                    }
                    return "<select name='makerTypeTable' lay-filter='makerTypeTable' lay-verify='required' data-id='"+d.makerProductId+"'>"+html+"</select>";
                    }}
                ,{field: 'makerProduct',edit:'text' ,title: '产品名称', sort:true}
                ,{field: 'productCode', title: '产品编码', sort:true}
                ,{field: 'originalPrice', title: '原价', sort:true,hide:true}
                ,{field: 'retailPrice',edit:'text', title: '售价', sort:true}
                ,{field: 'imageUrl', title: '商品图片', templet: function (d) {
                        return d.imageUrl == "" || d.imageUrl == null ?
                            "<div class='imgs'><img src='/noImg.png' style='width:60px;height: 30px'></div>" :
                            "<div class='imgs'><img src=http://" + d.imageUrl + " style='width:60px;height: 30px'></div>";
                    }}
                ,{field: 'productStatus', title: '商品状态',templet: function (d) {
                        var html = "<option value=''>请选择</option>";
                        for (var p in dataProductStatus) {
                            var option = "<option value='" + p + "'>" + dataProductStatus[p]+ "</option>";
                            if(p == d.productStatus){
                                option = "<option value='" + p + "' selected>" + dataProductStatus[p] + "</option>";
                            }
                            html += option;
                        }
                        return "<select name='dataProductStatusTable' lay-filter='dataProductStatusTable' lay-verify='required' data-id='"+
                            d.makerProductId+"'>"+html+"</select>";
                    }}
                ,{field: 'startTime', title: '有效期',width:300,templet: function (d) {
                    //edit:'select',
                        return "<input type='text' name='startTime' value='" +d.startTime+" - "+d.endTime+
                            "' lay-verify='required' autocomplete='off' placeholder=' - ' class='layui-input layui-input-date' data-id='"+d.makerProductId+"'>";
                    }}
                ,{field: 'status', title: '状态',hide:true}
                ,{field: 'createOperator', title: '创建人',hide:true}
                ,{field: 'createTime', title: '创建时间',hide:true}
                ,{field: 'modifyOperator', title: '修改人',hide:true}
                ,{field: 'dataChangeLastTime', title: '更新时间',hide:true}
                ,{fixed: 'right',title: '操作', width: 230, align: 'center',toolbar: '#productDemo'}
            ]]
            ,id: 'makerProductReload'
            , done: function (res, curr, count) {
                form.render("select","makerProduct");
                //时间
                $(".layui-input-date").each(function (i) {
                    layui.laydate.render({
                        elem: this
                        ,type: 'datetime'
                        ,range: true
                        // ,range: ' - '
                        // ,format: 'yyyy-MM-dd HH:mm:ss'
                        ,done: function(value, date){
                            // console.log(value);
                            // console.log(date);
                            var id = this.elem[0].getAttribute('data-id');
                            var paramsValue = {
                                makerProductId: id,
                                startTime: value.split(" - ")[0].replace(/^\s+|\s+$/g,""),
                                endTime: value.split(" - ")[1].replace(/^\s+|\s+$/g,""),
                                modifyOperator: "${currentUser.trueName!}"
                            };
                            layer.msg('[ID: ' + id + '] startTime 字段更改为：' + value, {
                                time: 20000, //20s后自动关闭
                                btn: ['确认修改', '取消'],
                                yes: function (index, layero) {
                                    var url = systemHost + "/manage/maker/product/updateMakerProduct";
                                    var params = paramsValue;
                                    $.post(url, params, function (res) {
                                        if (res.responseStatusType.message == "Success") {
                                            layer.msg("修改成功")
                                            table.reload("makerProductReload");
                                        } else {
                                            layer.msg(res.responseStatusType.error.errorMsg, {
                                                time: 20000, //20s后自动关闭
                                                btn: ['明白了']
                                            });
                                        }
                                    })
                                },
                                btn2: function (index) {
                                    layer.close(index);
                                    // table.reload("makerProductReload");
                                }
                            });
                        }
                    });
                });
                //由于layui 设置了超出隐藏，所以这里改变下，以兼容操作按钮的下拉菜单
                $(".layui-table-body, .layui-table-box, .layui-table-cell").css('overflow', 'visible');
                //调整高度
                $("td .layui-form-select").css('margin-top', '-10px');
                $("td .layui-form-select").css('margin-left', '-15px');
                $("td .layui-form-select").css('margin-right', '-15px');
            }
        });

        laydate.render({
            elem: '#productUseTime'
            ,type: 'datetime'
            ,range: true
            // ,range: ' - '
            // ,format: 'yyyy-MM-dd HH:mm:ss'
        });
        // laydate.render({
        //     elem: '#useLimit'
        //     ,type: 'datetime'
        //     ,range: true
        //     // ,range: ' - '
        //     // ,format: 'yyyy-MM-dd'
        // });
        laydate.render({
            elem: '#efficientDate'
            ,type: 'datetime'
            ,format: 'yyyy-MM-dd HH:mm:ss'
        });

    });

    //增删改查操作实现
    layui.use(['table','layer','form'], function(){
        table = layui.table;
        form = layui.form;
        layer = layui.layer;

        //监听表格复选框选择
        // table.on('checkbox(demo)', function(obj){
        // });
        //监听工具条
        table.on('tool(makerProduct)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                detailMakerProduct(data);
                // layer.msg('ID：'+ data.membershipLevelId + ' 的查看操作');
            }else if(obj.event === 'edit'){
                editMakerProdcut(data);
                // layer.alert('编辑行：<br>'+ JSON.stringify(data))
            }else if(obj.event === 'del'){
                deleteMakerProduct(data);
            }else if(obj.event === 'productUp'){
                upOrDownMakerProduct(obj.event,data);
            }else if(obj.event === 'productDown'){
                upOrDownMakerProduct(obj.event,data);
            }
        });

        //监听单元格编辑
        table.on('edit(makerProduct)', function (obj) {
            var value = obj.value //得到修改后的值
                , data = obj.data //得到所在行所有键值
                , field = obj.field; //得到字段
            var paramsValue = null;
            if(field=="makerProduct"){
                paramsValue = {
                    makerProductId: data.makerProductId,
                    makerProduct: value,
                    modifyOperator: "${currentUser.trueName!}"
                };
            }else if(field=="retailPrice"){
                paramsValue = {
                    makerProductId: data.makerProductId,
                    retailPrice: value,
                    modifyOperator: "${currentUser.trueName!}"
                };
            }
            layer.msg('[ID: ' + data.makerProductId + '] ' + field + ' 字段更改为：' + value, {
                time: 20000, //20s后自动关闭
                btn: ['确认修改', '取消'],
                yes: function (index, layero) {
                    var url = systemHost + "/manage/maker/product/updateMakerProduct";
                    var params = paramsValue;
                    $.post(url, params, function (res) {
                        if (res.responseStatusType.message == "Success") {
                            layer.msg("修改成功")
                            table.reload("makerProductReload");
                        } else {
                            layer.msg(res.responseStatusType.error.errorMsg, {
                                time: 20000, //20s后自动关闭
                                btn: ['明白了']
                            });
                        }
                    })
                },
                btn2: function (index) {
                    layer.close(index);
                    // table.reload("makerProductReload");
                }
            });
        });
        //监听表单元素（select）
        form.on('select(makerTypeTable)', function (obj) {
            var value = obj.value //得到修改后的值
                , othis = obj.othis; //得到美化后的元素
            var id = obj.elem.getAttribute("data-id");
            var paramsValue = {
                makerProductId: id,
                makerType: value,
                modifyOperator: "${currentUser.trueName!}"
            };
            layer.msg('[ID: ' + id + '] makerType 字段更改为：' + value, {
                time: 20000, //20s后自动关闭
                btn: ['确认修改', '取消'],
                yes: function (index, layero) {
                    var url = systemHost + "/manage/maker/product/updateMakerProduct";
                    var params = paramsValue;
                    $.post(url, params, function (res) {
                        if (res.responseStatusType.message == "Success") {
                            layer.msg("修改成功")
                            table.reload("makerProductReload");
                        } else {
                            layer.msg(res.responseStatusType.error.errorMsg, {
                                time: 20000, //20s后自动关闭
                                btn: ['明白了']
                            });
                        }
                    })
                },
                btn2: function (index) {
                    layer.close(index);
                    // table.reload("makerProductReload");
                }
            });
        });
        form.on('select(dataProductStatusTable)', function (obj) {
            var value = obj.value //得到修改后的值
                , elem = obj.elem //得到元素
                , othis = obj.othis; //得到美化后的元素
            var id = elem.getAttribute("data-id");
            var paramsValue = {
                makerProductId: id,
                productStatus: value,
                modifyOperator: "${currentUser.trueName!}"
            };
            layer.msg('[ID: ' + id + ']dataProductStatus 字段更改为：' + value, {
                time: 20000, //20s后自动关闭
                btn: ['确认修改', '取消'],
                yes: function (index, layero) {
                    var url = systemHost + "/manage/maker/product/updateMakerProduct";
                    var params = paramsValue;
                    $.post(url, params, function (res) {
                        if (res.responseStatusType.message == "Success") {
                            layer.msg("修改成功")
                            table.reload("makerProductReload");
                        } else {
                            layer.msg(res.responseStatusType.error.errorMsg, {
                                time: 20000, //20s后自动关闭
                                btn: ['明白了']
                            });
                        }
                    })
                },
                btn2: function (index) {
                    layer.close(index);
                    // table.reload("makerProductReload");
                }
            });
        });

        table.on('tool(productDetail)', function(obj){
            var data = obj.data;
            if(obj.event === 'edit'){
                editMakerProdcutDetail(data);
                // layer.alert('编辑行：<br>'+ JSON.stringify(data))
            }else if(obj.event === 'del'){
                deleteMakerProductDetail(data);
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
                var productStatus = $(".demoTable select[name='productStatus'] option:selected").val(),
                    makerType = $(".demoTable select[name='makerType'] option:selected").val();
                table.reload('makerProductReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        productStatus: productStatus,
                        makerType:makerType
                    }
                }, 'data');
            }
            ,addMakerProduct: function () {
                var a1 = layer.open({
                    type: 1,
                    title: '添加创客产品',
                    content: $('#editForm'),
                    // scrollbar: true,
                    closeBtn: 1,
                    btn: ['提交', '取消'],
                    id: "addMakerProductForm",
                    yes: function (index,layero) {
                        var makerType = layero.find("select[name='makerType']");
                        makerType = makerType.find("option:selected").val();
                        var storeNameS = layero.find("select[name='storeName']"),
                        storeId = storeNameS.find("option:selected").val(),
                        storeName = storeNameS.find("option:selected").text();
                        var barredPayMethod = layero.find("input[name='barredPayMethod']:checked");
                        var barredPayMethodArr = loadParams(barredPayMethod);
                        var productUseTime = layero.find("input[name='productUseTime']").val(),
                            timeS = productUseTime.split(" - ")[0],
                            timeE = productUseTime.split(" - ")[1];
                        // var productStatus = layero.find("select[name='productStatus']");
                        // productStatus = productStatus.find("option:selected").val();
                        var params= new FormData();
                        params.append("makerType",makerType);
                        params.append("makerProduct",layero.find("input[name='makerProduct']").val());
                        params.append("retailPrice",layero.find("input[name='retailPrice']").val());
                        params.append("integral",layero.find("input[name='integral']").val());
                        params.append("imageType","makerProduct");
                        if(multipartFile!=null){
                            params.append("multipartFile",multipartFile);
                        }
                        params.append("barredPayMethod", barredPayMethodArr);
                        params.append("storeId", storeId);
                        params.append("storeName", storeName);
                        params.append("moreContent",layero.find("textarea[name='moreContent']").val());
                        params.append("startTime", timeS.replace(/^\s+|\s+$/g,""));
                        params.append("endTime", timeE.replace(/^\s+|\s+$/g,""));
                        // params.append("productStatus", productStatus);
                        // if(productDetail !=null && productDetail!=[]){
                        //     productDetail.forEach(function (detail,index) {
                        //         params.append("makerProductDetailList", detail,index);
                        //     })
                        // }
                        params.append("makerProductDetailList", productDetail);
                        params.append("createOperator","${currentUser.trueName!}");
                        params.append("modifyOperator","${currentUser.trueName!}");
                        var url = systemHost+"/manage/maker/product/insertMakerProduct";
                        $.ajax({
                            url: url
                            ,type:"POST"
                            ,data: params
                            ,dataType: "json"   //服务器传回的数据类型
                            ,processData: false
                            // ,contentType:"multipart/form-data"
                            ,contentType: false
                            ,success: function (res){
                                if (res.responseStatusType.message == "Success") {
                                    layer.open({
                                        title: '添加'
                                        , content: '添加成功！'
                                        , btn: ["关闭"]
                                        , yes: function (index) {
                                            productDetail = [];
                                            layer.close(index); //如果设定了yes回调，需进行手工关闭
                                            layer.close(a1);
                                        }
                                    });
                                    //重新加载表格
                                    table.reload("makerProductReload");
                                } else {
                                    layer.open({
                                        title: '添加'
                                        , content: '添加失败！'
                                        , btn: ["关闭"]
                                    });
                                }
                            }
                        });
                    },
                    btn2: function (index) {
                        layer.close(index);
                    },
                    success: function (layero,index) {
                        //不能编辑
                        layero.find("input[name='createOperator']").parent().parent().hide();
                        layero.find("input[name='modifyOperator']").parent().parent().hide();
                        layero.find("input[name='productCode']").parent().parent().hide();
                        layero.find("input[name='imageType']").parent().parent().hide();
                        layero.find("input[name='originalPrice']").parent().parent().hide();
                        layero.find("select[name='productStatus']").parent().parent().hide();
                        //图片
                        layero.find("#uploadProductImage").parent().hide();
                        showProductImage();
                    },
                    area:['800px', '700px']
                });
            }
        };

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    });
    function loadParams(name) {
        var arr = new Array(name.length);
        for (var i=0;i<name.length;i++) {
            arr[i] = name[i].title
        }
        return arr;
    }
    function showProductImage() {   //商品图标
        file = upload.render({
            elem: '#productImage'
            ,exts: 'jpg|jpeg|png|bmp|GIF|JPG|PNG|JPEG'  //common设定
            ,size: 60000    //限制文件大小，单位 KB
            ,auto: false
            ,choose: function (obj) {
                //将图片回显到img标签
                obj.preview(function(index, file, result){
                    $('#uploadProductImage').attr('src', result); //图片链接（base64）
                    multipartFile = file;
                });
                var html = '<i class="layui-icon">&#xe67c;</i>重新选择图片';
                $('#productImage').html(html);
                $("#uploadProductImage").parent().show();
            }
        });
    }
    function showImage() {
        fileD = upload.render({
            elem: '#productDetailImage'
            ,exts: 'jpg|jpeg|png|bmp|GIF|JPG|PNG|JPEG'  //common设定
            ,size: 60000    //限制文件大小，单位 KB
            ,auto: false
            ,choose: function (obj) {
                //将图片回显到img标签
                obj.preview(function(index, file, result){
                    $('#uploadProductDetailImage').attr('src', result); //图片链接（base64）
                    mutipartFileD = file;
                });
                var html = '<i class="layui-icon">&#xe67c;</i>重新选择图片';
                $('#productDetailImage').html(html);
                $("#uploadProductDetailImage").parent().show();
            }
        });
    }
    //产品项目：添加
    $("#addMakerProductDetail").click(function () {
        //页面弹框
        var b2 = layer.open({
            type: 1,
            title: '添加创客产品项目',
            content: $('#productDetailForm'),
            // scrollbar: true,
            closeBtn: 1,
            btn: ['提交', '取消'],
            yes: function (index, layero) {
                var efficientCondition = layero.find("select[name='efficientCondition']");
                efficientCondition = efficientCondition.find("option:selected").val();
                var productNameS = layero.find("select[name='productName']"),
                    product = productNameS.find("option:selected").val(),
                    productName = productNameS.find("option:selected").text();
                var params= new FormData();
                params.append("product",product);
                params.append("productName",productName);
                params.append("useLimit",layero.find("input[name='useLimit']").val());
                params.append("useTotalTimes",layero.find("input[name='useTotalTimes']").val());
                params.append("useTime",layero.find("input[name='useTime']").val());
                params.append("efficientCondition",efficientCondition);
                params.append("efficientDate",layero.find("input[name='efficientDate']").val());
                params.append("link",layero.find("input[name='link']").val());
                params.append("totalSales",layero.find("input[name='totalSales']").val());
                params.append("totalCommission",layero.find("input[name='totalCommission']").val());
                params.append("forwardTitle",layero.find("input[name='forwardTitle']").val());
                params.append("forwardDescribe",layero.find("input[name='forwardDescribe']").val());
                params.append("imageType","makerProduct");
                params.append("multipartFile",mutipartFileD);
                params.append("createOperator","${currentUser.trueName!}");
                params.append("modifyOperator","${currentUser.trueName!}");
                productDetail.push(params);
                layer.open({
                    title: '添加'
                    , content: '添加成功！'
                    , btn: ["关闭"]
                    , yes: function (index) {
                        var productDetailBak = table.cache["productDetailReload"];
                        var tempJson = {};
                        params.forEach(function (value,key){
                            tempJson[key] = value;
                        });
                        tempJson.LAY_TABLE_INDEX = productDetailBak.length;
                        productDetailBak.push(tempJson);
                        //重新加载表格
                        table.reload("productDetailReload",{
                            data:productDetailBak  // 将新数据重新载入表格
                        });
                        layer.close(index);
                        layer.close(b2);
                    }
                });
            },
            btn2: function (index) {
                layer.close(index);
            },
            success: function (layero) {
                //图片
                layero.find("#uploadProductDetailImage").parent().hide();
                showImage();
                //不可编辑
                layero.find("input[name='productCode']").parent().parent().hide();
                layero.find("input[name='createOperator']").parent().parent().hide();
                layero.find("input[name='modifyOperator']").parent().parent().hide();
            },
            area:['750px', '650px']
        });
    });
    //产品项目：编辑
    function editMakerProdcutDetail(data){
        var b1 = layer.open({
            type: 1,
            title: '编辑创客产品项目',
            content: $('#productDetailForm'),
            // scrollbar: true,
            closeBtn: 1,
            btn: ['提交', '取消'],
            area: ['750px', '600px'],
            yes: function (index,layero) {
                var efficientCondition = layero.find("select[name='efficientCondition']");
                efficientCondition = efficientCondition.find("option:selected").val();
                var productNameS = layero.find("select[name='productName']"),
                    product = productNameS.find("option:selected").val(),
                    productName = productNameS.find("option:selected").text();
                var paramsPD = new FormData();
                paramsPD.append("makerProductDetailId",data.makerProductDetailId);
                paramsPD.append("product",product);
                paramsPD.append("productName",productName);
                paramsPD.append("useLimit",layero.find("input[name='useLimit']").val());
                paramsPD.append("useTotalTimes",layero.find("input[name='useTotalTimes']").val());
                paramsPD.append("useTime",layero.find("input[name='useTime']").val());
                paramsPD.append("efficientCondition",efficientCondition);
                paramsPD.append("efficientDate",layero.find("input[name='efficientDate']").val());
                paramsPD.append("link",layero.find("input[name='link']").val());
                paramsPD.append("totalSales",layero.find("input[name='totalSales']").val());
                paramsPD.append("totalCommission",layero.find("input[name='totalCommission']").val());
                paramsPD.append("forwardTitle",layero.find("input[name='forwardTitle']").val());
                paramsPD.append("forwardDescribe",layero.find("input[name='forwardDescribe']").val());
                paramsPD.append("imageType","makerProduct");
                paramsPD.append("multipartFile",mutipartFileD);
                <#--params.append("createOperator","${currentUser.trueName!}");-->
                paramsPD.append("modifyOperator","${currentUser.trueName!}");
                productDetail.push(paramsPD);
                layer.open({
                    title: '编辑'
                    , content: '编辑成功！'
                    , btn: ["关闭"]
                    , yes: function (index) {
                        layer.close(index);
                        layer.close(b1);
                    }
                });
                var productDetailBak = table.cache["productDetailReload"];
                var tempJson = {};
                paramsPD.forEach(function (value,key){
                    tempJson[key] = value;
                });
                //替换元素
                for(var p in productDetailBak){
                    if(productDetailBak[p].makerProductDetailId == data.makerProductDetailId){
                        tempJson.LAY_TABLE_INDEX = productDetailBak[p].LAY_TABLE_INDEX;
                        productDetailBak.splice(p,1,tempJson);
                    }
                }
                //重新加载表格
                table.reload("productDetailReload",{
                    data:productDetailBak
                });
            },
            btn2: function (index) {
                layer.close(index);
            },
            success: function (layero,index) {
                //回显
                layero.find("input[name='makerProductDetailId']").val(data.makerProductDetailId);
                layero.find("input[name='productCode']").val(data.productCode);
                var productName = layero.find("select[name='productName']");
                productName.find("option[value='"+data.product+"']").attr("selected",true);
                layero.find("input[name='useLimit']").val(data.useLimit);
                layero.find("input[name='useTotalTimes']").val(data.useTotalTimes);
                layero.find("input[name='useTime']").val(data.useTime);
                var efficientCondition = layero.find("select[name='efficientCondition']");
                efficientCondition.find("option[value='"+data.efficientCondition+"']").attr("selected",true);
                layero.find("input[name='efficientDate']").val(data.efficientDate);
                layero.find("input[name='link']").val(data.link);
                layero.find("input[name='totalSales']").val(data.totalSales);
                layero.find("input[name='totalCommission']").val(data.totalCommission);
                layero.find("input[name='forwardTitle']").val(data.forwardTitle);
                layero.find("input[name='forwardDescribe']").val(data.forwardDescribe);
                layero.find("input[name='imageType']").val(data.imageType);
                layui.form.render("select","productDetailForm");
                //不能编辑
                layero.find("input[name='useTime']").parent().parent().hide();
                layero.find("input[name='createOperator']").parent().parent().hide();
                layero.find("input[name='modifyOperator']").parent().parent().hide();
                layero.find("input[name='productCode']").parent().parent().hide();
                layero.find("input[name='imageType']").parent().parent().hide();
                //图片
                showImage();//加载图片
                var imageUrl = "http://"+data.imageUrl;
                layero.find("#uploadProductDetailImage").attr("src",imageUrl);
                layero.find("#uploadProductDetailImage").attr("onclick","window.open('"+imageUrl+"')"); //点击图片打开图片
            }
        });
    }
    function loadCheckBox(object, name) {
        var newCheckBox = [];
        newCheckBox = object.split(",");
        for (var j = 0; j < newCheckBox.length; j++) {
            var OldCheckBox = $("input[name="+name+"]");
            for (var i = 0; i < OldCheckBox.length; i++) {
                if (OldCheckBox[i].title == newCheckBox[j]) {
                    $(OldCheckBox[i]).attr('checked', true);
                    $(OldCheckBox[i]).next().addClass('layui-form-checked');
                }
            }
        }
    }
    //产品项目：删除
    function deleteMakerProductDetail(data) {
        var url = systemHost+"/manage/maker/product/deleteMakerProductDetail",
            params = {
                makerProductDetailId: data.makerProductDetailId,
                modifyOperator: "${currentUser.trueName!}"
            };
        $.post(url,params,function (res) {
            if (res.responseStatusType.message == "Success") {
                layer.open({
                    title: '删除'
                    , content: '删除成功！'
                });
                //重新加载表格
                table.reload("productDetailReload");
            } else {
                layer.open({
                    title: '删除'
                    , content: '删除失败！'
                });
            }
        })
    }
    //产品：详情
    function detailMakerProduct(data){
        var a2 = layer.open({
            type: 1,
            title: '查看创客产品项目',
            content: $('#showForm'),
            // scrollbar: true,
            closeBtn: 1,
            btn: ['取消'],
            id: "productFormReload",
            area: ['900px', '600px'],
            yes: function (index, layero) {
                layer.close(index);
            },
            success: function (layero, index) {
                layero.find("input[name='makerProductId']").val(data.makerProductId);
                var makerType = layero.find("select[name='makerType']");
                makerType.find("option[value='"+data.makerType+"']").attr("selected",true);
                layero.find("input[name='makerProduct']").val(data.makerProduct);
                layero.find("input[name='productCode']").val(data.productCode);
                layero.find("input[name='originalPrice']").val(data.originalPrice);
                layero.find("input[name='retailPrice']").val(data.retailPrice);
                layero.find("input[name='discount']").val(data.discount);
                layero.find("input[name='integral']").val(data.integral);
                layero.find("input[name='imageType']").val(data.imageType);
                //图片
                var imageUrl = "http://"+data.imageUrl;
                layero.find("#uploadProductImageShow").attr("src",imageUrl);
                layero.find("#uploadProductImageShow").attr("onclick","window.open('"+imageUrl+"')"); //点击图片打开图片
                layero.find("#productImageShow").hide();
                /*处理显示禁止支付方式复选框*/
                var name = 'barredPayMethod';
                loadCheckBox(data.barredPayMethod, name);
                var storeName = layero.find("select[name='storeName']");
                storeName.find("option[value='"+data.storeId+"']").attr("selected",true);
                layero.find("textarea[name='moreContent']").val(data.moreContent);
                layero.find("input[name='productUseTimeShow']").val(data.startTime+" - "+data.endTime);
                var productStatus = layero.find("select[name='productStatus']");
                productStatus.find("option[value='"+data.productStatus+"']").attr("selected",true);
                layero.find("input[name='createOperator']").val(data.createOperator);
                layero.find("input[name='modifyOperator']").val(data.modifyOperator);
                layui.form.render("select","showForm");
               table.render({
                    elem: '#showMakerProductTableShow'
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
                    ,cols: [[//标题栏
                       {align: 'center', title: '产品项目', colspan: 15}
                        ]
                        ,[
                        {type: 'checkbox', fixed: 'left',width:40,hide:true}
                        ,{field: 'makerProductDetailId', title: '序号', width:60, fixed: 'left'}
                        ,{field: 'productName', title: '商品', sort:true}
                        ,{field: 'useTotalTimes', title: '使用总次数', sort:true}
                        ,{field: 'efficientCondition', title: '条件', templet: function (d) {
                                var scope = "<div>"+ d.efficientDate +"</div>";
                                for(var p in dataScope){
                                    if(p == d.efficientCondition){
                                        scope = "<div>"+dataScope[p]+"</div>"+"<div>"+ d.efficientDate +"</div>";
                                    }
                                }
                                return scope;
                            }}
                        ,{field: 'link', title: '分享链接',hide:true}
                        ,{field: 'totalSales', title: '总售价', sort:true}
                        ,{field: 'forwardTitle', title: '转发标题',hide:true}
                        ,{field: 'forwardDescribe', title: '转发描述',hide:true}
                        ,{field: 'imageUrl', title: '商品图片', templet: function (d) {
                                return d.imageUrl == "" || d.imageUrl == null ?
                                    "<div class='imgs'><img src='/noImg.png' style='width:60px;height: 30px'></div>" :
                                    "<div class='imgs'><img src=http://" + d.imageUrl + " style='width:60px;height: 30px'></div>";
                            }}
                        ,{field: 'status', title: '状态',hide:true}
                        ,{field: 'createOperator', title: '创建人',hide:true}
                        ,{field: 'createTime', title: '创建时间',hide:true}
                        ,{field: 'modifyOperator', title: '修改人',hide:true}
                        ,{field: 'dataChangeLastTime', title: '更新时间',hide:true}
                    ]]
                    // ,id: 'makerProductDetailReload'
                });
            }
        });
    }
    //产品：编辑
    function editMakerProdcut(data){
        var a3 = layer.open({
            type: 1,
            title: '编辑创客产品',
            content: $('#productForm'),
            // scrollbar: true,
            closeBtn: 1,
            btn: ['提交','取消'],
            area: ['900px', '600px'],
            yes: function (index, layero) {
                var params= new FormData();
                params.append("makerProductId",data.makerProductId);
                // if(productDetail !=null && productDetail!=[]){
                //     productDetail.forEach(function (detail,index) {
                //         params.append("makerProductDetailList", detail,index);
                //     })
                // }
                params.append("makerProductDetailList", productDetail);
                params.append("modifyOperator","${currentUser.trueName!}");
                var url = systemHost+"/manage/maker/product/updateMakerProduct";
                $.ajax({
                    url: url
                    ,type:"POST"
                    ,data: params
                    ,dataType: "json"   //服务器传回的数据类型
                    ,processData: false
                    // ,contentType:"multipart/form-data"
                    ,contentType: false
                    ,success: function (res){
                        if (res.responseStatusType.message == "Success") {
                            layer.open({
                                title: '编辑'
                                , content: '编辑成功！'
                                , btn: ["关闭"]
                                , yes: function (index) {
                                    productDetail = [];
                                    layer.close(index); //如果设定了yes回调，需进行手工关闭
                                    layer.close(a3);
                                }
                            });
                            //重新加载表格
                            // table.reload("makerProductReload");
                        } else {
                            layer.open({
                                title: '编辑'
                                , content: '编辑失败！'
                                , btn: ["关闭"]
                            });
                        }
                    }
                });
            },
            success: function (layero, index) {
                table.render({
                    elem: '#productDetail'
                    , url: systemHost + "/manage/maker/product/selectMakerProductDetailByCondition"     // selectAllMemberList(状态为0的也查询)
                    , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    , page: true          //显示分页默认不显示
                    , method: 'post'
                    , request: {
                        pageName: 'pageNum', //页码的参数名称，默认：page
                        limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    }
                    , where: {
                        productCode: data.productCode
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
                        {type: 'checkbox', fixed: 'left', width: 40,hide:true}
                        , {field: 'makerProductDetailId', title: '序号', width: 60, fixed: 'left'}
                        , {field: 'productName', title: '商品', sort: true}
                        , {field: 'useTotalTimes', title: '总数', sort: true}
                        , {
                            field: 'efficientCondition', title: '条件', templet: function (d) {
                                var scope = "<div>" + d.efficientDate + "</div>";
                                for (var p in dataScope) {
                                    if (p == d.efficientCondition) {
                                        scope = "<div>" + dataScope[p] + "</div>" + "<div>" + d.efficientDate + "</div>";
                                    }
                                }
                                return scope;
                            }
                        }
                        , {field: 'link', title: '分享链接',hide:true}
                        , {field: 'totalSales', title: '总售价', sort: true}
                        , {field: 'forwardTitle', title: '转发标题',hide:true}
                        , {field: 'forwardDescribe', title: '转发描述',hide:true}
                        , {
                            field: 'imageUrl', title: '商品图片', templet: function (d) {
                                return d.imageUrl == "" || d.imageUrl == null ?
                                    "<div class='imgs'><img src='/noImg.png' style='width:60px;height: 30px'></div>" :
                                    "<div class='imgs'><img src=http://" + d.imageUrl + " style='width:60px;height: 30px'></div>";
                            }
                        }
                        , {field: 'status', title: '状态', hide: true}
                        , {field: 'createOperator', title: '创建人', hide: true}
                        , {field: 'createTime', title: '创建时间', hide: true}
                        , {field: 'modifyOperator', title: '修改人', hide: true}
                        , {field: 'dataChangeLastTime', title: '更新时间', hide: true}
                        , {fixed: 'right', title: '操作', width: 230, align: 'center', toolbar: '#productDetailDemo'}
                    ]]
                    , id: 'productDetailReload'
                });
            }
        });

    }
    //产品：删除
    function deleteMakerProduct(data){
        var url = systemHost+"/manage/maker/product/deleteMakerProduct",
            params = {
                makerProductId: data.makerProductId,
                modifyOperator: "${currentUser.trueName!}"
            };
        $.post(url,params,function (res) {
            if (res.responseStatusType.message == "Success") {
                layer.open({
                    title: '删除'
                    , content: '删除成功！'
                });
                //重新加载表格
                table.reload("makerProductReload");
            } else {
                layer.open({
                    title: '删除'
                    , content: '删除失败！'
                });
            }
        })
    }
    //产品：上架下架
    function upOrDownMakerProduct(event,data){
        var name = "";
        var productStatus;
        if(event === 'productUp'){
            productStatus = 1;
            name = "上架"
        }else if(event === 'productDown'){
            productStatus = 2;
            name = "下架"
        }
        var url = systemHost+"/manage/maker/product/updateMakerProduct",
            params = {
                makerProductId: data.makerProductId,
                productStatus: productStatus,
                modifyOperator: "${currentUser.trueName!}"
            };
        $.post(url,params,function (res) {
            if (res.responseStatusType.message == "Success") {
                layer.open({
                    title: name
                    , content: name+'成功！'
                    ,yes: function (index) {
                        layer.close(index);
                    }
                });
                //重新加载表格
                table.reload("makerProductReload");
            } else {
                layer.open({
                    title: name
                    , content: name+'失败！'
                });
            }
        })
    }
    function showSelect() {
        $(".demoTable select[name='productStatus']").html("<option value=''>请选择</option>");
        $(".demoTable select[name='makerType']").html("<option value=''>请选择</option>");
        $("#editForm select[name='productStatus']").html("<option value=''>请选择</option>");
        $("#editForm select[name='makerType']").html("<option value=''>请选择</option>");
        $("#showForm select[name='productStatus']").html("<option value=''>请选择</option>");
        $("#showForm select[name='makerType']").html("<option value=''>请选择</option>");
        $("#productDetailForm select[name='efficientCondition']").html("<option value=''>请选择</option>");
        $("#productDetailForm select[name='productName']").html("<option value=''>请选择</option>");
        for (var p in dataProductStatus) {
            var option = "<option value='" + p + "'>" + dataProductStatus[p] + "</option>";
            $(".demoTable select[name='productStatus']").append(option);
            $("#editForm select[name='productStatus']").append(option);
            $("#showForm select[name='productStatus']").append(option);
        }
        for (var p in dataMakerType) {
            var option = "<option value='" + dataMakerType[p].parameterId + "'>" + dataMakerType[p].parameterName + "</option>";
            $(".demoTable select[name='makerType']").append(option);
            $("#editForm select[name='makerType']").append(option);
            $("#showForm select[name='makerType']").append(option);
        }
        for(var p in dataStore){
            var option = "<option value='" + dataStore[p].storeId + "'>" + dataStore[p].name + "</option>";
            $(".editForm select[name='storeName']").append(option);
            $(".showForm select[name='storeName']").append(option);
        }
        for(var p in dataScope){
            var option = "<option value='" + p + "'>" + dataScope[p] + "</option>";
            $("#productDetailForm select[name='efficientCondition']").append(option);
        }
        for(var p in dataProduct){
            var option = "<option value='" + dataProduct[p].productId + "'>" + dataProduct[p].productName + "</option>";
            $("#productDetailForm select[name='productName']").append(option);
        }
        form.render("select","demoTable");
        form.render("select","editForm");
        form.render("select","showForm");
        form.render("select","productDetailForm");
    }

    function loadScope() {
        var url = accountHost+"/manage/member/selectAllErpName",
            param = {
                name: "ScopeOfUseEnum"
            };
        $.ajax({
            url: url,
            data: param,
            method: "POST",
            async: false,
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    dataScope = res.result;
                }
            }
        });
    }
    function loadMakerType(){
        $.ajax({
            url: systemHost+"/manage/system/selectParameterList",
            data:{parameterTypeId:10},
            async:false,
            method: "POST",
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    dataMakerType = res.result.list;
                }
            }
        })
    }
    // function loadOrderStatus(){
    //     $.ajax({
    //         url: systemHost+"/manage/maker/order/selectOrderStatusEnum",
    //         data: {name:"OrderStatusEnum"},
    //         async:false,
    //         method: "POST",
    //         success: function (res) {
    //             if (res.responseStatusType.message == "Success") {
    //                 dataOrderStatus = res.result;
    //             }
    //         }
    //     })
    // }
    function loadStore(){
        $.ajax({
            url: storeHost+"/manage/store/selectStoreList",
            async:false,
            method: "POST",
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    dataStore = res.result.list;
                }
            }
        })
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
    function loadProduct(){
        dataProduct = new Array();
        $.ajax({
            url: productHost + "/manage/product/selectProductListNoPage",
            async:false,
            data: {type: '1',productStatus: '1',status: 1},
            method: "POST",
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    var data = res.result;
                    for(var p in data){
                        dataProduct.push({productId:data[p].productId,productName:data[p].productName,data:data[p]});
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
                        dataProduct.push({productId:data[p].serviceProductId,productName:data[p].productName,data:data[p]});
                    }
                }
            }
        });
        // console.log(dataProduct);
    }
</script>

</body>
</html>