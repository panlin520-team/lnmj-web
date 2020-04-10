<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>职位管理</title>
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
    <#include "../../baseFtl/pageAuth.ftl" />
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
        <div class="layui-form-item">

            <div class="layui-inline">
                <label class="layui-form-label">请选择门店</label>
                <div class="layui-input-inline">
                    <select name="stores" id="stores" lay-filter="stores">
                    </select>
                </div>
            </div>

            <div class="layui-inline">
                <div class="layui-input-block">
                    <label class="layui-form-label resetLabel">所属行业</label>
                    <div class="layui-input-inline">
                        <select id="postIndustryIDSearch" name="postIndustryIDSearch" lay-filter="postIndustryIDSearch">
                        </select>
                    </div>
                </div>
            </div>


            <div class="layui-inline">
                <label class="layui-form-label" style="width: 100px">请选择查看组织</label>
                <div class="layui-inline">
                    <input type="radio" name="companyTypeSelect" value="2" title="子公司" checked="">
                    <input type="radio" name="companyTypeSelect" value="3" title="分公司">
                </div>
            </div>

            <div class="layui-inline">
                <button class="layui-btn" data-type="search"><i class="layui-icon layui-icon-search"></i></button>
            </div>
            <div class="layui-inline">
                <div class="layui-btn-group demoTable">
                    <button class="layui-btn" data-type="add" id="add">增加</button>
                </div>
            </div>
        </div>
    </div>
    <script type="text/html" id="switchTpl">
        <input type="checkbox" name="postAchievement" value="{{d.postId}}" lay-skin="switch" lay-text="是|否"
               lay-filter="yesOrNoDemo" {{ d.postAchievement== 1 ? 'checked' : '' }}>
    </script>
    <table class="layui-table" id="selectPost" lay-filter="demo"></table>
</div>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="detail">查看职位</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">修改职位</a>
    <#--<a class="layui-btn layui-btn-xs" lay-event="addProjuects">授权</a>-->
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<form class="layui-form layui-form-pane layui-personal" id="addForm" action="" lay-filter="example" method="post"
      hidden="true">
    <div class="layui-form-item">
        <label class="layui-form-label xrequired">职位名称</label>
        <div class="layui-input-block">
            <input type="text" name="name" lay-verify="required" autocomplete="off" placeholder=""
                   class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">职位星级</label>
        <div class="layui-input-block" style="width:150px;">
            <#--<select name="postLevel" id="postLevelID" lay-filter="postLevelID" &lt;#&ndash;lay-verify="required"&ndash;&gt;>-->
            <#--</select>-->

            <input name="postLevelAddShow" id="postLevelAddShow" readonly="readonly" type="text"
                   autocomplete="off" placeholder="请输入职位星级" class="layui-input" style="padding-right: 0px;width: 144px;height: 38px;padding-left: 0px;"
                   lay-verify="required">
            <input name="postLevel" id="postLevelAdd" hidden="true" type="text">
            <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachpostLevelAdd"><i
                        class="layui-icon layui-icon-search"></i></button>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label xrequired">职位分类</label>
        <div class="layui-input-block" style="width:150px;">
            <#--<select name="postCategoryId" id="postCategoryIdFgs" lay-filter="postCategoryId" lay-verify="required"-->
                    <#--lay-search="">-->
            <#--</select>-->

            <input name="postCategoryIdAddShow" id="postCategoryIdAddShowfgs" readonly="readonly" type="text"
                   autocomplete="off" placeholder="请输入职位分类" class="layui-input" style="padding-right: 0px;width: 144px;height: 38px;padding-left: 0px;"
                   lay-verify="required">
            <input name="postCategoryId" id="postCategoryIdAddFgs" hidden="true" type="text">
            <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachpostCategoryIdAddfgs"><i
                        class="layui-icon layui-icon-search"></i></button>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label xrequired">所属店铺</label>
        <div class="layui-input-block" style="width:150px;">
            <#--<select name="companyId" id="storesAdd" lay-filter="storesAdd" lay-verify="required">-->
            <#--</select>-->

            <input name="companyIdAddShow" id="companyIdAddShow" readonly="readonly" type="text"
                   autocomplete="off" placeholder="请输入所属店铺" class="layui-input" style="padding-right: 0px;width: 144px;height: 38px;padding-left: 0px;"
                   lay-verify="required">
            <input name="companyId" id="companyIdAdd" hidden="true" type="text">
            <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachcompanyIdAdd"><i
                        class="layui-icon layui-icon-search"></i></button>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label xrequired">所属部门</label>
        <div class="layui-input-block" style="width:150px;">
            <#--<select name="departmentId" id="departmentId" lay-filter="departmentId" lay-verify="required">-->
            <#--</select>-->

            <input name="departmentIdAddShow" id="departmentIdAddShowfgs" readonly="readonly" type="text"
                   autocomplete="off" placeholder="请输入所属部门" class="layui-input" style="padding-right: 0px;width: 144px;height: 38px;padding-left: 0px;"
                   lay-verify="required">
            <input name="departmentId" id="departmentIdAddfgs" hidden="true" type="text">
            <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachdepartmentIdAddfgs"><i
                        class="layui-icon layui-icon-search"></i></button>
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label xrequired">业绩统计方式</label>
        <div class="layui-input-block">
            <input type="radio" name="postAchievement" value="0" title="个人业绩" checked="">
            <input type="radio" name="postAchievement" value="1" title="全店业绩" >
            <input type="radio" name="postAchievement" value="2" title="分组业绩">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="addsubmitfilter">立即提交</button>
            <button id="reset" type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>

