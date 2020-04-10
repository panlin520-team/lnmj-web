<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>职位分类管理</title>
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
        .resetLabel {
            width: 90px;
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
                <div class="layui-input-block">
                    <label class="layui-form-label resetLabel">所属行业</label>
                    <div class="layui-input-inline">
                        <select id="postIndustryIDSearch" name="postIndustryIDSearch" lay-filter="postIndustryIDSearch">
                        </select>
                    </div>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label resetLabel">职位分类名称</label>
                <div class="layui-input-inline">
                    <input class="layui-input" type="text" name="postCategoryNameKeyword" autocomplete="off" placeholder="请输入职位分类名称">
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
    <table id="postCategory" lay-filter="demo"></table>

</div>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>


<#--添加表单-->
<div class="layui-fluid layui-form-pane layui-personal" id="addDiv" hidden="" style="margin: 15px;">
    <form class="layui-form" id="addForm" action="" lay-filter="example" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label xrequired">职位分类名称</label>
            <div class="layui-input-block">
                <input type="text" name="postCategoryName" lay-verify="required" autocomplete="off" placeholder="请输入职位分类名称"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label xrequired">所属行业</label>
            <div class="layui-input-block" style="width:150px;">
                <#--<select name="industryID" id="industryIDAdd" lay-filter="industryID"-->
                        <#--lay-verify="required">-->
                <#--</select>-->

                <input name="industryIDAddShow" id="industryIDAddShow" readonly="readonly" type="text"
                       autocomplete="off" placeholder="请输入所属行业" class="layui-input" style="padding-right: 0px;width: 144px;height: 38px;padding-left: 10px;"
                       lay-verify="required">
                <input name="industryID" id="industryIDAdd" hidden="true" type="text">
                <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachindustryIDAdd"><i
                            class="layui-icon layui-icon-search"></i></button>
            </div>
        </div>

        <div class="layui-form-item" hidden="true">
            <label class="layui-form-label xrequired">所属总公司</label>
            <div class="layui-input-block">
                <input type="text" name="companyId" id="companyId" lay-verify="required" autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="addsubmitfilter">立即提交</button>
                <button id="reset" type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
<#include "../../baseFtl/loadLinkData.ftl" />
<script>
    //列表显示
    var addOpen = null;
    layui.use('table', function () {
        var table = layui.table;
        var param = null;
        var colsParam = null;
        if ("${currentUser.companyType!}" == 1) {
            //如果是总公司查看
            param = {"companyId":"${currentUser.companyId!}"};
            colsParam = [[
                {type: 'checkbox', fixed: 'left', width: 40}
                , {field: 'postCategoryId', title: 'id', sort: true, fixed: 'left'}
                , {field: 'name', edit: 'text',title: '职位分类名称'}
                , {field: 'industryName',title: '行业名称'}
                , {fixed: 'right', title: '操作', align: 'center', toolbar: '#barDemo'}

            ]]
        }else if ("${currentUser.companyType!}" == 2) {
            param = {"companyId":"${currentUser.parentCompanyId!}"};
            colsParam = [[
                {type: 'checkbox', fixed: 'left', width: 40}
                , {field: 'postCategoryId', title: 'id', sort: true, fixed: 'left'}
                , {field: 'name',title: '职位分类名称'}
                , {field: 'industryName',title: '行业名称'}
            ]]
            $("#add").css("display","none")
        }
        table.render({
            elem: '#postCategory'
            , url: storeHost + "/manage/beautician/selectPostCategoryList"
            , id: "postCategoryReload"
            , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , page: true          //显示分页默认不显示
            , method: 'post'
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
    });


    layui.use(['table', 'layer', 'jquery', 'form'], function () {
        var table = layui.table,
                $ = layui.jquery,
                form = layui.form;
        loadIndustry(form)
        loadIndustrySearch(form)
        //监听工具条
        table.on('tool(demo)', function (obj) {
            var data = obj.data;
            if (obj.event === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    layerDelete(data, table, $);
                    obj.del();
                    layer.close(index);
                });
            }
        });


123
        /*------所属行业关联数据添加------*/
        $("#" + "serachindustryIDAdd").click(function () {
            var url = storeHost + "/manage/industry/selectList";
            var param = {};
            loadLinkData(layer, layui, url, "industryID", "industryName", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "industryIDAdd").val(data.industryID);
                $("#" + "industryIDAddShow").val(data.industryName);
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




        var $ = layui.$, active = {
            search: function () {
                var postCategoryNameKeyword = $(".demoTable input[name='postCategoryNameKeyword']").val();
                var postIndustryIDSearch = $(".demoTable select[name='postIndustryIDSearch'] option:selected").val();
                var param = null;
                var colsParam = null;
                if ("${currentUser.companyType!}" == 1) {
                    //如果是总公司查看
                    param = { postCategoryNameKeyword: postCategoryNameKeyword,postIndustryIDSearch: postIndustryIDSearch,companyId:"${currentUser.companyId!}"};
                    colsParam = [[
                        {type: 'checkbox', fixed: 'left', width: 40}
                        , {field: 'postCategoryId', title: 'id', sort: true, fixed: 'left'}
                        , {field: 'name', edit: 'text',title: '职位分类名称'}
                        , {field: 'industryName',title: '行业名称'}
                        , {fixed: 'right', title: '操作', align: 'center', toolbar: '#barDemo'}

                    ]]
                }else if ("${currentUser.companyType!}" == 2) {
                    param = { postCategoryNameKeyword: postCategoryNameKeyword,postIndustryIDSearch: postIndustryIDSearch,companyId:"${currentUser.parentCompanyId!}"};
                    colsParam = [[
                        {type: 'checkbox', fixed: 'left', width: 40}
                        , {field: 'postCategoryId', title: 'id', sort: true, fixed: 'left'}
                        , {field: 'name',title: '职位分类名称'}
                        , {field: 'industryName',title: '行业名称'}
                    ]]
                }
                table.render({
                    elem: '#postCategory'
                    , url: storeHost + "/manage/beautician/selectPostCategoryList"
                    , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    , page: true          //显示分页默认不显示
                    , method: 'post'
                    , id: "postCategoryReload"
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
            }
        };
        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        //添加提交
        form.on('submit(addsubmitfilter)', function (data) {
            /* ----------------提交的代码------------------*/
            var industry = $("select[name='industryID'] option:selected").val()
            var url = storeHost + "/manage/beautician/insertPostCategory";
            var params = {
                name: $("input[name='postCategoryName']").val(),
                companyId: $("input[name='companyId']").val(),
                industryID: $("input[name='industryID']").val(),
                createOperator: "${currentUser.trueName!}"
            };
            $.post(url, params, function (res) {
                if (res.responseStatusType.message == "Success") {
                    layer.open({
                        title: '添加'
                        , content: '添加成功！'
                        , btn: ["关闭"]
                        , btn2: function (index) {
                            layer.close(index);
                        }, end: function () {
                            table.reload("postCategoryReload");
                            layer.close(addOpen);
                        }
                    });
                    //重新加载表格
                    layui.form.render();
                } else {
                    layer.msg(res.responseStatusType.error.errorMsg, {
                        time: 20000, //20s后自动关闭
                        btn: ['明白了']
                    });
                }
            })
            return false;
        });
    });


    //删除行业按钮事件
    function layerDelete(data, table, $) {
        var url = storeHost + "/manage/beautician/deletePostCategory";
        var data = {
            postCategoryId: data.postCategoryId,
        };
        $.post(url, data, function (res) {
            if (res.responseStatusType.message == "Success") {
                layer.open({
                    title: '删除'
                    , content: '删除成功！'
                });c
                //重新加载表格
                table.reload("postCategoryReload");
            } else {
                layer.open({
                    title: '删除'
                    , content: '删除失败！'
                });
            }
        })
    }


    $("#add").click(function () {
        $("#reset").click();//重置表单(新建时在进入表单前要重置一下表单的内容，不然表单打开后会显示上一次的表单的内容。这里调用表单中重置按钮的点击方法来重置)
        addOpen = layer.open({//开启表单弹层
            area: ['427px', "397px"],
            type: 1,
            title: '新建职位分类',
            content: $('#addDiv'), //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
            success: function () {
                $("#companyId").val("${currentUser.companyId!}");
            }

        });
    });
    //监听单元格编辑
    layui.use('table', function () {
        var table = layui.table;
        table.on('edit(demo)', function (obj) {
            var value = obj.value //得到修改后的值
                    , data = obj.data //得到所在行所有键值
                    , field = obj.field; //得到字段
            var paramsValue = null;
            if (field == "name") {
                paramsValue = {
                    postCategoryId: data.postCategoryId,
                    name: value,
                    modifyOperator: "${currentUser.trueName!}"
                };
            }
            layer.msg('[ID: ' + data.postId + '] ' + field + ' 字段更改为：' + value, {
                time: 20000, //20s后自动关闭
                btn: ['确认修改', '取消'],
                yes: function (index, layero) {
                    var url = storeHost + "/manage/beautician/updatePostCategory";
                    var params = paramsValue;
                    $.post(url, params, function (res) {
                        if (res.responseStatusType.message == "Success") {
                            layer.msg("修改成功")
                            table.reload("industryReload");
                        } else {
                            layer.msg(res.responseStatusType.error.errorMsg, {
                                time: 20000, //20s后自动关闭
                                btn: ['明白了']
                            });
                        }
                    })
                },
                btn2: function () {
                    table.reload("postCategoryReload");
                }
            });
        });
    });

    function loadIndustry(form) {
        var url = storeHost + "/manage/industry/selectListIndustryNoPage";
        $.post(url, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("industryIDAdd"); //server为select定义的id
                server.innerHTML = "<option value='' selected='selected'>请选择</option>";
                for (var p in list) {
                    var option = document.createElement("option");  // 创建添加option属性
                    option.setAttribute("value", list[p].industryID); // 给option的value添加值
                    option.innerText = list[p].industryName;     // 打印option对应的纯文本
                    server.appendChild(option);           //给select添加option子标签
                }
                form.render();
            }
        })
    }

    //加载行业信息
    function loadIndustrySearch(form) {
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
</script>




</body>
</html>