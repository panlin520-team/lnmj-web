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
</head>
<style>

    label.xrequired:before {
        content: '* ';
        color: red;
    }

</style>
<body>

<div class="layui-fluid">
    <div class="demoTable layui-form">
        <div class="layui-btn-group" align="left">
            <button type="button" class="layui-btn" id="addType">添加支付类型</button>
        </div>
        <table id="paymentType" lay-filter="demo"></table>
    </div>
</div>


<form id="addForm" class="layui-form addForm layui-form-pane layui-personal" action="" lay-filter="addForm"
      method="post" hidden="true">

    <div class="layui-form-item" hidden="hidden">
        <div class="layui-inline">
            <label class="layui-form-label">支付类型id</label>
            <div class="layui-input-block">
                <input type="text" name="payTypeId" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入支付类型名称"
                       class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label xrequired">支付类型名称</label>
            <div class="layui-input-block">
                <input type="text" name="payTypeName" lay-verify="required" autocomplete="off" placeholder="请输入支付类型名称"
                       class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label xrequired">是否打折</label>
        <div class="layui-input-block">
            <input name="discount" type="checkbox" name="close" lay-skin="switch" lay-text="ON|OFF">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label xrequired">支付类型</label>
        <div class="layui-input-block" style="width:150px;">
            <select name="payTypeCategory" id="payTypeCategory" lay-filter="payTypeCategory"
                    lay-verify="required">
                <option value="1">现金支付</option>
                <option value="2">账户支付</option>
            </select>
        </div>
    </div>

    <div class="layui-form-item" id="accountTypeIdDiv">
        <label class="layui-form-label xrequired">账户类型</label>
        <div class="layui-input-block" style="width:150px;">
            <select name="accountTypeId" id="accountTypeId" lay-filter="accountTypeId"
                    <#--lay-verify="required"-->>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label xrequired">业绩比例(%)</label>
            <div class="layui-input-block">
                <input type="text" name="paymentRatioOriginal" lay-verify="required" autocomplete="off"
                       placeholder="请输入业绩比例" class="layui-input">
            </div>
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">所属小类</label><span style="color: red;">（如果不选则默认为所有小类）</span>
        <div class="layui-input-block" id="checkboxSubclasslistid">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">所属行业</label><span style="color: red;">（如果不选则默认为所有行业）</span>
        <div class="layui-input-block" id="checkboxIndustrylistid">
        </div>
    </div>
</form>


<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>


