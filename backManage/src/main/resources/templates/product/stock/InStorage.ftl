<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>入库</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${basePath!}/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${basePath!}/css/index.css" media="all"/>
    <script src="${basePath!}/js/jquery.min.js" type="text/javascript"></script>
    <script src="${basePath!}/layui/layui.js" charset="utf-8"></script>
    <script src="${basePath!}/js/host.js" type="text/javascript"></script>
    <#include "../../baseFtl/number.ftl" />
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
                <label class="layui-form-label resetLabel">日期</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" id="dateSearch" placeholder="yyyy-MM-dd">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">入库方式</label>
                <div class="layui-input-inline">
                    <select name="instorageTypeSearch" lay-filter="instorageTypeSearch" lay-verify="required">
                        <option value="0">请选择</option>
                        <option value="1">采购入库</option>
                        <option value="2">其他入库</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">来源供应商</label>
                <div class="layui-input-inline">
                    <select name="supplier" lay-filter="supplier" lay-verify="required">
                        <option value="0">请选择</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <button class="layui-btn" data-type="search"><i class="layui-icon layui-icon-search"></i></button>
            </div>
            <div class="layui-inline">
                <a class="layui-btn layui-btn-primary" onclick="instorage()">入库</a>
            </div>
        </div>
    </div>
    <#--表格:显示入库单-->
        <table id="instorage" lay-filter="instorage"></table>

    <#--显示入库单商品-->
        <form class="layui-form layui-form-pane layui-personal" id="instorageProductForm" action=""
              lay-filter="instorageProductForm" method="post" hidden="true">
            <table id="instorageProduct" class="instorageProduct" lay-filter="instorageProduct"></table>
        </form>
    <#--点击审核单据后的表单-->
    <form id="auditor" class="layui-form auditor layui-form-pane layui-personal" action="" lay-filter="auditor"
          hidden="true">
        <div class="layui-form-item">
            <label class="layui-form-label">操作描述</label>
            <div class="layui-input-block">
                <input type="text" name="remark" lay-verify="required" autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>
    </form>
</div>

<#-- 入库表单-采购 -->
<form id="instorageCaigouForm" class="layui-form instorageForm layui-form-pane layui-personal" action=""
      lay-filter="instorageCaigouForm" hidden="true">
    <div class="layui-form-item">
        <label class="layui-form-label xrequired" style="width: 103px;">单据类型</label>
        <div class="layui-input-inline">
            <select name="invoicesType" lay-filter="invoicesType" lay-verify="required">
                <option value="" selected="selected">请选择</option>
            </select>
        </div>
        <label class="layui-form-label xrequired" style="width: 103px;">业务类型</label>
        <div class="layui-input-inline">
            <select name="businessType" lay-filter="businessType" lay-verify="required">
                <option value="" selected="selected">请选择</option>
            </select>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label xrequired" style="width: 103px;">入库日期</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="inStorageDateCaigou" placeholder="yyyy-MM-dd"
                       lay-verify="required">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired" style="width: 103px;">收料组织</label>
        <div class="layui-input-inline">
            <select name="receiveGroup" lay-filter="receiveGroup" lay-verify="required">
                <option value="" selected="selected">请选择</option>
            </select>
        </div>
        <label class="layui-form-label">收料部门</label>
        <div class="layui-input-inline">
            <input type="text" name="receiveBranch" autocomplete="off" placeholder="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired" style="width: 103px;">需求组织</label>
        <div class="layui-input-inline">
            <select name="needGroup" lay-filter="needGroup" lay-verify="required">
                <option value="" selected="selected">请选择</option>
            </select>
        </div>
        <label class="layui-form-label xrequired" style="width: 103px;">采购组织</label>
        <div class="layui-input-inline">
            <select name="purchaseGroup" lay-filter="purchaseGroup" lay-verify="required">
                <option value="" selected="selected">请选择</option>
            </select>
        </div>
        <label class="layui-form-label" style="width: 103px;">采购部门</label>
        <div class="layui-input-inline">
            <input type="text" name="purchaseBranch" autocomplete="off" placeholder="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired" style="width: 120px;">供应商类别</label>
        <div class="layui-input-inline">
            <select name="providerType" lay-filter="providerType" id="providerType" lay-verify="required">

            </select>
        </div>
        <label class="layui-form-label xrequired" style="width: 103px;">供应商</label>
        <div class="layui-input-inline">
            <select name="provider" lay-filter="provider" lay-verify="required">
                <option value="" selected="selected">请选择</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired" style="width: 103px;">结算组织</label>
        <div class="layui-input-inline">
            <select name="settlementGroup" lay-filter="settlementGroup" lay-verify="required">
                <option value="" selected="selected">请选择</option>
            </select>
        </div>
        <label class="layui-form-label xrequired" style="width: 103px;">结算币别</label>
        <div class="layui-input-inline">
            <select name="settlementCurrency" lay-filter="settlementCurrency" lay-verify="required">
                <option value="" selected="selected">请选择</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired" style="width: 103px;">货主类型</label>
        <div class="layui-input-inline">
            <select name="shipperType" lay-filter="shipperType" lay-verify="required">
                <option value="" selected="selected">请选择</option>
            </select>
        </div>
        <label class="layui-form-label xrequired" style="width: 103px;">货主</label>
        <div class="layui-input-inline">
            <select name="shipper" lay-filter="shipper" lay-verify="required">
                <option value="" selected="selected">请选择</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label" style="width: 103px;">备注</label>
        <div class="layui-input-inline">
            <input type="text" name="remark" autocomplete="off" placeholder="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
    </div>
    <div class="layui-form-item">
        <#--<label class="layui-form-label" style="width: 103px;">请选择商品类型</label>-->
        <#--<div class="layui-input-inline">-->
        <#--<select name="productType" lay-filter="productType">-->
        <#--<option value="1" selected="selected">商品</option>-->
        <#--<option value="2">服务</option>-->
        <#--</select>-->
        <#--</div>-->
        <label class="layui-form-label" style="width: 103px;">商品名称</label>
        <div class="layui-input-inline">
            <input class="layui-input" type="text" id="productCodeSearchCaiGou" autocomplete="off" placeholder="输入商品名称">
        </div>
        <div class="layui-inline">
            <button class="layui-btn" id="searchProductCaigou"><i class="layui-icon layui-icon-search"></i></button>
        </div>
    </div>
    <#--显示所有商品-->
    <table id="productCaigou" class="productCaigou" lay-filter="productCaigou"></table>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" id="addInstorageCaigou" lay-filter="addInstorageCaigou">入库</button>
            <button id="resetInstorageCaigou" type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<#-- 入库表单-其他 -->
