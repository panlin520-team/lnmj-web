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
    <#include "../baseFtl/pageAuth.ftl" />
    <style>
        .resetLabel {
            width: 56px;
        }

        label.xrequired:before {
            content: '* ';
            color: red;
        }

    </style>
</head>
<body>


<div class="layui-fluid">
    <div class="demoTable layui-form">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label resetLabel">所属分类</label>
                <div class="layui-input-inline">
                    <select id="supplierCategoryIdSearch" name="supplierCategoryId" lay-filter="supplierCategoryId">
                    </select>
                </div>
                <label class="layui-form-label">电话</label>
                <div class="layui-input-inline">
                    <input class="layui-input" type="text" name="keyWordPhone" autocomplete="off" placeholder="输入电话">
                </div>
                <label class="layui-form-label">名称</label>
                <div class="layui-input-inline">
                    <input class="layui-input" type="text" name="keyWordName" autocomplete="off" placeholder="输入名称">
                </div>
            </div>

            <div class="layui-inline">
                <button class="layui-btn" data-type="search"><i class="layui-icon layui-icon-search"></i></button>
            </div>
            <div class="layui-inline">
                <div class="layui-btn-group demoTable">
                    <button class="layui-btn" id="add">增加</button>
                </div>
            </div>
        </div>
    </div>
    <table id="supplier" lay-filter="demo"></table>

</div>


<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="allocation">批量分配</button>
        <button class="layui-btn layui-btn-sm" lay-event="cancelAllocation">批量取消分配</button>
    </div>
</script>
<script type="text/html" id="toolbarDemo2">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="allocation2" id="allocation2">批量分配</button>
        <button class="layui-btn layui-btn-sm" lay-event="cancelAllocation2" id="cancelAllocation2">批量取消分配</button>
    </div>
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit" id="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del" id="del">删除</a>
</script>




<#--添加-->
<div class="layui-fluid" id="addeditformdivid" hidden="" style="margin: 15px;">
    <form class="layui-form layui-form-pane layui-personal" action="" id="addeditformid">
        <div class="layui-form-item">
            <label class="layui-form-label xrequired">供应商名称</label>
            <div class="layui-input-block" style="width:220px;">
                <input type="text" name="supplierName" lay-verify="required" autocomplete="off"
                       placeholder="请输入供应商名称"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">供应商简称</label>
            <div class="layui-input-block" style="width:220px;">
                <input type="text" name="shortName" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入供应商简称"
                       class="layui-input">
            </div>

        </div>


        <div class="layui-form-item">
            <label class="layui-form-label xrequired">所属供应商分类</label>
            <div class="layui-input-inline">
                <input name="supplierCategoryIdAddShow" id="supplierCategoryIdAddShow" readonly="readonly" type="text"
                       autocomplete="off" placeholder="请输入供应商分类" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;" lay-verify="required">
                <input name="supplierCategoryId" id="supplierCategoryIdAdd" hidden="true" type="text">
                <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachSupplierCategoryIdAdd"><i
                        class="layui-icon layui-icon-search"></i></button>

            </div>
        </div>



        <div class="layui-form-item">
            <label class="layui-form-label xrequired">选择K3数据中心</label>
            <div class="layui-input-block" style="width: 220px">
                <select id="parentCompanyAdd" name="companyID" lay-verify="required"
                        lay-filter="parentCompanyAdd">
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">开户行</label>
            <div class="layui-input-block" style="width:220px;">
                <input type="text" name="bankDeposit" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入开户行"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">银行卡号</label>
            <div class="layui-input-block" style="width:220px;">
                <input type="text" name="creditCardNum" <#--lay-verify="required|number"--> autocomplete="off"
                       placeholder="请输入银行卡号"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label xrequired">联系人</label>
            <div class="layui-input-block" style="width:220px;">
                <input type="text" name="linkMan" lay-verify="required" autocomplete="off" placeholder="请输入联系人"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label xrequired">联系人电话</label>
            <div class="layui-input-block" style="width:220px;">
                <input type="text" name="linkPhone" lay-verify="required|phone" autocomplete="off"
                       placeholder="请输入联系人电话"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label xrequired">地址</label>
            <div class="layui-input-block" style="width:220px;">
                <input type="text" name="address" lay-verify="required" autocomplete="off" placeholder="请输入地址"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="addeditsubmitfilter">立即提交</button>
                <button id="reset" type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