<form class="layui-form layui-form-pane layui-personal" id="addFormZgs" action="" lay-filter="example" method="post"
      hidden="true">
    <div class="layui-form-item">
        <label class="layui-form-label xrequired">职位名称</label>
        <div class="layui-input-block">
            <input type="text" name="name" lay-verify="required" autocomplete="off" placeholder=""
                   class="layui-input">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label xrequired">职位分类</label>
        <div class="layui-input-block" style="width:150px;">
            <#--<select name="postCategoryId" id="postCategoryIdZgs" lay-filter="postCategoryId" lay-verify="required"-->
                    <#--lay-search="">-->
            <#--</select>-->
            <input name="postCategoryIdAddShow" id="postCategoryIdAddShow" readonly="readonly" type="text"
                   autocomplete="off" placeholder="请输入门店所属分类" class="layui-input" style="padding-right: 0px;width: 144px;height: 38px;padding-left: 0px;"
                   lay-verify="required">
            <input name="postCategoryId" id="postCategoryIdAdd" hidden="true" type="text">
            <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachpostCategoryIdAdd"><i
                        class="layui-icon layui-icon-search"></i></button>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label xrequired">所属部门</label>
        <div class="layui-input-block" style="width:150px;">
            <#--<select name="departmentId" id="departmentIdZgs" lay-filter="departmentId" lay-verify="required">-->
            <#--</select>-->

            <input name="departmentIdAddShow" id="departmentIdAddShow" readonly="readonly" type="text"
                   autocomplete="off" placeholder="请输入门店所属分类" class="layui-input" style="padding-right: 0px;width: 144px;height: 38px;padding-left: 0px;"
                   lay-verify="required">
            <input name="departmentId" id="departmentIdAdd" hidden="true" type="text">
            <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachdepartmentIdAdd"><i
                        class="layui-icon layui-icon-search"></i></button>
        </div>
    </div>


    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="addsubmitfilter">立即提交</button>
            <button id="resetZgs" type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>

<form class="layui-form layui-form-pane layui-personal" id="editForm" action="" lay-filter="exampleEdit" method="post"
      hidden="true">

    <div class="layui-form-item" hidden="hidden">
        <label class="layui-form-label xrequired">职位id</label>
        <div class="layui-input-block">
            <input type="text" name="postId" autocomplete="off" placeholder=""
                   class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label xrequired">职位名称</label>
        <div class="layui-input-block">
            <input type="text" name="name" lay-verify="required" autocomplete="off" placeholder=""
                   class="layui-input">
        </div>
    </div>

    <div class="layui-form-item" id="addAndEdit">
        <label class="layui-form-label">职位星级</label>
        <div class="layui-input-block" style="width:150px;">
            <#--<select name="postLevel" id="postLevelIDEdit" lay-filter="postLevelID" &lt;#&ndash;lay-verify="required"&ndash;&gt;>-->
            <#--</select>-->

            <input name="storeCategoryIdDetailAndEditShow" id="storeCategoryIdDetailAndEditShow" readonly="readonly" type="text"
                   autocomplete="off" placeholder="请输入职位星级" class="layui-input" style="padding-right: 0px;width: 144px;height: 38px;padding-left: 0px;">
            <input name="storeCategoryId" id="storeCategoryIdDetailAndEdit" hidden="true" type="text">
            <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachstoreCategoryIdDeatilAndEdit"><i
                        class="layui-icon layui-icon-search"></i></button>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label xrequired">职位分类</label>
        <div class="layui-input-block" style="width:150px;">
            <#--<select name="postCategoryId" id="postCategoryIdEdit" lay-filter="postCategoryId" lay-verify="required"-->
                    <#--lay-search="">-->
            <#--</select>-->
            <input name="postCategoryIdShowAndEdit" id="postCategoryIdShowAndEdit" readonly="readonly" type="text"
                   autocomplete="off" placeholder="请输入职位分类" class="layui-input" style="padding-right: 0px;width: 144px;height: 38px;padding-left: 0px;"
                   lay-verify="required">
            <input name="postCategoryId" id="postCategoryId" hidden="true" type="text">
            <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachpostCategoryIdShowAndEdit"><i
                        class="layui-icon layui-icon-search"></i></button>
        </div>
    </div>


    <div class="layui-form-item" id="detailAndEditYeji">
        <label class="layui-form-label">业绩统计方式</label>
        <div class="layui-input-block">
            <input type="radio" name="postAchievement" value="0" title="个人业绩" checked="">
            <input type="radio" name="postAchievement" value="1" title="全店业绩">
            <input type="radio" name="postAchievement" value="2" title="分组业绩">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="editsubmitfilter" id="showSubmit">立即提交</button>
            <button id="resetFgs" type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>

</form>


