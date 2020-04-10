<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>客户管理</title>
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
                <label class="layui-form-label">名称</label>
                <div class="layui-input-inline">
                    <input class="layui-input" type="text" name="keyWordName" autocomplete="off" placeholder="输入名称">
                </div>
            </div>

            <div class="layui-inline">
                <button class="layui-btn" data-type="search"><i class="layui-icon layui-icon-search"></i></button>
            </div>
          <#--  <div class="layui-inline">
                <div class="layui-btn-group demoTable">
                    <button class="layui-btn" id="add">增加</button>
                </div>
            </div>-->
        </div>
    </div>
    <table id="customer" lay-filter="demo"></table>

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
<#--    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>-->
</script>


<#--添加-->
    <div class="layui-fluid" id="addeditformdivid" hidden="" style="margin: 15px;">
        <form class="layui-form layui-form-pane layui-personal" action="" id="addeditformid">
            <div class="layui-form-item" style="display: flex">
                <label class="layui-form-label xrequired" style="width:210px;">客户名称</label>
                <div class="layui-input-block" style="width:220px; margin-left: 0">
                    <input type="text" name="name" lay-verify="required" autocomplete="off"
                           placeholder="请输入客户名称"
                           class="layui-input" style="width: 283px;">
                </div>
            </div>

            <div class="layui-form-item" style="display: flex">
                <label class="layui-form-label xrequired" style="width: 210px">是否为销售或退货默认客户</label>
                <div class="layui-input-block" style="margin-left:0; width: 283px">
                    <select name="isDefaultCust" lay-filter="isDefaultCust" lay-verify="required">
                        <option value="1">是</option>
                        <option value="0" selected>否</option>
                    </select>
                </div>
            </div>

            <div class="layui-form-item" style="display:flex">
                <label class="layui-form-label xrequired" style="width: 210px">客户类型</label>
                <div class="layui-input-block" style="margin-left:0; width: 283px">
                    <select name="customerType" lay-filter="customerType" lay-verify="required">
                        <#--<option value="1">普通销售客户</option>-->
                        <option value="2">寄售客户</option>
                        <option value="3">内部结算客户</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit="" lay-filter="addeditsubmitfilter">立即提交</button>
                    <button id="reset" type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
    </div>
    </form>
    </div>

<#--修改-->
    <form class="layui-form layui-form-pane layui-personal" id="editForm" action="" lay-filter="exampleEdit"
          method="post"
          hidden="true">

        <div class="layui-form-item" hidden="hidden">
            <label class="layui-form-label">客户id</label>
            <div class="layui-input-block" style="width:220px;">
                <input type="text" name="id" lay-verify="required" autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label xrequired">客户名称</label>
            <div class="layui-input-block" style="width:220px;">
                <input type="text" name="name" lay-verify="required" autocomplete="off"
                       placeholder="请输入客户名称"
                       class="layui-input">
            </div>
        </div>
    </form>

<#--查看-->
<form class="layui-form layui-form-pane layui-personal" id="showForm" action="" lay-filter="exampleShowForm"
      method="post" hidden="true">
    <div class="layui-form-item">
        <label class="layui-form-label">客户名称</label>
        <span name="name"></span>
    </div>
</form>

<#--客户分配中选择分配组织类型-->
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

