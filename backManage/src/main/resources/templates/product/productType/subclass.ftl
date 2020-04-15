<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>商品小类</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${basePath!}/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${basePath!}/css/index.css" media="all"/>
    <script src="${basePath!}/js/jquery.min.js" type="text/javascript"></script>
    <script src="${basePath!}/layui/layui.js" charset="utf-8"></script>
    <script src="${basePath!}/js/host.js" type="text/javascript"></script>
    <#include "../../baseFtl/pageAuth.ftl" />
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
                <label class="layui-form-label">商品大类</label>
                <div class="layui-input-inline">
                    <select name="commodityTypeSearch" lay-filter="commodityTypeSearch" lay-verify="required">
                        <option value="0">请选择</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">客户测评</label>
                <div class="layui-input-inline">
                    <select name="subclassEvaluating" lay-filter="subclassEvaluating" lay-verify="required">
                        <option value="0">请选择</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <button class="layui-btn" data-type="search"><i class="layui-icon layui-icon-search"></i></button>
            </div>
            <div class="layui-inline">
                <button class="layui-btn" onclick="addNewSubclass()">添加小类</button>
            </div>
        </div>
    </div>
<#--表格:显示商品小类-->
    <table id="Subclass" lay-filter="Subclass"></table>
<#--商品小类的表单-->
    <form id="SubclassForm" class="layui-form SubclassForm layui-form-pane layui-personal" action=""
          lay-filter="SubclassForm" hidden="true">
        <div class="layui-form-item" hidden>
            <label class="layui-form-label">商品小类ID</label>
            <div class="layui-input-block">
                <input type="text" name="subclassID" <#--lay-verify="required"--> autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label xrequired">小类名称</label>
            <div class="layui-input-block">
                <input type="text" name="subclassName" id="subclassName" lay-verify="required" autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">所属行业</label>
            <div class="layui-input-inline">
                <input name="industryIdAddShow" id="industryIdAddShow" readonly="readonly"
                       type="text"
                       autocomplete="off" placeholder="请输入行业" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;"
                      <#-- lay-verify="required"-->>
                <input name="industryId" id="industryIdAdd" hidden="true" type="text">
                <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachIndustryIdAdd"><i
                        class="layui-icon layui-icon-search"></i></button>

            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label xrequired">商品大类</label>
            <div class="layui-input-inline">
                <input name="commodityTypeAddShow" id="commodityTypeAddShow" readonly="readonly"
                       type="text"
                       autocomplete="off" placeholder="请输入大类" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;"
                       lay-verify="required">
                <input name="commodityType" id="commodityTypeAdd" hidden="true" type="text">
                <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachCommodityTypeAdd"><i
                        class="layui-icon layui-icon-search"></i></button>

            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label xrequired">职位分类</label>
            <div class="layui-input-block" id="post">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label xrequired">客户评测</label>
            <div class="layui-input-inline">
                <input name="subclassEvaluatingAddShow" id="subclassEvaluatingAddShow" readonly="readonly"
                       type="text"
                       autocomplete="off" placeholder="请输入客户评测" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;"
                       lay-verify="required">
                <input name="subclassEvaluating" id="subclassEvaluatingAdd" hidden="true" type="text">
                <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachSubclassEvaluatingAdd"><i
                        class="layui-icon layui-icon-search"></i></button>

            </div>
        </div>
    </form>

