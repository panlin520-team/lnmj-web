<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>label</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${basePath!}/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${basePath!}/css/index.css" media="all"/>
    <script src="${basePath!}/layui/layui.js" charset="utf-8"></script>
    <script src="${basePath!}/js/jquery.js" charset="utf-8"></script>
    <#include "../baseFtl/pageAuth.ftl" />
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
    <style>
        label.xrequired:before {
            content: '* ';
            color: red;
        }
    </style>
</head>
<body>

<div class="layui-fluid">
    <div class="demoTable layui-form">
        <div class="layui-btn-group" align="left">
            <button type="button" class="layui-btn" id="addType">添加账户</button>
        </div>
        <table id="accountType" lay-filter="demo"></table>
    </div>
</div>


<form id="addForm" class="layui-form addForm layui-form-pane layui-personal" action="" lay-filter="addForm"
      method="post" hidden="true">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label xrequired">账户类型</label>
            <div class="layui-input-block">
                <input type="text" name="accountType" lay-verify="required" autocomplete="off" placeholder="请输入账户类型"
                       class="layui-input">
            </div>
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label xrequired">是否储值业绩</label>
        <div class="layui-input-block">
            <input name="isCuZhiYeJi" type="checkbox" name="close" lay-skin="switch" lay-text="ON|OFF">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label xrequired" style="width: 168px">是否为请客基金账户</label>
        <div class="layui-input-block">
            <input name="isQingKe" type="checkbox" name="close" lay-skin="switch" lay-text="ON|OFF">
        </div>
    </div>
</form>

<#--表格：显示规则记录-->
    <form class="demoTable layui-form layui-form-pane layui-personal" id="ruleTableForm" action=""
          lay-filter="ruleTableForm" method="post"
          hidden="true">
        <table id="ruleTable" class="ruleTable" lay-filter="ruleTable" hidden="true"></table>
        <div class="layui-btn-group">
            <button type="button" class="layui-btn" id="addRule">添加使用规则</button>
        </div>
    </form>
<#--表单：显示，编辑,添加规则-->
<form id="ruleForm" class="layui-form ruleForm layui-form-pane layui-personal" action="" lay-filter="ruleForm"
      method="post" hidden="true">
    <div class="layui-form-item" hidden="hidden">
        <label class="layui-form-label">ID</label>
        <div class="layui-input-block">
            <input type="text" name="accountUseRuleId" lay-verify="required" autocomplete="off" placeholder="请输入ID"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">账户名称</label>
        <div class="layui-input-block">
            <select name="accountType" lay-filter="accountType" lay-verify="required">
                <option value="">请选择</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商品类型</label>
        <div class="layui-input-block">
            <select name="productType" lay-filter="productType" lay-verify="required">
                <option value="">请选择</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">使用价格类型</label>
        <div class="layui-input-block">
            <select name="payPriceType" lay-filter="payPriceType" lay-verify="required">
                <option value="">请选择</option>
            </select>
        </div>
    </div>
    <#--<div class="layui-form-item">
        <label class="layui-form-label">折扣</label>
        <div class="layui-input-block">
            <input type="text" name="discount" lay-verify="required" autocomplete="off" placeholder="请输入折扣"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">会员等级</label>
        <div class="layui-input-block">
            <select name="memberLevel" lay-filter="memberLevel" lay-verify="required">
                <option value="">请选择</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">账号有效期</label>
        <div class="layui-input-block">
            <input type="text" name="accountUseTime" id="accountUseTime" lay-verify="required" autocomplete="off"
                   placeholder=" - " class="layui-input">
        </div>
    </div>-->
        <div class="layui-form-item">
            <label class="layui-form-label">使用范围</label>
            <div class="layui-input-block">
                <select name="useAccount" lay-filter="useAccount" lay-verify="required">
                    <option value="">请选择</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">时间</label>
            <div class="layui-input-block">
                <input type="text" name="startTime" id="startTime" lay-verify="required" autocomplete="off"
                       placeholder="yyyy-MM-dd HH:mm:ss" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">总次数</label>
            <div class="layui-input-block">
                <input type="text" name="useSum" lay-verify="required" autocomplete="off" placeholder="10"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">总价格</label>
            <div class="layui-input-block">
                <input type="text" name="useMax" lay-verify="required" autocomplete="off" placeholder="10000.00"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label xrequired">行业</label>
            <div class="layui-input-block" id="industry">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">使用天数</label>
            <div class="layui-input-block">
                <input type="text" name="productUseDay" lay-verify="required" autocomplete="off" placeholder="10"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">使用方式</label>
            <div class="layui-input-block">
                <select name="useMethod" lay-filter="useMethod" lay-verify="required">
                    <option value="">请选择</option>
                </select>
            </div>
        </div>
    <#--<div class="layui-form-item">
        <label class="layui-form-label">规则有效期</label>
        <div class="layui-input-block">
            <input type="text" name="ruleUseTime" id="ruleUseTime" lay-verify="required" autocomplete="off"
                   placeholder="开始  -  结束" class="layui-input">
        </div>
    </div>-->
    <div class="layui-form-item">
        <label class="layui-form-label">备注</label>
        <div class="layui-input-block">
            <input type="text" name="remark" lay-verify="required" autocomplete="off" placeholder="10"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" hidden="hidden">
        <label class="layui-form-label">状态</label>
        <div class="layui-input-block">
            <input type="text" name="status" lay-verify="required" autocomplete="off" placeholder="1"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">创建人</label>
        <div class="layui-input-block">
            <input type="text" name="createOperator" lay-verify="required" autocomplete="off" placeholder="11"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" hidden="hidden">
        <label class="layui-form-label">创建时间</label>
        <div class="layui-input-block">
            <input type="text" name="createTime" lay-verify="required" autocomplete="off"
                   placeholder="2019-04-26 15:30:43" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">修改人</label>
        <div class="layui-input-block">
            <input type="text" name="modifyOperator" lay-verify="required" autocomplete="off" placeholder="11"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" hidden="hidden">
        <label class="layui-form-label">更新时间</label>
        <div class="layui-input-block">
            <input type="text" name="dataChangeLastTime" lay-verify="required" autocomplete="off"
                   placeholder="2019-04-26 15:30:43" class="layui-input">
        </div>
    </div>
