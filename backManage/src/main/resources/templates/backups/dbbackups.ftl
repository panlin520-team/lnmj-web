<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>数据导入</title>
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

<#--业绩表格-->
<div class="layui-fluid">
    <div class="demoTable layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label" style="width: 154px;">请选择要导入数据的类型</label>
            <div class="layui-input-inline">
                <select name="type" id="type" lay-filter="type">
                    <option>请选择</option>
                    <option value="1">物料-产品</option>
                    <option value="2">物料-服务</option>
                    <option value="3">供应商</option>
                    <option value="4">会员</option>
                </select>
            </div>
            <div class="layui-inline">
                <div class="layui-btn-group demoTable">
                    <button type="button" class="layui-btn" id="backups">选择文件</button>
                    <button type="button" class="layui-btn" id="upfile"><i class="layui-icon"></i>导入</button>
                </div>
                <span class="layui-inline layui-upload-choose" id="filenameShow"></span>
            </div>
        </div>
    </div>
</div>
<#--<div class="layui-progress layui-progress-big" lay-showpercent="true" lay-filter="demo">-->
    <#--<div class="layui-progress-bar layui-bg-red" lay-percent="0%"></div>-->
<#--</div>-->


<script>

    layui.use(['table', 'layer', 'jquery', 'form', 'upload'], function () {
        var upload = layui.upload;
        var form = layui.form;
        var typeNum;
        var typeValue;
        var num;
        var param;

        form.on('select(type)', function (data, typeNum) {
            if (data.value === "1") {
                num = "1";
                param = dataHost + "/backups/backupsProduct";
                upfile(upload, param,data)
            } else if (data.value === "2") {
                num = "2";
                param = dataHost + "/backups/backupsServiceProduct";
                upfile(upload, param,data)
            } else if (data.value === "3") {
                num = "3";
                param = dataHost + "/backups/backupsSupplier";
                upfile(upload, param,data)
            } else if (data.value === "4") {
                num = "4";
                param = dataHost + "/backups/backupsMember";
                upfile(upload, param,data)
            }
        });


        //导入按钮点击事件
        $("#backups").click(function () {
            typeValue = $("#type option:selected").val();//jq 获取下拉框的值
            if (typeValue == '请选择') {
                layer.msg("请选择要导入的数据类型");
                return false;
            }
        });
    });


    function upfile(upload, param) {
        upload.render({
            elem: '#backups' //绑定元素
            , url: param
            , accept: 'file' //普通文件
            , auto: false //选择文件后不自动上传
            , bindAction: '#upfile' //指向一个按钮触发上传
            , choose: function (obj) {
                obj.preview(function (index, file, result) {
                    $("#filenameShow").html(file.name);
                    // console.log(index); //得到文件索引
                    // console.log(file); //得到文件对象
                    // console.log(result); //得到文件base64编码，比如图片
                });
            }
            , done: function (res) {
                if (res.responseStatusType.message === "Success") {
                    layer.open({
                        title: '操作成功'
                        , content: "导入成功"
                        , btn: ["关闭"],
                        yes: function (index) {
                            layer.close(index); //如果设定了yes回调，需进行手工关闭
                        }
                    });
                } else {
                    alert(res.responseStatusType.error.errorMsg)
                    return;
                }
                //上传完毕回调
            }
            , error: function () {
                //请求异常回调
            }
        });
    }

    //添加按钮点击事件-职位
    $("#addPost").click(function () {
        $("#resetPost").click();//重置表单(新建时在进入表单前要重置一下表单的内容，不然表单打开后会显示上一次的表单的内容。这里调用表单中重置按钮的点击方法来重置)
        addForm = layer.open({//开启表单弹层
            // // skin: 'layui-layer-molv',
            area: '60%',
            type: 1,
            id: "addAchiPostFormReload",
            title: '新建业绩职位',
            content: $('#addAchiPostForm'), //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
            success: function () {
                $("button[name='resetName']").attr("style", "display: inline;");

                $("div[name='singlePrizediv']").attr("style", "display:none;");
                $("div[name='zhongyejiRatiodiv']").attr("style", "display:none;");
                $("input[name='singlePrize']").attr("lay-verify", "");
                $("input[name='zhongyejiRatio']").attr("lay-verify", "");

            }
        });
    });


    //删除业绩按钮事件
    function layerDelete(data, table, $) {
        //删除数据库数据
        var url = dataHost + "/performance/deletePerformanceByID";
        var data = {
            "id": data.id,
            "modifyOperator": "${currentUser.trueName!}"
        };
        $.post(url, data, function (res) {
            if (res.responseStatusType.message == "Success") {
                layer.open({
                    title: '删除'
                    , content: '删除成功！'
                });
                //重新加载表格
                table.reload("listStoreAchievementTable");
            } else {
                layer.open({
                    title: '删除'
                    , content: '删除失败！'
                });
            }
        })
    }

    //删除业绩职务按钮事件
    function layerPostDelete(data, table, $) {
        //删除数据库数据
        var url = dataHost + "/performance/deletePerformancePostByID";
        var data = {
            "performanceId": data.achievementID,
            "performancePostId": data.id,
            "modifyOperator": "${currentUser.trueName!}"
        };
        $.post(url, data, function (res) {
            if (res.responseStatusType.message == "Success") {
                layer.open({
                    title: '删除'
                    , content: '删除成功！'
                });
                //重新加载表格
                table.reload("listStoreAchievementPostTable");
            } else {
                layer.open({
                    title: '删除'
                    , content: '删除失败！'
                });
            }
        })
    }

    //修改业绩职位
    function edit(data, table, $, form) {
        //页面弹框
        addForm = layer.open({
            type: 1,
            title: '编辑业绩职位',
            content: $('#editAchiPostForm'),
            closeBtn: 1,
            area: ['600px', '500px'],
            success: function (layero) {
                $("input[name='singlePrize']").attr("lay-verify", "");
                $("input[name='zhongyejiRatio']").attr("lay-verify", "");
                $("button[name='resetName']").attr("style", "display: none;");
                var param = {};
                if (data.achievementMethods === 1) {
                    $("div[name='singlePrizediv']").attr("style", "display:block;");
                    $("div[name='zhongyejiRatiodiv']").attr("style", "display:none;");
                    param = {
                        "id": data.id
                        , "achievementPostCategoryID": data.achievementPostCategoryID
                        , "achievementMethods": data.achievementMethods
                        , "achievementInterval": data.achievementInterval
                        , "achievementStore": data.achievementStore
                        , "achievementStoreId": data.achievementStoreId
                        , "isBasicSalary": data.isBasicSalary
                        , "singlePrize": data.ladderValue
                        , "achievementPostName": data.achievementPostName
                    }
                } else if (data.achievementMethods === 2) {
                    $("div[name='singlePrizediv']").attr("style", "display:none;");
                    $("div[name='zhongyejiRatiodiv']").attr("style", "display:block;");
                    param = {
                        "id": data.id
                        , "achievementPostCategoryID": data.achievementPostCategoryID
                        , "achievementMethods": data.achievementMethods
                        , "achievementInterval": data.achievementInterval
                        , "achievementStore": data.achievementStore
                        , "achievementStoreId": data.achievementStoreId
                        , "isBasicSalary": data.isBasicSalary
                        , "zhongyejiRatio": data.ladderValue
                        , "achievementPostName": data.achievementPostName
                    }
                } else {
                    $("div[name='singlePrizediv']").attr("style", "display:none;");
                    $("div[name='zhongyejiRatiodiv']").attr("style", "display:none;");
                    param = {
                        "id": data.id
                        , "achievementPostCategoryID": data.achievementPostCategoryID
                        , "achievementMethods": data.achievementMethods
                        , "achievementInterval": data.achievementInterval
                        , "achievementStore": data.achievementStore
                        , "achievementStoreId": data.achievementStoreId
                        , "isBasicSalary": data.isBasicSalary
                        , "achievementPostName": data.achievementPostName
                    }
                }
                form.val('editAchPost', param);
                form.render();
            }
        });
    }


    //加载职位分类信息
    function loadPostCate(form, postIndustryIDSearch) {
        var url = storeHost + "/manage/beautician/selectPostCategoryNoPage";
        var data = {"postIndustryIDSearch": postIndustryIDSearch};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("achievementPostCategoryIDAdd"); //server为select定义的id
                server.innerHTML = "<option value='' selected='selected'>请选择</option>";
                for (var p in list) {
                    var option = document.createElement("option");  // 创建添加option属性
                    option.setAttribute("value", list[p].postCategoryId); // 给option的value添加值
                    option.innerText = list[p].name;     // 打印option对应的纯文本
                    server.appendChild(option);           //给select添加option子标签
                }
                form.render();
            } else {

            }
        })
    }

    //加载职位分类信息
    function loadPostCateEdit(form, postIndustryIDSearch) {
        var url = storeHost + "/manage/beautician/selectPostCategoryNoPage";
        var data = {"postIndustryIDSearch": postIndustryIDSearch};
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

                }
                if (data.responseStatusType.message == 'Success') {
                    var list = data.result;    //返回的数据
                    var server = document.getElementById("achievementPostCategoryIDEdit"); //server为select定义的id
                    server.innerHTML = "<option value='' selected='selected'>请选择</option>";
                    for (var p in list) {
                        var option = document.createElement("option");  // 创建添加option属性
                        option.setAttribute("value", list[p].postCategoryId); // 给option的value添加值
                        option.innerText = list[p].name;     // 打印option对应的纯文本
                        server.appendChild(option);           //给select添加option子标签
                    }
                    form.render();
                }
            }
        });
    }

    //加载行业信息
    function loadAchievementIndustry(form) {
        var url = storeHost + "/manage/industry/selectListIndustryNoPage";
        var data = {};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("achievementIndustryID"); //server为select定义的id
                server.innerHTML = "<option value='' selected='selected'>请选择</option>";
                for (var p in list) {
                    var option = document.createElement("option");  // 创建添加option属性
                    option.setAttribute("value", list[p].industryID); // 给option的value添加值
                    option.innerText = list[p].industryName;     // 打印option对应的纯文本
                    server.appendChild(option);           //给select添加option子标签
                }
                form.render();
            } else {

            }
        })
    }

    //加载业绩类型枚举
    function loadAchievementType(form) {
        var url = orderHost + "/order/selectOrderTypeListForYeji";
        var data = {};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("achievementType"); //server为select定义的id
                server.innerHTML = "<option value='' selected='selected'>请选择</option>";
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


    //加载店铺信息-添加中
    function loadShopAdd(form) {
        var paramJson = {};
        if ("${currentUser.companyType!}" == 1) {
            //如果是总公司
            paramJson = {"companyId": "${currentUser.companyId!}"}
        } else if ("${currentUser.companyType!}" == 2) {
            //如果是子公司
            paramJson = {"subCompanyId": "${currentUser.companyId!}"}
        }
        var url = storeHost + "/manage/store/selectStoreListNoPage";
        var data = paramJson;
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("achievementStoreId"); //server为select定义的id
                server.innerHTML = "<option value='' selected='selected'>请选择</option>";
                for (var p in list) {
                    var option = document.createElement("option");  // 创建添加option属性
                    option.setAttribute("value", list[p].storeId); // 给option的value添加值
                    option.innerText = list[p].name;     // 打印option对应的纯文本
                    server.appendChild(option);           //给select添加option子标签
                }
                form.render();
            } else {

            }
        })
    }


    //加载店铺信息-修改中
    function loadShopEdit(form) {
        var paramJson = {};
        if ("${currentUser.companyType!}" == 1) {
            //如果是总公司
            paramJson = {"companyId": "${currentUser.companyId!}"}
        } else if ("${currentUser.companyType!}" == 2) {
            //如果是子公司
            paramJson = {"subCompanyId": "${currentUser.companyId!}"}
        }
        var url = storeHost + "/manage/store/selectStoreListNoPage";
        var data = paramJson;
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("achievementStoreIdEdit"); //server为select定义的id
                server.innerHTML = "<option value='' selected='selected'>请选择</option>";
                for (var p in list) {
                    var option = document.createElement("option");  // 创建添加option属性
                    option.setAttribute("value", list[p].storeId); // 给option的value添加值
                    option.innerText = list[p].name;     // 打印option对应的纯文本
                    server.appendChild(option);           //给select添加option子标签
                }
                form.render();
            } else {

            }
        })
    }

    //加载业绩提成方式
    function loadAchievementMethods(form) {
        var url = dataHost + "/performance/listAchievementMethods";
        var data = {};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("achievementMethods"); //server为select定义的id
                server.innerHTML = "<option value='' selected='selected'>请选择</option>";
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

    //加载业绩提成方式
    function loadAchievementMethodsEdit(form) {
        var url = dataHost + "/performance/listAchievementMethods";
        var data = {};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("achievementMethodsEdit"); //server为select定义的id
                server.innerHTML = "<option value='' selected='selected'>请选择</option>";
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

    //初始化子公司分组列表
    function loadSubCompanyStore(form) {
        var url = storeHost + "/manage/store/selectSubCompanyAndStoreNoPage";
        var data = {companyId: "${currentUser.companyId!}", companyType: "${currentUser.companyType!}"};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("stores"); //server为select定义的id
                server.innerHTML = "<option value='0' selected='selected'>直接选择或搜索选择</option>";
                for (var p in list) {
                    var optgroup = document.createElement("optgroup");  // 创建添加optgroup属性
                    optgroup.setAttribute("label", list[p].subsidiaryName); // 给optgroup的label添加值
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

    //加载默认业绩有效期
    function loadDefault() {
        var url = systemHost + "/manage/system/selectParameterByWhere";
        var data = {parameterName: "业绩默认有效期"};
        var resultValue = null;
        $.ajax({
            url: url,
            type: "post",
            data: data,
            async: false,
            success: function (result) {
                if (result.responseStatusType.message == "Success") {
                    resultValue = result.result[0].parameterValue;    //返回的数据

                } else {
                }
            }
        });
        return resultValue
    }


</script>


</body>
</html>