<#--选择要添加岗位的类型表单-->
<div id="companyTypePostDiv" hidden="" class="layui-fluid layui-form-pane layui-personal" style="margin: 15px;">
    <form class="layui-form" action="" id="companyTypePostForm" lay-filter="companyTypePostForm">
        <div class="layui-form-item">
            <label class="layui-form-label">请选择组织类型</label>
            <div class="layui-input-block">
                <input type="radio" name="companyTypePost" value="1" title="子公司岗位" checked=""
                       lay-filter="companyTypePost">
                <input type="radio" name="companyTypePost" value="2" title="门店岗位">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="companyTypePostConfir">确认</button>
            </div>
        </div>

    </form>
</div>
<#include "../../baseFtl/loadLinkData.ftl" />
<script>
    /*----------------渲染表格数据-------------------*/
    var addOpen = null;
    layui.use('table', function () {
        var table = layui.table;
        var $ = layui.jquery;
        var form = layui.form;
        table = $.extend(table, {config: {checkName: 'isChecked'}});
        var param = null;
        var colsParam = null;
        //如果是总公司查看
        param = {"companyId": "${currentUser.companyId!}","companyType": "${currentUser.companyType!}"};
        colsParam = [[
            {type: 'checkbox', fixed: 'left', width: 100}
            , {field: 'name', edit: 'text', title: '职位名称'}
            , {field: 'postLevelName', title: '职位等级'}
            , {field: 'postIndustryName', title: '所属行业'}
            , {field: 'postCategoryName', title: '职位分类'}
            /*, {field: 'postAchievement', title: '是否为全店业绩', templet: '#switchTpl', unresize: true}*/
            , {fixed: 'right', title: '操作', width: 300, align: 'center', toolbar: '#barDemo'}
        ]]
        table.render({
            elem: "#selectPost"
            , url: storeHost + "/manage/beautician/selectPost"
            , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , page: true          //显示分页默认不显示
            , method: 'post'
            , id: 'postReload'
            , request: {
                pageName: 'pageNum', //页码的参数名称，默认：page
                limitName: 'pageSize' //每页数据量的参数名，默认：limit
            }
            , where: param
            , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                return {
                    "code": 0, //解析接口状态
                    "msg": "暂无数据", //解析提示文本
                    "count": res.result == null ? 0 : res.result.total, //解析数据长度
                    "data": res.result == null ? 0 : res.result.list //解析数据列表
                };
            }
            , cols: colsParam,
            done: function (res, curr, count) {

            }
        });

        //监听是否为全店业绩操作
        form.on('switch(yesOrNoDemo)', function (obj) {
            var postAchievement = null;
            if (obj.elem.checked) {
                postAchievement = 1
            } else {
                postAchievement = 0
            }
            console.log(obj)
            var url = storeHost + "/manage/beautician/updatePost";
            var params = {
                postId: this.value,
                postAchievement: postAchievement,
                modifyOperator: "${currentUser.trueName!}"
            };
            $.post(url, params, function (res) {
                if (res.responseStatusType.message == "Success") {
                    layer.msg("修改成功")
                    table.reload("postReload");
                } else {
                    layer.msg(res.responseStatusType.error.errorMsg, {
                        time: 20000, //20s后自动关闭
                        btn: ['明白了']
                    });
                }
            })

        });
    });
    /*----------------渲染表格数据-------------------*/


    var selectBoxsAll;//授权框中选中的行
    layui.use(['table', 'layer', 'jquery', 'form'], function () {
        var table = layui.table,
            layer = layui.layer,
            $ = layui.jquery,
            form = layui.form;
        loadIndustry(form);
        loadSubCompanyStore(form)






        /*------职位分类关联数据添加------*/
        $("#" + "serachpostCategoryIdAdd").click(function () {
            var url = storeHost + "/manage/beautician/selectPostCategoryList";
            var param = {"companyId":"${currentUser.parentCompanyId!}"};
            loadLinkData(layer, layui, url, "postCategoryId", "name", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "postCategoryIdAdd").val(data.postCategoryId);
                $("#" + "postCategoryIdAddShow").val(data.name);
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

        /*------职位分类关联数据查看/修改------*/
        $("#" + "serachpostCategoryIdShowAndEdit").click(function () {
            var url = storeHost + "/manage/beautician/selectPostCategoryList";
            var param = {"companyId":"${currentUser.parentCompanyId!}"};
            loadLinkData(layer, layui, url, "postCategoryId", "name", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "postCategoryId").val(data.postCategoryId);
                $("#" + "postCategoryIdShowAndEdit").val(data.name);
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

        /*------所属部门关联数据添加------*/
        $("#" + "serachdepartmentIdAdd").click(function () {
            var searchCompanyType;
            //判断选择的组织类型
            if ($('input[name="companyTypePost"]:checked').val() === "1") {
                searchCompanyType = "${currentUser.companyType!}"
            } else {
                searchCompanyType = "3"
            }

            var url = storeHost + "/manage/department/listDepartment";
            var data = {"companyId": "${currentUser.companyId!}", "companyType": "${currentUser.companyType!}","searchCompanyType":searchCompanyType};
            loadLinkData(layer, layui, url, "id", "name", data);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "departmentIdAdd").val(data.id);
                $("#" + "departmentIdAddShow").val(data.name);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {keyWordName: wordSearch}
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

        /*------门店职位分类关联数据添加------*/
        $("#" + "serachpostCategoryIdAddfgs").click(function () {
            var url = storeHost + "/manage/beautician/selectPostCategoryList";
            var param = {"companyId":"${currentUser.parentCompanyId!}"};
            loadLinkData(layer, layui, url, "postCategoryId", "name", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "postCategoryIdAddFgs").val(data.postCategoryId);
                $("#" + "postCategoryIdAddShowfgs").val(data.name);
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

        /*------门店所属部门关联数据添加------*/
        $("#" + "serachdepartmentIdAddfgs").click(function () {
            var searchCompanyType;
            //判断选择的组织类型
            if ($('input[name="companyTypePost"]:checked').val() === "1") {
                searchCompanyType = "${currentUser.companyType!}"
            } else {
                searchCompanyType = "3"
            }

            var url = storeHost + "/manage/department/listDepartment";
            var companyIdAdd = $("input[id='companyIdAdd']").val();
            if(companyIdAdd==""||companyIdAdd==null){
                layer.msg("请先选择所属门店")
                return
            }
            var data = {"companyId": companyIdAdd, "companyType": searchCompanyType,"searchCompanyType":searchCompanyType};
            loadLinkData(layer, layui, url, "id", "name", data);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "departmentIdAddfgs").val(data.id);
                $("#" + "departmentIdAddShowfgs").val(data.name);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {keyWordName: wordSearch}
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

        /*------门店所属店铺关联数据添加------*/
        $("#" + "serachcompanyIdAdd").click(function () {
            var url = storeHost + "/manage/store/selectStoreListBySubCompany";
            var data = {"subsidiaryId": "${currentUser.companyId!}"};
            loadLinkData(layer, layui, url, "storeId", "name", data);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "companyIdAdd").val(data.storeId);
                $("#" + "companyIdAddShow").val(data.name);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {keyWord: wordSearch}
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
123
        /*------门店职位星级关联数据查看/编辑------*/
        $("#" + "serachstoreCategoryIdDeatilAndEdit").click(function () {
            var url = storeHost + "/manage/beautician/selectPostLevel";
            var data = {"companyId": "${currentUser.companyId!}"};
            loadLinkData(layer, layui, url, "postLevelId", "postLevelName", data);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "storeCategoryIdDetailAndEdit").val(data.postLevelId);
                $("#" + "storeCategoryIdDetailAndEditShow").val(data.postLevelName);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {postLevelNameKeyword: wordSearch}
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

        /*------门店职位星级关联数据查看/编辑------*/
        $("#" + "serachpostLevelAdd").click(function () {
            var url = storeHost + "/manage/beautician/selectPostLevel";
            var data = {"companyId": "${currentUser.companyId!}"};
            loadLinkData(layer, layui, url, "postLevelId", "postLevelName", data);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "postLevelAdd").val(data.postLevelId);
                $("#" + "postLevelAddShow").val(data.postLevelName);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {postLevelNameKeyword: wordSearch}
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



        //监听表格复选框选择
        table.on('checkbox(demo)', function (obj) {
            console.log(obj)
        });
        table.on('checkbox(selectProjectDemo)', function (obj) {
            if (obj.type == "one") {//如果是单行选
                if (obj.checked) {//如果选中,加入
                    selectBoxsAll.push(obj.data.serviceProductId)
                } else {//如果没选中,删除
                    var index = selectBoxsAll.indexOf(obj.data.serviceProductId);
                    if (index > -1) {
                        selectBoxsAll.splice(index, 1);
                    }
                }
            } else if (obj.type == "all") {//如果是全选
                if (isFind == 1) {//如果是搜索
                    if (obj.checked) {//是全选
                        for (var select in resultDataAllSearch) {
                            var flag = true;
                            for (var all in selectBoxsAll) {
                                if (resultDataAllSearch[select].serviceProductId == selectBoxsAll[all]) {
                                    flag = false;
                                }
                            }
                            if (flag == true) {//如果在全部里面找不到，就加入
                                selectBoxsAll.push(resultDataAllSearch[select].serviceProductId)
                            }
                        }
                    } else {//不是全选

                        for (var select in resultDataAllSearch) {
                            var flag = true;
                            for (var all in selectBoxsAll) {
                                if (resultDataAllSearch[select].serviceProductId == selectBoxsAll[all]) {
                                    flag = false;
                                }
                            }
                            if (flag == false) {//如果在全部里面找的到，就删除
                                var inde = selectBoxsAll.indexOf(resultDataAllSearch[select].serviceProductId);
                                selectBoxsAll.splice(inde, 1);
                            }
                        }
                    }
                } else if (isFind == 0) {//不是搜索
                    if (obj.checked) {//是全选
                        selectBoxsAll = new Array();
                        for (var all in resultDataAll) {
                            selectBoxsAll.push(resultDataAll[all].serviceProductId)
                        }
                    } else {//不是全选
                        selectBoxsAll = new Array();
                    }
                }

            }

        });

        //监听工具条
        table.on('tool(demo)', function (obj) {
            var data = obj.data;
            if (obj.event === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    var isDelete = postDelete(data, table, $);
                    if (isDelete) {
                        obj.del();
                    }
                    layer.close(index);
                });
            } else if (obj.event === 'addProjuects') {
                bindingProject(data, table, $);
            } else if (obj.event === 'edit') {
                postEdit(form, data, table, $);
            } else if (obj.event === 'detail') {
                postShow(form, data, table, $);
            }
        });

        //监听添加提交
        form.on('submit(addsubmitfilter)', function (data) {
            var data = null;
            if ($('input[name="companyTypePost"]:checked').val() === "1") {

                data = $('#addFormZgs').serialize() + "&companyType=2" + "&companyId=" + "${currentUser.companyId!}" + "&fCreateOrgId=" + "${currentUser.orgK3Number!}" + "&fUseOrgId=" + "${currentUser.orgK3Number!}"
            } else {
                data = $('#addForm').serialize() + "&companyType=3"
            }
            var indexload = layer.load(2);
            $.ajax({
                type: "POST",
                url: storeHost + "/manage/beautician/addPost",
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
                        layer.close(index);    //返回数据关闭loading
                    }
                    if (data.responseStatusType.message == 'Success') {
                        layer.open({
                            title: '添加'
                            , content: '添加成功！' + data.result
                            , btn: ["关闭"]
                            , yes: function (index) {
                                layer.close(index); //如果设定了yes回调，需进行手工关闭
                                layer.close(indexload);
                            }, end: function () {
                                layer.closeAll();
                                $("#resetZgs").click();//重置表单
                                $("#resetFgs").click();//重置表单
                                table.reload("postReload");
                            }
                        });
                    }
                }
            });


            return false;
        });


        //监听修改提交
        form.on('submit(editsubmitfilter)', function (data) {
           // var companyType =  $("#editForm").attr("companyType");
           // var companyId =  $("#editForm").attr("companyId");
            //获取当前操作选择的组织机构
            var companyType = "";
            if ($('input[name="companyTypeSelect"]:checked').val() === "2") {
                companyType = "2"
            } else {
                companyType = "3"
            }
            //获取当前操作的门店
            var companyId = $("#stores option:selected").val();
            $.ajax({
                type: "POST",
                url: storeHost + "/manage/beautician/updatePost",
                <#--data: $('#editForm').serialize() + "&modifyOperator=" + "${currentUser.trueName!}" + "&companyType=" + companyType + "&companyId=" + companyId + "&fCreateOrgId=" + "${currentUser.orgK3Number!}" + "&fUseOrgId=" + "${currentUser.orgK3Number!}",-->
                data: data.field,
                async: false,
                error: function (request) {
                    layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
                },
                success: function (data) {
                    if (data.responseStatusType.message == 'Failure') {
                        layer.alert(data.responseStatusType.error.errorMsg);
                    }
                    if (data.responseStatusType.message == 'Success') {
                        var param = {"companyId": companyId,"companyType": companyType};
                        layer.open({
                            title: '修改'
                            , content: '修改成功！'
                            , btn: ["关闭"]
                            , yes: function (index) {
                                layer.close(index); //如果设定了yes回调，需进行手工关闭
                            }, end: function () {
                                layer.close(addOpen);
                                table.reload('postReload', {
                                    page: {
                                        curr: 1 //重新从第 1 页开始
                                    }
                                    , where: param
                                }, 'data');


                            }
                        });
                    }
                }
            });
            return false;
        });


        var $ = layui.$, active = {
            search: function () {
                var companyType = null;
                var companyId = null;
                if ($('input[name="companyTypeSelect"]:checked').val() == 2) {
                    companyType = "${currentUser.companyType!}";
                    companyId = "${currentUser.companyId!}";
                } else {
                    var selectStoreId = $("select[name='stores']").find("option:selected").val()
                    if (selectStoreId == 0) {
                        layer.msg("请选择门店");
                        return;
                    } else {
                        companyType = 3;
                        companyId = selectStoreId;
                    }

                }

                var postIndustryIDSearch = $(".demoTable select[name='postIndustryIDSearch'] option:selected").val();
                var param = null;
                var colsParam = null;
                //如果是总公司查看
                param = {postIndustryIDSearch: postIndustryIDSearch, companyId: companyId, companyType: companyType};
                colsParam = [[
                    {type: 'checkbox', fixed: 'left', width: 100}
                    , {field: 'name', edit: 'text', title: '职位名称'}
                    , {field: 'postLevelName', title: '职位等级'}
                    , {field: 'postIndustryName', title: '所属行业'}
                    , {field: 'postCategoryName', title: '职位分类'}
                    /*, {field: 'postAchievement', title: '是否为全店业绩', templet: '#switchTpl', unresize: true}*/
                    , {fixed: 'right', title: '操作', width: 300, align: 'center', toolbar: '#barDemo'}
                ]]
                table.render({
                    elem: "#selectPost"
                    , url: storeHost + "/manage/beautician/selectPost"
                    , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    , page: true          //显示分页默认不显示
                    , method: 'post'
                    , id: 'postReload'
                    , request: {
                        pageName: 'pageNum', //页码的参数名称，默认：page
                        limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    }
                    , where: param
                    , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                        return {
                            "code": 0, //解析接口状态
                            "msg": "", //解析提示文本
                            "count": res.result == null ? 0 : res.result.total, //解析数据长度
                            "data": res.result == null ? 0 : res.result.list //解析数据列表
                        };
                    }
                    , cols: colsParam
                });
            },
            add: function () {// 打开添加窗口
                $("#reset").click();//重置表单(新建时在进入表单前要重置一下表单的内容，不然表单打开后会显示上一次的表单的内容。这里调用表单中重置按钮的点击方法来重置)
                var layerid = layer.open({//开启表单弹层
                    skin: 'layui-layer-molv',
                    area: '60%',
                    type: 1,
                    title: '新建岗位',
                    content: $('#companyTypePostDiv'), //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
                    success: function () {

                    }
                });
            }
        };



        //监听确认-打开对应的添加员工类型弹窗
        form.on('submit(companyTypePostConfir)', function (data) {
            var div = null;
            if ($('input[name="companyTypePost"]:checked').val() === "1") {
                div = $('#addFormZgs');
                <#--loadDepartmentForZgs("2", "${currentUser.companyId!}");-->
            } else {
                div = $('#addForm');

            }
            $("#reset").click();//重置表单(新建时在进入表单前要重置一下表单的内容，不然表单打开后会显示上一次的表单的内容。这里调用表单中重置按钮的点击方法来重置)
            addOpen = layer.open({
                type: 1,
                title: '添加职位',
                content: div,
                area: ['553px', "488px"],
                closeBtn: 1,
                btn: [],
                yes: function (index, layero) {

                },
                btn2: function () {

                },
                success: function (layero) {
                    $("#resetZgs").click();//重置表单
                    $("#resetFgs").click();//重置表单
                },
                end: function () {
                    table.reload("postReload");
                }
            });
            return false;//防止表单提交后跳转
        });

        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });


        //根据门店查部门
        form.on('select(storesAdd)', function (data) {
            var storeId = data.value;
            loadDepartmentForAdd("3", storeId);
        });
    });


    //修改职位-表格中
    layui.use('table', function () {
        var table = layui.table;

        //监听单元格编辑
        table.on('edit(demo)', function (obj) {
            var value = obj.value //得到修改后的值
                , data = obj.data //得到所在行所有键值
                , field = obj.field; //得到字段
            layer.msg('[ID: ' + data.postId + '] ' + field + ' 字段更改为：' + value, {
                time: 20000, //20s后自动关闭
                btn: ['确认修改', '取消'],
                yes: function (index, layero) {
                    var url = storeHost + "/manage/beautician/updatePost";
                    var params = {
                        postId: data.postId,
                        name: value,
                        modifyOperator: "${currentUser.trueName!}"
                    };
                    $.post(url, params, function (res) {
                        if (res.responseStatusType.message == "Success") {
                            layer.msg("修改成功")
                            table.reload("postReload");
                        } else {
                            layer.msg(res.responseStatusType.error.errorMsg, {
                                time: 20000, //20s后自动关闭
                                btn: ['明白了']
                            });
                        }
                    })
                },
                btn2: function () {
                    table.reload("postReload");
                }
            });
        });
    });


    //查看职位按钮事件
    function postShow(form, data, table, $) {
        addOpen = layer.open({
            type: 1,
            title: '修改职位',
            content: $('#editForm'),
            area: ['553px', "488px"],
            closeBtn: 1,
            btn: [],
            yes: function (index, layero) {

            },
            btn2: function () {
            },
            success: function (layero) {
                $("#resetFgs").attr("style", "display:none;");
                $("#showSubmit").attr("style", "display:none;");

                $("#editForm").attr("companyType",data.companyType);
                $("#editForm").attr("companyId",data.companyId);
                if (data.companyType== "2") {
                    $("#addAndEdit").attr("style","display:none;");
                }
                //表单初始赋值
                form.val('exampleEdit', {
                    "postId": data.postId,
                    "postLevel": data.postLevel,
                    "storeCategoryIdDetailAndEditShow": data.postLevelName,
                    "postCategoryId": data.postCategoryId,
                    "postCategoryIdShowAndEdit": data.postCategoryName,
                    "name": data.name,
                    "postIndustryID": data.postIndustryID,
                    "postAchievement": data.postAchievement
                })
            }
        });


    }


    //修改职位按钮事件
    function postEdit(form, data, table, $) {

        if (data.companyType == "2") {
            $("#detailAndEditYeji").attr("style", "display:none;");
            $("#addAndEdit").attr("style", "display:none;");
            // $("#addAndEdit").removeAttr("lay-verify");
        } else {
            $("#detailAndEditYeji").attr("style", "display:block;");
            // $("#addAndEdit").attr("style", "display:block;");
            // $("#addAndEdit").attr("lay-verify","required");
        }
        addOpen = layer.open({
            type: 1,
            title: '修改职位',
            content: $('#editForm'),
            area: ['553px', "488px"],
            closeBtn: 1,
            btn: [],
            yes: function (index, layero) {
                var indexload = layer.load(2);
                $.ajax({
                    type: "POST",
                    url: storeHost + "/manage/beautician/updatePost",
                    data: $('#editForm').serialize() + "&companyType=" + "${currentUser.companyType!}",
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
                            layer.close(index);    //返回数据关闭loading
                        }
                        if (data.responseStatusType.message == 'Success') {
                            layer.open({
                                title: '添加'
                                , content: '添加成功！' + data.result
                                , btn: ["关闭"]
                                , yes: function (index) {
                                    layer.close(index); //如果设定了yes回调，需进行手工关闭
                                    layer.close(indexload);
                                }, end: function () {
                                    layer.close(layerid);
                                    $("#reset").click();//重置表单
                                    table.reload("postReload");
                                }
                            });
                        }
                    }
                });

            },
            btn2: function () {
            },
            success: function (layero) {
                $("#resetFgs").attr("style", "display:inline;");123
                $("#showSubmit").attr("style", "display:inline;");
                //表单初始赋值
                form.val('exampleEdit', {
                    "postId": data.postId,
                    "postLevel": data.postLevel,
                    "storeCategoryIdDetailAndEditShow": data.postLevelName,
                    "postCategoryId": data.postCategoryId,
                    "postCategoryIdShowAndEdit": data.postCategoryName,
                    "name": data.name,
                    "postIndustryID": data.postIndustryID,
                    "postAchievement": data.postAchievement
                })
            }
        });


    }

    //删除职位按钮事件
    function postDelete(data, table, $) {
        var isDelete = true
        //删除数据库数据
        var url = storeHost + "/manage/beautician/deletePost";
        var data = {
            postId: data.postId
        };
        $.post(url, data, function (res) {
            if (res.responseStatusType.message == "Success") {
                layer.open({
                    title: '删除'
                    , content: '删除成功！'
                });
                //重新加载表格
                table.reload("postReload");
            } else {
                layer.open({
                    title: '删除'
                    , content: res.responseStatusType.error.errorMsg
                });
                isDelete = false
            }
        });

    }
123
    //加载分类信息--修改
    function loadPostCategoryEdit(form) {
        var url = storeHost + "/manage/industry/selectListIndustryNoPage";
        var data = {};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("postCategoryIdEdit"); //server为select定义的id
                server.innerHTML = "<option value=''>直接选择或搜索选择</option>";
                for (var p in list) {
                    var optgroup = document.createElement("optgroup");  // 创建添加optgroup属性
                    optgroup.setAttribute("label", list[p].industryName); // 给optgroup的label添加值
                    var postCategoryList = list[p].postCategoryList;
                    for (var n in postCategoryList) {
                        var option = document.createElement("option");  // 创建添加option属性
                        option.setAttribute("value", postCategoryList[n].postCategoryId); // 给option的value添加值
                        option.innerText = postCategoryList[n].name;     // 打印option对应的纯文本
                        optgroup.appendChild(option)
                    }
                    server.appendChild(optgroup);           //给select添加option子标签
                }
                form.render();
            } else {

            }
        });
    }

    //加载分类信息--添加 --分公司
    function loadPostCategoryAddFgs(form) {
        var url = storeHost + "/manage/industry/selectListIndustryNoPage";
        var data = {};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("postCategoryIdFgs"); //server为select定义的id
                server.innerHTML = "<option value=''>直接选择或搜索选择</option>";
                for (var p in list) {
                    var optgroup = document.createElement("optgroup");  // 创建添加optgroup属性
                    optgroup.setAttribute("label", list[p].industryName); // 给optgroup的label添加值
                    var postCategoryList = list[p].postCategoryList;
                    for (var n in postCategoryList) {
                        var option = document.createElement("option");  // 创建添加option属性
                        option.setAttribute("value", postCategoryList[n].postCategoryId); // 给option的value添加值
                        option.innerText = postCategoryList[n].name;     // 打印option对应的纯文本
                        optgroup.appendChild(option)
                    }
                    server.appendChild(optgroup);           //给select添加option子标签
                }
                form.render();
            } else {

            }
        });
    }

    //加载分类信息--添加 -- 子公司
    function loadPostCategoryAddZgs(form) {
        var url = storeHost + "/manage/industry/selectListIndustryNoPage";
        var data = {};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("postCategoryIdZgs"); //server为select定义的id
                server.innerHTML = "<option value=''>直接选择或搜索选择</option>";
                for (var p in list) {
                    var optgroup = document.createElement("optgroup");  // 创建添加optgroup属性
                    optgroup.setAttribute("label", list[p].industryName); // 给optgroup的label添加值
                    var postCategoryList = list[p].postCategoryList;
                    for (var n in postCategoryList) {
                        var option = document.createElement("option");  // 创建添加option属性
                        option.setAttribute("value", postCategoryList[n].postCategoryId); // 给option的value添加值
                        option.innerText = postCategoryList[n].name;     // 打印option对应的纯文本
                        optgroup.appendChild(option)
                    }
                    server.appendChild(optgroup);           //给select添加option子标签
                }
                form.render();
            } else {

            }
        });
    }




    //绑定授权项目事件
    function bindingProject(datas, table, $) {
        isFind = 0;
        var a3 = layer.open({
            type: 1,
            title: '护理项目',
            area: ['740px', '500px'],
            closeBtn: 1,
            scrollbar: true,
            content: '<div class="demoTableSerch layui-form">\n' +
                '    <div class="layui-form-item">\n' +
                '        <div class="layui-inline">\n' +
                '            <label class="layui-form-label">商品名称</label>\n' +
                '            <div class="layui-input-inline">\n' +
                '                <input class="layui-input" type="text" name="keyWordProductName" autocomplete="off"\n' +
                '                       placeholder="输入商品名称">\n' +
                '            </div>\n' +
                '            <label class="layui-form-label">商品号</label>\n' +
                '            <div class="layui-input-inline">\n' +
                '                <input class="layui-input" type="text" name="keyWordProductCode" autocomplete="off" placeholder="输入商品号">\n' +
                '            </div>\n' +
                '        </div>\n' +
                '        <div class="layui-inline">\n' +
                '            <button class="layui-btn"  id="find"><i class="layui-icon layui-icon-search"></i></button>\n' +
                '        </div>\n' +
                '    </div>\n' +
                '</div>' +
                '<table id="selectProject" lay-filter="selectProjectDemo"></table>',
            btn: ['提交', '取消'],
            yes: function (index, layero) {
                var url = storeHost + "/manage/beautician/insertProjectToBeautician";//添加授权
                var params = {
                    postId: datas.postId,
                    postLevel: datas.postLevel,
                    projects: JSON.stringify(selectBoxsAll)
                };
                $.post(url, params, function (res) {
                    if (res.responseStatusType.message == "Success") {
                        layer.open({
                            title: '授权'
                            , content: '授权成功！'
                            , btn: ["关闭"]
                            , yes: function (index) {
                                layer.close(index); //如果设定了yes回调，需进行手工关闭
                                layer.close(a3);
                            }
                        });
                    } else {

                    }
                })
            },
            btn2: function () {
                layer.closeAll();
            },
            success: function (layero, index) {

                /*----------------渲染表格数据-------------------*/
                layui.use('table', function () {
                    var table = layui.table;
                    var $ = layui.jquery;
                    table = $.extend(table, {config: {checkName: 'isChecked'}});
                    table.render({
                        elem: layero.find('#selectProject')
                        , url: storeHost + "/manage/beautician/selectProject"
                        , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                        , page: true          //显示分页默认不显示
                        , method: 'post'
                        , request: {
                            pageName: 'pageNum', //页码的参数名称，默认：page
                            limitName: 'pageSize' //每页数据量的参数名，默认：limit
                        }
                        , where: {
                            postId: datas.postId,
                            postLevel: datas.postLevel
                        }
                        , id: "allDataTable"
                        , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                            return {
                                "code": 0, //解析接口状态
                                "msg": "暂无授权项目", //解析提示文本
                                "count": res.result == null ? 0 : res.result.total, //解析数据长度
                                "data": res.result == null ? 0 : res.result.list //解析数据列表
                            };
                        }
                        , cols: [[
                            {type: 'checkbox', fixed: 'left', width: 100}
                            , {field: 'serviceProductId', title: '项目id', sort: true}
                            , {field: 'productCode', title: '商品编号'}
                            , {field: 'productName', title: '项目名称'}
                            , {field: 'isChecked', title: '是否选择'}
                        ]],
                        done: function (res, curr, count) {
                            resultDataAll = res.data;
                            selectBoxsAll = new Array();
                            var checkStatus = table.checkStatus('allDataTable')
                                , data = checkStatus.data;
                            for (var p in data) {
                                //加入所有选中项目
                                selectBoxsAll.push(data[p].serviceProductId)
                            }
                        }
                    });

                });
                /*----------------渲染表格数据-------------------*/


                /*----------------给搜索按钮绑定事件-------------------*/
                layui.use('layer', function () {
                    var $ = layui.jquery, layer = layui.layer;
                    $(document).on('click', '#find', function () {
                        isFind = 1;
                        layui.use('table', function () {
                            var table = layui.table;
                            var $ = layui.jquery;
                            table = $.extend(table, {config: {checkName: 'isChecked'}});
                            var keyWordProductName = $(".demoTableSerch input[name='keyWordProductName']").val();
                            var keyWordProductCode = $(".demoTableSerch input[name='keyWordProductCode']").val();
                            table.render({
                                elem: layero.find('#selectProject')
                                , url: storeHost + "/manage/beautician/selectProject"
                                , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                                , page: true          //显示分页默认不显示
                                , method: 'post'
                                , request: {
                                    pageName: 'pageNum', //页码的参数名称，默认：page
                                    limitName: 'pageSize' //每页数据量的参数名，默认：limit
                                }
                                , id: "searchDataTable"
                                , where: {
                                    keyWordProductName: keyWordProductName,
                                    keyWordProductCode: keyWordProductCode,
                                    postId: datas.postId,
                                    postLevel: datas.postLevel
                                }
                                , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                                    return {
                                        "code": 0, //解析接口状态
                                        "msg": "暂无授权项目", //解析提示文本
                                        "count": res.result == null ? 0 : res.result.total, //解析数据长度
                                        "data": res.result == null ? 0 : res.result.list //解析数据列表
                                    };
                                }
                                , cols: [[
                                    {type: 'checkbox', fixed: 'left', width: 100}
                                    , {field: 'serviceProductId', title: '项目id', sort: true}
                                    , {field: 'productCode', title: '商品编号'}
                                    , {field: 'productName', title: '项目名称'}
                                    , {field: 'isChecked', title: '是否选择'}
                                ]],
                                done: function (res, curr, count) {
                                    resultDataAllSearch = res.data;
                                }
                            });
                        });
                    });
                });
                /*----------------给搜索按钮绑定事件-------------------*/
            }
        });

    }

    //加载行业信息
    function loadIndustry(form) {
        var url = storeHost + "/manage/industry/selectListIndustryNoPage";
        var data = {};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("postIndustryIDSearch"); //server为select定义的id
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
</script>

</body>
</html>