<form id="instorageQitaForm" class="layui-form instorageForm layui-form-pane layui-personal" action=""
      lay-filter="instorageQitaForm" hidden="true">
    <div class="layui-form-item">
        <label class="layui-form-label xrequired" style="width: 103px;">单据类型</label>
        <div class="layui-input-inline">
            <select name="invoicesType" lay-filter="invoicesType" lay-verify="required">
                <option value="" selected="selected">请选择</option>
            </select>
        </div>

        <div class="layui-inline">
            <label class="layui-form-label xrequired" style="width: 103px;">入库日期</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="inStorageDateQita" placeholder="yyyy-MM-dd"
                       lay-verify="required">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label xrequired" style="width: 120px;">供应商类别</label>
        <div class="layui-input-inline">
            <select name="providerTypeQt" lay-filter="providerTypeQt" id="providerTypeQt" lay-verify="required">
            </select>
        </div>
        <label class="layui-form-label xrequired" style="width: 103px;">供应商</label>
        <div class="layui-input-inline">
            <select name="providerQt" lay-filter="providerQt" lay-verify="required" id="providerQt">
                <option value="" selected="selected">请选择</option>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label xrequired" style="width: 103px;">货主类型</label>
        <div class="layui-input-inline">
            <select name="shipperType" lay-filter="shipperType" lay-verify="required">
                <option value="" selected="selected">请选择</option>
            </select>
        </div>

        <label class="layui-form-label xrequired" style="width: 103px;">部门</label>
        <div class="layui-input-inline">
            <select name="branch" lay-filter="branch" id="branch" lay-verify="required">
                <option value="" selected="selected">请选择</option>
            </select>
        </div>

        <label class="layui-form-label xrequired" style="width: 103px;">货主</label>
        <div class="layui-input-inline">
            <select name="shipper" lay-filter="shipper" lay-verify="required">
                <option value="" selected="selected">请选择</option>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <#--<label class="layui-form-label xrequired" style="width: 103px;">库存组织</label>-->
        <#--<div class="layui-input-inline">-->
        <#--<select name="inventoryGroup" lay-filter="inventoryGroup" lay-verify="required">-->
        <#--<option value="" selected="selected">请选择</option>-->
        <#--</select>-->
        <#--</div>-->
        <label class="layui-form-label xrequired" style="width: 103px;">库存方向</label>
        <div class="layui-input-inline">
            <select name="inventoryWay" lay-filter="inventoryWay" lay-verify="required">
                <option value="" selected="selected">请选择</option>
                <option value="GENERAL">普通</option>
                <option value="RETURN">退货</option>
            </select>
        </div>
        <label class="layui-form-label" style="width: 103px;">备注</label>
        <div class="layui-input-inline">
            <input type="text" name="remark" autocomplete="off" placeholder="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
    </div>
    <div class="layui-form-item">
        <#--<label class="layui-form-label" style="width: 103px;">请选择商品类型</label>-->
        <#--<div class="layui-input-inline">-->
        <#--<select name="productType" lay-filter="productType">-->
        <#--<option value="1" selected="selected">商品</option>-->
        <#--<option value="2">服务</option>-->
        <#--</select>-->
        <#--</div>-->
        <label class="layui-form-label" style="width: 103px;">商品名称</label>
        <div class="layui-input-inline">
            <input class="layui-input" type="text" name="productCodeSearchQita" autocomplete="off" placeholder="输入商品名称">
        </div>
        <div class="layui-inline">
            <button class="layui-btn" id="searchProductQita"><i class="layui-icon layui-icon-search"></i></button>
        </div>
    </div>
    <#--显示所有商品-->
    <table id="productQita" class="productQita" lay-filter="productQita"></table>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="addInstorageQita">入库</button>
            <button id="resetInstorageQita" type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>


<#-- 商品属性表单 -->
<form id="productDetailForm" class="layui-form productDetailForm layui-form-pane layui-personal" action=""
      lay-filter="productDetailForm"
      hidden="true">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label xrequired">生产日期</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="productionDate" placeholder="yyyy-MM-dd HH:mm:ss"
                       lay-verify="required">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label xrequired">有效期</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="endDate" placeholder="yyyy-MM-dd HH:mm:ss"
                       lay-verify="required">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label xrequired">在架售卖日期</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="inShelfDate" placeholder="yyyy-MM-dd HH:mm:ss"
                       lay-verify="required">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired">是否赠送</label>
        <div class="layui-input-block">
            <input type="checkbox" name="isSend" lay-filter="isSend" lay-skin="switch" lay-text="是|否"
                   lay-verify="required">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired">保管者类型</label>
        <div class="layui-input-inline">
            <select name="keeperType" lay-filter="keeperType" lay-verify="required">
                <option value="" selected>请选择</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired">保管者</label>
        <div class="layui-input-inline" style="width: 300px">
            <select name="keeper" lay-filter="keeper" lay-verify="required">
                <option value="" selected>请选择</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item" hidden>
        <label class="layui-form-label">状态</label>
        <div class="layui-input-block">
            <input type="text" name="status" autocomplete="off" placeholder="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" hidden>
        <label class="layui-form-label">创建时间</label>
        <div class="layui-input-block">
            <input type="text" name="createTime" autocomplete="off" placeholder="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" hidden>
        <label class="layui-form-label">创建人</label>
        <div class="layui-input-block">
            <input type="text" name="createOperator" autocomplete="off" placeholder="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" hidden>
        <label class="layui-form-label">修改人</label>
        <div class="layui-input-block">
            <input type="text" name="modifyOperator" autocomplete="off" placeholder="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" hidden>
        <label class="layui-form-label">修改时间</label>
        <div class="layui-input-block">
            <input type="text" name="dataChangeLastTime" autocomplete="off" placeholder="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" hidden>
        <div class="layui-input-block">
            <#--<button class="layui-btn" lay-submit="" lay-filter="addInstorage">入库</button>-->
            <button id="resetProductDetail" type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>


<#--点击审核单据后的表单-->
<form id="tuihuo" class="layui-form auditor layui-form-pane layui-personal" action="" lay-filter="auditor"
      hidden="true">
    <div class="layui-form-item">
        <label class="layui-form-label">退货数量</label>
        <div class="layui-input-block">
            <input type="text" name="number" id="numberTuiHuo" lay-verify="required" autocomplete="off" placeholder=""
                   class="layui-input">
        </div>
    </div>
</form>