</form>

<script type="text/html" id="barDemo">
    {{#  if(d.isQingKe == 1){ }}
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="setting">设置</a>
    {{#  } }}
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="edit">编辑</a>
    <#--<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>-->
</script>
    <script type="text/html" id="ruleBarDemo">
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="showRule">查看</a>
        <a class="layui-btn layui-btn-xs" lay-event="editRule">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="deleteRule">删除</a>
    </script>


<#--是否计入储值业绩自定义显示-->
    <script type="text/html" id="isCuZhiYeJi">
        {{#  if(d.isCuZhiYeJi == 0){ }}
        否
        {{#  }else if(d.isCuZhiYeJi == 1){ }}
        是
        {{#  } }}
    </script>
<#--是否为赠送账户自定义显示-->
<script type="text/html" id="isQingKe">
    {{#  if(d.isQingKe == 0){ }}
    否
    {{#  }else if(d.isQingKe == 1){ }}
    是
    {{#  } }}
</script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script src="${basePath!}/js/host.js" type="text/javascript"></script>
<script>
    var dataProductType = [], dataUseMethod = [], dataScopeOfUse = [], dataAccountType = [], dataIndustry,
        dataProductPrice = [], dataMember, layer = null, form = null, laydate = null, table = null;
    layui.use('table', function () {
        table = layui.table;
        dataProductType = loadRuleEnumName("ProductTypeEnum");
        dataUseMethod = loadRuleEnumName("UseMethodEnum");
        dataScopeOfUse = loadRuleEnumName("ScopeOfUseEnum");
        dataProductPrice = loadRuleEnumName("ProductPriceTypeEnum");
        loadMemberlevel();

        table.render({
            elem: '#accountType'
            , url: walletHost + "/manage/wallet/selectWalletAccountList"
            , cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , page: true          //显示分页默认不显示
            , method: 'post'
            , request: {
                pageName: 'pageNum', //页码的参数名称，默认：page
                limitName: 'pageSize' //每页数据量的参数名，默认：limit
            }
            , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                dataAccountType = res.result;
                return {
                    "code": 0, //解析接口状态
                    "msg": "", //解析提示文本
                    "count": res.result == null ? 0 : res.result.length, //解析数据长度
                    "data": res.result == null ? 0 : res.result //解析数据列表
                };
            }
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'accountType', title: '账户类型'}
                , {field: 'isCuZhiYeJi', title: '是否储值业绩', templet: '#isCuZhiYeJi'}
                , {field: 'isCuZhiYeJi', title: '是否赠送账户', templet: '#isQingKe'}
                , {title: '操作', fixed: 'right', toolbar: '#barDemo'}
            ]]
        });
    });
    layui.use(['table', 'layer', 'jquery', 'form', 'laydate'], function () {
        layer = layui.layer;
        var $ = layui.jquery;
        form = layui.form;
        laydate = layui.laydate;
        table = layui.table;

        // loadSubclassInfo(layer);
        showSelectIndustry();

        //监听表格复选框选择
        table.on('checkbox(demo)', function (obj) {
        });
        //监听工具条
        table.on('tool(demo)', function (obj) {
            var data = obj.data;
            if (obj.event === 'edit') {
                editType(table, data, form);
            } else if (obj.event === 'del') {
                layer.confirm('确定删除吗？', function (index) {
                    deleteType(table, data);
                });
            } else if (obj.event === 'setting') {
                settingType(table, data, form);
            }
        });

        //button按钮绑定事件
        $("#addType").click(function () {
            $("#addForm")[0].reset();
            var a = layer.open({
                type: 1
                , content: $('#addForm')
                , title: '添加'
                , area: ['723px', '474px']
                , btn: ['提交', '取消']
                , yes: function (index, layero) {
                    form.on('submit(formVerify)', function (data) {
                        var url = walletHost + "/manage/wallet/addWalletAccount";
                        var data = {
                            accountType: layero.find("input[name='accountType']").val(),
                            isCuZhiYeJi: $("input[name='isCuZhiYeJi']").is(":checked") == true ? 1 : 0,
                            isQingKe: $("input[name='isQingKe']").is(":checked") == true ? 1 : 0
                        };
                        $.post(url, data, function (result) {
                            if (result.responseStatusType.message == "Success") {
                                // layer.msg("成功");
                                layer.open({
                                    title: '添加'
                                    , content: '添加成功！'
                                });
                                layer.close(a);
                                table.reload("accountType");
                            } else {
                                layer.msg(result.responseStatusType.error.errorMsg);
                            }
                        })
                    })
                }
                , success: function (layero) {
                    layero.addClass('layui-form');
                    layero.find('.layui-layer-btn0').attr('lay-filter', 'formVerify').attr('lay-submit', '');
                    form.render();
                }

            })
        });
    });


    function settingType(table, data, form) {
        //设置操作
        var a1 = layer.open({
            type: 1,
            title: '使用规则',
            content: $('#ruleTableForm'),
            success: function (layero, index) {
                table.render({
                    elem: '#ruleTable'
                    , url: walletHost + "/manage/ruleSet/selectAccountRuleByCondition"
                    , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    , page: true          //显示分页默认不显示
                    , method: 'post'
                    , request: {
                        pageName: 'pageNum', //页码的参数名称，默认：page
                        limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    }
                    , where: {
                        accountType: data.accountTypeId
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
                        , {field: 'accountUseRuleId', title: '序号', width: 75, sort: true, fixed: 'left'}
                        , {
                            field: 'accountType', title: '账户类型', templet: function (d) {
                                var accountType = "";
                                for (var q in dataAccountType) {
                                    if (dataAccountType[q].accountTypeId == d.accountType) {
                                        accountType = dataAccountType[q].accountType;
                                    }
                                }
                                return accountType
                            }
                        }
                        , {field: 'productTypeName', title: '商品类型'}
                        , {field: 'payPriceType', title: '价格类型', sort: true}
                        , {
                            field: 'useAccount', title: '使用对象', sort: true, templet: function (d) {
                                var useAccount = "";
                                for (var q in dataScopeOfUse) {
                                    if (q == d.useAccount) {
                                        useAccount = dataScopeOfUse[q];
                                    }
                                }
                                return useAccount
                            }
                        }
                        , {field: 'startTime', title: '开始(结束)时间'}
                        , {fixed: 'right', title: '操作', width: 180, align: 'center', toolbar: '#ruleBarDemo'}
                    ]]
                    , id: 'userReload'
                });
            },
            cancel: function () {
                layer.close(a1);
            },
            area: ['900px', '600px']
        });

        //监听表单复选框的选择
        form.on('checkbox(industry)', function (data) {
            // console.log(data.elem); //得到checkbox原始DOM对象
            // console.log(data.elem.checked); //是否被选中，true或者false
            // console.log(data.value); //复选框value值，也可以通过data.elem.value得到
            // console.log(data.othis); //得到美化后的DOM对象
            var value = data.value, flag = data.elem.checked;
            if (flag) {   //选择了复选框
                //启用输入框
                $("#" + value + " input[name='useSum']").attr("disabled", false);
                $("#" + value + " input[name='useMax']").attr("disabled", false);
                $("#" + value + " input[name='unitPrice']").attr("disabled", false);
            } else {  //不选择复选框
                $("#" + value + " input[name='useSum']").attr("disabled", true);
                $("#" + value + " input[name='useMax']").attr("disabled", true);
                $("#" + value + " input[name='unitPrice']").attr("disabled", true);
            }
            form.render();
        });

        //监听规则的操作按钮
        table.on('tool(ruleTable)', function (obj) {
            var data = obj.data;
            if (obj.event === 'showRule') {
                showRule(data);
            } else if (obj.event === 'deleteRule') {
                layer.confirm('确定删除吗？', function (index) {
                    deleteRule(data.accountUseRuleId);
                });
            } else if (obj.event === 'editRule') {
                editRule(data);
            }
        });
        //点击添加规则按钮
        $("#addRule").click(function () {
            addRule(data);
        });

    }

    function addRule(data) {
        var a2 = layer.open({
            type: 1
            , content: $('#ruleForm')
            , title: '添加规则'
            , btn: ['提交', '取消']
            , success: function (layero) {
                showAllSelect(laydate, form,accountId);
                //隐藏创建人和编辑人
                layero.find("input[name='createOperator']").parent().parent().hide();
                layero.find("input[name='modifyOperator']").parent().parent().hide();
            }
            , yes: function (index, layero) {
                var url = walletHost + "/manage/ruleSet/insertAccountRule";
                var accountType = layero.find("select[name='accountType']"),
                    accountTypeId = accountType.find("option:selected").val();
                var productType = layero.find("select[name='productType']"),
                    productTypeId = productType.find("option:selected").val(),
                    productTypeName = productType.find("option:selected").text();
                var payPriceType = layero.find("select[name='payPriceType']"),
                    payPriceType = payPriceType.find("option:selected").val();
                var memberLevel = layero.find("select[name='memberLevel']"),
                    memberLevelId = memberLevel.find("option:selected").val(),
                    memberLevelName = memberLevel.find("option:selected").text();
                var accountUseTime = layero.find("input[name='accountUseTime']").val(),
                    accountUseTimeS = accountUseTime.split(" - ")[0],
                    accountUseTimeE = accountUseTime.split(" - ")[1];
                var useAccount = layero.find("select[name='useAccount']"),
                    useAccount = useAccount.find("option:selected").val();
                var useMethod = layero.find("select[name='useMethod']"),
                    useMethod = useMethod.find("option:selected").val();
                var ruleUseTime = layero.find("input[name='ruleUseTime']").val(),
                    ruleUseTimeS = ruleUseTime.split(" - ")[0],
                    ruleUseTimeE = ruleUseTime.split(" - ")[1];
                var data = {
                    accountType: accountTypeId,
                    productType: productTypeId,
                    productTypeName: productTypeName,
                    payPriceType: payPriceType,
                    discount: layero.find("input[name='discount']").val(),
                    memberLevel: memberLevelId,
                    memberLevelName: memberLevelName,
                    accountUseStartTime: accountUseTimeS,
                    accountUseEndTime: accountUseTimeE,
                    useAccount: useAccount,
                    startTime: layero.find("input[name='startTime']").val(),
                    useSum: layero.find("input[name='useSum']").val(),
                    useMax: layero.find("input[name='useMax']").val(),
                    productUseDay: layero.find("input[name='productUseDay']").val(),
                    useMethod: useMethod,
                    ruleStartTime: ruleUseTimeS,
                    ruleEndTime: ruleUseTimeE,
                    remark: layero.find("input[name='remark']").val(),
                    <#--modifyOperator: "${currentUser.trueName!}"-->
                    createOperator: "${currentUser.trueName!}"
                };
                $.post(url, data, function (result) {
                    if (result.responseStatusType.message == "Success") {
                        layer.open({
                            title: '添加规则'
                            , content: '添加成功！'
                            , yes: function (index) {
                                layer.close(index); //如果设定了yes回调，需进行手工关闭
                                layer.close(a2);
                            }
                        });
                        table.reload("ruleTable");
                    } else {
                        layer.open({
                            title: '添加规则'
                            , content: '添加失败！'
                            , btn: ["关闭"]
                        });
                    }
                })
            }
            , area: ['500px', '500px']
            // ,end:function(){
            //     window.location.reload();
            // }
        })
    }

    function showAllSelect(laydate, form,aId) {
        //加载所有的选择框
        $("#ruleForm select[name='accountType']").html("<option value=''>请选择</option>");
        for (var p in dataAccountType) {
            var option = "";
            if(aId==dataAccountType[p].accountTypeId){
                option = "<option value='" + dataAccountType[p].accountTypeId + "' selected>" + dataAccountType[p].accountType + "</option>";
            }else{
                option = "<option value='" + dataAccountType[p].accountTypeId + "'>" + dataAccountType[p].accountType + "</option>"
            }
            $("#ruleForm select[name='accountType']").append(option);
            $("#ruleForm select[name='accountType']").append(option);
        }

        $("#ruleForm select[name='productType']").html("<option value=''>请选择</option>");
        for (var p in dataProductType) {
            var option = "<option value='" + p + "'>" + dataProductType[p] + "</option>";
            $("#ruleForm select[name='productType']").append(option);
        }

        $("#ruleForm select[name='payPriceType']").html("<option value=''>请选择</option>");
        for (var p in dataProductPrice) {
            var option = "<option value='" + dataProductPrice[p] + "'>" + dataProductPrice[p] + "</option>";
            $("#ruleForm select[name='payPriceType']").append(option);
        }

        // $("#ruleForm select[name='memberLevel']").html("<option value=''>请选择</option>");
        // for (var p in dataMember) {
        //     var option = "<option value='" + dataMember[p].membershipLevelId + "'>" + dataMember[p].membershipLevelName + "</option>";
        //     $("#ruleForm select[name='memberLevel']").append(option);
        // }

        $("#ruleForm select[name='useAccount']").html("<option value=''>请选择</option>");
        for (var p in dataScopeOfUse) {
            var option = "<option value='" + p + "'>" + dataScopeOfUse[p] + "</option>";
            $("#ruleForm select[name='useAccount']").append(option);
        }

        $("#ruleForm select[name='useMethod']").html("<option value=''>请选择</option>");
        for (var p in dataUseMethod) {
            var option = "<option value='" + p + "'>" + dataUseMethod[p] + "</option>";
            $("#ruleForm select[name='useMethod']").append(option);
        }
        form.render("select", "ruleForm");
        laydate.render({
            elem: '#startTime'
            , type: 'datetime'
        });
        // laydate.render({
        //     elem: '#accountUseTime'
        //     , type: 'datetime'
        //     /*,range: ' - '*/
        //     , range: true
        //     /*,format: 'yyyy-MM-dd HH:mm:ss'*/
        // });
        // laydate.render({
        //     elem: '#ruleUseTime'
        //     , type: 'datetime'
        //     // ,range: ' - '
        //     , range: true
        //     // ,format: 'yyyy-MM-dd HH:mm:ss'
        // });
    }

    function showRule(data) {
        var a3 = layer.open({
            type: 1
            , content: $('#ruleForm')
            , title: '查看规则'
            , btn: ['确定', '取消']
            , success: function (layero) {
                showAllSelect(laydate, form);
                //回显数据
                layero.find("input[name='accountUseRuleId']").val(data.accountUseRuleId);
                var accountType = layero.find("select[name='accountType']");
                accountType.find("option[value='" + data.accountType + "']").attr("selected", true);
                var productType = layero.find("select[name='productType']");
                productType.find("option[value='" + data.productType + "']").attr("selected", true);
                var payPriceType = layero.find("select[name='payPriceType']");
                payPriceType.find("option[value='" + data.payPriceType + "']").attr("selected", true);
                layero.find("input[name='discount']").val(data.discount);
                var memberLevel = layero.find("select[name='memberLevel']");
                memberLevel.find("option[value='" + data.memberLevel + "']").attr("selected", true);
                layero.find("input[name='accountUseTime']").val(data.accountUseStartTime + " - " + data.accountUseEndTime);
                var useAccount = layero.find("select[name='useAccount']");
                useAccount.find("option[value='" + data.useAccount + "']").attr("selected", true);
                layero.find("input[name='startTime']").val(data.startTime);
                layero.find("input[name='useSum']").val(data.useSum);
                layero.find("input[name='useMax']").val(data.useMax);
                layero.find("input[name='productUseDay']").val(data.productUseDay);
                var useMethod = layero.find("select[name='useMethod']");
                useMethod.find("option[value='" + data.useMethod + "']").attr("selected", true);
                layero.find("input[name='ruleUseTime']").val(data.ruleUseTime + " - " + data.ruleUseTime);
                layero.find("input[name='status']").val(data.status);
                layero.find("input[name='createOperator']").val(data.createOperator);
                layero.find("input[name='createTime']").val(data.createTime);
                layero.find("input[name='modifyOperator']").val(data.modifyOperator);
                layero.find("input[name='dataChangeLastTime']").val(data.dataChangeLastTime);
                //隐藏创建人和编辑人
                layero.find("input[name='createOperator']").parent().parent().hide();
                layero.find("input[name='modifyOperator']").parent().parent().hide();
                form.render("select", "ruleForm");
            }
            , yes: function (index, layero) {
                layer.close(index); //如果设定了yes回调，需进行手工关闭
                layer.close(a3);
            }
            , area: ['500px', '500px']
            //, end:function(){
            //     window.location.reload();
            // }
        })
    }

    function editRule(data) {
        var a4 = layer.open({
            type: 1
            , content: $('#ruleForm')
            , title: '查看规则'
            , btn: ['提交', '取消']
            , success: function (layero) {
                showAllSelect(laydate, form);
                //回显数据
                layero.find("input[name='accountUseRuleId']").val(data.accountUseRuleId);
                var accountType = layero.find("select[name='accountType']");
                accountType.find("option[value='" + data.accountType + "']").attr("selected", true);
                var productType = layero.find("select[name='productType']");
                productType.find("option[value='" + data.productType + "']").attr("selected", true);
                var payPriceType = layero.find("select[name='payPriceType']");
                payPriceType.find("option[value='" + data.payPriceType + "']").attr("selected", true);
                layero.find("input[name='discount']").val(data.discount);
                var memberLevel = layero.find("select[name='memberLevel']");
                memberLevel.find("option[value='" + data.memberLevel + "']").attr("selected", true);
                layero.find("input[name='accountUseTime']").val(data.accountUseStartTime + " - " + data.accountUseEndTime);
                var useAccount = layero.find("select[name='useAccount']");
                useAccount.find("option[value='" + data.useAccount + "']").attr("selected", true);
                layero.find("input[name='startTime']").val(data.startTime);
                layero.find("input[name='useSum']").val(data.useSum);
                layero.find("input[name='useMax']").val(data.useMax);
                layero.find("input[name='productUseDay']").val(data.productUseDay);
                var useMethod = layero.find("select[name='useMethod']");
                useMethod.find("option[value='" + data.useMethod + "']").attr("selected", true);
                layero.find("input[name='ruleUseTime']").val(data.ruleUseTime + " - " + data.ruleUseTime);
                layero.find("input[name='status']").val(data.status);
                layero.find("input[name='createOperator']").val(data.createOperator);
                layero.find("input[name='createTime']").val(data.createTime);
                layero.find("input[name='modifyOperator']").val(data.modifyOperator);
                layero.find("input[name='dataChangeLastTime']").val(data.dataChangeLastTime);
                //隐藏创建人和编辑人
                layero.find("input[name='createOperator']").parent().parent().hide();
                layero.find("input[name='modifyOperator']").parent().parent().hide();
                form.render("select", "ruleForm");
            }
            , yes: function (index, layero) {
                var url = walletHost + "/manage/ruleSet/updateAccountRuleById";
                var accountType = layero.find("select[name='accountType']"),
                    accountTypeId = accountType.find("option:selected").val();
                var productType = layero.find("select[name='productType']"),
                    productTypeId = productType.find("option:selected").val(),
                    productTypeName = productType.find("option:selected").text();
                var payPriceType = layero.find("select[name='payPriceType']"),
                    payPriceType = payPriceType.find("option:selected").val();
                var memberLevel = layero.find("select[name='memberLevel']"),
                    memberLevelId = memberLevel.find("option:selected").val(),
                    memberLevelName = memberLevel.find("option:selected").text();
                var accountUseTime = layero.find("input[name='accountUseTime']").val(),
                    accountUseTimeS = accountUseTime.split(" - ")[0],
                    accountUseTimeE = accountUseTime.split(" - ")[1];
                var useAccount = layero.find("select[name='useAccount']"),
                    useAccount = useAccount.find("option:selected").val();
                var useMethod = layero.find("select[name='useMethod']"),
                    useMethod = useMethod.find("option:selected").val();
                var ruleUseTime = layero.find("input[name='ruleUseTime']").val(),
                    ruleUseTimeS = ruleUseTime.split(" - ")[0],
                    ruleUseTimeE = ruleUseTime.split(" - ")[1];
                var param = {
                    accountUseRuleId: data.accountUseRuleId,
                    accountType: accountTypeId,
                    productType: productTypeId,
                    productTypeName: productTypeName,
                    payPriceType: payPriceType,
                    discount: layero.find("input[name='discount']").val(),
                    memberLevel: memberLevelId,
                    memberLevelName: memberLevelName,
                    accountUseStartTime: accountUseTimeS,
                    accountUseEndTime: accountUseTimeE,
                    useAccount: useAccount,
                    startTime: layero.find("input[name='startTime']").val(),
                    useSum: layero.find("input[name='useSum']").val(),
                    useMax: layero.find("input[name='useMax']").val(),
                    productUseDay: layero.find("input[name='productUseDay']").val(),
                    useMethod: useMethod,
                    ruleStartTime: ruleUseTimeS,
                    ruleEndTime: ruleUseTimeE,
                    remark: layero.find("input[name='remark']").val(),
                    modifyOperator: "${currentUser.trueName!}"
                    <#--createOperator: "${currentUser.trueName!}"-->
                };
                $.post(url, param, function (result) {
                    if (result.responseStatusType.message == "Success") {
                        layer.open({
                            title: '修改规则'
                            , content: '修改成功！'
                            , yes: function (index) {
                                layer.close(index); //如果设定了yes回调，需进行手工关闭
                                layer.close(a4);
                            }
                        });
                        table.reload("ruleTable");
                    } else {
                        layer.open({
                            title: '修改规则'
                            , content: '修改失败！'
                            , btn: ["关闭"]
                        });
                    }
                })
            }
            , area: ['500px', '500px']
            // ,end:function(){
            //     window.location.reload();
            // }
        })
    }

    function deleteRule(id) {
        var url = walletHost + "/manage/ruleSet/deleteAccountRuleById",
            data = {
                accountUseRuleId: id,
                modifyOperator: "${currentUser.trueName!}"
            };
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                layer.open({
                    title: '删除规则'
                    , content: '删除成功！'
                    , yes: function (index) {
                        layer.close(index); //如果设定了yes回调，需进行手工关闭
                    }
                });
                table.reload("ruleTable");
            } else {
                layer.open({
                    title: '删除规则'
                    , content: '删除失败！'
                    , btn: ["关闭"]
                });
            }
        })
    }

    function loadMemberlevel() {
        var url = accountHost + "/manage/member/selectAllNormalMemberList";
        $.ajax({
            url: url,
            method: "POST",
            async: false,
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    dataMember = res.result.list;
                }
            }
        });
    }

    function loadRuleEnumName(name) {
        var url = walletHost + "/manage/ruleSet/selectRuleEnumName",
            param = {
                name: name
            }, dataRuleEnum = [];
        $.ajax({
            url: url,
            data: param,
            method: "POST",
            async: false,
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    dataRuleEnum = res.result;
                }
            }
        });
        return dataRuleEnum;
    }

    function editType(table, data, form) {
        var accountTypeId = data.accountTypeId
        var a = layer.open({
            type: 1
            , content: $('#addForm')
            , title: '修改'
            , area: ['723px', '474px']
            , btn: ['提交', '取消']
            , success: function (layero) {
                layero.addClass('layui-form');
                layero.find('.layui-layer-btn0').attr('lay-filter', 'formVerify').attr('lay-submit', '');
                form.render();
                if (data.isCuZhiYeJi == 1) {
                    //开启业绩
                    $("input[name='isCuZhiYeJi']").attr("checked", "checked");
                    form.render();
                } else {
                    //未开启业绩
                    $("input[name='isCuZhiYeJi']").next().removeClass("layui-form-onswitch");
                    $("input[name='isCuZhiYeJi']").next().children().get(0).innerHTML = "OFF";
                }
                if (data.isQingKe == 1) {
                    //开启赠送账户
                    $("input[name='isQingKe']").attr("checked", "checked");
                    form.render();
                } else {
                    //未开启赠送账户
                    $("input[name='isQingKe']").next().removeClass("layui-form-onswitch");
                    $("input[name='isQingKe']").next().children().get(0).innerHTML = "OFF";
                }
                layero.find("input[name='accountType']").val(data.accountType)
            }
            , yes: function (index, layero) {
                form.on('submit(formVerify)', function (data) {

                    var subclass = [];
                    $('input[class="checkboxSubclass"]:checked').each(function (index, element) {
                        //追加到数组中
                        subclass.push($(this).val());
                    });
                    var url = walletHost + "/manage/wallet/updateWalletAccount";
                    var data = {
                        accountTypeId: accountTypeId,
                        accountType: layero.find("input[name='accountType']").val(),
                        isCuZhiYeJi: $("input[name='isCuZhiYeJi']").is(":checked") == true ? 1 : 0,
                        isQingKe: $("input[name='isQingKe']").is(":checked") == true ? 1 : 0
                    };
                    $.post(url, data, function (result) {
                        if (result.responseStatusType.message == "Success") {
                            layer.open({
                                title: '修改'
                                , content: '修改成功！'
                                , yes: function () {
                                    layer.closeAll();
                                }
                            });
                            // layer.close(a);
                            table.reload("accountType");
                        } else {
                            layer.msg(result.responseStatusType.error.errorMsg);
                        }
                    })
                })
            },
            end: function () {
                window.location.reload();
            }
        });
    }

    function deleteType(table, data) {
        var url = walletHost + "/manage/wallet/deleteWalletAccount";
        var data = {
            accountId: data.accountTypeId
        };
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                //重新加载表格
                table.reload("accountType");
                layer.msg("成功");
            } else {
                layer.msg("失败");
            }
        })
    }

    //加载行业总次数，总金额
    function showSelectIndustry() {
        loadIndustry();
        $("#industry").empty();
        for (var p in dataIndustry) {
            var div = "<div id='" + dataIndustry[p].industryID + "' class='layui-input-inline' style='width:230px'>" +
                "         <div class='layui-input-inline' style='width:220px'>" +
                "           <label class='layui-form-label' style='width:110px'>总次数：</label>" +
                "           <input type='text' name='useSum' lay-verify='required' autocomplete='off' placeholder='输入总次数' class='layui-input' style='width:100px;' disabled>" +
                "         </div>" +
                "         <div class='layui-input-inline' style='width:220px'>" +
                "           <label class='layui-form-label' style='width:110px'>总金额：</label>" +
                "           <input type='text' name='useMax' lay-verify='required' autocomplete='off' placeholder='输入总金额' class='layui-input' style='width:100px;' disabled>" +
                "         </div>" +
                "         <div class='layui-input-inline' style='width:220px'>" +
                "           <label class='layui-form-label' style='width:110px'>单次金额：</label>" +
                "           <input type='text' name='unitPrice' lay-verify='required' autocomplete='off' placeholder='输入单次价格' class='layui-input' style='width:100px;' disabled>" +
                "         </div>" +
                "    </div>";
            var input = "<div class='layui-input-inline' style='width:90px;'>" +
                "<input type='checkbox' name='Industry[" + dataIndustry[p].industryID + "]' value='" + dataIndustry[p].industryID + "" +
                "' lay-filter='industry' ay-skin='primary' title='" + dataIndustry[p].industryName + "'></div>";
            $("#industry").append(input + div);
            form.render();
        }
    }

    //加载行业
    function loadIndustry() {
        dataIndustry = [];
        var url = storeHost + "/manage/industry/selectListIndustryNoPage";
        $.ajax({
            url: url,
            // data: param,
            method: "POST",
            async: false,
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    dataIndustry = res.result;
                }
            }
        });
    }


    //加载小类信息多选
    function loadSubclassInfo(layer) {
        $.ajax({
            type: "POST",
            url: dataHost + "/commodityType/selectSubclassByConditionNoPage",
            data: {},
            async: false,
            error: function (request) {
                layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
            },
            success: function (data) {
                if (data.responseStatusType.message == 'Success') {
                    var strs = "";
                    $.each(data.result, function (n, value) {
                        strs += '<input class="checkboxSubclass" type="checkbox" name=' + value.subclassID + ' title="' + value.subclassName + '"  value="' + value.subclassID + '" >';
                    });
                    $("#checkboxSubclasslistid").empty();//每次填充前都要清空所有按钮，重新填充
                    $("#checkboxSubclasslistid").append(strs);
                } else {
                    layer.alert(data.responseStatusType.error.errorMsg);
                }
            }
        });
    }
</script>

</body>
</html>