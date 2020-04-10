<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>底薪</title>
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
        <div class="layui-btn-group" align="left">
            <#--<button class="layui-btn" onclick="addBaseSalary()" style="float: right">添加底薪</button>-->
            <button class="layui-btn" id="addBaseSalary">添加底薪</button>
        </div>
        <table id="basesalary" lay-filter="demo"></table>
    </div>
</div>

<form id="form" class="layui-form layui-form-pane layui-personal" action="" lay-filter="form" method="post"
      hidden="true">

    <div class="layui-form-item" hidden="hidden">
        <label class="layui-form-label xrequired">id</label>
        <div class="layui-input-block" style="width:150px;">
            <input type="text" name="baseSalaryScoreID" autocomplete="off" placeholder=""
                   class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label xrequired">底薪名称</label>
            <div class="layui-input-block">
                <input type="text" name="BaseSalaryName" lay-verify="required" autocomplete="off" placeholder="请输入底薪名称"
                       class="layui-input">
            </div>
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">所属行业</label>
        <div class="layui-input-inline">
            <input name="baseSalaryIndustryIDAddShow" id="baseSalaryIndustryIDAddShow" readonly="readonly"
                   type="text"
                   autocomplete="off" placeholder="请输入行业" class="layui-input" style="padding-right: 80px;"
                    <#-- lay-verify="required"-->>
            <input name="baseSalaryIndustryID" id="baseSalaryIndustryIDAdd" hidden="true" type="text">
            <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachBaseSalaryIndustryIDAdd"><i
                        class="layui-icon layui-icon-search"></i></button>

        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">所属门店</label>
        <div class="layui-input-inline">
            <input name="baseSalaryStoreIdAddShow" id="baseSalaryStoreIdAddShow" readonly="readonly"
                   type="text"
                   autocomplete="off" placeholder="请输入所属门店" class="layui-input" style="padding-right: 80px;"
                    <#--lay-verify="required"-->>
            <input name="baseSalaryStoreId" id="baseSalaryStoreIdAdd" hidden="true" type="text">
            <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachBaseSalaryStoreIdAdd"><i
                        class="layui-icon layui-icon-search"></i></button>

        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">职位分类</label>
        <div class="layui-input-inline">
            <input name="baseSalaryPostIDAddShow" id="baseSalaryPostIDAddShow" readonly="readonly"
                   type="text"
                   autocomplete="off" placeholder="请输入职位分类" class="layui-input" style="padding-right: 80px;"
                    <#--lay-verify="required"-->>
            <input name="baseSalaryPostID" id="baseSalaryPostIDAdd" hidden="true" type="text">
            <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachBaseSalaryPostIDAdd"><i
                        class="layui-icon layui-icon-search"></i></button>

        </div>
    </div>


    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label xrequired">最低分</label>
            <div class="layui-input-block">
                <input type="text" name="BaseSalaryLow" lay-verify="required" autocomplete="off" placeholder="请输入最低分"
                       class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label xrequired">底薪</label>
            <div class="layui-input-block">
                <input type="text" name="BaseSalaryAmount" lay-verify="required" autocomplete="off" placeholder="请输入底薪"
                       class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item" hidden="hidden">
        <div class="layui-input-block">
            <button id="reset" type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<#include "../../baseFtl/loadLinkData.ftl" />
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script>

    //列表显示
    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#basesalary'
            , url: dataHost + "/manage/baseSalary/selectList"
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
            , id: 'baseSalaryRender'
            , cols: [[
                {type: 'checkbox', fixed: 'left', width: 40}
                , {field: 'baseSalaryName', title: ' 底薪名称', sort: true, fixed: 'left'}
                , {field: 'industryName', title: ' 行业名称', sort: true, fixed: 'left'}
                , {field: 'storeName', title: ' 门店名称', sort: true, fixed: 'left'}
                , {field: 'postName', title: ' 职务名称', sort: true, fixed: 'left'}
                , {field: 'baseSalaryLow', title: ' 最低分', sort: true, fixed: 'left'}
                , {field: 'baseSalaryAmount', title: '底薪'}
                , {fixed: 'right', title: '操作', width: 180, align: 'center', toolbar: '#barDemo'}
            ]]
        });
    });


    //增删改查操作实现
    layui.use(['table', 'layer', 'jquery', 'form'], function () {
        var table = layui.table,
            layer = layui.layer,
            $ = layui.jquery,
            form = layui.form;


        /*------行业关联数据查看-添加/修改------*/
        $("#" + "serachBaseSalaryIndustryIDAdd").click(function () {
            var url = storeHost + "/manage/industry/selectList";
            var param = {};
            loadLinkData(layer, layui, url, "industryID", "industryName", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "baseSalaryIndustryIDAddShow").val(data.industryName);
                $("#" + "baseSalaryIndustryIDAdd").val(data.industryID);
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

        /*------所属门店关联数据查看-添加/修改------*/
        $("#" + "serachBaseSalaryStoreIdAdd").click(function () {
            var url = storeHost + "/manage/store/selectStoreList";
            var industryIdAdd = $("input[id='baseSalaryIndustryIDAdd']").val();
            if (industryIdAdd == "" || industryIdAdd == null) {
                layer.msg("请先选择所属行业")
                return
            }
            var param = {
                companyId: "${currentUser.companyId!}",
                companyType: "${currentUser.companyType!}",
                industryID: industryIdAdd
            };
            loadLinkData(layer, layui, url, "storeId", "name", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "baseSalaryStoreIdAddShow").val(data.name);
                $("#" + "baseSalaryStoreIdAdd").val(data.storeId);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {
                    keyWordName: wordSearch,
                    companyId: "${currentUser.companyId!}",
                    companyType: "${currentUser.companyType!}",
                    industryID: industryIdAdd
                }
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

        /*------所属职位分类关联数据查看-添加/修改------*/
        $("#" + "serachBaseSalaryPostIDAdd").click(function () {
            var url = storeHost + "/manage/beautician/selectPostCategoryList";
            var industryIdAdd = $("input[id='baseSalaryIndustryIDAdd']").val();
            if (industryIdAdd == "" || industryIdAdd == null) {
                layer.msg("请先选择所属行业")
                return
            }
            var param = {postIndustryIDSearch: industryIdAdd};
            loadLinkData(layer, layui, url, "postCategoryId", "name", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "baseSalaryPostIDAddShow").val(data.name);
                $("#" + "baseSalaryPostIDAdd").val(data.postCategoryId);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {postCategoryNameKeyword: wordSearch, postIndustryIDSearch: industryIdAdd}
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
        var data = null;
        table.on('tool(demo)', function (obj) {
            data = obj.data;
            if (obj.event === 'detail') {
                layerShow(data, table, $, form)
            } else if (obj.event === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    layerDelete(data, $);
                    obj.del();
                    layer.close(index);
                });
            } else if (obj.event === 'edit') {
                $("#createOperator").attr("hidden", "hidden");
                $("#modifyOperator").attr("hidden", "hidden");
                layerShowAndEdit(data, table, $, form);
            }
        })


        form.on('select(BaseSalaryIndustryID)', function (obj) {
            var value = obj.value; //得到修改后的值 storeid
            loadPost(form, value);
        });


        //----------------------添加底薪点击事件--------------------------
        $(document).on('click', '#addBaseSalary', function () {
            $("#createOperator").attr("hidden", "hidden");
            $("#modifyOperator").attr("hidden", "hidden");
            // document.getElementById("form").reset();
            $("#reset").click();
            layer.open({
                type: 1,
                title: '添加底薪',
                content: $('#form'),
                area: ['500px', '400px'],
                closeBtn: 1,
                btn: ['确定', '取消'],
                yes: function (index, layero) {
                    //监听提交
                    layui.form.on('submit(formVerify)', function (data) {
                        var BaseSalaryName = layero.find("input[name='BaseSalaryName']").val();
                        var IndustryID = layero.find("input[id='baseSalaryIndustryIDAdd']").val();
                        var Store = layero.find("input[id='baseSalaryStoreIdAdd']").val();
                        var Post = layero.find("input[id='baseSalaryPostIDAdd']").val();
                        var baseSalaryLow = layero.find("input[name='BaseSalaryLow']").val();
                        var baseSalaryAmount = layero.find("input[name='BaseSalaryAmount']").val();
                        var url = dataHost + "/manage/baseSalary/addBaseSalary";
                        var params = {
                            baseSalaryName: BaseSalaryName,
                            baseSalaryIndustryID: IndustryID,
                            baseSalaryStoreId: Store,
                            baseSalaryPostID: Post,
                            baseSalaryLow: baseSalaryLow,
                            baseSalaryAmount: baseSalaryAmount,
                            createOperator: "${currentUser.trueName!}"
                        };
                        //表单取值
                        $.post(url, params, function (res) {
                            if (res.responseStatusType.message == "Success") {
                                //重新加载表格
                                layer.msg("添加成功");
                                layer.close(index);
                                //重新加载表格
                                table.reload('baseSalaryRender', {
                                    page: {
                                        curr: 1 //重新从第 1 页开始
                                    }
                                }, 'data');
                            } else {
                                layer.open({
                                    title: '添加'
                                    , content: '添加失败！'
                                    , btn: ["关闭"]
                                });
                            }
                        });
                        return false;
                    })
                },
                btn2: function () {
                    layer.closeAll();
                },
                success: function (layero) {
                    // 校验方法添加（追加class，filter属性）
                    layero.addClass('layui-form');
                    layero.find('.layui-layer-btn0').attr('lay-filter', 'formVerify').attr('lay-submit', '');
                    layui.form.render();
                },
            });
        });
    });


    //删除用户按钮事件
    function layerDelete(data, $, table) {
        //删除数据库数据
        var url = dataHost + "/manage/baseSalary/deleteBaseSalary";
        var data = {
            baseSalaryScoreID: data.baseSalaryScoreID,
            modifyOperator: "${currentUser.trueName!}"
        };
        $.post(url, data, function (res) {
            if (res.responseStatusType.message == "Success") {
                layer.msg("删除成功");
                //重新加载表格
                table.reload('baseSalaryRender', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                }, 'data');
            } else {
                layer.open({
                    title: '删除'
                    , content: '删除失败！'
                });
            }
        })
    }

    //修改按钮事件
    function layerShowAndEdit(data, table, $, form) {
        //页面弹框
        var a1 = layer.open({
            type: 1,
            title: '底薪编辑详情',
            content: $('#form'),
            area: ['400px', '450px'],
            closeBtn: 1,
            btn: ['提交', '取消'],
            yes: function (index, layero) {
                layui.form.on('submit(formVerify)', function (data) {
                    var url = dataHost + "/manage/baseSalary/updateBaseSalary";
                    var baseSalaryScoreID = layero.find("input[name='baseSalaryScoreID']").val();
                    var BaseSalaryName = layero.find("input[name='BaseSalaryName']").val();


                    var industryID = layero.find("input[id='baseSalaryIndustryIDAdd']").val();
                    var Store = layero.find("input[id='baseSalaryStoreIdAdd']").val();
                    var Post = layero.find("input[id='baseSalaryPostIDAdd']").val();

                    var baseSalaryLow = layero.find("input[name='BaseSalaryLow']").val();
                    var baseSalaryAmount = layero.find("input[name='BaseSalaryAmount']").val();

                    var params = {
                        baseSalaryScoreID: baseSalaryScoreID
                        , baseSalaryName: BaseSalaryName
                        , baseSalaryIndustryID: industryID
                        , baseSalaryStoreId: Store
                        , baseSalaryPostID: Post
                        , baseSalaryLow: baseSalaryLow
                        , baseSalaryAmount: baseSalaryAmount
                        , modifyOperator: "${currentUser.trueName!}"
                    };
                    $.post(url, params, function (res) {
                        if (res.responseStatusType.message == "Success") {
                            //重新加载表格
                            layer.msg("修改成功");
                            layer.close(index);
                            //重新加载表格
                            table.reload('baseSalaryRender', {
                                page: {
                                    curr: 1 //重新从第 1 页开始
                                }
                            }, 'data');
                        } else {
                            layer.msg(res.responseStatusType.error.errorMsg, {
                                time: 20000, //20s后自动关闭
                                btn: ['修改失败']
                            });
                        }
                    })
                })
            },
            btn2: function () {
                layer.close(a1);
            },
            success: function (layero) {
                layero.addClass('layui-form');
                layero.find('.layui-layer-btn0').attr('lay-filter', 'formVerify').attr('lay-submit', '');
                //表单赋值
                form.val('form', {
                    "baseSalaryScoreID": data.baseSalaryScoreID
                    , "BaseSalaryName": data.baseSalaryName

                    , "baseSalaryIndustryID": data.baseSalaryIndustryID
                    , "baseSalaryIndustryIDAddShow": data.industryName


                    , "baseSalaryStoreId": data.baseSalaryStoreId
                    , "baseSalaryStoreIdAddShow": data.storeName

                    , "baseSalaryPostID": data.baseSalaryPostID
                    , "baseSalaryPostIDAddShow": data.postName

                    , "BaseSalaryLow": data.baseSalaryLow
                    , "BaseSalaryAmount": data.baseSalaryAmount
                });
                layui.form.render();
            },
        });
    }

    //查看按钮事件
    function layerShow(data, table, $, form) {
        //页面弹框
        var a2 = layer.open({
            type: 1,
            title: '底薪详情',
            content: $('#form'),
            area: ['350px', '550px'],
            closeBtn: 1,
            btn: ['关闭'],
            btn2: function () {
                layer.close(a2);
            },
            success: function (layero) {
                //表单赋值
                form.val('form', {
                    "BaseSalaryName": data.baseSalaryName

                    , "baseSalaryIndustryID": data.baseSalaryIndustryID
                    , "baseSalaryIndustryIDAddShow": data.industryName


                    , "baseSalaryStoreId": data.baseSalaryStoreId
                    , "baseSalaryStoreIdAddShow": data.storeName

                    , "baseSalaryPostID": data.baseSalaryPostID
                    , "baseSalaryPostIDAddShow": data.postName

                    , "BaseSalaryLow": data.baseSalaryLow
                    , "BaseSalaryAmount": data.baseSalaryAmount
                });
            }
            // ,end: function () {
            //     window.location.reload();
            // }
        });
    }


</script>


</body>
</html>