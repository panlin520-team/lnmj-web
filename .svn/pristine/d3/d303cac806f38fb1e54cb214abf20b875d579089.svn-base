<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>仓库</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${basePath!}/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${basePath!}/css/index.css" media="all"/>
    <script src="${basePath!}/js/jquery.min.js" type="text/javascript"></script>
    <script src="${basePath!}/layui/layui.js" charset="utf-8"></script>
    <script src="${basePath!}/js/host.js" type="text/javascript"></script>
    <script type="text/javascript" src="${basePath!}/assets/city-picker.data.js"></script>
    <script type="text/javascript" src="${basePath!}/assets/province.js"></script>
    <style>
        .resetLabel {
            width: 75px;
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
                <label class="layui-form-label resetLabel">公司分类</label>
                <div class="layui-input-inline">
                    <select name="companyTypeAdd" lay-filter="companyTypeAdd" lay-verify="required">
                        <option value="">请选择</option>
                        <option value="1">总公司</option>
                        <option value="2">子公司</option>
                        <option value="3">门店</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">公司</label>
                <div class="layui-input-inline">
                    <select name="companyIdAdd" lay-filter="companyIdAdd" lay-verify="required" id="companyIdAdd">
                        <#--<option value="">请选择</option>-->
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <button class="layui-btn" data-type="add">添加仓库</button>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label resetLabel">公司分类</label>
                <div class="layui-input-inline">
                    <select name="companyTypeSearch" lay-filter="companyTypeSearch" lay-verify="required">
                        <option value="">请选择</option>
                        <option value="1">总公司</option>
                        <option value="2">子公司</option>
                        <option value="3">门店</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">公司</label>
                <div class="layui-input-inline">
                    <select name="companyIdSearch" lay-filter="companyIdSearch" lay-verify="required"
                            id="companyIdSearch">
                        <option value="">请选择</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <button class="layui-btn" data-type="search"><i class="layui-icon layui-icon-search"></i></button>
            </div>
        </div>
    </div>
    <#--表格:显示仓库-->
    <table id="stock" lay-filter="stock"></table>
</div>

<#--表单：仓库数据-->
<form id="stockForm" class="layui-form stockForm layui-form-pane layui-personal" action=""
      lay-filter="stockForm" hidden="true">
    <div class="layui-form-item" hidden>
        <label class="layui-form-label">仓库ID</label>
        <div class="layui-input-block">
            <input type="text" name="stockId" <#--lay-verify="required"--> autocomplete="off" placeholder=""
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">仓库编号</label>
        <div class="layui-input-block">
            <input type="text" name="stockCode" <#--lay-verify="required"--> autocomplete="off" placeholder=""
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">公司分类</label>
        <#--<span id="addCompanyType"></span>-->
        <div class="layui-input-block">
            <select name="addCompanyType" lay-filter="addCompanyType" lay-verify="required">
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">公司</label>
        <#--<span id="addCompany"></span>-->
        <div class="layui-input-block">
            <select name="addCompany" lay-filter="addCompany" lay-verify="required">
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired">负责人</label>
        <div class="layui-input-block">
            <input type="text" name="responsiblePerson" lay-verify="required" autocomplete="off" placeholder=""
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired">仓库类型</label>
        <div class="layui-input-block">
            <select name="stockType" class="stockType" lay-filter="stockType" lay-verify="required">
                <option value="" selected="selected">请选择</option>
                <option value="0">普通仓库</option>
                <option value="1">其他仓库</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired">是否允许负仓库</label>
        <div class="layui-input-block">
            <input type="checkbox" name="allowableNegativeInventory" lay-filter="allowableNegativeInventory"
                   lay-skin="switch" lay-text="是|否">
        </div>
    </div>
    <div class="layui-form-item" hidden="hidden">
        <label class="layui-form-label xrequired">启用</label>
        <div class="layui-input-block">
            <input type="checkbox" name="isUse" lay-filter="isUse" lay-skin="switch" lay-text="是|否"
                   <#--lay-verify="required"-->>
        </div>
    </div>
    <div class="layui-form-item" hidden>
        <label class="layui-form-label xrequired">是否启用仓位</label>
        <div class="layui-input-block">
            <input type="checkbox" name="isStockPlace" lay-filter="isStockPlace" lay-skin="switch"
                   <#--lay-verify="required"-->
                   lay-text="是|否">
        </div>
    </div>
    <#--<div class="layui-form-item">-->
        <#--<label class="layui-form-label">积分比例</label>-->
        <#--<div class="layui-input-block">-->
            <#--<input type="text" name="integralPercent" &lt;#&ndash;lay-verify="required"&ndash;&gt; autocomplete="off" placeholder=""-->
                   <#--class="layui-input">-->
        <#--</div>-->
    <#--</div>-->
    <div class="layui-form-item">
        <label class="layui-form-label xrequired">选择地区</label>
        <div class="layui-input-block">
            <div class="layui-inline">
                <select name="provinceId" class="province" lay-filter="province">
                </select>
            </div>
            <div class="layui-inline">
                <select name="cityId" class="city" lay-filter="city">
                </select>
            </div>
            <div class="layui-inline">
                <select name="countyId" class="county" lay-filter="county">
                </select>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired">地址</label>
        <div class="layui-input-block">
            <input type="text" name="stockAddress" lay-verify="required" autocomplete="off" placeholder=""
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired">电话</label>
        <div class="layui-input-block">
            <input type="text" name="phone" lay-verify="required" autocomplete="off" placeholder=""
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">备注</label>
        <div class="layui-input-block">
            <input type="text" name="remark" <#--lay-verify="required"--> autocomplete="off" placeholder=""
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" hidden>
        <label class="layui-form-label">状态</label>
        <div class="layui-input-block">
            <input type="text" name="status" <#--lay-verify="required"--> autocomplete="off" placeholder=""
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" hidden>
        <label class="layui-form-label">创建时间</label>
        <div class="layui-input-block">
            <input type="text" name="createTime" <#--lay-verify="required"--> autocomplete="off" placeholder=""
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" hidden>
        <label class="layui-form-label">创建人</label>
        <div class="layui-input-block">
            <input type="text" name="createOperator" <#--lay-verify="required"--> autocomplete="off" placeholder=""
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" hidden>
        <label class="layui-form-label">修改人</label>
        <div class="layui-input-block">
            <input type="text" name="modifyOperator" <#--lay-verify="required"--> autocomplete="off" placeholder=""
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" hidden>
        <label class="layui-form-label">修改时间</label>
        <div class="layui-input-block">
            <input type="text" name="dataChangeLastTime" <#--lay-verify="required"--> autocomplete="off"
                   placeholder=""
                   class="layui-input">
        </div>
    </div>
</form>

<script type="text/html" id="stockDemo">
    <#--{{#  if(d.dataStatus == 0){ }}-->
    <#--<a class="layui-btn layui-btn-xs layui-btn-primary" lay-event="audit">审核</a>-->
    <#--<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="edit">编辑</a>-->
    <#--{{#  } }}-->
    <#--{{#  if(d.dataStatus == 1){ }}-->
    <#--<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="edit">编辑</a>-->
    <#--{{#  } }}-->
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="edit">编辑</a>
</script>

<script>
    var allowableNegativeInventory, isUse, isStockPlace, table, form, laydate, stock,
        companyType = "${currentUser.companyType!}",
        companyId = "${currentUser.companyId!}",
        companyName = "${currentUser.companyName!}";
    //数据显示,分页实现
    layui.use(['table', 'form', 'laydate'], function () {
        table = layui.table;
        form = layui.form;
        laydate = layui.laydate;

        loadCompanyTypeAdd();
        loadCompanyTypeSearch();

        table.render({
            elem: '#stock'
            , url: productHost + "/stock/selectStockList"
            , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , page: true          //显示分页默认不显示
            , method: 'post'
            , id: 'stockReload'
            , request: {
                pageName: 'pageNum', //页码的参数名称，默认：page
                limitName: 'pageSize' //每页数据量的参数名，默认：limit
            }
            , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                return {
                    "code": 0, //解析接口状态
                    "msg": res.responseStatusType.error.errorMsg, //解析提示文本
                    "count": res.result == null ? 0 : res.result.length, //解析数据长度
                    "data": res.result == null ? 0 : res.result //解析数据列表
                }
            }
            , where: {
                companyType: companyType,
                companyId: companyId,
                isSon: true
            }
            , cols: [[
                {type: 'checkbox', fixed: 'left', width: 40, hide: true}
                , {field: 'stockCode', title: '仓库编码', sort: true, fixed: 'left'}
                , {field: 'company', title: '仓库所属公司', width: 320}
                , {
                    field: 'companyType', title: '公司分类', templet: function (d) {
                        if (d.companyType == 1) {
                            return "总公司";
                        } else if (d.companyType == 2) {
                            return "子公司";
                        } else {
                            return "分公司";
                        }
                    }
                }
                , {
                    field: 'stockType', title: '仓库类型', templet: function (d) {
                        if (d.stockType == "0") {
                            return "普通仓库";
                        } else {
                            return "其他仓库";
                        }
                    }
                }
                , {
                    field: 'allowableNegativeInventory', title: '是否允许负库存', templet: function (d) {
                        if (d.allowableNegativeInventory == 1) {
                            return "是";
                        } else {
                            return "否";
                        }
                    }
                }
                // , {
                //     field: 'isUse', title: '是否启用', templet: function (d) {
                //         if (d.isUse == 1) {
                //             return "是";
                //         } else {
                //             return "否";
                //         }
                //     }
                // }
                , {
                    field: 'dataStatus', title: '数据状态', templet: function (d) {
                        if (d.dataStatus == 1) {
                            return "已审核";
                        } else {
                            return "待审核";
                        }
                    }
                }
                , {field: 'stockAddress', title: '仓库地址'}
                , {fixed: 'right', title: '操作', width: 120, align: 'left', toolbar: '#stockDemo'}
            ]]
        });

        //监听公司分类的选择
        form.on('select(companyTypeSearch)', function (data) {
            if (data.value == 1 || data.value == 2) {
                $(".demoTable select[name='companyIdSearch']").empty();
                var companyTypeSearch = data.value;
                //请求公司
                var company = loadCompany(companyTypeSearch);
                $(".demoTable select[name='companyIdSearch']").val("<option value='' selected>请选择</option>");
                if (companyType == companyTypeSearch) {
                    var option = "<option value='" + companyId + "'>" + companyName + "</option>";
                    $(".demoTable select[name='companyIdSearch']").append(option);
                } else {
                    if (companyTypeSearch == 1) {
                        for (var p in company) {
                            var option = "<option value='" + company[p].companyId + "'>" + company[p].companyName + "</option>";
                            $(".demoTable select[name='companyIdSearch']").append(option);
                        }
                    }
                    if (companyTypeSearch == 2) {
                        for (var p in company) {
                            var option = "<option value='" + company[p].subsidiaryId + "'>" + company[p].subsidiaryName + "</option>";
                            $(".demoTable select[name='companyIdSearch']").append(option);
                        }
                    }
                    if (companyTypeSearch == 3) {
                        for (var p in company) {
                            var option = "<option value='" + company[p].storeId + "'>" + company[p].name + "</option>";
                            $(".demoTable select[name='companyIdSearch']").append(option);
                        }
                    }
                }
            } else if (data.value == 3) {
                loadFilialeSearch(form);
            }
            form.render("select", "demoTable");
        });
        form.on('select(companyTypeAdd)', function (data) {
            if (data.value == 1 || data.value == 2) {
                $(".demoTable select[name='companyIdAdd']").empty();
                var companyTypeSelect = data.value;
                //请求公司
                var company = loadCompany(companyTypeSelect);
                $(".demoTable select[name='companyIdAdd']").val("<option value='' selected>请选择</option>");
                if (companyType == companyTypeSelect) {
                    var option = "<option value='" + companyId + "'>" + companyName + "</option>";
                    $(".demoTable select[name='companyIdAdd']").append(option);
                } else {
                    if (companyTypeSelect == 1) {
                        for (var p in company) {
                            var option = "<option value='" + company[p].companyId + "'>" + company[p].companyName + "</option>";
                            $(".demoTable select[name='companyIdAdd']").append(option);
                        }
                    }
                    if (companyTypeSelect == 2) {
                        for (var p in company) {
                            var option = "<option value='" + company[p].subsidiaryId + "'>" + company[p].subsidiaryName + "</option>";
                            $(".demoTable select[name='companyIdAdd']").append(option);
                        }
                    }
                    if (companyTypeSelect == 3) {
                        for (var p in company) {
                            var option = "<option value='" + company[p].storeId + "'>" + company[p].name + "</option>";
                            $(".demoTable select[name='companyIdAdd']").append(option);
                        }
                    }
                }
            } else if (data.value == 3) {
                loadFilialeAdd(form);
            }
            form.render("select", "demoTable");
        });
        form.on('select(companyType)', function (data) {
            $("#stockForm select[name='company']").empty();
            var companyType = data.value;
            //请求公司
            var company = loadCompany(companyType);
            $("#stockForm select[name='company']").val("<option value='' selected>请选择</option>");
            if (companyType == 1) {
                for (var p in company) {
                    var option = "<option value='" + company[p].companyId + "'>" + company[p].companyName + "</option>";
                    $("#stockForm select[name='company']").append(option);
                }
            }
            if (companyType == 2) {
                for (var p in company) {
                    var option = "<option value='" + company[p].subsidiaryId + "'>" + company[p].subsidiaryName + "</option>";
                    $("#stockForm select[name='company']").append(option);
                }
            }
            if (companyType == 3) {
                for (var p in company) {
                    var option = "<option value='" + company[p].storeId + "'>" + company[p].name + "</option>";
                    $("#stockForm select[name='company']").append(option);
                }
            }
            form.render("select", "stockForm");
        });

        //监听开关
        form.on('switch(allowableNegativeInventory)', function (data) {
            //开关是否开启，true或者false
            var checked = data.elem.checked;
            if (checked) {
                allowableNegativeInventory = true;
            } else {
                allowableNegativeInventory = false;
            }
        });
        form.on('switch(isUse)', function (data) {
            //开关是否开启，true或者false
            var checked = data.elem.checked;
            if (checked) {
                isUse = true;
            } else {
                isUse = false;
            }
        });
        form.on('switch(isStockPlace)', function (data) {
            //开关是否开启，true或者false
            var checked = data.elem.checked;
            if (checked) {
                isStockPlace = true;
            } else {
                isStockPlace = false;
            }
        });

        var $ = layui.$, active = {
            add: function () {
                var companyType = $(".demoTable select[name='companyTypeAdd'] option:selected").val(),
                    companyTypeName = $(".demoTable select[name='companyTypeAdd'] option:selected").text(),
                    company = $(".demoTable select[name='companyIdAdd'] option:selected").val(),
                    companyName = $(".demoTable select[name='companyIdAdd'] option:selected").text();
                if (companyType == null || companyType == 0) {
                    layer.msg("请选择公司分类!");
                    return
                }
                if (company == null || company == 0) {
                    layer.msg("请选择公司!");
                    return
                }
                //判断公司是否有仓库
                checkStock(companyType, company);
                if (stock != null && stock != [] && stock.length > 0) {
                    layer.msg("此公司已经有仓库，不能添加");
                    return
                }
                var a2 = layer.open({
                    type: 1,
                    title: '添加仓库',
                    content: $('#stockForm'),
                    closeBtn: 1,
                    btn: ['提交', '取消'],
                    yes: function (index, layero) {
                        form.on('submit(formVerify)', function (data) {
                            $.ajax({
                                type: "POST",
                                url: productHost + "/stock/addStock",
                                data: $('#stockForm').serialize() + "&companyType=" + companyType +
                                    "&companyId=" + company +
                                    "&company=" + companyName +
                                    "&createOperator=" + "${currentUser.trueName!}",
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
                                            , content: '添加成功！'
                                            , btn: ["关闭"]
                                            , yes: function (index) {
                                                layer.close(index); //如果设定了yes回调，需进行手工关闭
                                            }, end: function () {
                                                layer.close(a2);
                                                $("#reset").click();//重置表单
                                                table.reload("stockReload");
                                            }
                                        });
                                    }
                                }
                            });
                            return false;


                        })
                        // layer.close(); //如果设定了yes回调，需进行手工关闭
                    },
                    btn2: function () {
                        layer.close(a2);
                    },
                    success: function (layero) {
                        layero.addClass('layui-form');
                        layero.find('.layui-layer-btn0').attr('lay-filter', 'formVerify').attr('lay-submit', '');
                        //省市级赋值
                        var data1 = {"provinceId": "110000", "cityId": "110100", "countyId": "110101"}//默认北京
                        query(form, data1);
                        /*监听省select*/
                        form.on('select(province)', function (data1) {
                            cityChange(form, data1.value, "", "")
                        });
                        /*监听市select*/
                        form.on('select(city)', function (data1) {
                            countyChange(form, data1.value, "")
                        });
                        form.val('stockForm', {
                            "stockId": ""     // "name": "value"
                            , "stockCode": "自动生成"
                            , "companyType": companyType
                            /*  ,"company": company*/
                            , "responsiblePerson": ""
                            , "stockType": ""
                            , "allowableNegativeInventory": false //开关状态
                            , "isUse": false //开关状态
                            , "isStockPlace": false //开关状态
                            // , "integralPercent": ""
                            , "stockAddress": ""
                            , "phone": ""
                            , "remark": ""
                        });
                        layero.find("select[name='addCompanyType']").html("<option value='" + companyType + "'>" + companyTypeName + "</option>")
                        layero.find("select[name='addCompany']").html("<option value='" + companyId + "'>" + companyName + "</option>");
                        layero.find("input[name='stockCode']").attr("disabled", "disabled");
                        layero.find("select[name='companyType']").attr("disabled", "disabled");
                        layero.find("select[name='company']").attr("disabled", "disabled");
                        layero.find("input[name='createOperator']").parent().parent().hide();
                        layero.find("input[name='modifyOperator']").parent().parent().hide();
                        layero.find("input[name='status']").parent().parent().hide();
                        layero.find("input[name='createTime']").parent().parent().hide();
                        layero.find("input[name='dataChangeLastTime']").parent().parent().hide();
                        form.render();
                    },
                    area: ['600px', '500px'],
                    // end: function () {
                    //     window.location.reload();
                    // }
                });
            }, search: function () {
                var companyType1 = $(".demoTable select[name='companyTypeSearch'] option:selected").val(),
                    company1 = $(".demoTable select[name='companyIdSearch'] option:selected").val();
                var param = {isSon:true};
                if(companyType1 != null && companyType1 != ""){
                    param.companyType= companyType1;
                }
                if(company1!=null && company1 != ""){
                    param.companyId=company1;
                }
                table.reload('stockReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    , where: param
                }, 'data');
            }
        };

        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        //编辑、审核、入库、出库
        table.on('tool(stock)', function (obj) {
            var data = obj.data;
            if (obj.event === 'edit') {
                editStock(data);
                // } else if (obj.event === 'audit') {
                //     auditStock(data);
            }
        });
    });

    //检查仓库
    function checkStock(comType, com) {
        stock = [];
        $.ajax({
            url: productHost + "/stock/selectStockList",
            data: {companyType: comType, companyId: com},
            method: "POST",
            async: false,
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    stock = res.result;
                }
            }
        });
    }

    //编辑仓库
    function editStock(data) {
        var a1 = layer.open({
            type: 1,
            title: '修改仓库',
            content: $('#stockForm'),
            closeBtn: 1,
            btn: ['提交', '取消'],
            yes: function (index, layero) {
                form.on('submit(formVerify)', function (dataIn) {
                    $.ajax({
                        type: "POST",
                        url: productHost + "/stock/updateStockById",
                        data: $('#stockForm').serialize() + "&companyType=" + data.companyType +
                            "&companyId=" + data.companyId +
                            "&company=" + data.company +
                            "&modifyOperator=" + "${currentUser.trueName!}",
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
                                    title: '修改'
                                    , content: '修改成功！'
                                    , btn: ["关闭"]
                                    , yes: function (index) {
                                        layer.close(index); //如果设定了yes回调，需进行手工关闭
                                    }, end: function () {
                                        layer.close(a1);
                                        $("#reset").click();//重置表单
                                        table.reload("stockReload");
                                    }
                                });
                            }
                        }
                    });
                    return false;
                });
            },
            btn2: function () {
                layer.close(a1);
            },
            success: function (layero) {
                layero.addClass('layui-form');
                layero.find('.layui-layer-btn0').attr('lay-filter', 'formVerify').attr('lay-submit', '');
                //省市级赋值
                query(form, data);
                /*监听省select*/
                form.on('select(province)', function (data) {
                    cityChange(form, data.value, "", "")
                });
                /*监听市select*/
                form.on('select(city)', function (data) {
                    countyChange(form, data.value, "")
                });
                form.val('stockForm', {
                    "stockId": data.stockId     // "name": "value"
                    , "stockCode": data.stockCode  //后台生成
                    , "responsiblePerson": data.responsiblePerson
                    , "stockType": data.stockType
                    , "allowableNegativeInventory": data.allowableNegativeInventory //开关状态
                    , "isUse": data.isUse //开关状态
                    , "isStockPlace": data.isStockPlace //开关状态
                    // , "integralPercent": data.integralPercent
                    , "stockAddress": data.stockAddress
                    , "phone": data.phone
                    , "remark": data.remark
                });
                var companyName = "";
                if (data.companyType == 1) {
                    companyName = "总公司"
                } else if (data.companyType == 2) {
                    companyName = "子公司"
                } else if (data.companyType == 3) {
                    companyName = "分公司"
                }
                layero.find("select[name='addCompanyType']").append("<option value='" + data.companyType + "'>" + companyName + "</option>")
                layero.find("select[name='addCompany']").append("<option value='" + data.companyId + "'>" + data.company + "</option>");

                layero.find("input[name='stockCode']").attr("disabled", "disabled");
                //编辑隐藏创建人和编辑人
                layero.find("input[name='createOperator']").parent().parent().hide();
                layero.find("input[name='modifyOperator']").parent().parent().hide();
                layero.find("input[name='status']").parent().parent().hide();
                layero.find("input[name='createTime']").parent().parent().hide();
                layero.find("input[name='dataChangeLastTime']").parent().parent().hide();
                form.render();
            },
            area: ['600px', '500px'],
            // end: function () {
            //     window.location.reload();
            // }
        });
    }

    //审核仓库
    <#--function auditStock(data) {-->
    <#--var url = productHost + "/stock/auditStock";-->
    <#--var params = {-->
    <#--stockId: data.stockId,-->
    <#--auditor: "${currentUser.trueName!}",-->
    <#--auditStatus: "1"-->
    <#--};-->
    <#--$.post(url, params, function (res) {-->
    <#--if (res.responseStatusType.message == "Success") {-->
    <#--layer.open({-->
    <#--title: '审核'-->
    <#--, content: '审核成功！'-->
    <#--, btn: ["关闭"]-->
    <#--});-->
    <#--//重新加载表格-->
    <#--table.reload("stockReload");-->
    <#--} else {-->
    <#--layer.open({-->
    <#--title: '审核'-->
    <#--, content: '审核失败！'-->
    <#--, btn: ["关闭"]-->
    <#--});-->
    <#--}-->
    <#--})-->
    <#--}-->

    //加载公司
    function loadCompany(id) {
        var company = [];
        /*        if (id == 1) {    //总公司
                    $.ajax({
                        url: storeHost + "/manage/company/selectCompanyListNoPage",
                        // data: param,
                        method: "POST",
                        async: false,
                        success: function (res) {
                            if (res.responseStatusType.message == "Success") {
                                company = res.result;
                            }
                        }
                    });
                    return company;
                }*/
        if (id == 2) {    //子公司
            $.ajax({
                url: storeHost + "/manage/company/selectSubsidiaryList",
                data: {"companyId": companyId},
                method: "POST",
                async: false,
                success: function (res) {
                    if (res.responseStatusType.message == "Success") {
                        company = res.result.list;
                    }
                }
            });
            return company;
        }
        if (id == 3) {    //分公司
            $.ajax({
                url: storeHost + "/manage/store/selectStoreListNoPage",
                data: {"subCompanyId": companyId},
                method: "POST",
                async: false,
                success: function (res) {
                    if (res.responseStatusType.message == "Success") {
                        company = res.result;
                    }
                }
            });
            return company;
        }
    }


    function loadCompanyTypeAdd() {
        if (companyType == 1) {
            $(".demoTable select[name='companyTypeAdd']").empty();
            var option = "<option value=''>请选择</option><option value='1'>总公司</option><option value='2'>子公司</option><option value='3'>分公司</option>";
            $(".demoTable select[name='companyTypeAdd']").append(option);
        } else if (companyType == 2) {
            $(".demoTable select[name='companyTypeAdd']").empty();
            var option = "<option value=''>请选择</option><option value='2'>子公司</option><option value='3'>分公司</option>";
            $(".demoTable select[name='companyTypeAdd']").append(option);
        } else if (companyType == 3) {
            $(".demoTable select[name='companyTypeAdd']").empty();
            var option = "<option value=''>请选择</option><option value='3'>分公司</option>";
            $(".demoTable select[name='companyTypeAdd']").append(option);
        }
        form.render("select", "demoTable")
    }

    function loadCompanyTypeSearch() {
        if (companyType == 1) {
            $(".demoTable select[name='companyTypeSearch']").empty();
            var option = "<option value=''>请选择</option><option value='1'>总公司</option><option value='2'>子公司</option><option value='3'>分公司</option>";
            $(".demoTable select[name='companyTypeSearch']").append(option);
        } else if (companyType == 2) {
            $(".demoTable select[name='companyTypeSearch']").empty();
            var option = "<option value=''>请选择</option><option value='2'>子公司</option><option value='3'>分公司</option>";
            $(".demoTable select[name='companyTypeSearch']").append(option);
        } else if (companyType == 3) {
            $(".demoTable select[name='companyTypeSearch']").empty();
            var option = "<option value=''>请选择</option><option value='3'>分公司</option>";
            $(".demoTable select[name='companyTypeSearch']").append(option);
        }
        form.render("select", "demoTable")
    }

    //初始化子公司分组列表-添加
    function loadFilialeAdd(form) {
        var url = storeHost + "/manage/store/selectSubCompanyAndStoreNoPage";
        var data = {companyId: "${currentUser.companyId!}", companyType: "${currentUser.companyType!}"};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("companyIdAdd"); //server为select定义的id
                server.innerHTML = "<option value='' selected='selected'>直接选择或搜索选择</option>";
                for (var p in list) {
                    var optgroup = document.createElement("optgroup");  // 创建添加optgroup属性
                    optgroup.setAttribute("label", list[p].subsidiaryName); // 给optgroup的label添加值
                    optgroup.setAttribute("value", list[p].subsidiaryId); // 给optgroup的label添加值
                    var storeVOList = list[p].storeVOList;
                    for (var n in storeVOList) {
                        var option = document.createElement("option");  // 创建添加option属性
                        option.setAttribute("value", storeVOList[n].storeId); // 给option的value添加值
                        option.innerText = storeVOList[n].name;     // 打印option对应的纯文本
                        optgroup.appendChild(option)
                    }
                    server.appendChild(optgroup);           //给select添加option子标签
                }
                form.render();
            } else {

            }
        })
    }

    //初始化子公司分组列表-搜索
    function loadFilialeSearch(form) {
        var url = storeHost + "/manage/store/selectSubCompanyAndStoreNoPage";
        var data = {companyId: "${currentUser.companyId!}", companyType: "${currentUser.companyType!}"};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("companyIdSearch"); //server为select定义的id
                server.innerHTML = "<option value='' selected='selected'>直接选择或搜索选择</option>";
                for (var p in list) {
                    var optgroup = document.createElement("optgroup");  // 创建添加optgroup属性
                    optgroup.setAttribute("label", list[p].subsidiaryName); // 给optgroup的label添加值
                    optgroup.setAttribute("value", list[p].subsidiaryId); // 给optgroup的label添加值
                    var storeVOList = list[p].storeVOList;
                    for (var n in storeVOList) {
                        var option = document.createElement("option");  // 创建添加option属性
                        option.setAttribute("value", storeVOList[n].storeId); // 给option的value添加值
                        option.innerText = storeVOList[n].name;     // 打印option对应的纯文本
                        optgroup.appendChild(option)
                    }
                    server.appendChild(optgroup);           //给select添加option子标签
                }
                form.render();
            } else {

            }
        })
    }

</script>
</body>
</html>