<#--修改-->
<form class="layui-form layui-form-pane layui-personal" id="editForm" action="" lay-filter="exampleEdit" method="post"
      hidden="true">

    <div class="layui-form-item" hidden="hidden">
        <label class="layui-form-label">供应商id</label>
        <div class="layui-input-block" style="width:220px;">
            <input type="text" name="supplierId" lay-verify="required" autocomplete="off" placeholder=""
                   class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label xrequired">供应商名称</label>
        <div class="layui-input-block" style="width:220px;">
            <input type="text" name="supplierName" lay-verify="required" autocomplete="off"
                   placeholder="请输入供应商名称"
                   class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">供应商简称</label>
        <div class="layui-input-block" style="width:220px;">
            <input type="text" name="shortName" <#--lay-verify="required"--> autocomplete="off" placeholder="请输入供应商简称"
                   class="layui-input">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label xrequired">所属供应商分类</label>
        <div class="layui-input-inline">
            <input name="supplierCategoryIdEditShow" id="supplierCategoryIdEditShow" readonly="readonly" type="text"
                   autocomplete="off" placeholder="请输入供应商分类" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;" lay-verify="required">
            <input name="supplierCategoryId" id="supplierCategoryIdEdit" hidden="true" type="text">
            <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachSupplierCategoryIdEdit"><i
                    class="layui-icon layui-icon-search"></i></button>

        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">开户行</label>
        <div class="layui-input-block" style="width:220px;">
            <input type="text" name="bankDeposit" <#--lay-verify="required"--> autocomplete="off" placeholder="请输入开户行"
                   class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">银行卡号</label>
        <div class="layui-input-block" style="width:220px;">
            <input type="text" name="creditCardNum" <#--lay-verify="required"--> autocomplete="off"
                   placeholder="请输入银行卡号"
                   class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label xrequired">联系人</label>
        <div class="layui-input-block" style="width:220px;">
            <input type="text" name="linkMan" lay-verify="required" autocomplete="off" placeholder="请输入联系人"
                   class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label xrequired">联系人电话</label>
        <div class="layui-input-block" style="width:220px;">
            <input type="text" name="linkPhone" lay-verify="required" autocomplete="off" placeholder="请输入联系人电话"
                   class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">地址</label>
        <div class="layui-input-block" style="width:220px;">
            <input type="text" name="address" <#--lay-verify="required"--> autocomplete="off" placeholder="请输入地址"
                   class="layui-input">
        </div>
    </div>
</form>

<#--查看-->
<form class="layui-form layui-form-pane layui-personal" id="showForm" action="" lay-filter="exampleShowForm"
      method="post" hidden="true">
    <div class="layui-form-item">
        <label class="layui-form-label">供应商编号</label>
        <span name="supplierCode"></span>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">供应商名称</label>
        <span name="supplierName"></span>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">供应商简称</label>
        <span name="shortName"></span>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">所属分类</label>
        <span name="supplierCategoryName"></span>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">开户行</label>
        <span name="bankDeposit"></span>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">银行卡号</label>
        <span name="creditCardNum"></span>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">联系人</label>
        <span name="linkMan"></span>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">联系人电话</label>
        <span name="linkPhone"></span>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">地址</label>
        <span name="address"></span>
    </div>
</form>
<#--供应商分配中选择分配组织类型-->
<div id="chooseCompanyType" hidden="" class="layui-fluid layui-form-pane layui-personal" style="margin: 15px;">
    <form class="layui-form" action="" id="chooseCompanyTypeformid" lay-filter="exampleEdit">
        <div class="layui-form-item">
            <label class="layui-form-label">选择公司类型</label>
            <div class="layui-input-block">
                <input type="radio" name="companyType" value="1" title="子公司" checked="" lay-filter="userType" id="zhi">
                <input type="radio" name="companyType" value="2" title="分公司" lay-filter="userType" id="fen">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="chooseCompanyTypeConfir">确认</button>
            </div>
        </div>

    </form>
</div>
<#--查看公司表格-->
<form class="layui-form" id="companyForm" action="" lay-filter="exampleCompany" method="post" hidden="true">
    <div class="demoTable layui-form">
        <div class="layui-form-item">
            <div class="layui-inline">
                <div class="layui-input-inline">
                    <input type="text" autocomplete="off" class="layui-input" placeholder="请输入关键字查询" id="word">
                </div>
                <div class="layui-inline">
                    <button class="layui-btn" data-type="search" type="button" id="searchwordcompany"><i
                            class="layui-icon layui-icon-search"></i></button>
                </div>
            </div>
        </div>
        <table id="companyTable" lay-filter="companyTable"></table>
    </div>
