<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>出库</title>
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
                <label class="layui-form-label">出库方式</label>
                <div class="layui-input-inline">
                    <select name="outStorageTypeSearch" lay-filter="outStorageTypeSearch" lay-verify="required">
                        <option value="0">请选择</option>
                        <option value="1">销售出库</option>
                        <option value="2">其他出库</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">出库客户</label>
                <div class="layui-input-inline">
                    <select name="cust" lay-filter="cust" lay-verify="required">
                        <option value="0">请选择</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <button class="layui-btn" data-type="search"><i class="layui-icon layui-icon-search"></i></button>
            </div>
            <div class="layui-inline">
                <a class="layui-btn layui-btn-primary" onclick="outstorage()">出库</a>
            </div>
        </div>
    </div>
    <#--表格:显示出库单-->
        <table id="outstorage" lay-filter="outstorage"></table>

    <#--显示出库单商品-->
        <form class="layui-form layui-form-pane layui-personal" id="outstorageProductForm" action=""
              lay-filter="outstorageProductForm" method="post" hidden="true">
            <table id="outstorageProduct" class="outstorageProduct" lay-filter="outstorageProduct"></table>
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

<#-- 出库表-销售-->
<form id="outstorageFormXs" class="layui-form outstorageForm layui-form-pane layui-personal" action=""
      lay-filter="outstorageFormXs" hidden="true">
    <div class="layui-form-item">
        <label class="layui-form-label xrequired" style="width: 103px;">单据类型</label>
        <div class="layui-input-inline">
            <select name="invoicesTypeOut" lay-filter="invoicesTypeOut" lay-verify="required">
                <option value="" selected>请选择</option>
            </select>
        </div>

        <div class="layui-inline">
            <label class="layui-form-label xrequired" style="width: 103px;">出库日期</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="outStorageDateOutXs" placeholder="yyyy-MM-dd"
                       lay-verify="required">
            </div>
        </div>
        <label class="layui-form-label xrequired" style="width: 103px;">结算币别</label>
        <div class="layui-input-inline">
            <select name="settlementCurrencyOut" lay-filter="settlementCurrencyOut" lay-verify="required">
                <option value="" selected>请选择</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired" style="width: 103px;">销售组织</label>
        <div class="layui-input-inline">
            <select name="marketGroupOut" lay-filter="marketGroupOut" lay-verify="required">
                <option value="" selected>请选择</option>
            </select>
        </div>
        <label class="layui-form-label xrequired" style="width: 103px;">客户</label>
        <div class="layui-input-inline">
            <select name="clientOut" lay-filter="clientOut" id="clientOutXs" lay-verify="required">
            </select>
        </div>
        <label class="layui-form-label xrequired" style="width: 103px;">发货组织</label>
        <div class="layui-input-inline">
            <select name="shipmentGroupOut" lay-filter="shipmentGroupOut" lay-verify="required">
                <option value="" selected>请选择</option>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label" style="width: 103px;">备注</label>
        <div class="layui-input-inline">
            <input type="text" name="remarkOut" autocomplete="off" placeholder="" class="layui-input">
        </div>


        <label class="layui-form-label xrequired">销售员</label>
        <div class="layui-input-inline">
            <input name="staffNumberShow" id="staffNumberShow" readonly="readonly"
                   type="text"
                   autocomplete="off" placeholder="请输入销售员" class="layui-input" style="padding-right: 80px;"
                   lay-verify="required">
            <input name="staffNumber" id="staffNumber" hidden="true" type="text">
            <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachStaffNumber"><i
                        class="layui-icon layui-icon-search"></i></button>

        </div>
    </div>



    <div class="layui-form-item">
    </div>
    <div class="layui-form-item">
        <#--<label class="layui-form-label" style="width: 103px;">请选择商品类型</label>-->
        <#--<div class="layui-input-inline">-->
        <#--<select name="productTypeOut" lay-filter="productTypeOut">-->
        <#--<option value="1" selected>商品</option>-->
        <#--<option value="2">服务</option>-->
        <#--</select>-->
        <#--</div>-->
        <label class="layui-form-label" style="width: 103px;">商品名称</label>
        <div class="layui-input-inline">
            <input class="layui-input" type="text" name="productCodeSearchXs" id="productCodeSearchXs"
                   autocomplete="off" placeholder="输入商品名称">
        </div>
        <div class="layui-inline">
            <button class="layui-btn" id="searchProductOutXs"><i class="layui-icon layui-icon-search"></i></button>
        </div>
    </div>
    <#--显示所有商品-->
    <table id="productOutXs" class="productOut" lay-filter="productOutXs"></table>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="outstorageXs">出库</button>
            <button id="resetoutstorageXs" type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<#-- 出库表-其他 -->