<script type="text/html" id="instorageDemo">
    {{#  if(d.invalidStatus == 1 && d.afterAuditInStorageId == null && d.confirmStatus == 0){ }}
    <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="invalid">作废</a>
    <a class="layui-btn layui-btn-xs layui-btn-primary" lay-event="audit">确认收货</a>
    <a class="layui-btn layui-btn-xs" lay-event="instorageProduct">入库商品</a>

    {{#  }else if(d.invalidStatus == 1 && d.afterAuditInStorageId == null && d.confirmStatus == null){ }}
    <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="invalid">作废</a>
    <a class="layui-btn layui-btn-xs" lay-event="instorageProduct">入库商品</a>

    {{#  }else if((d.invalidStatus == 0 || d.afterAuditInStorageId != null)&&d.confirmStatus == 0){ }}
    <a class="layui-btn layui-btn-xs" lay-event="instorageProduct">入库商品</a>
    <a class="layui-btn layui-btn-xs layui-btn-primary" lay-event="audit">确认收货</a>

    {{#  }else if((d.invalidStatus == 0 || d.afterAuditInStorageId != null)&&d.confirmStatus == null){ }}
    <a class="layui-btn layui-btn-xs" lay-event="instorageProduct">入库商品</a>

    {{#  }else if((d.invalidStatus == 0 || d.afterAuditInStorageId != null)&&d.confirmStatus == 1){ }}
    <a class="layui-btn layui-btn-xs" lay-event="instorageProduct">入库商品</a>
    {{#  } }}

</script>

<script type="text/html" id="barDemoProduct">
    <#--<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="instorageReturn" id="instorageReturn">退货</a>-->
    <button type="button" class="layui-btn layui-btn-sm" id="instorageReturn" lay-event="instorageReturn">退货</button>
</script>


<script>
    var stockData, product, table, form, laydate, $, companyType = "${currentUser.companyType!}",
        companyId = "${currentUser.companyId!}",
        companyName = "${currentUser.companyName!}", stockId, dataUnit, dataStockStatus, dataInStorageType,
        inStorageProductList = [], dataInvoicesType, dataBusinessType,
        dateSettlementCurrency, dataProvider, dataInventoryWay, dataProviderType;
    //数据显示,分页实现
    layui.use(['table', 'form', 'laydate', 'jquery'], function () {
        table = layui.table;
        form = layui.form;
        laydate = layui.laydate;
        $ = layui.$;

        stockId = loadStockId(companyType, companyId);
        loadUnit();
        loadProviderType();
        dataBusinessType = loadEnumData("InStorageBusinessTypeEnum");
        dataInvoicesType = loadEnumData("InStorageInvoicesTypeEnum");
        dataInStorageType = loadEnumData("InStorageTypeEnum");
        dataInventoryWay = loadEnumData("InventoryWayEnum");
        loadSelectIn();
        loadDepartment(form);
        selectSuppTypeList(form)
        selectSuppTypeListQt(form)
        //判断公司类型，子公司需要显示门店的单据
        if (companyType == 1) { //总公司
            $(".demoTable select[name='store']").parent().parent().hide();
        } else if (companyType == 2) { //子公司
            $(".demoTable select[name='store']").parent().parent().show();
            //显示所有子公司的门店
            loadSupp();
            //监听门店的选择
            form.on('select(supplier)', function (obj) {
                //重新加载入库表格
                table.reload('instorageReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    , where: {
                        provider: obj.value
                    }
                }, 'data');
            })
        } else if (companyType == 3) { //分公司，门店
            $(".demoTable select[name='store']").parent().parent().hide();
        }

        laydate.render({
            elem: '#dateSearch'
        });

        laydate.render({
            elem: '#inStorageDateCaigou'
        });
        laydate.render({
            elem: '#inStorageDateQita'
        });
        laydate.render({
            elem: '#productionDate'
            , type: 'datetime'
        });
        laydate.render({
            elem: '#endDate'
            , type: 'datetime'
        });
        laydate.render({
            elem: '#inShelfDate'
            , type: 'datetime'
        });

        table.render({
            elem: '#instorage'
            , url: productHost + "/stock/selectInstorageList"
            , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , page: true          //显示分页默认不显示
            , method: 'post'
            , request: {
                pageName: 'pageNum', //页码的参数名称，默认：page
                limitName: 'pageSize' //每页数据量的参数名，默认：limit
            }
            , where: {
                stockId: stockId
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
                , {
                    field: 'inStorageType', title: '入库方式'
                }
                , {field: 'outstorageOrgName', title: '供货组织'}
                , {
                    field: 'inventoryWay', title: '其他入库方向', templet: function (d) {
                        var number = "";
                        if (d.inventoryWay == "GENERAL") {
                            number = "普通";
                            return "<span>" + number + "</span>"
                        }
                        if (d.inventoryWay == "RETURN") {
                            number = "退货";
                            return "<span>" + number + "</span>"
                        } else {
                            return ""
                        }
                    }
                }
                , {
                    field: 'inStorageNumber', title: '入库编号', templet: function (d) {
                        var number = "";
                        if (d.afterAuditInStorageNumber == null) {
                            number = d.inStorageNumber;
                            return "<span>" + number + "</span>"
                        }
                        if (d.afterAuditInStorageNumber != null) {
                            number = d.afterAuditInStorageNumber;
                            return "<span>" + number + "</span>"
                        }
                    }
                }
                , {
                    field: 'inStorageDate', title: '入库日期', templet: function (d) {
                        return d.inStorageDate.split(" ")[0];
                    }
                }

                , {
                    field: 'inStorageStatus', title: '入库状态', templet: function (d) {
                        var statusName = "";
                        var color = "";
                        if (d.invalidStatus == 0) {
                            statusName = "已作废";
                            color = "red"
                            return "<span style='color: " + color + "'" + ">" + statusName + "</span>"
                        }
                        if (d.invalidStatus == 1) {
                            statusName = "未作废";
                            color = "green"
                            return "<span style='color: " + color + "'" + ">" + statusName + "</span>"
                        }
                    }
                }
                , {
                    field: 'suppIsAudit', title: '供应商审核状况', templet: function (d) {
                        var statusName = "";
                        var color = "";
                        if (d.suppIsAudit == 0) {
                            statusName = "待审核";
                            color = "red"
                            return "<span style='color: " + color + "'" + ">" + statusName + "</span>"
                        }
                        if (d.suppIsAudit == 1) {
                            statusName = "已审核";
                            color = "green"
                            return "<span style='color: " + color + "'" + ">" + statusName + "</span>"
                        } else if (d.suppIsAudit == 2) {
                            statusName = "未通过";
                            color = "red"
                            return "<span style='color: " + color + "'" + ">" + statusName + "</span>"
                        } else {
                            return ""
                        }
                    }
                }
                , {
                    field: 'confirmStatus', title: '是否确认收货', templet: function (d) {
                        var statusName = "";
                        var color = "";
                        if (d.confirmStatus == 0) {
                            statusName = "待确认";
                            color = "red"
                            return "<span style='color: " + color + "'" + ">" + statusName + "</span>"
                        }
                        if (d.confirmStatus == 1) {
                            statusName = "已确认";
                            color = "green"
                            return "<span style='color: " + color + "'" + ">" + statusName + "</span>"
                        } else {
                            return ""
                        }
                    }
                }
                , {field: 'auditorTime', title: '审核时间'}
                , {fixed: 'right', title: '操作', width: 220, align: 'left', toolbar: '#instorageDemo'}
            ]]
            , id: 'instorageReload'
            , done: function () {
                var isStock = checkIsStock();
                if (isStock == 0) {
                    layer.msg("当前组织暂无仓库，无法生成商品,请联系管理员添加")
                }

            }
        });

        var $ = layui.$, active = {
            search: function () {
                var date = $("#dateSearch").val(),
                    instorageType = $(".demoTable select[name='instorageTypeSearch'] option:selected").text(),
                    value = $(".demoTable select[name='store'] option:selected").val();
                if (value == 0) {
                    stockId = loadStockId(companyType, companyId);
                } else {
                    stockId = loadStockId(3, value);
                }
                if (instorageType == "请选择") {
                    instorageType = null;
                }
                table.reload('instorageReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    , where: {
                        stockId: stockId,
                        inStorageDate: date,
                        inStorageType: instorageType
                    }
                }, 'data');
            }
        };

        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        //查看，审核，入库商品
        table.on('tool(instorage)', function (obj) {
            var data = obj.data;
            // if(obj.event === 'show'){
            //     // showInstorage(data);
            // }else
            if (obj.event === 'audit') {
                auditInstorage(data);
            } else if (obj.event === 'invalid') {
                invalidProduct(data);
            } else if (obj.event === 'instorageProduct') {
                instorageProduct(data);
            }
        });

        //查看，审核，入库商品
        table.on('tool(instorageProduct)', function (obj) {
            var data = obj.data;
            if (obj.event === 'instorageReturn') {
                layer.confirm('确定退货吗？', function (index) {
                    instorageReturn(data);
                    layer.close(index);
                });

            }
        });
    });

    //加载仓库code
    function loadStockId(comT, comI) {
        var stockId = null,
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
                        stockId = stock[p].stockId;
                    }
                }
            }
        });
        return stockId;
    }

    //确认入库
    function auditInstorage(data) {
        var c1 = layer.open({
            type: 1,
            title: '是否确认收货？',
            content: $('#auditor'),
            closeBtn: 1,
            btn: ['通过', '拒绝'],
            yes: function (index, layero) {
                var url = productHost + "/stock/confirm";
                var params = {
                    inStorageId: data.inStorageId,
                    confirmStatus: 1,
                    remark: layero.find("input[name='remark']").val(),
                    confirm: "${currentUser.trueName!}"
                };

                var index = null;
                $.ajax({
                    type: "POST",
                    url: url,
                    data: params,
                    async: true,
                    beforeSend: function () {
                        index = layer.load(3, {
                            shade: [0.9, '#fff'] //0.1透明度的白色背景
                        });
                    },
                    error: function (request) {
                        layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
                        layer.close(index);    //返回数据关闭loading
                    },
                    success: function (data) {
                        if (data.responseStatusType.message == "Success") {
                            layer.open({
                                title: '收货'
                                , content: '收货成功！'
                                , btn: ["关闭"]
                            });
                            layer.close(index);
                            layer.close(c1);
                            //重新加载表格
                            table.reload("instorageReload");
                        } else {
                            layer.open({
                                title: '收货'
                                , content: '收货失败！' + data.responseStatusType.error.errorMsg
                                , btn: ["关闭"]
                            });
                            layer.close(index);    //返回数据关闭loading
                        }
                    }
                });
            },

            success: function (layero) {
                layero.find("input[name='remark']").val("");
            },
            area: ['350px', '160px']
        });

    }

    //作废入库
    function invalidProduct(data) {
        var c2 = layer.open({
            type: 1,
            title: '确认作废？',
            content: "是否确认作废",
            closeBtn: 1,
            btn: ['确认', '取消'],
            yes: function (index, layero) {
                var url = productHost + "/stock/cancelInstoragePreAudit";
                var params = {
                    inStorageId: data.inStorageId,
                    invalid: "${currentUser.trueName!}"
                };
                $.post(url, params, function (res) {
                    if (res.responseStatusType.message == "Success") {
                        layer.open({
                            title: '作废'
                            , content: '作废成功！'
                            , btn: ["关闭"]
                        });
                        layer.close(index);
                        layer.close(c2);
                        //重新加载表格
                        table.reload("instorageReload");
                    } else {
                        layer.open({
                            title: '作废'
                            , content: '作废失败！' + res.responseStatusType.error.errorMsg
                            , btn: ["关闭"]
                        });
                    }
                })
            },
            btn2: function (index, layero) {
                layer.close(index);
                layer.close(c2);
            },
            success: function (layero) {
                layero.find("input[name='remark']").val("");
            },
            area: ['250px', '150px']
        });

    }

    //入库商品
    function instorageProduct(data) {
        var dataInProduct = data.inStorageProductList;
        var a1 = layer.open({
            type: 1,
            title: '查看入库商品',
            content: $('#instorageProductForm'),
            // scrollbar: true,
            closeBtn: 1,
            btn: ['确定'],
            area: ['1200px', '400px'],
            yes: function (index, layero) {
                layer.close(index);
                layer.close(a1);
            },
            success: function (layero, index) {
                $("#instorageProductForm").attr("data-instorageid", data.inStorageId);
                table.render({
                    elem: '#instorageProduct'
                    , data: dataInProduct
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
                        , {field: 'inStorageNumber', title: '入库编号', width: 165}
                        , {field: 'productCode', title: '商品编码', width: 95}
                        , {field: 'productName', title: '商品', width: 135}
                        , {field: 'batchNumber', title: '批号', width: 165}
                        /*  , {
                              field: 'productionDate', title: '生产日期', width: 105, templet: function (d) {
                                  var productionDate = "";
                                  if (d.productionDate != null) {
                                      productionDate = d.productionDate.split(" ")[0];
                                  }
                                  return productionDate;
                              }
                          }
                          , {
                              field: 'endDate', title: '到期日', width: 105, templet: function (d) {
                                  var endDate = "";
                                  if (d.endDate != null) {
                                      endDate = d.endDate.split(" ")[0];
                                  }
                                  return endDate;
                              }
                          }*/
                        , {field: 'receivedNumber', title: '数量'}
                        , {
                            field: 'unit', title: '单位', templet: function (d) {
                                var unitName = "";
                                for (var i in dataUnit) {
                                    if (d.unit == dataUnit[i].unitId) {
                                        unitName = dataUnit[i].unitName
                                    }
                                }
                                return unitName;
                            }
                        }
                        , {field: 'totalPrice', title: '价格'}
                        , {fixed: 'right', title: '操作', align: 'center', toolbar: '#barDemoProduct'}
                    ]]
                    , id: 'instorageProductReload'
                    , done: function (res, curr, count) {
                        if ((data.inventoryWay != "" && data.inventoryWay != "GENERAL") || data.afterAuditInStorageId == null) {
                            $("#instorageReturn").css("display", "none")
                        }
                    }
                });
            }
        });

    }

    //退货
    function instorageReturn(data) {
        $("#numberTuiHuo").val("");

        var c1 = layer.open({
            type: 1,
            title: '退货数量',
            content: $('#tuihuo'),
            closeBtn: 1,
            btn: ['确认', '取消'],
            yes: function (index, layero) {
                var inStorageId = $("#instorageProductForm").attr("data-instorageid");
                var number = layero.find("input[name='number']").val();
                var inStorageProductID = data.inStorageProductID;
                var url = productHost + "/stock/instoragePreAuditReturn";
                var params = {inStorageId: inStorageId, number: number, inStorageProductID: inStorageProductID};
                $.post(url, params, function (res) {
                    if (res.responseStatusType.message == "Success") {
                        layer.open({
                            title: '退货'
                            , content: res.result
                            , btn: ["关闭"]
                        });
                        layer.close(index);
                        layer.close(c1);
                        //重新加载表格
                        table.reload("instorageReload");
                    } else {
                        layer.open({
                            title: '退货'
                            , content: res.responseStatusType.error.errorMsg
                            , btn: ["关闭"]
                        });
                        layer.close(index);
                        layer.close(c1);
                        table.reload("instorageReload");
                    }
                });
            },
            btn2: function (index, layero) {
                layer.close(index);
                layer.close(c1);
            },
            area: ['350px', '160px']
        });


    }

    /*================入库====================*/
    //入库
    function instorage() {
        //获取本公司仓库
        loadStock(companyType, companyId);
        layer.msg('选择入库方式', {
            time: 20000, //20s后自动关闭
            btn: ['采购入库', '其他入库', '取消'],
            skin: 'layui-layer-molv',
            yes: function (index, layero) {
                purchaseInstorage(stockData);
                layer.close(index);
            },
            btn2: function (index, layero) {
                otherInstorage(stockData);
                layer.close(index);
                // return false
            },
            btn3: function (index) {
                layer.close(index);
            }
        });
    }

    //采购入库
    function purchaseInstorage(stockData) {
        //采购入库: 单据类型、业务类型、日期、单据状态、收料组织、需求组织、
        //采购组织、供应商、结算组织、结算币别、货主类型、货主
        //入库商品：物料编码、单位、数量、收货仓库、仓库状态
        //获取商品
        $("#resetInstorageCaigou").click();
        var p1 = layer.open({
            type: 1,
            title: '采购入库',
            id: "p1",
            content: $('#instorageCaigouForm'),
            closeBtn: 1,
            success: function (layero) {
                //初始化
                table.render({
                    elem: '#productCaigou'
                    , method: 'post'
                    , url: productHost + "/manage/product/selectProductList"
                    , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    , page: true          //显示分页默认不显示
                    , request: {
                        pageName: 'pageNum', //页码的参数名称，默认：page
                        limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    }
                    , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                        return {
                            "code": 0, //解析接口状态
                            "msg": "", //解析提示文本
                            "count": res == null ? 0 : res.result.total, //解析数据长度
                            "data": res == null ? 0 : res.result.list //解析数据列表
                        }
                    }
                    , where: {
                        companyType: companyType,
                        companyId: companyId,
                        type: '1',
                        productStatus: '1',
                        status: 1,
                        isHoutai: 0
                    }
                    , totalRow: true
                    , cols: [[
                        {type: 'checkbox', fixed: 'left', width: 40}
                        , {field: 'productCode', title: '商品编码', totalRowText: '合计'}
                        , {field: 'productName', title: '商品', width: 135}
                        , {field: 'barCode', title: '条形码', hide: true}
                        , {field: 'secondaryAttribute', title: '辅助属性', hide: true}
                        , {
                            field: 'unitId', title: '单位', templet: function (d) {
                                var unitName = "";
                                for (var i in dataUnit) {
                                    if (d.unitId == dataUnit[i].unitId) {
                                        unitName = dataUnit[i].unitName
                                    }
                                }
                                return unitName;
                            }
                        }
                        , {field: 'instoragePrice', edit: 'text', title: '入库单价'}
                        , {field: 'number', title: '数量', edit: 'text'}
                        , {field: 'stockNum', title: '库存数量', width: 90}
                        , {field: 'totalPrice', title: '总价', totalRow: true}
                        , {
                            field: 'stock', title: '仓库', templet: function (d) {
                                return stockData.stockCode;
                            }
                        }

                    ]]
                    , id: 'productReloadCaigou'
                    , done: function (res, curr, count) {
                        form.render("select", "product");
                        //由于layui 设置了超出隐藏，所以这里改变下，以兼容操作按钮的下拉菜单
                        $(".layui-table-body, .layui-table-box, .layui-table-cell").css('overflow', 'visible');
                        //调整高度
                        $("td .layui-form-select").css('margin-top', '-10px');
                        $("td .layui-form-select").css('margin-left', '-15px');
                        $("td .layui-form-select").css('margin-right', '-15px');
                        //禁用全选
                        $('th[data-field="0"] input[type="checkbox"]').prop('disabled', true);
                    }
                });
                //隐藏
                layero.find("select[name='inventoryGroup']").parent().hide();
                layero.find("select[name='inventoryGroup']").parent().prev().hide();
                layero.find("select[name='inventoryWay']").parent().hide();
                layero.find("select[name='inventoryWay']").parent().prev().hide();
                //监听选择
                //供应商
                form.on("select(providerType)", function (data) {
                    var value = data.value;
                    $("#instorageCaigouForm select[name='provider']").empty();
                    $("#instorageCaigouForm select[name='provider']").val("<option value='0' selected>请选择</option>");
                    if (value != null && value != 0) {
                        loadProvider(value);
                        for (var p in dataProvider) {
                            var option = "<option value='" + dataProvider[p].supplierCode + "'>" + dataProvider[p].supplierName + "</option>";
                            $("#instorageCaigouForm select[name='provider']").append(option);
                        }
                    }
                    form.render("select", "instorageCaigouForm");
                });


            },
            area: ['950px', '600px'],
            end: function () {
                window.location.reload();
            }
        });
        //监听表格的单选复选
        table.on('checkbox(productCaigou)', function (obj) {
            var checked = obj.checked;
            var data = obj.data;
            var type = obj.type;    // all  one
            if (checked) {
                //判断商品数量
                var productNumber = data.number;
                if (productNumber == null || productNumber == "" || productNumber == "0") {
                    layer.msg("商品数量不能为空");
                    $(this).prop('checked', false);
                    form.render('checkbox');
                    return;
                }
                var productionDate = "", endDate = "", inShelfDate = "", keeperType = "",
                    keeper = "", keeperCode = "", isSend = false;
                //打开商品详情表单
                var pd1 = layer.open({
                    type: 1,
                    title: '商品属性',
                    content: $('#productDetailForm'),
                    closeBtn: 1,
                    btn: ['提交', '取消'],
                    yes: function (index, layero) {
                        productionDate = $("#productionDate").val();
                        endDate = $("#endDate").val();
                        inShelfDate = $("#inShelfDate").val();
                        var keeperType1 = layero.find("select[name='keeperType']");
                        keeperType = keeperType1.find("option:selected").text();
                        var keeper1 = layero.find("select[name='keeper']");
                        keeper = keeper1.find("option:selected").text();
                        keeperCode = keeper1.find("option:selected").val();
                        form.on('submit(formVerify)', function (dataIn) {
                            var json = {
                                productType: data.productType,
                                productCode: data.productCode,
                                productName: data.productName,
                                // barCode:data.barCode,
                                specification: data.productSpecification,
                                // secondaryAttribute:data.secondaryAttribute,
                                productionDate: productionDate,
                                endDate: endDate,
                                inShelfDate: inShelfDate,
                                receivableNumber: data.number,
                                receivedNumber: data.number,
                                unit: data.unitId,
                                unitPrice: data.instoragePrice,
                                totalPrice: data.totalPrice,
                                stock: stockData.stockCode,
                                stockStatus: "1",
                                keeperType: keeperType,
                                keeper: keeper,
                                keeperCode: keeperCode,
                                isSend: isSend
                            };
                            inStorageProductList.push(json);
                            layer.close(index);
                            layer.close(pd1);
                        })
                    },
                    btn2: function (index) {
                        layer.close(index);
                        layer.close(pd1);
                    },
                    success: function (layero) {
                        layero.addClass('layui-form');
                        layero.find('.layui-layer-btn0').attr('lay-filter', 'formVerify').attr('lay-submit', '');
                        $("#resetProductDetail").click();
                        //监听开关
                        form.on('switch(isSend)', function (data) {
                            //开关是否开启，true或者false
                            var checked = data.elem.checked;
                            if (checked) {
                                isSend = true;
                            } else {
                                isSend = false;
                            }
                        });
                    },
                    area: ['500px', '500px'],
                    // end: function () {
                    //     window.location.reload();
                    // }
                });
            } else {
                for (var p in inStorageProductList) {
                    if (data.productCode == inStorageProductList[p].productCode) {
                        inStorageProductList.splice(p, 1);
                    }
                }
            }
        });

        //监听表格的数量和单价的修改
        table.on('edit(productCaigou)', function (obj) {
            var value = obj.value //得到修改后的值
                , data = obj.data //得到所在行所有键值
                , field = obj.field; //得到字段
            var totalPriceSum = 0;
            if (field == "number") {
                totalPriceSum = accMul(Number(value), Number(data.instoragePrice));
                //获取点击的一行tr
                var tr = $(this).parent().parent();
                //获取tr的所有td元素
                var b = tr.children("td");
                //取得第三列元素
                var c = b.eq(9);
                //显示第三列的值
                c.html("<div class='layui-table-cell laytable-cell-2-0-9' style='overflow: visible;'>" + totalPriceSum + "</div>");
                if (data.instoragePrice == null || data.instoragePrice == "") {
                    data.instoragePrice = 0;
                }
                data.number = value;
            }
            if (field == "instoragePrice") {
                if (data.number == null || data.number == "") {
                    data.number = 0;
                }
                totalPriceSum = accMul(Number(value), Number(data.number));
                //获取点击的一行tr
                var tr = $(this).parent().parent();
                //获取tr的所有td元素
                var b = tr.children("td");
                //取得第三列元素
                var c = b.eq(8);
                //显示第三列的值
                c.html("<div class='layui-table-cell laytable-cell-2-0-7' style='overflow: visible;'>" + totalPriceSum + "</div>");
                data.instoragePrice = value;
                var outprice = accDiv(value, accSub(1 - data.outstorageProfit));   //accMul(value,accAdd(data.outstorageProfit,1))
                updatePriductInstoragePrice(data.productType, data.productCode, data.instoragePrice, outprice, data.outstorageProfit);
            }
            data.totalPrice = totalPriceSum.toString();
            var productCache = table.cache["productReloadCaigou"];
            for (var p in productCache) {
                if (productCache[p].productCode == data.productCode) {
                    //行标
                    data.LAY_TABLE_INDEX = productCache[p].LAY_TABLE_INDEX;
                    //保留是否被选中
                    data.LAY_CHECKED = productCache[p].LAY_CHECKED;
                    productCache.splice(p, 1, data);
                }
            }
            var div = document.getElementById('p1');
            var a = div.scrollTop;
            div.scrollTop = a;
        });


        //监听搜索
        $("#searchProductCaigou").click(function () {
            var name = $("#productCodeSearchCaiGou").val();
            table.reload('productReloadCaigou', {
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                , where: {
                    companyType: companyType,
                    companyId: companyId,
                    type: '1',
                    productStatus: '1',
                    status: 1,
                    isHoutai: 0,
                    keyWord: name
                }
            }, 'data');
            return false;
        });
        //监听提交
        form.on('submit(addInstorageCaigou)', function () {



            if (inStorageProductList.length == 0) {
                layer.open({
                    title: '提示'
                    , content: "请选择商品"
                    , btn: ["关闭"]
                    , yes: function (index) {
                        layer.close(index); //如果设定了yes回调，需进行手工关闭
                    }
                });
                return false;
            }

            var falg = 0;
            for (var p in  inStorageProductList) {
                if (inStorageProductList[p].unitPrice == 0) {
                    falg = 1
                }
            }
            if (falg == 1) {
                layer.open({
                    title: '提示'
                    , content: "存在入库价为0的商品，无法入库"
                    , btn: ["关闭"]
                    , yes: function (index) {
                        layer.close(index); //如果设定了yes回调，需进行手工关闭
                    }
                });
                return false;
            }

            var invoicesType = $("#instorageCaigouForm select[name='invoicesType'] option:selected").text();
            var businessType = $("#instorageCaigouForm select[name='businessType'] option:selected").text();
            var receiveGroup = $("#instorageCaigouForm select[name='receiveGroup'] option:selected").text();
            var needGroup = $("#instorageCaigouForm select[name='needGroup'] option:selected").text();
            var purchaseGroup = $("#instorageCaigouForm select[name='purchaseGroup'] option:selected").text();
            var settlementGroup = $("#instorageCaigouForm select[name='settlementGroup'] option:selected").text();
            var shipperType = $("#instorageCaigouForm select[name='shipperType'] option:selected").text();
            var shipper = $("#instorageCaigouForm select[name='shipper'] option:selected").text();
            var shipperCode = $("#instorageCaigouForm select[name='shipper'] option:selected").val();
            var settlementCurrency = $("#instorageCaigouForm select[name='settlementCurrency'] option:selected").text();
            var providerName = $("#instorageCaigouForm select[name='provider'] option:selected").text();
            var providerID = $("#instorageCaigouForm select[name='provider'] option:selected").val();
            var params = {
                inStorageType: "采购入库",
                invoicesType: invoicesType,
                businessType: businessType,
                inStorageDate: $("#inStorageDateCaigou").val() + " 00:00:00",
                receiveGroup: receiveGroup,
                receiveBranch: $("#instorageCaigouForm input[name='receiveBranch']").val(),
                stockGroup: stockData.stockCode,
                stockId: stockData.stockId,
                needGroup: needGroup,
                purchaseGroup: purchaseGroup,
                purchaseBranch: $("#instorageCaigouForm input[name='purchaseBranch']").val(),
                provider: providerID,
                providerName: providerName,
                settlementGroup: settlementGroup,
                settlementCurrency: settlementCurrency,
                shipperType: shipperType,
                shipper: shipper,
                shipperCode: shipperCode,
                orgK3Number: "${currentUser.orgK3Number!}",
                companyId: "${currentUser.companyId!}",
                companyType: "${currentUser.companyType!}",
                instorageOrgName: "${currentUser.companyName!}",
                inStorageProductJson: JSON.stringify(inStorageProductList),
                remark: $("#instorageCaigouForm input[name='remark']").val(),
                createOperator: "${currentUser.trueName!}"
            }
            var index = null;
            $.ajax({
                type: "POST",
                url: productHost + "/stock/instoragePreAudit",
                data: params,
                async: true,
                beforeSend: function () {
                    index = layer.load(3, {
                        shade: [0.9, '#fff'] //0.1透明度的白色背景
                    });
                },
                error: function (request) {
                    layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
                    layer.close(index);    //返回数据关闭loading
                },
                success: function (data) {
                    layer.close(index);    //返回数据关闭loading
                    if (data.responseStatusType.message == 'Failure') {
                        layer.alert(data.responseStatusType.error.errorMsg);
                    }
                    if (data.responseStatusType.message == 'Success') {
                        layer.open({
                            title: '添加'
                            , content: data.result
                            , btn: ["关闭"]
                            , yes: function (index) {
                                layer.close(index); //如果设定了yes回调，需进行手工关闭
                                layer.close(p1);
                            }, end: function () {
                                layer.close(p1);
                                $("#resetInstorageCaigou").click();//重置表单
                            }
                        });
                    }
                }
            });

            return false;
        });

    }

    //其他入库
    function otherInstorage(stockData) {
        //其他入库：单据类型、库存组织、库存方向、日期、货主类型、货主、单据状态
        //入库商品：物料编码、单位、数量、收货仓库
        //获取商品
        $("#resetInstorageQita").click();
        var p2 = layer.open({
            type: 1,
            title: '其他入库',
            id: "p2",
            content: $('#instorageQitaForm'),
            closeBtn: 1,
            success: function (layero) {
                table.render({
                    elem: '#productQita'
                    , url: productHost + "/manage/product/selectProductList"
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
                            "count": res == null ? 0 : res.result.total, //解析数据长度
                            "data": res == null ? 0 : res.result.list //解析数据列表
                        }
                    }

                    , where: {
                        companyType: companyType,
                        companyId: companyId,
                        type: '2',
                        productStatus: '1',
                        status: 1,
                        isHoutai: 0
                    }
                    , cols: [[
                        {type: 'checkbox', fixed: 'left', width: 40}
                        , {field: 'productCode', title: '商品编码'}
                        , {field: 'productName', title: '商品', width: 135}
                        , {field: 'barCode', title: '条形码', hide: true}
                        // , {field: 'productSpecification', title: '规格型号'}
                        // , {field: 'secondaryAttribute', title: '辅助属性', hide: true}
                        , {
                            field: 'unitId', title: '单位', templet: function (d) {
                                var unitName = "";
                                for (var i in dataUnit) {
                                    if (d.unitId == dataUnit[i].unitId) {
                                        unitName = dataUnit[i].unitName
                                    }
                                }
                                return unitName;
                            }
                        }
                        /*  , {field: 'instoragePrice', title: '入库单价', edit: 'text'}*/
                        , {
                            field: 'number', title: '数量', edit: 'text'
                        }
                        , {field: 'stockNum', title: '库存数量', width: 90}
                        /* , {field: 'totalPrice', title: '总价'}*/
                        , {
                            field: 'stock', title: '仓库', templet: function (d) {
                                return stockData.stockCode;
                            }
                        }

                    ]]
                    , id: 'productQitaReload'
                    , done: function (res, curr, count) {
                        form.render("select", "productQita");
                        //由于layui 设置了超出隐藏，所以这里改变下，以兼容操作按钮的下拉菜单
                        $(".layui-table-body, .layui-table-box, .layui-table-cell").css('overflow', 'visible');
                        //调整高度
                        $("td .layui-form-select").css('margin-top', '-10px');
                        $("td .layui-form-select").css('margin-left', '-15px');
                        $("td .layui-form-select").css('margin-right', '-15px');
                        //禁用全选
                        $('th[data-field="0"] input[type="checkbox"]').prop('disabled', true);
                    }
                });
                //隐藏
                layero.find("select[name='businessType']").parent().hide();
                layero.find("select[name='businessType']").parent().prev().hide();
                layero.find("input[name='receiveBranch']").parent().parent().hide();
                layero.find("input[name='purchaseBranch']").parent().parent().hide();
                layero.find("select[name='settlementCurrency']").parent().parent().hide();

                form.on("select(providerTypeQt)", function (data) {
                    var value = data.value;
                    $("#instorageQitaForm select[name='providerQt']").empty();
                    $("#instorageQitaForm select[name='providerQt']").val("<option value='0' selected>请选择</option>");
                    if (value != null && value != 0) {
                        loadProvider(value);
                        for (var p in dataProvider) {
                            var option = "<option value='" + dataProvider[p].supplierCode + "'>" + dataProvider[p].supplierName + "</option>";
                            $("#instorageQitaForm select[name='providerQt']").append(option);
                        }
                    }
                    form.render("select", "instorageQitaForm");
                });


            },
            area: ['950px', '600px'],
            end: function () {
                window.location.reload();
            }
        });
        //监听表格的单选复选
        table.on('checkbox(productQita)', function (obj) {
            var checked = obj.checked;
            var data = obj.data;
            var type = obj.type;    // all  one
            if (checked) {

                //判断商品数量
                var productNumber = data.number;
                if (productNumber == null || productNumber == "" || productNumber == "0") {
                    layer.msg("商品数量不能为空")
                    $(this).prop('checked', false);
                    form.render('checkbox');
                    return;
                }
                var productionDate = "", endDate = "", inShelfDate = "", keeperType = "",
                    keeper = "", keeperCode = "", isSend = false;
                //打开商品详情表单
                var pd1 = layer.open({
                    type: 1,
                    title: '商品属性',
                    content: $('#productDetailForm'),
                    closeBtn: 1,
                    btn: ['提交', '取消'],
                    yes: function (index, layero) {
                        productionDate = $("#productionDate").val();
                        endDate = $("#endDate").val();
                        inShelfDate = $("#inShelfDate").val();
                        var keeperType1 = layero.find("select[name='keeperType']");
                        keeperType = keeperType1.find("option:selected").text();
                        var keeper1 = layero.find("select[name='keeper']");
                        keeper = keeper1.find("option:selected").text();
                        keeperCode = keeper1.find("option:selected").val();
                        var json = {
                            productType: data.productType,
                            productCode: data.productCode,
                            productName: data.productName,
                            // barCode:data.barCode,
                            specification: data.productSpecification,
                            // secondaryAttribute:data.secondaryAttribute,
                            productionDate: productionDate,
                            endDate: endDate,
                            inShelfDate: inShelfDate,
                            receivableNumber: data.number,
                            receivedNumber: data.number,
                            unit: data.unitId,
                            unitPrice: data.instoragePrice,
                            totalPrice: data.totalPrice,
                            stock: stockData.stockCode,
                            stockStatus: "1",
                            keeperType: keeperType,
                            keeper: keeper,
                            keeperCode: keeperCode,
                            isSend: isSend
                        };
                        inStorageProductList.push(json);
                        layer.close(index);
                        layer.close(pd1);
                    },
                    btn2: function (index) {
                        layer.close(index);
                        layer.close(pd1);
                    },
                    success: function (layero) {
                        $("#resetProductDetail").click();

                        //监听开关
                        form.on('switch(isSend)', function (data) {
                            //开关是否开启，true或者false
                            var checked = data.elem.checked;
                            if (checked) {
                                isSend = true;
                            } else {
                                isSend = false;
                            }
                        });
                    },
                    area: ['500px', '500px'],
                    // end: function () {
                    //     window.location.reload();
                    // }
                });
            } else {
                for (var p in inStorageProductList) {
                    if (data.productCode == inStorageProductList[p].productCode) {
                        inStorageProductList.splice(p, 1);
                    }
                }
            }
        });

        //监听表格的数量修改
        table.on('edit(productQita)', function (obj) {
            var value = obj.value //得到修改后的值
                , data = obj.data //得到所在行所有键值
                , field = obj.field; //得到字段
            var totalPrice = 0;
            if (field == "number") {
                if (data.instoragePrice == null || data.instoragePrice == "") {
                    data.instoragePrice = 0;
                }
                totalPrice = accMul(Number(value), Number(data.instoragePrice));
                data.number = value;
            }
            if (field == "instoragePrice") {
                if (data.number == null || data.number == "") {
                    data.number = 0;
                }
                totalPrice = accMul(Number(value), Number(data.number));
                data.instoragePrice = value;
                var outprice = accMul(value, accAdd(data.outstorageProfit, 1));
                updatePriductInstoragePrice(data.productType, data.productCode, data.instoragePrice, outprice, data.outstorageProfit);
            }
            data.totalPrice = totalPrice;
            var productCache = table.cache["productQitaReload"];
            for (var p in productCache) {
                if (productCache[p].productCode == data.productCode) {
                    data.LAY_TABLE_INDEX = productCache[p].LAY_TABLE_INDEX;
                    data.LAY_CHECKED = productCache[p].LAY_CHECKED;
                    productCache.splice(p, 1, data);

                }
            }
            var div = document.getElementById('p2');
            // var a = div.scrollHeight;
            var a = div.scrollTop;
            /*      //刷新页面
                  table.reload('productQitaReload', {
                      data: productCache
                  }, 'data');*/
            div.scrollTop = a;
        });


        //监听搜索
        $("#searchProductQita").click(function () {
            var name = $("#instorageQitaForm input[name='productCodeSearchQita']").val();
            table.reload('productQitaReload', {
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                , where: {
                    companyType: companyType,
                    companyId: companyId,
                    type: '2',
                    productStatus: '1',
                    status: 1,
                    isHoutai: 0,
                    keyWord: name
                }
            }, 'data');
            return false;
        });
        //监听提交
        form.on('submit(addInstorageQita)', function () {

            if (inStorageProductList.length == 0) {
                layer.open({
                    title: '提示'
                    , content: "请选择商品"
                    , btn: ["关闭"]
                    , yes: function (index) {
                        layer.close(index); //如果设定了yes回调，需进行手工关闭
                    }
                });
                return false;
            }
            var invoicesType = $("#instorageQitaForm select[name='invoicesType'] option:selected").text();
            var shipperType = $("#instorageQitaForm select[name='shipperType'] option:selected").text();
            var shipper = $("#instorageQitaForm select[name='shipper'] option:selected").text();
            var shipperCode = $("#instorageQitaForm select[name='shipper'] option:selected").val();
            var branch = $("#instorageQitaForm select[name='branch'] option:selected").val();
            var providerName = $("#instorageQitaForm select[name='providerQt'] option:selected").text();
            var providerID = $("#instorageQitaForm select[name='providerQt'] option:selected").val();
            // var inventoryGroup = $("#instorageQitaForm select[name='inventoryGroup'] option:selected").text();
            var inventoryWay = $("#instorageQitaForm select[name='inventoryWay'] option:selected").val();
            var url = productHost + "/stock/instoragePreAudit";
            var data = {
                inStorageType: "其他入库",
                invoicesType: invoicesType,
                inStorageDate: $("#inStorageDateQita").val() + " 00:00:00",
                purchaseBranch: $("#instorageQitaForm input[name='purchaseBranch']").val(),
                stockGroup: stockData.stockCode,
                shipperType: shipperType,
                shipper: shipper,
                provider: providerID,
                providerName: providerName,
                direction: "GENERAL",
                stockId: stockData.stockId,
                companyId: "${currentUser.companyId!}",
                companyType: "${currentUser.companyType!}",
                instorageOrgName: "${currentUser.companyName!}",
                shipperCode: shipperCode,
                inventoryGroup: stockData.stockCode,
                inventoryWay: inventoryWay,
                orgK3Number: "${currentUser.orgK3Number!}",
                inStorageProductJson: JSON.stringify(inStorageProductList),
                branch: branch,
                remark: $("#instorageQitaForm input[name='remark']").val(),
                createOperator: "${currentUser.trueName!}"
            };
            var index = null;
            $.ajax({
                type: "POST",
                url: url,
                data: data,
                async: true,
                beforeSend: function () {
                    index = layer.load(3, {
                        shade: [0.9, '#fff'] //0.1透明度的白色背景
                    });
                },
                error: function (request) {
                    layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
                    layer.close(index);    //返回数据关闭loading
                },
                success: function (data) {
                    layer.close(index);    //返回数据关闭loading
                    if (data.responseStatusType.message == 'Failure') {
                        layer.alert(data.responseStatusType.error.errorMsg);
                    }
                    if (data.responseStatusType.message == 'Success') {
                        layer.open({
                            title: '添加'
                            , content: data.result
                            , btn: ["关闭"]
                            , yes: function (index) {
                                layer.close(index); //如果设定了yes回调，需进行手工关闭
                                layer.close(p2);
                            }, end: function () {
                                layer.close(p2);
                                $("#resetInstorageQita").click();//重置表单
                            }
                        });
                    }
                }
            });
            return false;
        });
    }

    // //获取当前位置
    // function getMousePos(event) {
    //     var e = event || window.event;
    //     return {'x':e.screenX,'y':e.screenY}
    // }
    //当前鼠标位置
    function getMousePos(event) {

        var e = event || window.event;

        return {'x': e.clientX, 'y': e.clientY}

    }

    //加载枚举
    function loadEnumData(name) {
        var enumD = [];
        $.ajax({
            url: productHost + "/stock/selectEnumByName",
            data: {name: name},
            method: "POST",
            async: false,
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    enumD = res.result;
                }
            }
        });
        return enumD;
    }

    //加载供应商类型
    function loadProviderType() {
        dataProviderType = [];
        $.ajax({
            url: storeHost + "/manage/supplier/listSupplierCategoryNoPage",
            data: {"companyId": "${currentUser.companyId!}", "companyType": "${currentUser.companyType!}"},
            method: "POST",
            async: false,
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    dataProviderType = res.result;
                }
            }
        });
    }

    //加载供应商（业务组织）
    function loadProvider(id) {
        dataProvider = [];
        $.ajax({
            url: storeHost + "/manage/supplier/listSupplierNoPage",
            data: {
                supplierType: id,
                companyId: "${currentUser.companyId!}",
                companyType: "${currentUser.companyType!}"
            },
            method: "POST",
            async: false,
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    dataProvider = res.result;
                }
            }
        });

    }

    //入库下拉框
    function loadSelectIn() {
        //单据类型
        var option = "<option value='1'>标准采购入库</option>";
        var option1 = "<option value='11'>标准其他入库</option>";
        $("#instorageCaigouForm select[name='invoicesType']").html(option);
        $("#instorageQitaForm select[name='invoicesType']").html(option1);
        option = "<option value='1'>标准采购</option>";
        $("#instorageCaigouForm select[name='businessType']").html(option);

        //组织类型
        //供应商类型
        $("#instorageCaigouForm select[name='providerType']").val("<option value='0' selected>请选择</option>");
        $("#instorageQitaForm select[name='providerType']").val("<option value='0' selected>请选择</option>");
        for (var p in dataProviderType) {
            var option = "<option value='" + dataProviderType[p].supplierCategoryId + "'>" + dataProviderType[p].supplierCategoryName + "</option>";
            $("#instorageCaigouForm select[name='providerType']").append(option);
            $("#instorageQitaForm select[name='providerType']").append(option);
        }
        //结算币别
        $("#instorageCaigouForm select[name='settlementCurrency']").html("<option value='PRE001'>人民币</option>");
        $("#instorageQitaForm select[name='settlementCurrency']").html("<option value='PRE001'>人民币</option>");
        // for (var p in dateSettlementCurrency) {
        //     var option = "<option value='" + dateSettlementCurrency[p].code + "'>" + dateSettlementCurrency[p].name + "</option>";
        //     $("#instorageForm select[name='settlementCurrency']").append(option);
        // }

        //本公司
        var option = "<option value='" + companyId + "'>" + companyName + "</option>";
        //收料组织（业务组织）
        $("#instorageCaigouForm select[name='receiveGroup']").html(option);
        $("#instorageQitaForm select[name='receiveGroup']").html(option);
        //需求组织
        $("#instorageCaigouForm select[name='needGroup']").html(option);
        $("#instorageQitaForm select[name='needGroup']").html(option);
        //采购组织
        $("#instorageCaigouForm select[name='purchaseGroup']").html(option);
        $("#instorageQitaForm select[name='purchaseGroup']").html(option);
        //结算组织
        $("#instorageCaigouForm select[name='settlementGroup']").html(option);
        $("#instorageQitaForm select[name='settlementGroup']").html(option);
        //库存组织
        // $("#instorageCaigouForm select[name='inventoryGroup']").html(option);
        // $("#instorageQitaForm select[name='inventoryGroup']").html(option);
        //货主类型
        $("#instorageCaigouForm select[name='shipperType']").html("<option value='0'>业务组织</option>");
        $("#instorageQitaForm select[name='shipperType']").html("<option value='0'>业务组织</option>");
        //货主
        $("#instorageCaigouForm select[name='shipper']").html(option);
        $("#instorageQitaForm select[name='shipper']").html(option);
        //保管者类型
        $("#productDetailForm select[name='keeperType']").html("<option value='0'>业务组织</option>");
        //保管者
        $("#productDetailForm select[name='keeper']").html(option);
        form.render("select", "productDetailForm");
        form.render("select", "instorageCaigouForm");
        form.render("select", "instorageQitaForm");
    }

    //加载仓库
    function loadStock(comT, comI) {
        var param = {
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
                    stockData = res.result[0];
                }
            }
        });
    }

    //加载公司门店
    function loadSupp() {
        var url = storeHost + "/manage/supplier/listSupplierNoPage";
        $.post(url, {
            companyId: "${currentUser.companyId!}",
            companyType: "${currentUser.companyType!}"
        }, function (res) {
            if (res.responseStatusType.message == "Success") {
                var supplierList = res.result;
                for (var p in supplierList) {
                    var option = "<option value='" + supplierList[p].supplierCode + "'>" + supplierList[p].supplierName + "</option>";
                    $(".demoTable select[name='supplier']").append(option);
                }
                layui.form.render();
            }
        })
    }

    //加载商品-护理
    function loadProduct(name) {
        var param = {
            companyType: companyType,
            companyId: companyId,
            type: '2',
            productStatus: '1',
            status: 1,
            isHoutai: 0,
            keyWord: name
        };
        product = [];
        $.ajax({
            url: productHost + "/manage/product/selectProductList",
            data: param,
            method: "POST",
            async: false,
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    var productT = res.result.list;
                    for (var p in productT) {
                        /*if (productT[p].productSubordinate == "0") {*/
                        product.push(productT[p]);
                        /* }*/
                    }
                }
            }
        });
    }

    //加载商品--产品
    function loadProductCP(name) {
        var param = {
            companyType: companyType,
            companyId: companyId,
            type: '1',
            productStatus: '1',
            status: 1,
            isHoutai: 0,
            keyWord: name
        };
        product = [];
        $.ajax({
            url: productHost + "/manage/product/selectProductList",
            data: param,
            method: "POST",
            async: false,
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    var productT = res.result.list;
                    for (var p in productT) {
                        if (productT[p].productSubordinate == "0") {
                            product.push(productT[p]);
                        }
                    }
                }
            }
        });
    }

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

    //修改商品入库价，根据利润率修改出库价
    function updatePriductInstoragePrice(type, code, inPrice, outPrice, outstorageProfit) {
        if (type == 1) {  //商品
            $.ajax({
                url: productHost + "/manage/product/calculation",
                method: "POST",
                async: true,
                data: {
                    productCode: code,
                    instoragePrice: inPrice,
                    outstorageProfit: outstorageProfit,
                    type: type
                },
                success: function (res) {
                    if (res.responseStatusType.message == "Success") {
                        layer.msg("商品入库价修改成功！" + res.result);
                    }
                }
            });
        }
        if (type == 2) {  //服务
            $.ajax({
                url: productHost + "/manage/product/calculation",
                method: "POST",
                async: true,
                data: {
                    productCode: code,
                    instoragePrice: inPrice,
                    outstorageProfit: outstorageProfit,
                    type: type
                },
                success: function (res) {
                    if (res.responseStatusType.message == "Success") {
                        layer.msg("商品入库价修改成功！" + res.result);
                    }
                }
            });
        }
    }

    //判断当前组织是否有仓库
    function checkIsStock() {
        var isStore = null;
        $.ajax({
            url: productHost + "/stock/selectStockList",
            method: "POST",
            data: {"companyId": "${currentUser.companyId!}", "companyType": "${currentUser.companyType!}"},
            async: false,
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    isStore = 1
                } else {
                    isStore = 0
                }
            }
        });
        return isStore;
    }

    //加载其他入库中的-部门
    function loadDepartment(form) {
        //加载店铺列表信息
        var url = storeHost + "/manage/department/listDepartmentNoPage";
        var data = {"companyId": "${currentUser.companyId!}", "companyType": "${currentUser.companyType!}"};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("branch"); //server为select定义的id
                server.innerHTML = "<option value='' selected='selected'>请选择</option>";
                for (var p in list) {
                    var option = document.createElement("option");  // 创建添加option属性
                    option.setAttribute("value", list[p].k3Number); // 给option的value添加值
                    option.innerText = list[p].name;     // 打印option对应的纯文本
                    server.appendChild(option);           //给select添加option子标签
                }
                form.render();
            } else {

            }
        })
    }

    /*加载供应商类型*/
    function selectSuppTypeList(form) {
        //加载店铺列表信息
        var url = storeHost + "/manage/supplier/selectSuppTypeList";
        var data = {};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("providerType"); //server为select定义的id
                server.innerHTML = "<option value='0' selected='selected'>请选择</option>";
                for (var p in list) {
                    var option = document.createElement("option");  // 创建添加option属性
                    option.setAttribute("value", p); // 给option的value添加值
                    option.innerText = list[p];     // 打印option对应的纯文本
                    server.appendChild(option);           //给select添加option子标签

                }
                form.render();
            } else {

            }
        })
    }

    /*加载供应商类型*/
    function selectSuppTypeListQt(form) {
        //加载店铺列表信息
        var url = storeHost + "/manage/supplier/selectSuppTypeList";
        var data = {};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("providerTypeQt"); //server为select定义的id
                server.innerHTML = "<option value='0' selected='selected'>请选择</option>";
                for (var p in list) {
                    var option = document.createElement("option");  // 创建添加option属性
                    option.setAttribute("value", p); // 给option的value添加值
                    option.innerText = list[p];     // 打印option对应的纯文本
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