</form>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<#include "../baseFtl/loadLinkData.ftl" />
<script>
    //列表显示
    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#supplier'
            , url: storeHost + "/manage/supplier/listSupplier"
            , id: "supplierReload"
            , toolbar: '#toolbarDemo'
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
            , where: {
                companyId: "${currentUser.companyId!}",
                companyType: "${currentUser.companyType!}"
            }
            , cols: [[
                {type: 'checkbox', fixed: 'left', width: 40}
                , {field: 'supplierId', title: '供应商id', sort: true, fixed: 'left'}
                , {field: 'supplierCode', title: '供应商编号'}
                , {field: 'supplierName', title: '供应商名称'}
                , {field: 'supplierCategoryName', title: '供应商所属分类'}
                , {
                    field: 'supplierType', title: '供应商类别', templet: function (d) {
                        var supplierTypeName = "";
                            if (d.supplierType == 1) {
                                supplierTypeName = "组织供应商"
                            }else{
                                supplierTypeName = "其他供应商"
                            }

                        return supplierTypeName;
                    }
                }
                , {fixed: 'right', title: '操作', align: 'center', toolbar: '#barDemo'}

            ]]
            , done: function (res, curr, count) {
                for (var i = 0; i < res.data.length; i++) {
                    if (res.data[i].supplierType == 1) {//如果此行已经审核过了
                        $("tbody tr:eq(" + i + ")").children().find("#edit").css("display", "none")
                        $("tbody tr:eq(" + i + ")").children().find("#del").css("display", "none")
                    }
                }
            }
        });

        //头工具栏事件-批量审核
        table.on('toolbar(demo)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id);
            switch (obj.event) {
                case 'allocation':
                    var data = checkStatus.data;
                    if (data.length === 0) {
                        layer.alert("请选中充值项");
                        break;
                    }
                    openCompanySelect(data, table,1)
                    break;
                case 'cancelAllocation':
                    var data = checkStatus.data;
                    if (data.length === 0) {
                        layer.alert("请选中充值项");
                        break;
                    }
                    openCompanySelect(data, table,2)
                    break;
            }
            ;
        });
    });

    //增删改查操作实现
    var layerid;//当前弹层id;这个id可以定义多个，主要的目的是为了在回调函数关闭弹层时使用的
    var element;
    layui.use(['table', 'layer', 'jquery', 'form','element'], function () {
        var table = layui.table,
            layer = layui.layer,
            $ = layui.jquery,
            form = layui.form,
            element = layui.element;
        loadSupplierCategorySearch(form);
        loadCompanyAdd(form)
        //监听确认-打开公司列表
        form.on('submit(chooseCompanyTypeConfir)', function (data) {
            var url = null;
            var subCompanyOrStore = null;
            if ($('input[name="companyType"]:checked').val() === "1") {
                // 如果是子公司
                url = storeHost + "/manage/company/selectSubsidiaryList";
                subCompanyOrStore = 1;
            } else if ($('input[name="companyType"]:checked').val() === "2") {
                //如果是分公司
                url = storeHost + "/manage/store/selectStoreList";
                subCompanyOrStore = 2;
            }
            var a3 = layer.open({
                type: 1,
                title: '公司列表',
                content: $('#companyForm'),
                area: ['904px', '500px'],
                id: "companyFormReload",
                closeBtn: 1,
                btn: ['关闭'],
                btn2: function () {
                    layer.close(a3)
                },
                success: function (layero) {
                    layui.use('table', function () {
                        var table = layui.table;
                        table.render({
                            elem: '#companyTable'
                            , url: url
                            , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                            , page: true          //显示分页默认不显示
                            , method: 'post'
                            , id: "companyTableRelod"
                            , toolbar: '#toolbarDemo2'
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
                            , where: {
                                companyId: "${currentUser.companyId!}",
                                companyType: "${currentUser.companyType!}"
                            }
                            , cols: [[
                                {type: 'checkbox', fixed: 'left', width: 40}
                                , {field: 'orgId', title: '组织Id', fixed: 'left'}
                                , {field: 'orgK3Number', title: '组织k3编号', fixed: 'left'}
                                , {field: 'orgName', title: '组织名称', fixed: 'left'}
                            ]]
                            , done: function (res, curr, count) {
                                if ($("#chooseCompanyType").attr("data-type")=="1"){
                                    $("#allocation2").attr("style", "display:block;"); //显示
                                    $("#cancelAllocation2").attr("style", "display:none;");  //隐藏
                                } else {
                                    $("#cancelAllocation2").attr("style", "display:block;"); //显示
                                    $("#allocation2").attr("style", "display:none;");  //隐藏
                                }
                            }
                        });
                        //头工具栏事件-批量分配
                        table.on('toolbar(companyTable)', function (obj) {
                            var checkStatus = table.checkStatus(obj.config.id);
                            switch (obj.event) {
                                case 'allocation2':
                                    var data = checkStatus.data;
                                    if (data.length === 0) {
                                        alert("请选中充值项");
                                        break;
                                    }
                                    if (subCompanyOrStore == 1) {
                                        batchAllocationZhi($("#chooseCompanyType").attr("data-supplierArrayStr"), data, layer, table);
                                    } else if (subCompanyOrStore == 2) {
                                        batchAllocationFen($("#chooseCompanyType").attr("data-supplierArrayStr"), data, layer, table);
                                    }

                                    break;
                                case 'cancelAllocation2':
                                    var data = checkStatus.data;
                                    if (data.length === 0) {
                                        alert("请选中充值项");
                                        return;
                                        break;
                                    }
                                    if (subCompanyOrStore == 1) {
                                        batchCancelAllocationZhi($("#chooseCompanyType").attr("data-supplierArrayStr"), data, layer, table);
                                    } else if (subCompanyOrStore == 2) {
                                        batchCancelAllocationFen($("#chooseCompanyType").attr("data-supplierArrayStr"), data, layer, table);
                                    }
                                    break;
                            }
                            ;
                            return
                        });

                    })
                }
            });
            return false
        });
        //监听表格复选框选择
        table.on('checkbox(demo)', function (obj) {
        });

        /*------供应商分类关联数据查看-添加------*/
        $("#" + "serachSupplierCategoryIdAdd").click(function () {
            var url = storeHost + "/manage/supplier/listSupplierCategory";
            var param = {companyId: "${currentUser.companyId!}", companyType: "${currentUser.companyType!}"};123
            loadLinkData(layer, layui, url, "supplierCategoryId", "supplierCategoryName", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "supplierCategoryIdAddShow").val(data.supplierCategoryName);
                $("#" + "supplierCategoryIdAdd").val(data.supplierCategoryId);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {keyWordName: wordSearch,companyId: "${currentUser.companyId!}", companyType: "${currentUser.companyType!}"}
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

        /*------供应商分类关联数据查看-修改------*/
        $("#" + "serachSupplierCategoryIdEdit").click(function () {
            var url = storeHost + "/manage/supplier/listSupplierCategory";
            var param = {companyId: "${currentUser.companyId!}", companyType: "${currentUser.companyType!}"};123
            loadLinkData(layer, layui, url, "supplierCategoryId", "supplierCategoryName", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "supplierCategoryIdEditShow").val(data.supplierCategoryName);
                $("#" + "supplierCategoryIdEdit").val(data.supplierCategoryId);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {keyWordName: wordSearch,companyId: "${currentUser.companyId!}", companyType: "${currentUser.companyType!}"}
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

        //监听工具条
        table.on('tool(demo)', function (obj) {
            var data = obj.data;
            if (obj.event === 'detail') {
                layerShow(form, data, table, $)
            } else if (obj.event === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    layerDelete(data, table, $);
                    obj.del();
                    layer.close(index);
                });
            } else if (obj.event === 'edit') {
                layerShowAndEdit(form, data, table, $);
            }
        });


        //监听添加提交
        form.on('submit(addeditsubmitfilter)', function (data) {
            //为了防止form中的id值被重置后置空,将编辑的id存放在label中
            $("#editid").val($("#editlabelid").html());
            $("#editlabelid").html("");
            var index = null
            $.ajax({
                type: "POST",
                url: storeHost + "/manage/supplier/addSupplier",
                data: $('#addeditformid').serialize() + "&createOperator=" + "${currentUser.trueName!}"+"&orgK3Number="+"${currentUser.orgK3Number!}"+"&companyType="+"${currentUser.companyType!}"+"&companyId="+"${currentUser.companyId!}",
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
                            title: '操作成功'
                            , content: '操作成功！'+data.result
                            , btn: ["关闭"],
                            yes: function (index) {
                                layer.close(index); //如果设定了yes回调，需进行手工关闭
                                layer.close(layerid);
                                $("#reset").click();//重置表单
                            }
                        });
                        //重新加载表格
                        table.reload("supplierReload");
                    }
                }
            });
            return false;
        });

        //搜索
        var $ = layui.$, active = {
            search: function () {
                var keyWordName = $(".demoTable input[name='keyWordName']").val();
                var keyWordPhone = $(".demoTable input[name='keyWordPhone']").val();
                var supplierCategoryId = $(".demoTable select[name='supplierCategoryId'] option:selected").val() === "0" ? null : $(".demoTable select[name='supplierCategoryId'] option:selected").val();
                table.render({
                    elem: '#supplier'
                    , url: storeHost + "/manage/supplier/listSupplier"
                    , id: "supplierReload"
                    , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    , page: true          //显示分页默认不显示
                    , method: 'post'
                    , toolbar: '#toolbarDemo'
                    , request: {
                        pageName: 'pageNum', //页码的参数名称，默认：page
                        limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    }
                    , where: {
                        keyWordPhone: keyWordPhone,
                        keyWordName: keyWordName,
                        supplierCategoryId: supplierCategoryId,
                        companyId: "${currentUser.companyId!}",
                        companyType: "${currentUser.companyType!}"
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
                        , {field: 'supplierId', title: '供应商id', sort: true, fixed: 'left'}
                        , {field: 'supplierCode', title: '供应商编号'}
                        , {field: 'supplierName', title: '供应商名称'}
                        , {field: 'supplierCategoryName', title: '供应商所属分类'}
                        , {fixed: 'right', title: '操作', align: 'center', toolbar: '#barDemo'}

                    ]]
                });
            }
            , add: function () {

            }
        };

        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    });


    //添加按钮点击事件
    $("#add").click(function () {
        $("#reset").click();//重置表单(新建时在进入表单前要重置一下表单的内容，不然表单打开后会显示上一次的表单的内容。这里调用表单中重置按钮的点击方法来重置)
        layerid = layer.open({//开启表单弹层
            // // skin: 'layui-layer-molv',
            area: '60%',
            type: 1,
            title: '新建供应商',
            content: $('#addeditformdivid'), //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
            success: function () {

            }

        });
    });

    //删除按钮事件
    function layerDelete(data, table, $) {
        //删除数据库数据
        var url = storeHost + "/manage/supplier/deleteSupplier";
        var data = {
            supplierId: data.supplierId,
            supplierCode: data.supplierCode,
            modifyOperator: "${currentUser.trueName!}"
        };

        $.ajax({
            url: url,
            data: data,
            method: "POST",
            async: true,
            success:function (res) {
                if (res.responseStatusType.message == "Success") {
                    layer.open({
                        title: '删除'
                        , content: '删除成功！'+res.result
                    });
                    //重新加载表格
                    table.reload("supplierReload");

                } else {
                    layer.alert(res.responseStatusType.error.errorMsg);
                    //重新加载表格
                    table.reload("supplierReload");
                }
            }
        });
    }

    //修改按钮事件
    function layerShowAndEdit(form, data, table, $) {
        //页面弹框
        var a1 = layer.open({
            type: 1,
            title: '供应商修改',
            content: $('#editForm'),
            area: ['900px'],
            closeBtn: 1,
            btn: ['提交', '取消'],
            yes: function (index, layero) {
                form.on('submit(formVerify)', function (data) {
                    var url = storeHost + "/manage/supplier/updateSupplier";
                    var supplierCategoryId = layero.find("input[id='supplierCategoryIdEdit']").val();
                    var params = {
                        supplierId: layero.find("input[name='supplierId']").val(),
                        supplierName: layero.find("input[name='supplierName']").val(),
                        shortName: layero.find("input[name='shortName']").val(),
                        supplierCategoryId: supplierCategoryId,
                        bankDeposit: layero.find("input[name='bankDeposit']").val(),
                        creditCardNum: layero.find("input[name='creditCardNum']").val(),
                        linkMan: layero.find("input[name='linkMan']").val(),
                        linkPhone: layero.find("input[name='linkPhone']").val(),
                        address: layero.find("input[name='address']").val(),
                        modifyOperator: "${currentUser.trueName!}"
                    };
                    $.post(url, params, function (res) {
                        if (res.responseStatusType.message == "Success") {
                            layer.open({
                                title: '修改'
                                , content: res.result
                                , btn: ["关闭"]
                                , yes: function (index) {
                                    layer.close(index); //如果设定了yes回调，需进行手工关闭
                                    layer.close(a1);
                                }
                            });
                            //重新加载表格
                            table.reload("supplierReload");
                        } else {
                            layer.msg(res.responseStatusType.error.errorMsg, {
                                time: 20000, //20s后自动关闭
                                btn: ['明白了']
                            });
                        }
                    })
                })
            },
            btn2: function () {
                layer.closeAll();
            },
            success: function (layero) {
                layero.addClass('layui-form');
                layero.find('.layui-layer-btn0').attr('lay-filter', 'formVerify').attr('lay-submit', '');
                form.render();
                //表单初始赋值
                form.val('exampleEdit', {
                    "supplierId": data.supplierId
                    , "supplierName": data.supplierName
                    , "shortName": data.shortName
                    , "supplierCategoryIdEdit": data.supplierCategoryId
                    , "supplierCategoryIdEditShow": data.supplierCategoryName
                    , "bankDeposit": data.bankDeposit
                    , "creditCardNum": data.creditCardNum
                    , "linkMan": data.linkMan
                    , "linkPhone": data.linkPhone
                    , "address": data.address
                });
                form.render();
            }, end: function () {
                window.location.reload();
            }

        });
    }

    //查看按钮事件
    function layerShow(form, data, table, $) {
        //页面弹框
        var a2 = layer.open({
            type: 1,
            title: '供应商详情',
            content: $('#showForm'),
            area: ['900px'],
            closeBtn: 1,
            btn: ['关闭'],
            btn2: function () {
                layer.close(a2)
            },
            success: function (layero) {
                //初始赋值
                layero.find("span[name='supplierCode']").text(data.supplierCode);
                layero.find("span[name='supplierName']").text(data.supplierName);
                layero.find("span[name='shortName']").text(data.shortName);
                layero.find("span[name='supplierCategoryName']").text(data.supplierCategoryName);
                layero.find("span[name='bankDeposit']").text(data.bankDeposit);
                layero.find("span[name='creditCardNum']").text(data.creditCardNum);
                layero.find("span[name='linkMan']").text(data.linkMan);
                layero.find("span[name='linkPhone']").text(data.linkPhone);
                layero.find("span[name='address']").text(data.address);
                form.render();
            }, end: function () {
                window.location.reload();
            }

        });
    }

    //加载供应商分类列表--搜索
    function loadSupplierCategorySearch(form) {
        var url = storeHost + "/manage/supplier/listSupplierCategoryNoPage";
        var data = {companyId: "${currentUser.companyId!}", companyType: "${currentUser.companyType!}"};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("supplierCategoryIdSearch"); //server为select定义的id
                server.innerHTML = "<option value='0' selected='true'>请选择</option>";
                for (var p in list) {
                    var option = document.createElement("option");  // 创建添加option属性
                    option.setAttribute("value", list[p].supplierCategoryId); // 给option的value添加值
                    option.innerText = list[p].supplierCategoryName;     // 打印option对应的纯文本
                    server.appendChild(option);           //给select添加option子标签
                }
                form.render();
            } else {

            }
        })
    }




    //加载总公司信息-添加
    function loadCompanyAdd(form) {
        //加载店铺列表信息
        var url = storeHost + "/manage/company/selectCompanyListNoPage";
        var data = {};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("parentCompanyAdd"); //server为select定义的id
                server.innerHTML = "<option value='' selected='selected'>请选择</option>";
                for (var p in list) {
                    var option = document.createElement("option");  // 创建添加option属性
                    option.setAttribute("value", list[p].companyId); // 给option的value添加值
                    option.innerText = list[p].companyName;     // 打印option对应的纯文本
                    server.appendChild(option);           //给select添加option子标签
                }
                form.render();
            } else {

            }
        })
    }

 /*   //公司选项
    function openCompanySelect(data, table,type) {
        layerid = layer.open({//开启表单弹层
            // skin: 'layui-layer-molv',
            area: '60%',
            type: 1,
            title: '选择公司类型',
            content: $('#chooseCompanyType'), //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
            success: function (layero) {
                $("#chooseCompanyType").attr("data-supplierArrayStr", JSON.stringify(data))
                $("#chooseCompanyType").attr("data-type", type)
                if("${currentUser.companyType!}" === "2"){
                    //如果是子公司，只显示分公司选项
                    /!*$('#zhi').attr("disabled", "disabled");*!/
                    $('#zhi').css("display", "none");
                }
            }
        });
    }*/

    //供应商分配物料-子公司
    function batchAllocationZhi(dataSupplierArrayStr, dataCompanyArrayStr, layer, table) {
        var dataSupplierArrayStr1 = [];
        var dataCompanyArrayStr1 = [];
        for (var i = 0; i < $.parseJSON(dataSupplierArrayStr).length; i++) {
            var a = {
                "supplierId": $.parseJSON(dataSupplierArrayStr)[i].supplierId,
                "supplierName": $.parseJSON(dataSupplierArrayStr)[i].supplierName,
                "supplierK3Id": $.parseJSON(dataSupplierArrayStr)[i].k3Id
            };
            dataSupplierArrayStr1.push(a);
        }
        for (var i = 0; i < dataCompanyArrayStr.length; i++) {
            var b = {
                "orgId": dataCompanyArrayStr[i].orgId,
                "orgK3Number": dataCompanyArrayStr[i].orgK3Number,
                "orgName": dataCompanyArrayStr[i].orgName,
                "k3Id": dataCompanyArrayStr[i].k3Id
            };
            dataCompanyArrayStr1.push(b);
        }
        var url = storeHost + "/manage/supplier/batchAllocationSubCompany";
        var data = {
            supplierArrayStr: JSON.stringify(dataSupplierArrayStr1),
            subcompanyIdArrayStr: JSON.stringify(dataCompanyArrayStr1),
            companyId: "${currentUser.companyId!}",
            companyType:"${currentUser.companyType!}"
        };

        //分配请求
        var index = null;
        $.ajax({
            url: url,
            data: data,
            async: false,
            type: "POST",
            beforeSend: function () {
                index = layer.load(3, {
                    shade: [0.9, '#fff'] //0.1透明度的白色背景
                });
            },
            error: function (request) {
                layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
                layer.close(index);    //返回数据关闭loading
            },
            success: function (res) {
                layer.close(index);    //返回数据关闭loading
                if (res.responseStatusType.message === "Success") {
                    layer.open({
                        title: '操作成功'
                        , content: res.result
                        , btn: ["关闭"],
                        yes: function (index) {
                            layer.close(index); //如果设定了yes回调，需进行手工关闭
                            layer.closeAll();
                        }
                    });
                    //重新加载表格
                    table.reload("companyTableRelod");
                } else {
                    alert(res.responseStatusType.error.errorMsg)
                    return;
                }
            }
        });
    }


    //供应商分配物料-分公司
    function batchAllocationFen(dataSupplierArrayStr, dataCompanyArrayStr, layer, table) {
        var dataSupplierArrayStr1 = [];
        var dataCompanyArrayStr1 = [];
        for (var i = 0; i < $.parseJSON(dataSupplierArrayStr).length; i++) {
            var a = {
                "supplierId": $.parseJSON(dataSupplierArrayStr)[i].supplierId,
                "supplierName": $.parseJSON(dataSupplierArrayStr)[i].supplierName,
                "supplierK3Id": $.parseJSON(dataSupplierArrayStr)[i].k3Id
            }
            dataSupplierArrayStr1.push(a);
        }
        for (var i = 0; i < dataCompanyArrayStr.length; i++) {
            var b = {
                "orgId": dataCompanyArrayStr[i].orgId,
                "orgK3Number": dataCompanyArrayStr[i].orgK3Number,
                "orgName": dataCompanyArrayStr[i].orgName,
                "k3Id": dataCompanyArrayStr[i].k3Id
            }
            dataCompanyArrayStr1.push(b);
        }
        var url = storeHost + "/manage/supplier/batchAllocationStore";
        var data = {
            supplierArrayStr: JSON.stringify(dataSupplierArrayStr1),
            storeIdArrayStr: JSON.stringify(dataCompanyArrayStr1),
            companyId: "${currentUser.companyId!}",
            companyType:"${currentUser.companyType!}"
        };

        //分配请求
        var index = null
        $.ajax({
            url: url,
            data: data,
            async: false,
            type: "POST",
            beforeSend: function () {
                index = layer.load(3, {
                    shade: [0.9, '#fff'] //0.1透明度的白色背景
                });
            },
            error: function (request) {
                layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
                layer.close(index);    //返回数据关闭loading
            },
            success: function (res) {
                layer.close(index);    //返回数据关闭loading
                if (res.responseStatusType.message === "Success") {
                    layer.open({
                        title: '操作成功'
                        , content: res.result
                        , btn: ["关闭"],
                        yes: function (index) {
                            layer.close(index); //如果设定了yes回调，需进行手工关闭
                            layer.closeAll();
                        }
                    });
                    //重新加载表格
                    table.reload("companyTableRelod");
                } else {
                    alert(res.responseStatusType.error.errorMsg)
                    return;
                }
            }
        });
    }

    //供应商取消分配物料-子公司
    function batchCancelAllocationZhi(dataSupplierArrayStr, dataCompanyArrayStr, layer, table) {
        var dataSupplierArrayStr1 = [];
        var dataCompanyArrayStr1 = [];
        for (var i = 0; i < $.parseJSON(dataSupplierArrayStr).length; i++) {
            var a = {
                "supplierId": $.parseJSON(dataSupplierArrayStr)[i].supplierId,
                "supplierName": $.parseJSON(dataSupplierArrayStr)[i].supplierName,
                "supplierK3Id": $.parseJSON(dataSupplierArrayStr)[i].k3Id
            }
            dataSupplierArrayStr1.push(a);
        }
        for (var i = 0; i < dataCompanyArrayStr.length; i++) {
            var b = {
                "orgId": dataCompanyArrayStr[i].orgId,
                "orgK3Number": dataCompanyArrayStr[i].orgK3Number,
                "orgName": dataCompanyArrayStr[i].orgName,
                "k3Id": dataCompanyArrayStr[i].k3Id
            };
            dataCompanyArrayStr1.push(b);
        }
        var url = storeHost + "/manage/supplier/batchCancelAllocationSubCompany";
        var data = {
            supplierArrayStr: JSON.stringify(dataSupplierArrayStr1),
            subcompanyIdArrayStr: JSON.stringify(dataCompanyArrayStr1),
            companyId: "${currentUser.companyId!}",
            companyType:"${currentUser.companyType!}"
        };

        //分配请求
        $.ajax({
            url: url,
            data: data,
            async: false,
            type: "POST",
            success: function (res) {
                if (res.responseStatusType.message === "Success") {
                    layer.open({
                        title: '操作成功'
                        , content: res.result
                        , btn: ["关闭"],
                        yes: function (index) {
                            layer.close(index); //如果设定了yes回调，需进行手工关闭
                            layer.closeAll();
                        }
                    });
                    //重新加载表格
                    table.reload("companyTableRelod");
                } else {
                    alert(res.responseStatusType.error.errorMsg)
                    return;
                }
            }
        });
    }


    //供应商取消分配物料-分公司
    function batchCancelAllocationFen(dataSupplierArrayStr, dataCompanyArrayStr, layer, table) {
        var dataSupplierArrayStr1 = [];
        var dataCompanyArrayStr1 = [];
        for (var i = 0; i < $.parseJSON(dataSupplierArrayStr).length; i++) {
            var a = {
                "supplierId": $.parseJSON(dataSupplierArrayStr)[i].supplierId,
                "supplierName": $.parseJSON(dataSupplierArrayStr)[i].supplierName,
                "supplierK3Id": $.parseJSON(dataSupplierArrayStr)[i].k3Id
            }
            dataSupplierArrayStr1.push(a);
        }
        for (var i = 0; i < dataCompanyArrayStr.length; i++) {
            var b = {
                "orgId": dataCompanyArrayStr[i].orgId,
                "orgK3Number": dataCompanyArrayStr[i].orgK3Number,
                "orgName": dataCompanyArrayStr[i].orgName,
                "k3Id": dataCompanyArrayStr[i].k3Id
            }
            dataCompanyArrayStr1.push(b);
        }
        var url = storeHost + "/manage/supplier/batchCancelAllocationStore";
        var data = {
            supplierArrayStr: JSON.stringify(dataSupplierArrayStr1),
            storeIdArrayStr: JSON.stringify(dataCompanyArrayStr1),
            companyId: "${currentUser.companyId!}",
            companyType:"${currentUser.companyType!}"
        };

        //分配请求
        $.ajax({
            url: url,
            data: data,
            async: false,
            type: "POST",
            success: function (res) {
                if (res.responseStatusType.message === "Success") {
                    layer.open({
                        title: '操作成功'
                        , content: res.result
                        , btn: ["关闭"],
                        yes: function (index) {
                            layer.close(index); //如果设定了yes回调，需进行手工关闭
                            layer.closeAll();
                        }
                    });
                    //重新加载表格
                    table.reload("companyTableRelod");
                } else {
                    alert(res.responseStatusType.error.errorMsg)
                    return;
                }
            }
        });
    }

    //公司选项
    function openCompanySelect(data, table,type) {
        layerid = layer.open({//开启表单弹层
            // skin: 'layui-layer-molv',
            area: '60%',
            type: 1,
            title: '选择公司类型',
            content: $('#chooseCompanyType'), //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
            success: function (layero) {
                $("#chooseCompanyType").attr("data-supplierArrayStr", JSON.stringify(data))
                $("#chooseCompanyType").attr("data-type", type)
                if("${currentUser.companyType!}" === "2"){
                    //如果是子公司，只显示分公司选项
                   /* $('#zhi').attr("disabled", "disabled");*/
                    /*$('#zhi').attr("disabled", "");*/
                }
            }
        });
    }
</script>

</body>
</html>