<form id="outstorageFormQt" class="layui-form outstorageForm layui-form-pane layui-personal" action=""
      lay-filter="outstorageFormQt" hidden="true">
    <div class="layui-form-item">
        <label class="layui-form-label xrequired" style="width: 103px;">单据类型</label>
        <div class="layui-input-inline">
            <select name="invoicesTypeOut" lay-filter="invoicesTypeOut" lay-verify="required">
                <option value="" selected>请选择</option>
            </select>
        </div>
        <label class="layui-form-label xrequired" style="width: 103px;">业务类型</label>
        <div class="layui-input-inline">
            <select name="businessTypeOut" lay-filter="businessTypeOut" lay-verify="required">
                <option value="" selected>请选择</option>
            </select>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label xrequired" style="width: 103px;">出库日期</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="outStorageDateOutQt" placeholder="yyyy-MM-dd"
                       lay-verify="required">
            </div>
        </div>

    </div>
    <div class="layui-form-item">
        <#--<label class="layui-form-label xrequired" style="width: 103px;">库存组织</label>-->
        <#--<div class="layui-input-inline">-->
        <#--<select name="inventoryGroupOut" lay-filter="inventoryGroupOut" lay-verify="required">-->
        <#--<option value="" selected>请选择</option>-->
        <#--</select>-->
        <#--</div>-->
        <label class="layui-form-label xrequired" style="width: 103px;">领用组织</label>
        <div class="layui-input-inline">
            <select name="receiveGroupOut" lay-filter="receiveGroupOut" lay-verify="required">
                <option value="" selected>请选择</option>
            </select>
        </div>
        <label class="layui-form-label xrequired" style="width: 103px;">库存方向</label>
        <div class="layui-input-inline">
            <select name="inventoryWayOut" lay-filter="inventoryWayOut" lay-verify="required">
                <option value="" selected>请选择</option>
                <option value="GENERAL">普通</option>
                <option value="RETURN">退货</option>
            </select>
        </div>

    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired" style="width: 103px;">客户</label>
        <div class="layui-input-inline">
            <select name="clientOut" lay-filter="clientOut" id="clientOutQt" lay-verify="required">
            </select>
        </div>
        <label class="layui-form-label xrequired" style="width: 103px;">货主类型</label>
        <div class="layui-input-inline">
            <select name="shipperTypeOut" lay-filter="shipperTypeOut" lay-verify="required">
                <option value="" selected>请选择</option>
            </select>
        </div>
        <label class="layui-form-label xrequired" style="width: 103px;">货主</label>
        <div class="layui-input-inline">
            <select name="shipperOut" lay-filter="shipperOut" lay-verify="required">
                <option value="" selected>请选择</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label" style="width: 103px;">备注</label>
        <div class="layui-input-inline">
            <input type="text" name="remarkOut" autocomplete="off" placeholder="" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
    </div>
    <div class="layui-form-item">
        <#--<label class="layui-form-label" style="width: 103px;">请选择商品类型</label>-->
        <#--<div class="layui-input-inline">-->
        <#--<select name="productTypeOut" lay-filter="productTypeOut">-->
        <#--<option value="1" selected>商品</option>-->
        <#--<option value="2">服务</option>-->
        <#--</select>-->
        <#--</div>-->
        <label class="layui-form-label" style="width: 103px;">商品名称</label>
        <div class="layui-input-inline">
            <input class="layui-input" type="text" name="productCodeSearchQita" id="productCodeSearchQita"
                   autocomplete="off" placeholder="输入商品名称">
        </div>
        <div class="layui-inline">
            <button class="layui-btn" id="searchProductOutQt"><i class="layui-icon layui-icon-search"></i></button>
        </div>
    </div>
    <#--显示所有商品-->
    <table id="productOutQt" class="productOut" lay-filter="productOutQt"></table>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="outstorageQt">出库</button>
            <button id="resetoutstorageQt" type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<#include "../../baseFtl/loadLinkData.ftl" />