<#--是否打折自定义显示-->
<script type="text/html" id="discount">
    {{#  if(d.discount == 0){ }}
    关闭
    {{#  }else if(d.discount == 1){ }}
    开启
    {{#  } }}
</script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script src="${basePath!}/js/host.js" type="text/javascript"></script>
<script>
    var dataAccountType = [], layer = null, form = null, laydate = null, table = null;
    layui.use('table', function () {
        table = layui.table;
        table.render({
            elem: '#paymentType'
            , url: payHost + "/manage/payment/selectPayTypeList"
            , cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , page: true          //显示分页默认不显示
            , method: 'post'
            , id: "paymentTypeReload"
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
            ,where: {
                "memberNum" : 0
            }
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'payTypeName', title: '账户类型'}
                , {
                    field: 'paymentRatioOriginal', title: '业绩比例(%)', templet: function (d) {
                        return d.paymentRatioOriginal * 100;
                    }, hide: false
                }
                , {field: 'discount', title: '是否打折', templet: '#discount'}
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
        loadSubclassInfo(layer);
        loadIndustryInfo(layer);
        loadAccountType(form);
        //监听表格复选框选择
        table.on('checkbox(demo)', function (obj) {
        });

        form.on('select(payTypeCategory)', function (obj) {
            var value = obj.value; //得到修改后的值 storeid
            if (value === "2") {
                //如果是账户支付
                $("#accountTypeIdDiv").css("display", "block");
            } else if (value === "1") {
                //如果是现金支付
                $("#accountTypeIdDiv").css("display", "none");
            }


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
            }
        });


        //button按钮绑定事件
        $("#addType").click(function () {
            $("#accountTypeIdDiv").css("display", "none");
            $("#addForm")[0].reset();
            var a = layer.open({
                type: 1
                , content: $('#addForm')
                , title: '添加'
                , area: ['723px', '474px']
                , btn: ['提交', '取消']
                , yes: function (index, layero) {
                    form.on('submit(formVerify)', function (data) {
                        var subclass = [];
                        $('input[class="checkboxSubclass"]:checked').each(function (index, element) {
                            //追加到数组中
                            subclass.push($(this).val());
                        });

                        var industry = [];
                        $('input[class="checkboxIndustry"]:checked').each(function (index, element) {
                            //追加到数组中
                            industry.push($(this).val());
                        });

                        var url = payHost + "/manage/payment/insertPayType";
                        var data = {
                            payTypeCategory: $("select[name='payTypeCategory'] option:selected").val(),
                            accountType: $("select[name='accountTypeId'] option:selected").val(),
                            payTypeName: layero.find("input[name='payTypeName']").val(),
                            paymentRatioOriginal: layero.find("input[name='paymentRatioOriginal']").val(),
                            discount: $("input[name='discount']").is(":checked") == true ? 1 : 0,
                            subclass: JSON.stringify(subclass),
                            industry: JSON.stringify(industry)
                        };
                        $.post(url, data, function (result) {
                            if (result.responseStatusType.message == "Success") {
                                // layer.msg("成功");
                                layer.open({
                                    title: '添加'
                                    , content: '添加成功！'
                                });
                                layer.close(a);
                                table.reload("paymentTypeReload");
                            } else {
                                layer.msg(result.responseStatusType.error.errorMsg);
                            }
                        })
                    })
                }
                , success: function (layero) {
                    layero.addClass('layui-form');
                    layero.find('.layui-layer-btn0').attr('lay-filter', 'formVerify').attr('lay-submit', '');
                    layui.form.render();
                }

            });
        });
    });

    function editType(table, data, form) {
        var payTypeId = data.payTypeId;
        var a = layer.open({
            type: 1
            , content: $('#addForm')
            , title: '修改'
            , area: ['723px', '474px']
            , btn: ['提交', '取消']
            , success: function (layero) {
                layero.addClass('layui-form');
                layero.find('.layui-layer-btn0').attr('lay-filter', 'formVerify').attr('lay-submit', '');
                layui.form.render();
                $("#accountTypeIdDiv").css("display", "none");
                if (data.discount == 1) {
                    //开启打折
                    $("input[name='discount']").attr("checked", "checked");
                    form.render();
                } else {
                    //未开启打折
                    $("input[name='discount']").next().removeClass("layui-form-onswitch");
                    $("input[name='discount']").next().children().get(0).innerHTML = "OFF";
                }

                var json = {}
                if (data.payTypeCategory === 2) {
                    $("#accountTypeIdDiv").css("display", "block");
                    json = {
                        "payTypeId": data.payTypeId
                        , "payTypeCategory": data.payTypeCategory
                        , "payTypeName": data.payTypeName
                        , "paymentRatioOriginal": data.paymentRatioOriginal * 100
                        , "accountTypeId": data.accountType
                    }
                } else {
                    json = {
                        "payTypeId": data.payTypeId
                        , "payTypeCategory": data.payTypeCategory
                        , "payTypeName": data.payTypeName
                        , "paymentRatioOriginal": data.paymentRatioOriginal * 100
                    }
                }
                form.val('addForm', json);


                //给表单赋值
                var subclass = JSON.parse(data.subclass);
                var industry = JSON.parse(data.industry);
                var jsonObj = {};
                for (var n in subclass) {
                    jsonObj[subclass[n]] = true;
                }
                for (var p in industry) {
                    jsonObj[industry[p]] = true;
                }

                form.val('addForm', jsonObj);
            }
            , yes: function (index, layero) {
                form.on('submit(formVerify)', function (data) {
                    var subclass = [];
                    var industry = [];
                    $('input[class="checkboxSubclass"]:checked').each(function (index, element) {
                        //追加到数组中
                        subclass.push($(this).val());
                    });
                    $('input[class="checkboxIndustry"]:checked').each(function (index, element) {
                        //追加到数组中
                        industry.push($(this).val());
                    });
                    var url = payHost + "/manage/payment/updatePayType";
                    var data = {
                        payTypeCategory: $("select[name='payTypeCategory'] option:selected").val(),
                        payTypeId: payTypeId,
                        accountType: $("select[name='accountTypeId'] option:selected").val(),
                        payTypeName: layero.find("input[name='payTypeName']").val(),
                        paymentRatioOriginal: layero.find("input[name='paymentRatioOriginal']").val(),
                        discount: $("input[name='discount']").is(":checked") == true ? 1 : 0,
                        subclass: JSON.stringify(subclass),
                        industry: JSON.stringify(industry)
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
                            table.reload("paymentTypeReload");
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
        var url = payHost + "/manage/payment/deletePayType";
        var data = {
            payTypeId: data.payTypeId
        };
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                //重新加载表格
                table.reload("paymentTypeReload");
                layer.msg("成功");
            } else {
                layer.msg("失败");
            }
        })
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

    //加载行业信息多选
    function loadIndustryInfo(layer) {
        $.ajax({
            type: "POST",
            url: storeHost + "/manage/industry/selectListIndustryNoPage",
            data: {},
            async: false,
            error: function (request) {
                layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
            },
            success: function (data) {
                if (data.responseStatusType.message == 'Success') {
                    var strs = "";
                    $.each(data.result, function (n, value) {
                        strs += '<input class="checkboxIndustry" type="checkbox" name=' + value.industryID + ' title="' + value.industryName + '"  value="' + value.industryID + '" >';
                    });
                    $("#checkboxIndustrylistid").empty();//每次填充前都要清空所有按钮，重新填充
                    $("#checkboxIndustrylistid").append(strs);
                } else {
                    layer.alert(data.responseStatusType.error.errorMsg);
                }
            }
        });
    }

    function loadAccountType(form) {
        //加载店铺列表信息
        var url = walletHost + "/manage/wallet/selectWalletAccountList";
        var data = {};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("accountTypeId"); //server为select定义的id
                server.innerHTML = "<option value='' selected='selected'>请选择</option>";
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