<script>
    //列表显示
    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#customer'
            , url: storeHost + "/manage/customer/listCustomer"
            , id: "customerReload"
            , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , page: true          //显示分页默认不显示
            , method: 'post'
            /*, toolbar: '#toolbarDemo'*/
            , request: {
                pageName: 'pageNum', //页码的参数名称，默认：page
                limitName: 'pageSize' //每页数据量的参数名，默认：limit
            }
            , where: {
                "companyId": "${currentUser.companyId!}",
                "companyType": "${currentUser.companyType!}"
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
                , {field: 'name', title: '客户名称', sort: true, fixed: 'left'}
                , {field: 'k3Id', title: 'k3Id'}
                , {field: 'k3Number', title: 'k3编号'}
                , {
                    field: 'customerType', title: ' 客户类别', templet: function (d) {
                        var customerTypeName = "";
                        if (d.customerType == 1) {
                            customerTypeName = "普通销售客户"
                        }else if(d.customerType == 2){
                            customerTypeName = "寄售客户"
                        }else if(d.customerType == 3){
                            customerTypeName = "内部结算客户"
                        }

                        return customerTypeName;
                    }
                }
                /*, {field: 'companyName', title: '所属公司名称'}*/
                , {fixed: 'right', title: '操作', align: 'center', toolbar: '#barDemo'}
            ]]
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
    layui.use(['table', 'layer', 'jquery', 'form', 'element'], function () {
        var table = layui.table,
            layer = layui.layer,
            $ = layui.jquery,
            form = layui.form,
            element = layui.element;
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
                                        batchAllocationZhi($("#chooseCompanyType").attr("data-customerArrayStr"), data, layer, table);
                                    } else if (subCompanyOrStore == 2) {
                                        batchAllocationFen($("#chooseCompanyType").attr("data-customerArrayStr"), data, layer, table);
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
                                        batchCancelAllocationZhi($("#chooseCompanyType").attr("data-customerArrayStr"), data, layer, table);
                                    } else if (subCompanyOrStore == 2) {
                                        batchCancelAllocationFen($("#chooseCompanyType").attr("data-customerArrayStr"), data, layer, table);
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
            $.ajax({
                type: "POST",
                url: storeHost + "/manage/customer/insertCustomer",
                data: $('#addeditformid').serialize() + "&createOperator=" + "${currentUser.trueName!}" + "&companyId=" + "${currentUser.companyId!}" + "&companyType=" + "${currentUser.companyType!}",
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
                            title: '操作成功'
                            , content: '操作成功！' + data.result
                            , btn: ["关闭"],
                            yes: function (index) {
                                layer.close(index); //如果设定了yes回调，需进行手工关闭
                                layer.close(layerid);
                                $("#reset").click();//重置表单
                            }
                        });
                        //重新加载表格
                        table.reload("customerReload");
                    }
                }
            });
            return false;
        });

        //搜索
        var $ = layui.$, active = {
            search: function () {
                var keyWordName = $(".demoTable input[name='keyWordName']").val();
                table.render({
                    elem: '#customer'
                    , url: storeHost + "/manage/customer/listCustomer"
                    , id: "customerReload"
                    , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    , page: true          //显示分页默认不显示
                    , method: 'post'
                    , toolbar: '#toolbarDemo'
                    , request: {
                        pageName: 'pageNum', //页码的参数名称，默认：page
                        limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    }
                    , where: {
                        "companyId": "${currentUser.companyId!}",
                        "companyType": "${currentUser.companyType!}",
                        keyWordName: keyWordName
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
                        , {field: 'name', title: '客户名称', sort: true, fixed: 'left'}
                        , {field: 'k3Id', title: 'k3Id'}
                        , {field: 'k3Number', title: 'k3编号'}
                        , {field: 'companyName', title: '所属公司名称'}
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
            title: '新建客户',
            content: $('#addeditformdivid'), //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
            success: function () {

            }

        });
    });

    //删除按钮事件
    function layerDelete(data, table, $) {
        //删除数据库数据
        var url = storeHost + "/manage/customer/deleteCustomer";
        var data = {
            id: data.id,
            k3Id: data.k3Id,
            k3Number: data.k3Number,
            companyId: data.companyId,
            companyType: data.companyType
        };
        $.ajax({
            url: url,
            data: data,
            method: "POST",
            async: true,
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    layer.open({
                        title: '删除'
                        , content: '操作成功！' + res.result
                    });
                    //重新加载表格
                    table.reload("customerReload");

                } else {
                    layer.alert(res.responseStatusType.error.errorMsg);
                    //重新加载表格
                    table.reload("customerReload");
                }
            }
        });
    }

    //修改按钮事件
    function layerShowAndEdit(form, data, table, $) {
        var dataSend = data;
        //页面弹框
        var a1 = layer.open({
            type: 1,
            title: '客户修改',
            content: $('#editForm'),
            area: ['900px'],
            closeBtn: 1,
            btn: ['提交', '取消'],
            yes: function (index, layero) {
                form.on('submit(formVerify)', function (data) {
                    var url = storeHost + "/manage/customer/updateCustomer";
                    var params = {
                        id: layero.find("input[name='id']").val(),
                        name: layero.find("input[name='name']").val(),
                        companyId: dataSend.companyId,
                        companyType: dataSend.companyType,
                        k3Id: dataSend.k3Id,
                        modifyOperator: "${currentUser.trueName!}"
                    };
                    $.post(url, params, function (res) {
                        if (res.responseStatusType.message == "Success") {
                            layer.open({
                                title: '修改'
                                , content: '操作成功！' + res.result
                                , btn: ["关闭"]
                                , yes: function (index) {
                                    layer.close(index); //如果设定了yes回调，需进行手工关闭
                                    layer.close(a1);
                                }
                            });
                            //重新加载表格
                            table.reload("customerReload");
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
                    "id": data.id,
                    "name": data.name
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
            title: '客户详情',
            content: $('#showForm'),
            area: ['900px'],
            closeBtn: 1,
            btn: ['关闭'],
            btn2: function () {
                layer.close(a2)
            },
            success: function (layero) {
                //初始赋值
                layero.find("span[name='name']").text(data.name);
                form.render();
            }, end: function () {
                window.location.reload();
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
                $("#chooseCompanyType").attr("data-customerArrayStr", JSON.stringify(data))
                $("#chooseCompanyType").attr("data-type", type)
                if("${currentUser.companyType!}" === "2"){
                    //如果是子公司，只显示分公司选项
                    $('#zhi').attr("disabled", "disabled");
                }
            }
        });
    }
</script>

</body>
</html>