<script type="text/html" id="outstorageDemo">
    <#--<a class="layui-btn layui-btn-xs" lay-event="show">查看</a>-->
    <#--只有当没审核并且未作废 才有审核-->
    {{#  if(d.outStorageStatus == 0 && d.invalidStatus ==1){ }}
    <a class="layui-btn layui-btn-xs layui-btn-primary" lay-event="audit">审核</a>
    {{#  } }}
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="outstorageProduct">出库商品</a>
</script>

<script type="text/html" id="outstorageDemo2">
    <#--<a class="layui-btn layui-btn-xs" lay-event="show">查看</a>-->

    {{#  if(d.outStorageStatus == 0 ){ }}
    <a class="layui-btn layui-btn-xs layui-btn-primary" lay-event="audit">审核</a>
    {{#  } }}
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="outstorageProduct">出库商品</a>
</script>

<script>
    var stockData, product, table, form, laydate, $, companyType = "${currentUser.companyType!}",
        companyId = "${currentUser.companyId!}",
        companyName = "${currentUser.companyName!}", stockId, dataUnit, dataStockStatus, dateSettlementCurrency,
        dataProvider,
        dataOutStorageInvoicesType, dataOutStorageType, outStorageProductJson = [], dataOutStorageBusinessType;
    //数据显示,分页实现
    layui.use(['table', 'form', 'laydate'], function () {
        table = layui.table;
        form = layui.form;
        laydate = layui.laydate;
        $ = layui.$;

        stockId = loadStockId(companyType, companyId);
        loadUnit();
        loadCustomerQt(form);
        // loadStockStatus();
        dataOutStorageInvoicesType = loadEnumData("OutStorageInvoicesTypeEnum");
        dataOutStorageType = loadEnumData("OutStorageTypeEnum");
        dataOutStorageBusinessType = loadEnumData("OutStorageBusinessTypeEnum");
        loadSelectOut();


        /*------查看销售员-----*/
        $("#" + "serachStaffNumber").click(function () {
            var url = storeHost + "/manage/beautician/selectBeauticianList";
            var param = {companyType:"${currentUser.companyType!}",companyId:"${currentUser.companyId!}",isSaleMan: 1};
            loadLinkData(layer, layui, url, "staffNumber", "name", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "staffNumberShow").val(data.name);
                $("#" + "staffNumber").val(data.staffNumber);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {keyWordName: wordSearch,companyType:"${currentUser.companyType!}",companyId:"${currentUser.companyId!}",isSaleMan: 1}
                layui.use('table', function () {
                    var table = layui.table;
                    table.reload('showLinDataTableRelod', {
                        page: {
                            curr: 1 //重新从第 1 页开始
                        }
                        , where: searchJsonName
                    }, 'data');
                });
            })
            //刷新
            $("#refreshLinkData").click(function () {
                $(".layui-laypage-btn").click();
            })
        });

        //判断公司类型，子公司需要显示门店的单据
        if (companyType == 1) { //总公司
            $(".demoTable select[name='store']").parent().parent().hide();
        } else if (companyType == 2) { //子公司
            $(".demoTable select[name='store']").parent().parent().show();
            //显示所有子公司的门店
            loadCust();
            //监听门店的选择
            form.on('select(cust)', function (obj) {

                //重新加载入库表格
                table.reload('outstorageReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    , where: {
                        client: obj.value
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
            elem: '#outStorageDateOutXs'
        });
        laydate.render({
            elem: '#outStorageDateOutQt'
        });

        table.render({
            elem: '#outstorage'
            , url: productHost + "/stock/selectOutstorageList"
            , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , page: true          //显示分页默认不显示
            , method: 'post'
            , request: {
                pageName: 'pageNum', //页码的参数名称，默认：page
                limitName: 'pageSize' //每页数据量的参数名，默认：limit
            }
            , where: {
                inventoryGroup: stockId
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
                , {field: 'outStorageType', title: '出库方式'}
                , {field: 'instorageOrgName', title: '需求组织'}
                , {
                    field: 'inventoryWay', title: '其他出库方向', templet: function (d) {
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
                    field: 'outStorageNumber', title: '出库编号', templet: function (d) {
                        var number = "";
                        if (d.afterAuditOutStorageNumber == null) {
                            number = d.outStorageNumber;
                            return "<span>" + number + "</span>"
                        }
                        if (d.afterAuditOutStorageNumber != null) {
                            number = d.afterAuditOutStorageNumber;
                            return "<span>" + number + "</span>"
                        }
                    }
                }
                , {
                    field: 'outStorageDate', title: '出库日期', templet: function (d) {
                        return d.outStorageDate.split(" ")[0];
                    }
                }
                , {
                    field: 'outStorageStatus', title: '单据状态', templet: function (d) {
                        var statusName = "";
                        var color = "";
                        if (d.outStorageStatus == 1) {
                            statusName = "已审核";
                            color = "green"
                            return "<span style='color: " + color + "'" + ">" + statusName + "</span>"
                        } else if (d.outStorageStatus == 2) {
                            statusName = "未通过";
                            color = "red"
                            return "<span style='color: " + color + "'" + ">" + statusName + "</span>"
                        } else if (d.outStorageStatus == 0) {
                            statusName = "待审核";
                            color = "gray"
                            return "<span style='color: " + color + "'" + ">" + statusName + "</span>"
                        } else {
                            return ""
                        }
                    }
                }
                , {
                    field: 'instorageIsComfir', title: '客户是否确认收货', templet: function (d) {
                        var statusName = "";
                        var color = "";
                        if (d.instorageIsComfir == 1) {
                            statusName = "已确认";
                            color = "green"
                            return "<span style='color: " + color + "'" + ">" + statusName + "</span>"
                        } else if (d.instorageIsComfir == 0) {
                            statusName = "未确认";
                            color = "red"
                            return "<span style='color: " + color + "'" + ">" + statusName + "</span>"
                        } else {
                            return ""
                        }
                    }
                }
                , {
                    field: 'invalidStatus', title: '请购组织是否作废', templet: function (d) {
                        var statusName = "";
                        var color = "";
                        if (d.invalidStatus == 1) {
                            statusName = "未作废";
                            color = "green"
                            return "<span style='color: " + color + "'" + ">" + statusName + "</span>"
                        } else if (d.invalidStatus == 0) {
                            statusName = "已作废";
                            color = "red"
                            return "<span style='color: " + color + "'" + ">" + statusName + "</span>"
                        } else {
                            return ""
                        }
                    }
                }
                , {field: 'auditorTime', title: '审核时间'}
                , {fixed: 'right', title: '操作', width: 180, align: 'left', toolbar: '#outstorageDemo'}
            ]]
            , id: 'outstorageReload'
        });

        var $ = layui.$, active = {
            search: function () {
                var date = $("#dateSearch").val(),
                    outStorageType = $(".demoTable select[name='outStorageTypeSearch'] option:selected").text(),
                    value = $(".demoTable select[name='store'] option:selected").val();
                if (value == 0) {
                    stockId = loadStockId(companyType, companyId);
                } else {
                    stockId = loadStockId(3, value);
                }
                if (outStorageType == "请选择") {
                    outStorageType = null;
                }
                table.reload('outstorageReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    , where: {
                        inventoryGroup: stockId,
                        outStorageType: outStorageType,
                        outStorageDate: date
                    }
                }, 'data');
            }
        };

        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        //查看，审核，出库商品
        table.on('tool(outstorage)', function (obj) {
            var data = obj.data;
            // if(obj.event === 'show'){
            //     // showInstorage(data);
            // }else
            if (obj.event === 'audit') {
                auditOutstorage(data);
            } else if (obj.event === 'outstorageProduct') {
                outstorageProduct(data);
            }
        });
    });

    //审核出库
    function auditOutstorage(data) {
        var c1 = layer.open({
            type: 1,
            title: '是否审核通过？',
            content: $('#auditor'),
            closeBtn: 1,
            btn: ['通过', '拒绝'],
            yes: function (index, layero) {
                var url = productHost + "/stock/auditOutstorage";
                var params = {
                    outStorageId: data.outStorageId,
                    inventoryWay: data.inventoryWay,
                    outstorageStatus: 1,
                    remark: layero.find("input[name='remark']").val(),
                    auditor: "${currentUser.trueName!}"
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
                        layer.close(index);    //返回数据关闭loading
                        if (data.responseStatusType.message == "Success") {
                            layer.open({
                                title: '审核'
                                , content: '审核成功！'
                                , btn: ["关闭"]
                            });
                            layer.close(index);
                            layer.close(c1);
                            //重新加载表格
                            table.reload("outstorageReload");
                        } else {
                            layer.open({
                                title: '审核'
                                , content: data.responseStatusType.error.errorMsg
                                , btn: ["关闭"]
                            });
                            layer.close(index);
                            layer.close(c1);
                            table.reload("outstorageReload");
                        }
                    }
                });

            },
            btn2: function (index, layero) {
                var url = productHost + "/stock/auditOutstorage";
                var params = {
                    outStorageId: data.outStorageId,
                    outstorageStatus: 2,
                    remark: layero.find("input[name='remark']").val(),
                    auditor: "${currentUser.trueName!}"
                };
                $.post(url, params, function (res) {
                    if (res.responseStatusType.message == "Success") {
                        layer.open({
                            title: '拒绝'
                            , content: '拒绝成功！'
                            , btn: ["关闭"]
                        });
                        layer.close(index);
                        layer.close(c1);
                        //重新加载表格
                        table.reload("outstorageReload");
                    } else {
                        layer.open({
                            title: '拒绝'
                            , content: '拒绝失败！'
                            , btn: ["关闭"]
                        });
                    }
                })
            },
            success: function (layero) {
                layero.find("input[name='remark']").val("");
            },
            area: ['350px', '160px']
        });
    }

    //出库商品
    function outstorageProduct(data) {
        var dataOutProduct = data.outStorageProductList;
        var a1 = layer.open({
            type: 1,
            title: '查看出库商品',
            content: $('#outstorageProductForm'),
            // scrollbar: true,
            closeBtn: 1,
            btn: ['确定'],
            area: ['800px', '400px'],
            yes: function (index, layero) {
                layer.close(index);
                layer.close(a1);
            },
            success: function (layero, index) {
                table.render({
                    elem: '#outstorageProduct'
                    , data : dataOutProduct
                    /*, url: productHost + "/manage/product/selectProductList"*/
                    , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    , page: true          //显示分页默认不显示
                    /*, method: 'post'*/
                   /* , request: {
                        pageName: 'pageNum', //页码的参数名称，默认：page
                        limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    }*/
                    , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                        return {
                            "code": 0, //解析接口状态
                            "msg": "", //解析提示文本
                            "count": res == null ? 0 : res.length, //解析数据长度
                            "data": res == null ? 0 : res //解析数据列表
                        }
                    }
                   /* , where: {
                        companyType: companyType,
                        companyId: companyId,
                        type: '2',
                        productStatus: '1',
                        status: 1,
                        isHoutai: 0
                    }*/
                    , cols: [[
                        {type: 'checkbox', fixed: 'left', width: 40, hide: true}
                        , {field: 'outStorageNumber', title: '出库编号', width: 170}
                        , {field: 'productCode', title: '商品编码', width: 100}
                        , {field: 'productName', title: '商品', width: 135}
                        , {field: 'batchNumber', title: '批号', width: 170}
                        , {field: 'sendNumber', title: '数量'}
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
                    ]]
                    , id: 'outstorageProductReload'
                });
            }
        });
    }

    //加载公司的仓库code
    function loadStockId(comT, comI) {
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

    /*==============出库====================*/

    //出库
    function outstorage() {
        //获取本公司仓库
        loadStock(companyType, companyId);
        layer.msg('选择出库方式', {
            time: 20000, //20s后自动关闭
            btn: ['销售出库', '其他出库', '取消'],
            skin: 'layui-layer-molv',
            yes: function (index, layero) {
                marketOutstorage(stockData);
                layer.close(index);
            },
            btn2: function (index, layero) {
                otherOutstorage(stockData);
                layer.close(index);
                // return false
            },
            btn3: function (index) {
                layer.close(index);
            }
        });
    }

    //销售出库
    function marketOutstorage(stockData) {
        //销售出库：单据类型、日期、结算币别、销售组织、客户、发货组织
        //出库商品：物料编码、单位、数量、仓库、仓库状态、批号
        //获取商品
        $("#resetoutstorageXs").click();
        var p3 = layer.open({
            type: 1,
            title: '销售出库',
            id: "p3",
            content: $('#outstorageFormXs'),
            closeBtn: 1,
            success: function (layero) {
                //初始化
                table.render({
                    elem: '#productOutXs'
                    , method: 'post'
                    , url: productHost + "/manage/product/selectProductList"
                    , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    , page: true          //显示分页默认不显示
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
                    , request: {
                        pageName: 'pageNum', //页码的参数名称，默认：page
                        limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    }
                    , cols: [[
                        {type: 'checkbox', fixed: 'left', width: 40}
                        , {field: 'productCode', title: '商品编码'}
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
                        , {field: 'outstoragePrice', title: '出库单价', edit: 'text'}
                        , {field: 'number', title: '数量', edit: 'text'}
                        , {field: 'stockNum', title: '库存数量', width: 90}
                        , {field: 'totalPrice', title: '总价'}
                        , {
                            field: 'stock', title: '仓库', templet: function (d) {
                                return stockData.stockCode;
                            }
                        }
                    ]]
                    , id: 'productOutReloadXs'
                    , done: function (res, curr, count) {
                        form.render("select", "productOutXs");
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
                layero.find("select[name='businessTypeOut']").parent().hide();
                layero.find("select[name='businessTypeOut']").parent().prev().hide();

                layero.find("select[name='receiveGroupOut']").parent().hide();
                layero.find("select[name='receiveGroupOut']").parent().prev().hide();
                layero.find("select[name='inventoryWayOut']").parent().hide();
                layero.find("select[name='inventoryWayOut']").parent().prev().hide();

                layero.find("select[name='shipperOut']").parent().parent().hide();

            },
            area: ['950px', '600px'],
            end: function () {
                window.location.reload();
            }
        });
        //监听表格的单选复选
        table.on('checkbox(productOutXs)', function (obj) {
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
                var json = {
                    productType: data.productType,
                    productCode: data.productCode,
                    productName: data.productName,
                    // barCode:data.barCode,
                    specification: data.productSpecification,
                    // secondaryAttribute:data.secondaryAttribute,
                    sendableNumber: data.number,
                    sendNumber: data.number,
                    unit: data.unitId,
                    unitPrice: data.outstoragePrice,
                    totalPrice: data.totalPrice,
                    stock: stockData.stockCode,
                    stockStatus: "1"
                };
                outStorageProductJson.push(json);
            } else {
                for (var p in outStorageProductJson) {
                    if (data.productCode == outStorageProductJson[p].productCode) {
                        outStorageProductJson.splice(p, 1);
                    }
                }
            }
        });

        //监听表格的数量修改
        table.on('edit(productOutXs)', function (obj) {
            var value = obj.value //得到修改后的值
                , data = obj.data //得到所在行所有键值
                , field = obj.field; //得到字段
            var totalPrice = 0;
            if (field == "number") {
                if (data.outstoragePrice == null || data.outstoragePrice == "") {
                    data.outstoragePrice = 0;
                }
                totalPrice = accMul(Number(value), Number(data.outstoragePrice));
                //获取点击的一行tr
                var tr = $(this).parent().parent();
                //获取tr的所有td元素
                var b = tr.children("td");
                //取得第三列元素
                var c = b.eq(9);
                //显示第三列的值
                c.html("<div class='layui-table-cell laytable-cell-2-0-9' style='overflow: visible;'>" + totalPrice + "</div>");
                data.number = value;
            }
            if (field == "outstoragePrice") {
                if (data.number == null || data.number == "") {
                    data.number = 0;
                }
                totalPrice = accMul(Number(value), Number(data.number));
                //获取点击的一行tr
                var tr = $(this).parent().parent();
                //获取tr的所有td元素
                var b = tr.children("td");
                //取得第三列元素
                var c = b.eq(9);
                //显示第三列的值
                c.html("<div class='layui-table-cell laytable-cell-2-0-9' style='overflow: visible;'>" + totalPrice + "</div>");
                data.outstoragePrice = value;
                var profit = accDiv(value, data.instoragePrice);
                updatePriductOutstoragePrice(data.productType, data.productCode, data.outstoragePrice, data.instoragePrice);
            }
            data.totalPrice = totalPrice.toString();
            var productCache = table.cache["productOutReloadXs"];
            for (var p in productCache) {
                if (productCache[p].productCode == data.productCode) {
                    data.LAY_TABLE_INDEX = productCache[p].LAY_TABLE_INDEX;
                    data.LAY_CHECKED = productCache[p].LAY_CHECKED;
                    productCache.splice(p, 1, data);
                }
            }
            var div = document.getElementById('p3');
            // var a = div.scrollHeight;
            var a = div.scrollTop;
            /*   table.reload('productOutReloadXs', {
                   data: productCache
               }, 'data');*/
            div.scrollTop = a;
            return false;
        });

        //监听搜索
        $("#searchProductOutXs").click(function () {
            var name = $("#productCodeSearchXs").val();
            table.reload('productOutReloadXs', {
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
        form.on('submit(outstorageXs)', function () {
            var falg = 0;
            for (var p in  outStorageProductJson) {
                if (outStorageProductJson[p].unitPrice == 0) {
                    falg = 1
                }
            }
            if (falg == 1) {
                layer.open({
                    title: '提示'
                    , content: "存在出库价为0的商品，无法出库"
                    , btn: ["关闭"]
                    , yes: function (index) {
                        layer.close(index); //如果设定了yes回调，需进行手工关闭
                    }
                });
                return false;
            }




            var invoicesType = $("#outstorageFormXs select[name='invoicesTypeOut'] option:selected").text();
            var settlementCurrency = $("#outstorageFormXs select[name='settlementCurrencyOut'] option:selected").text();
            var marketGroup = $("#outstorageFormXs select[name='marketGroupOut'] option:selected").text();
            var client = $("#outstorageFormXs select[name='clientOut'] option:selected").val();
            var clientName = $("#outstorageFormXs select[name='clientOut'] option:selected").text();
            var shipmentGroup = $("#outstorageFormXs select[name='shipmentGroupOut'] option:selected").text();

            var staffNumber = $("input[id='staffNumber']").val();
            var url = productHost + "/stock/outstoragePreAudit";
            var data = {
                outStorageType: "销售出库",
                invoicesType: invoicesType,
                outStorageDate: $("#outStorageDateOutXs").val() + " 00:00:00",
                settlementCurrency: settlementCurrency,
                marketGroup: marketGroup,
                stockGroup: stockData.stockCode,
                stockId: stockData.stockId,
                companyId: "${currentUser.companyId!}",
                companyType: "${currentUser.companyType!}",
                outstorageOrgName: "${currentUser.companyName!}",
                client: client,
                clientName: clientName,
                shipmentGroup: shipmentGroup,
                orgK3Number: "${currentUser.orgK3Number!}",
                outStorageProductJson: JSON.stringify(outStorageProductJson),
                remark: $("#outstorageFormXs input[name='remark']").val(),
                staffNumber: staffNumber,
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
                    if (data.responseStatusType.message == 'Failure') {
                        layer.alert(data.responseStatusType.error.errorMsg);
                        layer.close(index);    //返回数据关闭loading
                    }
                    if (data.responseStatusType.message == 'Success') {
                        layer.close(index);    //返回数据关闭loading
                        layer.open({
                            title: '添加'
                            , content: data.result
                            , btn: ["关闭"]
                            , yes: function (index) {
                                layer.close(index); //如果设定了yes回调，需进行手工关闭
                                layer.close(p3);
                            }, end: function () {
                                layer.close(p3);
                                $("#resetoutstorageXs").click();//重置表单
                            }
                        });
                    }
                }
            });
            return false;
        });
    }

    //其他出库
    function otherOutstorage(stockData) {
        //其他出库：单据类型、库存组织、领用组织、库存方向、日期、业务类型、货主、货主类型
        //出库商品: 物料编码、单位、数量、仓库、批号
        $("#resetoutstorageQt").click();
        var p4 = layer.open({
            type: 1,
            title: '其他出库',
            id: "p4",
            content: $('#outstorageFormQt'),
            closeBtn: 1,
            success: function (layero) {
                //初始化
                table.render({
                    elem: '#productOutQt'
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
                        /* , {field: 'outstoragePrice', title: '出库单价', edit: 'text'}*/
                        , {
                            field: 'number', title: '数量', edit: 'text'
                        }
                        , {field: 'stockNum', title: '库存数量', width: 90}
                        /*  , {
                              field: 'totalPrice', title: '总价'
                          }*/
                        , {
                            field: 'stock', title: '仓库', templet: function (d) {
                                return stockData.stockCode;
                            }
                        }
                    ]]
                    , id: 'productOutReloadQt'
                    , done: function (res, curr, count) {
                        form.render("select", "productOutQt");
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
                layero.find("select[name='settlementCurrencyOut']").parent().hide();
                layero.find("select[name='settlementCurrencyOut']").parent().prev().hide();
                layero.find("select[name='marketGroupOut']").parent().hide();
                layero.find("select[name='marketGroupOut']").parent().prev().hide();
                layero.find("select[name='shipmentGroupOut']").parent().hide();
                layero.find("select[name='shipmentGroupOut']").parent().prev().hide();
                form.render("select", "outstorageFormQt");
            },
            area: ['950px', '600px'],
            end: function () {
                window.location.reload();
            }
        });
        //监听表格的单选复选
        table.on('checkbox(productOutQt)', function (obj) {
            var checked = obj.checked;
            var data = obj.data;
            var type = obj.type;    // all  one
            if (checked) {
                //判断仓库状态
                // var stockStatus = data.stockStatus;
                // if (stockStatus == null || stockStatus == "" || stockStatus == "0") {
                //     layer.msg("仓库状态不能为空")
                //     $(this).prop('checked', false);
                //     form.render('checkbox');
                //     return;
                // }
                //判断商品数量
                var productNumber = data.number;
                if (productNumber == null || productNumber == "" || productNumber == "0") {
                    layer.msg("商品数量不能为空")
                    $(this).prop('checked', false);
                    form.render('checkbox');
                    return;
                }
                var json = {
                    productType: data.productType,
                    productCode: data.productCode,
                    productName: data.productName,
                    // barCode:data.barCode,
                    specification: data.productSpecification,
                    // secondaryAttribute:data.secondaryAttribute,
                    sendableNumber: data.number,
                    sendNumber: data.number,
                    unit: data.unitId,
                    unitPrice: data.outstoragePrice,
                    totalPrice: data.totalPrice,
                    stock: stockData.stockCode,
                    stockStatus: "1"
                };
                outStorageProductJson.push(json);
            } else {
                for (var p in outStorageProductJson) {
                    if (data.productCode == outStorageProductJson[p].productCode) {
                        outStorageProductJson.splice(p, 1);
                    }
                }
            }
        });

        //监听表格的数量修改
        table.on('edit(productOutQt)', function (obj) {
            var value = obj.value //得到修改后的值
                , data = obj.data //得到所在行所有键值
                , field = obj.field; //得到字段
            var totalPrice = 0;
            if (field == "number") {
                if (data.outstoragePrice == null || data.outstoragePrice == "") {
                    data.outstoragePrice = 0;
                }
                totalPrice = accMul(Number(value), Number(data.outstoragePrice));
                data.number = value;
            }
            if (field == "outstoragePrice") {
                if (data.number == null || data.number == "") {
                    data.number = 0;
                }
                totalPrice = accMul(Number(value), Number(data.number));
                data.outstoragePrice = value;
                var profit = accSub(1, accDiv(data.instoragePrice, value));  //accDiv(value,data.instoragePrice)
                updatePriductOutstoragePrice(data.productType, data.productCode, data.outstoragePrice, data.instoragePrice);
            }
            data.totalPrice = totalPrice.toString();
            var productCache = table.cache["productOutReloadQt"];
            for (var p in productCache) {
                if (productCache[p].productCode == data.productCode) {
                    data.LAY_TABLE_INDEX = productCache[p].LAY_TABLE_INDEX;
                    data.LAY_CHECKED = productCache[p].LAY_CHECKED;
                    productCache.splice(p, 1, data);
                }
            }
            var div = document.getElementById('p4');
            // var a = div.scrollHeight;
            var a = div.scrollTop;
            /*  table.reload('productOutReloadQt', {
                  data: productCache
              }, 'data');*/
            div.scrollTop = a;
            return false;
        });

        //监听搜索
        $("#searchProductOutQt").click(function () {
            var name = $("#productCodeSearchQita").val();
            table.reload('productOutReloadQt', {
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
        form.on('submit(outstorageQt)', function () {

            var invoicesType = $("#outstorageFormQt select[name='invoicesTypeOut'] option:selected").text();
            var businessType = $("#outstorageFormQt select[name='businessTypeOut'] option:selected").text();
            // var inventoryGroup = $("#outstorageFormQt select[name='inventoryGroupOut'] option:selected").text();
            var receiveGroup = $("#outstorageFormQt select[name='receiveGroupOut'] option:selected").text();
            var inventoryWay = $("#outstorageFormQt select[name='inventoryWayOut'] option:selected").val();
            var shipperType = $("#outstorageFormQt select[name='shipperTypeOut'] option:selected").text();
            var shipper = $("#outstorageFormQt select[name='shipperOut'] option:selected").text();
            var client = $("#outstorageFormQt select[name='clientOut'] option:selected").val();
            var clientName = $("#outstorageFormQt select[name='clientOut'] option:selected").text();
            var url = productHost + "/stock/outstoragePreAudit";
            var data = {
                outStorageType: "其他出库",
                invoicesType: invoicesType,
                businessType: businessType,
                outStorageDate: $("#outStorageDateOutQt").val() + " 00:00:00",
                inventoryGroup: stockData.stockCode,
                receiveGroup: receiveGroup,
                stockGroup: stockData.stockCode,
                stockId: stockData.stockId,
                inventoryWay: inventoryWay,
                orgK3Number: "${currentUser.orgK3Number!}",
                client: client,
                clientName: clientName,
                shipperType: shipperType,
                shipper: shipper,
                companyId: "${currentUser.companyId!}",
                companyType: "${currentUser.companyType!}",
                outstorageOrgName: "${currentUser.companyName!}",
                outStorageProductJson: JSON.stringify(outStorageProductJson),
                remark: $("#outstorageQt input[name='remark']").val(),
                createOperator: "${currentUser.trueName!}"
            };
            $.ajax({
                type: "POST",
                url: url,
                data: data,
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
                            title: '添加'
                            , content: data.result
                            , btn: ["关闭"]
                            , yes: function (index) {
                                layer.close(index); //如果设定了yes回调，需进行手工关闭
                                layer.close(p4);
                            }, end: function () {
                                layer.close(p4);
                                $("#resetoutstorageQt").click();//重置表单
                            }
                        });
                    }
                }
            });
            return false;
        });
    }

    //出库下拉框
    function loadSelectOut() {
        //单据类型
        var option = "<option value='1'>标准销售出库</option>";
        var option1 = "<option value='11'>标准其他出库</option>";
        $("#outstorageFormXs select[name='invoicesTypeOut']").html(option);
        $("#outstorageFormQt select[name='invoicesTypeOut']").html(option1);
        option = "<option value='11' selected=''>物料领用</option>";
        $("#outstorageFormQt select[name='businessTypeOut']").html(option);
        // for (var p in dataOutStorageInvoicesType) {
        //     if (p == 11) {
        //         break;
        //     }
        //     var option = "<option value='" + p + "'>" + dataOutStorageInvoicesType[p] + "</option>";
        //     $("#outstorageFormXs select[name='invoicesTypeOut']").append(option);
        //     $("#outstorageFormQt select[name='invoicesTypeOut']").append(option);
        // }
        //业务类型(选择单据类型后业务类型自动显示)

        //结算币别
        $("#outstorageFormXs select[name='settlementCurrencyOut']").html("<option value='PRE001'>人民币</option>");
        $("#outstorageFormQt select[name='settlementCurrencyOut']").html("<option value='PRE001'>人民币</option>");
        // for (var p in dateSettlementCurrency) {
        //     var option = "<option value='" + dateSettlementCurrency[p].code + "'>" + dateSettlementCurrency[p].name + "</option>";
        //     $("#outstorageForm select[name='settlementCurrencyOut']").append(option);
        // }
        var optionCompamy = "<option value='" + companyId + "'>" + companyName + "</option>";
        //库存组织
        // $("#outstorageFormQt select[name='inventoryGroupOut']").html(optionCompamy);
        //领用组织
        $("#outstorageFormXs select[name='receiveGroupOut']").html(optionCompamy);
        $("#outstorageFormQt select[name='receiveGroupOut']").html(optionCompamy);
        //销售组织
        $("#outstorageFormXs select[name='marketGroupOut']").html(optionCompamy);
        $("#outstorageFormQt select[name='marketGroupOut']").html(optionCompamy);
        //发货组织
        $("#outstorageFormXs select[name='shipmentGroupOut']").html(optionCompamy);
        $("#outstorageFormQt select[name='shipmentGroupOut']").html(optionCompamy);
        //货主类型
        $("#outstorageFormXs select[name='shipperTypeOut']").html("<option value='0'>业务组织</option>");
        $("#outstorageFormQt select[name='shipperTypeOut']").html("<option value='0'>业务组织</option>");
        //货主
        $("#outstorageFormXs select[name='shipperOut']").html(optionCompamy);
        $("#outstorageFormQt select[name='shipperOut']").html(optionCompamy);
        /*  //客户
          loadProvider(2);
          for (var p in dataProvider) {
              //子公司
              var option = "<option value='"+ p + "'>" + dataProvider[p].companyName + "</option>";
              $("#outstorageFormXs select[name='clientOut']").append(option);
              $("#outstorageFormQt select[name='clientOut']").append(option);
          }*/
        form.render("select", "outstorageFormXs");
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

    //加载公司的客户
    function loadCust() {
        var url = storeHost + "/manage/customer/listCustomerNoPage";
        $.post(url, {
            companyId: "${currentUser.companyId!}",
            companyType: "${currentUser.companyType!}"
        }, function (res) {
            if (res.responseStatusType.message == "Success") {
                var custList = res.result;
                for (var p in custList) {
                    var option = "<option value='" + custList[p].k3Number + "'>" + custList[p].name + "</option>";
                    $(".demoTable select[name='cust']").append(option);
                }
                layui.form.render();
            }
        })
    }

    //加载商品
    function loadProduct(name, type) {
        var param = {
            companyType: companyType,
            companyId: companyId,
            type: type,
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
                        if (type == 1) {
                            if (productT[p].productSubordinate == "0") {
                                product.push(productT[p]);
                            }
                        } else {
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

    //加载仓库状态
    function loadStockStatus() {
        dataStockStatus = [];
        $.ajax({
            url: productHost + "/stockStatus/selectStockStatusList",
            // data: param,
            method: "POST",
            async: false,
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    dataStockStatus = res.result;
                }
            }
        });
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

    /*//加载供应商（业务组织）
    function loadProvider(id) {
        dataProvider = [];
        if (id == 1) {  //第三方供应商
            $.ajax({
                url: storeHost + "/manage/supplier/listSupplier",
                data: {supplierCategoryId: id},
                method: "POST",
                async: false,
                success: function (res) {
                    if (res.responseStatusType.message == "Success") {
                        dataProvider = res.result.list;
                    }
                }
            });
        }
        if (id == 2) {  //业务组织（公司，子公司，分公司）
            //请求全部子公司和分公司
            $.ajax({
                url: storeHost + "/manage/store/selectCompanyAndStoreNoPage",
                data: {companyId: companyId, companyType: companyType},
                method: "POST",
                async: false,
                success: function (res) {
                    if (res.responseStatusType.message == "Success") {
                        dataProvider = res.result;
                    }
                }
            });
        }
    }*/

    //修改商品出库价
    function updatePriductOutstoragePrice(type, code, price, inprice) {
        if (type == 1) {  //商品
            $.ajax({
                url: productHost + "/manage/product/calculation",
                method: "POST",
                async: true,
                data: {
                    productCode: code,
                    outstoragePrice: price,
                    instoragePrice: inprice,
                    type: type
                },
                success: function (res) {
                    if (res.responseStatusType.message == "Success") {
                        layer.msg("商品出库价修改成功！" + res.result);
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
                    outstoragePrice: price,
                    outstorageProfit: outstorageProfit,
                    type: type
                },
                success: function (res) {
                    if (res.responseStatusType.message == "Success") {
                        layer.msg("商品出库价修改成功！" + res.result);
                    }
                }
            });
        }
    }

    //加载客户-其他出库、销售出库
    function loadCustomerQt(form) {
        //加载店铺列表信息
        var url = storeHost + "/manage/customer/listCustomerNoPage";
        var data = {"companyId": "${currentUser.companyId!}", "companyType": "${currentUser.companyType!}"};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据

                //其他出库
                var server = document.getElementById("clientOutQt"); //server为select定义的id
                server.innerHTML = "<option value='' selected='selected'>请选择</option>";
                for (var p in list) {
                    if (list[p].isDefaultCust != 1) {
                        var option = document.createElement("option");  // 创建添加option属性
                        option.setAttribute("value", list[p].k3Number); // 给option的value添加值
                        option.innerText = list[p].name;     // 打印option对应的纯文本
                        server.appendChild(option);           //给select添加option子标签
                    }
                }

                //销售出库
                var server = document.getElementById("clientOutXs"); //server为select定义的id
                server.innerHTML = "<option value='' selected='selected'>请选择</option>";
                for (var p in list) {
                    if (list[p].isDefaultCust != 1) {
                        var option = document.createElement("option");  // 创建添加option属性
                        option.setAttribute("value", list[p].k3Number); // 给option的value添加值
                        option.innerText = list[p].name;     // 打印option对应的纯文本
                        server.appendChild(option);           //给select添加option子标签
                    }
                }
                form.render();
            } else {

            }
        })
    }


</script>

</body>
</html>