</div>
<#include "../../baseFtl/loadLinkData.ftl" />
<#--小类按钮-->
<script type="text/html" id="SubclassDemo">
    <a class="layui-btn layui-btn-xs" lay-event="show">查看</a>
    <a class="layui-btn layui-btn-xs layui-btn-primary" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script>
    var dataAchievement, dataCommityType, dataEvaluating, dataPostCategory, table, form, postCategoryList = [];
    //数据显示,分页实现
    layui.use(['table', 'form', 'jquery'], function () {
        table = layui.table;
        form = layui.form;
        var $ = layui.jquery;

        loadData()
        //加载行业
        loadIndustry();
        table.render({
            elem: '#Subclass'
            , url: dataHost + "/commodityType/selectSubclassByCondition" //selectSubclassList
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
                    "msg": res.responseStatusType.error.errorMsg, //解析提示文本
                    "count": res.result == null ? 0 : res.result.total, //解析数据长度
                    "data": res.result == null ? 0 : res.result.list //解析数据列表
                }
            }
            , cols: [[
                {type: 'checkbox', fixed: 'left', width: 40, hide: true}
                , {field: 'subclassID', title: '序号', width: 75, sort: true, fixed: 'left'}
                , {field: 'subclassName', title: '小类'}
                , {
                    field: 'commodityTypeID', title: '大类', templet: function (d) {
                        var commodity = ""
                        for (var p in dataCommityType) {
                            if (dataCommityType[p].commodityTypeID == d.commodityTypeID) {
                                commodity = dataCommityType[p].commodityTypeName;
                            }
                        }
                        return commodity;
                    }, sort: true
                }
                , {
                    field: 'postCategoryIds', title: '职位分类', templet: function (d) {
                        var voList = d.postCategoryVOList, post = "";
                        for (var i in voList) {
                            post = post + voList[i].postCategoryName + " ";
                        }
                        return post;
                    }, sort: true
                }
                , {
                    field: 'subclassEvaluatingID', title: '客户评测', templet: function (d) {
                        var evaluating = ""
                        for (var p in dataEvaluating) {
                            if (dataEvaluating[p].evaluatingID == d.subclassEvaluatingID) {
                                evaluating = dataEvaluating[p].evaluatingName;
                            }
                        }
                        return evaluating;
                    }, sort: true
                }
                , {
                    field: 'status', title: '状态', templet: function (d) {
                        if (d.status == 1) {
                            return "正常"
                        } else {
                            return "删除"
                        }
                    }
                }
                , {field: 'createOperator', title: '创建人'}
                , {field: 'createTime', title: '创建时间'}
                , {field: 'modifyOperator', title: '修改人'}
                , {field: 'dataChangeLastTime', title: '修改时间'}
                , {fixed: 'right', title: '操作', width: 180, align: 'center', toolbar: '#SubclassDemo'}
            ]]
            , id: 'SubclassReload'
        });



        /*------行业关联数据查看-添加/修改------*/
        $("#" + "serachIndustryIdAdd").click(function () {
            var url = storeHost + "/manage/industry/selectList";
            var param = {};
            loadLinkData(layer, layui, url, "industryID", "industryName", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "industryIdAddShow").val(data.industryName);
                $("#" + "industryIdAdd").val(data.industryID);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {industryNameKeyword: wordSearch}
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
        /*------大类关联数据查看-添加/修改------*/
        $("#" + "serachCommodityTypeAdd").click(function () {
            var url = dataHost + "/commodityType/selectCommodityTypeList";
            var industryIdAdd = $("input[id='industryIdAdd']").val();
            if(industryIdAdd==""||industryIdAdd==null){
                layer.msg("请先选择所属行业")
                return
            }
            var param = {commodityTypeIndustryID:industryIdAdd};
            loadLinkData(layer, layui, url, "commodityTypeID", "commodityTypeName", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "commodityTypeAddShow").val(data.commodityTypeName);
                $("#" + "commodityTypeAdd").val(data.commodityTypeID);
                loadPostList(form,data.commodityTypeID,data.commodityTypeIndustryID,data.commodityProductType,$);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {searchWord: wordSearch,commodityTypeIndustryID:industryIdAdd}
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
        /*------测评关联数据查看-添加/修改------*/
        $("#" + "serachSubclassEvaluatingAdd").click(function () {
            var url = dataHost + "/evaluating/selectEvaluatingList";
            var industryIdAdd = $("input[id='industryIdAdd']").val();
            if(industryIdAdd==""||industryIdAdd==null){
                layer.msg("请先选择所属行业")
                return
            }
            var param = {evaluatingIndustryID:industryIdAdd};
            loadLinkData(layer, layui, url, "evaluatingID", "evaluatingName", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "subclassEvaluatingAddShow").val(data.evaluatingName);
                $("#" + "subclassEvaluatingAdd").val(data.evaluatingID);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {keyWord: wordSearch,evaluatingIndustryID:industryIdAdd}
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


        //查看，编辑，删除
        table.on('tool(Subclass)', function (obj) {
            var data = obj.data;
            if (obj.event === 'edit') {
                editSubclass(data);
                // layer.msg('ID：'+ data.membershipLevelId + ' 的查看操作');
            } else if (obj.event === 'del') {
                layer.confirm('真的删除ID为' + data.subclassID + '的小类么？', function (index) {
                    delSubclass(data);
                    obj.del();
                });
                // layer.alert('编辑行：<br>'+ JSON.stringify(data))
            } else if (obj.event === 'show') {
                showSubclass(data);
                // layer.alert('编辑行：<br>'+ JSON.stringify(data))
            }
        });

        //职位(监听大类的选择，大类选择后获取大类的行业，获取行业职位分类)
        form.on('select(commodityType)', function (data) {
            $("#post").empty();
            var id = data.value;//大类id
            var inId;//行业id
            var productType;//商品分类
            for (var p in dataCommityType) {
                if (id == dataCommityType[p].commodityTypeID) {
                    inId = dataCommityType[p].commodityTypeIndustryID;
                    productType = dataCommityType[p].commodityProductType;
                }
            }
            if (productType == 1) { //产品
                $("#post").parent().hide();
            } else if (productType == 2) {   //服务
                $("#post").parent().show();
                var intresult = 0
                for (var p in dataPostCategory) {
                    if (dataPostCategory[p].industryID == inId) {
                        intresult++;
                        var input = "<div class='layui-input-inline' style='width:90px;'>" +
                                "<input type='checkbox' name='" + dataPostCategory[p].postCategoryId + "' value='" + dataPostCategory[p].postCategoryId + "" +
                                "' lay-filter='post' ay-skin='primary' title='" + dataPostCategory[p].name + "'></div>";
                        $("#post").append(input);
                    }
                }

                if (intresult == 0) {
                    $("#post").html("<span style='color: red'>  选中的大类所属的行业暂未添加任何职位分类，请先添加</span>");
                }
            }
            // form.render('checkbox');
            form.render();
        });

        //监听行业联动大类
        form.on('select(IndustryId)', function (data) {
            loadCommodityType(data.value);
        })

        //监听表单复选框的选择
        form.on('checkbox(post)', function (data) {
            // console.log(data.elem); //得到checkbox原始DOM对象
            // console.log(data.elem.checked); //是否被选中，true或者false
            // console.log(data.value); //复选框value值，也可以通过data.elem.value得到
            // console.log(data.othis); //得到美化后的DOM对象
            var value = data.value, flag = data.elem.checked;
            if (flag) {   //选择了复选框
                //启用输入框和选择框
                $("#" + value + " select[name='method']").attr("disabled", false);
                $("#" + value + " input[name='takePercentage']").attr("disabled", false);
            } else {  //不选择复选框
                $("#" + value + " select[name='method']").attr("disabled", true);
                $("#" + value + " input[name='takePercentage']").attr("disabled", true);
            }
            form.render();
        });


        //搜索
        var $ = layui.$, active = {
            search: function () {
                var commodityTypeID = $(".demoTable select[name='commodityTypeSearch'] option:selected").val(),
                        // subclassAchievementID = $(".demoTable select[name='subclassAchievement'] option:selected").val(),
                        subclassEvaluatingID = $(".demoTable select[name='subclassEvaluating'] option:selected").val();
                var params = {
                    commodityTypeID: null,
                    subclassEvaluatingID: null
                };
                if (commodityTypeID != null && commodityTypeID != 0) {
                    params.commodityTypeID = commodityTypeID;
                }
                if (subclassEvaluatingID != null && subclassEvaluatingID != 0) {
                    params.subclassEvaluatingID = subclassEvaluatingID;
                }
                table.reload('SubclassReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    , where: params
                }, 'data');
            }
        };
        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    });

    function editSubclass(data) {

        var a3 = layer.open({
            type: 1,
            title: '修改商品小类',
            content: $('#SubclassForm'),
            closeBtn: 1,
            btn: ['提交', '取消'],
            yes: function (index, layero) {
                form.on('submit(formVerify)', function (data) {
                    postCategoryList = [];
                    //遍历每个被选中的复选框
                    $("#post input[type='checkbox']:checked").each(function (index, e) {
                        // var value = $(this).val();
                        var value = this.value;
                        var title = this.title;
                        //职位
                        var postCategory = {};
                        postCategory.postCategoryId = value;
                        postCategory.postCategoryName = title;
                        postCategoryList.push(postCategory);
                    });
                    // console.log(postCategoryList);
                    var url = dataHost + "/commodityType/updateSubclass";
                    var subclassEvaluating = layero.find("input[id='subclassEvaluatingAdd']").val();
                    var commidity = layero.find("input[id='commodityTypeAdd']").val();
                    var params = {
                        subclassID: layero.find("input[name='subclassID']").val(),
                        subclassName: layero.find("input[name='subclassName']").val(),
                        commodityTypeID: commidity,
                        postCategoryIds: JSON.stringify(postCategoryList),
                        subclassEvaluatingID: subclassEvaluating,
                        modifyOperator: "${currentUser.trueName!}"
                    };
                    $.post(url, params, function (res) {
                        if (res.responseStatusType.message == "Success") {
                            layer.open({
                                title: '修改'
                                , content: '修改成功！'
                                , btn: ["关闭"]
                                , yes: function (index) {
                                    layer.close(index); //如果设定了yes回调，需进行手工关闭
                                    layer.close(a3);
                                }
                            });
                            //重新加载表格
                            table.reload("SubclassReload");
                        } else {
                            layer.open({
                                title: '修改'
                                , content: '修改失败！' + res.responseStatusType.error.errorMsg
                                , btn: ["关闭"]
                            });
                        }
                    })
                })
                // layer.close(); //如果设定了yes回调，需进行手工关闭
            },
            btn2: function () {
                layer.close(a3);
            },
            success: function (layero) {
                layero.addClass('layui-form');
                layero.find('.layui-layer-btn0').attr('lay-filter', 'formVerify').attr('lay-submit', '');


                //查询大类id 的类型
                $.ajax({
                    type: "POST",
                    url: dataHost + "/commodityType/selectCommodityTypeById",
                    data: {"commodityTypeID":data.commodityTypeID},
                    async: true,
                    error: function (request) {
                        layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");

                    },
                    success: function (data) {
                        if (data.responseStatusType.message == 'Failure') {
                            layer.alert(data.responseStatusType.error.errorMsg);
                        }
                        if (data.responseStatusType.message == 'Success') {
                                if(data.result.commodityProductType == "1"){
                                    $("#post").hide();
                                }else{
                                    $("#post").show();
                                }
                        }
                    }
                });




                form.val("SubclassForm", {
                    "subclassID": data.subclassID,
                    "subclassName": data.subclassName,

                    "commodityTypeAddShow": data.commodityTypeName,
                    "commodityType": data.commodityTypeID,

                    "subclassEvaluatingAddShow": data.subclassEvaluatingName,
                    "subclassEvaluating": data.subclassEvaluatingID
                });

                //职位分类,根据商品大类中的行业id和职位分类中的行业id显示职位分类
                loadPostCategory(data.commodityTypeID);
                //职位选择
                var postList = data.postCategoryVOList;
                var jsonObj = {};
                for (var p in postList) {
                    jsonObj[postList[p].postCategoryId] = true;
                }
                form.val('SubclassForm', jsonObj);123
                //显示商品大类
                layero.find("select[name='commodityType']").parent().parent().show();

                form.render();
            },
            area: ['600px', '500px'],

        });
    }

    function delSubclass(data) {
        //删除数据库数据
        var url = dataHost + "/commodityType/deleteSubclass";
        var params = {
            subclassID: data.subclassID,
            modifyOperator: "${currentUser.trueName!}"
        };
        $.post(url, params, function (res) {
            if (res.responseStatusType.message == "Success") {
                layer.open({
                    title: '删除'
                    , content: '删除成功！'
                    , btn: ["关闭"]
                });
                //重新加载表格
                table.reload("SubclassReload");
            } else {
                layer.open({
                    title: '删除'
                    , content: '删除失败！' + res.responseStatusType.error.errorMsg
                    , btn: ["关闭"]
                });
            }
        })
    }

    function showSubclass(data) {
        var a1 = layer.open({
            type: 1,
            title: '查看商品小类',
            content: $('#SubclassForm'),
            closeBtn: 1,
            btn: ['确定'],
            yes: function () {
                layer.close(a1);
            },
            success: function (layero) {

                form.val("SubclassForm", {
                    "subclassID": data.subclassID,
                    "subclassName": data.subclassName,

                    "commodityTypeAddShow": data.commodityTypeName,
                    "commodityType": data.commodityTypeID,

                    "subclassEvaluatingAddShow": data.subclassEvaluatingName,
                    "subclassEvaluating": data.subclassEvaluatingID
                });

                //查询大类id 的类型
                $.ajax({
                    type: "POST",
                    url: dataHost + "/commodityType/selectCommodityTypeById",
                    data: {"commodityTypeID":data.commodityTypeID},
                    async: true,
                    error: function (request) {
                        layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");

                    },
                    success: function (data) {
                        if (data.responseStatusType.message == 'Failure') {
                            layer.alert(data.responseStatusType.error.errorMsg);
                        }
                        if (data.responseStatusType.message == 'Success') {
                            if(data.result.commodityProductType == "1"){
                                $("#post").hide();
                            }else{
                                $("#post").show();
                            }
                        }
                    }
                });


                //职位分类,根据商品大类中的行业id和职位分类中的行业id显示职位分类
                loadPostCategory(data.commodityTypeID);
                //显示职位
                var postList = data.postCategoryVOList;
                var jsonObj = {};
                for (var p in postList) {
                    jsonObj[postList[p].postCategoryId] = true;
                }
                form.val('SubclassForm', jsonObj);
                //显示商品大类
                layero.find("select[name='commodityType']").parent().parent().show();
                if (data.status == 1) {
                    layero.find("input[name='status']").val("正常");
                } else {
                    layero.find("input[name='status']").val("删除");
                }
                form.render();
            },
            area: ['600px', '500px'],
            // end: function () {
            //     window.location.reload();
            // }
        });
    }

    function addNewSubclass() {
        // //获取商品大类的值
        // var commidity = $(".demoTable select[name='commodityTypeAdd'] option:selected").val();
        loadIndustry();
        $("select[name='commodityType']").empty();
        $("#post").empty();
        var a2 = layer.open({
            type: 1,
            title: '添加商品小类',
            content: $('#SubclassForm'),
            closeBtn: 1,
            btn: ['提交', '取消'],
            yes: function (index, layero) {

                form.on('submit(formVerify)', function (data) {
                    var commidity = layero.find("input[id='commodityTypeAdd']").val();
                    postCategoryList = [];
                    //遍历每个被选中的复选框
                    $("#post input[type='checkbox']:checked").each(function (index, e) {
                        // var value = $(this).val();
                        var value = this.value;
                        var title = this.title;
                        //职位
                        var postCategory = {};
                        postCategory.postCategoryId = value;
                        postCategory.postCategoryName = title;
                        postCategoryList.push(postCategory);
                    });
                    var url = dataHost + "/commodityType/insertSubclass";

                    var subclassEvaluating = layero.find("input[id='subclassEvaluatingAdd']").val();

                    var params = {
                        subclassName: layero.find("input[name='subclassName']").val(),
                        commodityTypeID: commidity,
                        postCategoryIds: JSON.stringify(postCategoryList),
                        subclassEvaluatingID: subclassEvaluating,
                        createOperator: "${currentUser.trueName!}",
                        modifyOperator: "${currentUser.trueName!}"
                    };
                    $.post(url, params, function (res) {
                        if (res.responseStatusType.message == "Success") {
                            layer.open({
                                title: '添加'
                                , content: '添加成功！'
                                , btn: ["关闭"]
                                , yes: function (index) {
                                    layer.close(index); //如果设定了yes回调，需进行手工关闭
                                    layer.close(a2);
                                }
                            });
                            //重新加载表格
                            table.reload("SubclassReload");
                        } else {
                            layer.open({
                                title: '添加'
                                , content: '添加失败！' + res.responseStatusType.error.errorMsg
                                , btn: ["关闭"]
                            });
                        }
                    })
                });
                // layer.close(); //如果设定了yes回调，需进行手工关闭
            },
            btn2: function () {
                layer.close(a2);
            },
            success: function (layero) {
                layero.find("input[id='subclassName']").val("");
                layero.find("input[id='industryIdAddShow']").val("");
                layero.find("input[id='commodityTypeAddShow']").val("");
                layero.find("input[id='subclassEvaluatingAddShow']").val("");

                layero.addClass('layui-form');
                layero.find('.layui-layer-btn0').attr('lay-filter', 'formVerify').attr('lay-submit', '');
            },
            area: ['600px', '500px'],
            end: function () {
                loadCommodityType();
            }
        });
    }

    function loadPostCategory(commidity) {
        //职位分类,根据商品大类中的行业id和职位分类中的行业id显示职位分类
        $("#post").empty();
        var inId;//行业id
        for (var p in dataCommityType) {
            if (commidity == dataCommityType[p].commodityTypeID) {
                inId = dataCommityType[p].commodityTypeIndustryID;
            }
        }
        var intresult = 0
        for (var p in dataPostCategory) {
            if (dataPostCategory[p].industryID == inId) {
                intresult++
                var input = "<div class='layui-input-inline' style='width:90px;'>" +
                        "<input type='checkbox' name='" + dataPostCategory[p].postCategoryId + "' value='" + dataPostCategory[p].postCategoryId + "" +
                        "' lay-filter='post' ay-skin='primary' title='" + dataPostCategory[p].name + "'></div>";
                $("#post").append(input);
            }
        }
        if (intresult == 0) {
            $("#post").html("<span style='color: red'>  选中的大类所属的行业暂未添加任何职位分类，请先添加</span>");
        }
        form.render();
    }






    //加载行业
    function loadIndustry() {
        $("select[name='industryId']").empty();
        var url = storeHost + "/manage/industry/selectListIndustryNoPage";
        $.post(url, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var option1 = "<option value='' selected='selected'>请选择</option>";
                $("select[name='industryId']").append(option1);
                for (var p in list) {
                    var option = "<option value='" + list[p].industryID + "'>" + list[p].industryName + "</option>";
                    $("select[name='industryId']").append(option);
                }
                layui.form.render();
            }
        })
    }

    function loadCommodityType(id) {
        var param;
        if (typeof (id) != 'undefined') {
            param = {commodityTypeIndustryID: id};
        }
        //请求商品大类数据
        $.ajax({
            url: dataHost + "/commodityType/selectCommodityTypeList",
            method: "POST",
            data: param,
            async: false,
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    $("#commodityType").empty();
                    var list = res.result.list;
                    var option1 = "<option value='' selected='selected'>请选择</option>";
                    $("select[name='commodityType']").append(option1);
                    for (var p in list) {
                        var option = "<option value='" + list[p].commodityTypeID + "'>" + list[p].commodityTypeName + "</option>";
                        $("select[name='commodityType']").append(option);
                    }
                    layui.form.render();
                }
            }
        });
    }

    function loadPostList(form,commitTypeId,inId,productType,$) {
        var url = storeHost + "/manage/beautician/selectPostCategoryNoPage";
        var data = {};
        $.ajax({
            url: url,
            data: data,
            type: "POST",
            async: true,
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    var dataPostCategory = res.result;
                    $("#post").empty();
                    var id = commitTypeId;//大类id
                    for (var p in dataCommityType) {
                        if (id == dataCommityType[p].commodityTypeID) {
                            inId = dataCommityType[p].commodityTypeIndustryID;
                            productType = dataCommityType[p].commodityProductType;
                        }
                    }
                    if (productType == 1) { //产品
                        $("#post").hide();
                        $("#post").parent().hide();
                    } else if (productType == 2) {   //服务
                        $("#post").show();
                        $("#post").parent().show();
                        var intresult = 0
                        for (var p in dataPostCategory) {
                            if (dataPostCategory[p].industryID == inId) {
                                intresult++;
                                var input = "<div class='layui-input-inline' style='width:90px;'>" +
                                    "<input type='checkbox' name='" + dataPostCategory[p].postCategoryId + "' value='" + dataPostCategory[p].postCategoryId + "" +
                                    "' lay-filter='post' ay-skin='primary' title='" + dataPostCategory[p].name + "'></div>";
                                $("#post").append(input);
                            }
                        }

                        if (intresult == 0) {
                            $("#post").html("<span style='color: red'>  选中的大类所属的行业暂未添加任何职位分类，请先添加</span>");
                        }
                    }
                    // form.render('checkbox');
                    form.render();
                }else{
                    $("#post").html("<span style='color: red'>  选中的大类所属的行业暂未添加任何职位分类，请先添加</span>");
                }
            }
        });
    }
    function loadData() {
        //请求职位数据 selectPostNoPage
        $.ajax({
            url: storeHost + "/manage/beautician/selectPostCategoryNoPage",
            // data: param,
            method: "POST",
            async: false,
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    dataPostCategory = res.result;
                    var list = dataPostCategory;    //返回的数据
                    $("select[name='industryId']").empty();
                    var option1 = "<option value='' selected='selected'>请选择</option>";
                    $("select[name='industryId']").append(option1);
                    for (var p in list) {
                        var option = "<option value='" + list[p].industryID + "'>" + list[p].industryName + "</option>";
                        $("select[name='industryId']").append(option);
                    }
                    layui.form.render();
                }
            }
        });

        //请求客户评测数据
        $.ajax({
            url: dataHost + "/evaluating/selectEvaluatingList",
            // data: param,
            method: "POST",
            async: false,
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    dataEvaluating = res.result.list;
                }
            }
        });
        //请求商品大类数据
        $.ajax({
            url: dataHost + "/commodityType/selectCommodityTypeList",
            data: {"isDingzhi": 0},
            method: "POST",
            async: false,
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    dataCommityType = res.result.list;
                }
            }
        });

        $("#SubclassForm select[name='commodityType']").html("<option value='0'>请选择</option>");
        // $("#SubclassForm select[name='subclassAchievement']").val("<option value='0' checked>请选择</option>");
        $("#SubclassForm select[name='subclassEvaluating']").html("<option value='0'>请选择</option>");
        // $("#SubclassForm select[name='post']").val("<option value='0' checked>请选择</option>");
        $(".demoTable select[name='commodityTypeSearch']").val("<option value='0'>请选择</option>");
        // $(".demoTable select[name='commodityTypeAdd']").val("<option value='0'>请选择</option>");
        // $(".demoTable select[name='subclassAchievement']").val("<option value='0'>请选择</option>");
        $(".demoTable select[name='subclassEvaluating']").val("<option value='0'>请选择</option>");
        // for (var p in dataAchievement) {
        //     var option = "<option value='" + dataAchievement[p].achievementID + "'>" + dataAchievement[p].achievementName + "</option>";
        //     $("#SubclassForm select[name='subclassAchievement']").append(option);
        //     $(".demoTable select[name='subclassAchievement']").append(option);
        // }
        for (var p in dataCommityType) {
            var option = "<option value='" + dataCommityType[p].commodityTypeID + "'>" + dataCommityType[p].commodityTypeName + "</option>";
            $("#SubclassForm select[name='commodityType']").append(option);
            $(".demoTable select[name='commodityTypeSearch']").append(option);
            // $(".demoTable select[name='commodityTypeAdd']").append(option);
        }
        for (var p in dataEvaluating) {
            var option = "<option value='" + dataEvaluating[p].evaluatingID + "'>" + dataEvaluating[p].evaluatingName + "</option>";
            $("#SubclassForm select[name='subclassEvaluating']").append(option);
            $(".demoTable select[name='subclassEvaluating']").append(option);
        }
        form.render("select", "SubclassForm");
        form.render("select", "demoTable");
    }
</script>
</body>
</html>