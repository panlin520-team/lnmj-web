<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>门店标签</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${basePath!}/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${basePath!}/css/index.css" media="all"/>
    <script src="${basePath!}/layui/layui.js" charset="utf-8"></script>
    <script src="${basePath!}/js/jquery.min.js" type="text/javascript"></script>
    <script src="${basePath!}/js/Sortable.js" type="text/javascript"></script>
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
    <div class="demoTable layui-form">
        <div class="layui-btn-group" align="left">
            <button class="layui-btn" id="addScore">添加评分</button>
        </div>
        <table id="score" lay-filter="demo"></table>
    </div>
</div>


<form id="form" class="layui-form layui-form-pane layui-personal" action="" lay-filter="form" method="post"
      hidden="true">


    <div class="layui-form-item" hidden="hidden">
        <label class="layui-form-label xrequired">id</label>
        <div class="layui-input-block" style="width:150px;">
            <input type="text" name="scoreID" autocomplete="off" placeholder=""
                   class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label xrequired">评分名称</label>
            <div class="layui-input-block">
                <input type="text" name="scoreName" lay-verify="required" autocomplete="off" placeholder="请输入评分名称"
                       class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">计分方式</label>
            <div class="layui-input-inline">
                <select name="scoreMode" lay-filter="scoreMode">
                </select>
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">所属行业</label>
        <div class="layui-input-inline">
            <input name="achievementIndustryIDAddShow" id="achievementIndustryIDAddShow" readonly="readonly"
                   type="text"
                   autocomplete="off" placeholder="请输入行业" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;"
                    <#-- lay-verify="required"-->>
            <input name="achievementIndustryID" id="achievementIndustryIDAdd" hidden="true" type="text">
            <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachAchievementIndustryIDAdd"><i
                        class="layui-icon layui-icon-search"></i></button>

        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">所属业绩分类</label>
        <div class="layui-input-inline">
            <input name="achievementIDAddShow" id="achievementIDAddShow" readonly="readonly"
                   type="text"
                   autocomplete="off" placeholder="请输入业绩分类" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;"
                    <#--lay-verify="required"-->>
            <input name="achievementID" id="achievementIDAdd" hidden="true" type="text">
            <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachAchievementIDAdd"><i
                        class="layui-icon layui-icon-search"></i></button>

        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">业绩</label>
        <div class="layui-input-inline">
            <input name="scoreAchievementIDAddShow" id="scoreAchievementIDAddShow" readonly="readonly"
                   type="text"
                   autocomplete="off" placeholder="请输入业绩" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;"
                    <#--lay-verify="required"-->>
            <input name="scoreAchievementID" id="scoreAchievementIDAdd" hidden="true" type="text">
            <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachScoreAchievementIDAdd"><i
                        class="layui-icon layui-icon-search"></i></button>

        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">所属职位</label>
        <div class="layui-input-inline">
            <input name="postCategoryIdAddShow" id="postCategoryIdAddShow" readonly="readonly"
                   type="text"
                   autocomplete="off" placeholder="请输入职位" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;"
                    <#-- lay-verify="required"-->>
            <input name="postCategoryId" id="postCategoryIdAdd" hidden="true" type="text">
            <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachPostCategoryIdAdd"><i
                        class="layui-icon layui-icon-search"></i></button>

        </div>
    </div>


    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label xrequired">最高分</label>
            <div class="layui-input-block">
                <input type="text" name="scoreHigh" lay-verify="required" autocomplete="off"
                       placeholder="请输入最高分"
                       class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label xrequired">最低分</label>
            <div class="layui-input-block">
                <input type="text" name="scoreLow" lay-verify="required" autocomplete="off" placeholder="请输入最低分"
                       class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label xrequired">默认分数</label>
            <div class="layui-input-block">
                <input type="text" name="scoreDefault" lay-verify="required" autocomplete="off"
                       placeholder="请输入默认分数"
                       class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label xrequired">分值基数</label>
            <div class="layui-input-block">
                <input type="text" name="scoreBase" lay-verify="required" autocomplete="off"
                       placeholder="请输入分值基数"
                       class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label xrequired">业绩基数</label>
            <div class="layui-input-block">
                <input type="text" name="scoreProportion" lay-verify="required" autocomplete="off"
                       placeholder="请输入业绩基数"
                       class="layui-input">
            </div>
        </div>
    </div>

    <span style="color: red">注：评分=（业绩总额-业绩基数）/分值基数+默认分数
        判断得分是否低于最低分，如果低于最低分，按最低分算，如果高于最高分，按最高分算</span>


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

<script type="text/html" id="scoreMode">
    {{#  if(d.scoreMode = 0){ }}
    自动计分
    {{#  if(d.scoreMode = 1)}
    手动评分
    {{#  } }}
</script>

<script>

    // var performanceList;//业绩list
    //列表显示
    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#score'
            , url: dataHost + "/manage/score/selectList"
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
                storeId: "${currentUser.storeId!}"
            }
            , id: 'score'
            , cols: [[
                {type: 'checkbox', fixed: 'left', width: 40}
                , {field: 'scoreName', title: ' 评分名称', sort: true, fixed: 'left'}
                , {
                    field: 'scoreMode', title: ' 评分模式', sort: true, fixed: 'left'
                    , templet: function (d) {
                        return d.scoreMode == 0 ? "自动计分" : "手动计分"
                    }
                }
                // , {field: 'achievementName', title: ' 业绩名称', sort: true, fixed: 'left',templet:function (d) {
                //         for (var n in performanceList) {
                //             if (performanceList[n].id == d.scoreAchievementID) {
                //                 return performanceList[n].achievementPostName;
                //             }
                //         }
                //     }}
                , {field: 'postName', title: ' 职位名称', sort: true, fixed: 'left'}
                , {field: 'scoreHigh', title: ' 最高分', sort: true, fixed: 'left'}
                , {field: 'scoreLow', title: '最低分'}
                , {field: 'scoreDefault', title: '默认分数'}
                , {field: 'scoreBase', title: '分值基数'}
                , {field: 'scoreProportion', title: '业绩基数'}
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
        //监听工具条
        var data = null;
        loadScoreMode(form);
        /*------行业关联数据查看-添加/修改------*/
        $("#" + "serachAchievementIndustryIDAdd").click(function () {
            var url = storeHost + "/manage/industry/selectList";
            var param = {};
            loadLinkData(layer, layui, url, "industryID", "industryName", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "achievementIndustryIDAddShow").val(data.industryName);
                $("#" + "achievementIndustryIDAdd").val(data.industryID);
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

        /*------所属业绩分类关联数据查看-添加/修改------*/
        $("#" + "serachAchievementIDAdd").click(function () {
            var url = dataHost + "/performance/selectPerformanceList";
            var industryIdAdd = $("input[id='achievementIndustryIDAdd']").val();
            if (industryIdAdd == "" || industryIdAdd == null) {
                layer.msg("请先选择所属行业")
                return
            }
            var param = {achievementIndustryID: industryIdAdd};
            loadLinkData(layer, layui, url, "achievementID", "achievementName", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "achievementIDAddShow").val(data.achievementName);
                $("#" + "achievementIDAdd").val(data.achievementID);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {keyWordAchievementName: wordSearch, achievementIndustryID: industryIdAdd}
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

        /*------业绩关联数据查看-添加/修改------*/
        $("#" + "serachScoreAchievementIDAdd").click(function () {
            var url = dataHost + "/performance/selectPerformancePostList";
            var achievementIDAdd = $("input[id='achievementIDAdd']").val();
            if (achievementIDAdd == "" || achievementIDAdd == null) {
                layer.msg("请先选择所属业绩分类")
                return
            }
            var param = {achievementID: achievementIDAdd};
            loadLinkData(layer, layui, url, "id", "achievementPostName", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "scoreAchievementIDAddShow").val(data.achievementPostName);
                $("#" + "scoreAchievementIDAdd").val(data.id);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {keyWord: wordSearch, achievementID: achievementIDAdd}
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
        $("#" + "serachPostCategoryIdAdd").click(function () {
            var url = storeHost + "/manage/beautician/selectPostCategoryList";
            var industryIdAdd = $("input[id='achievementIndustryIDAdd']").val();
            if (industryIdAdd == "" || industryIdAdd == null) {
                layer.msg("请先选择所属行业")
                return
            }
            var param = {postIndustryIDSearch: industryIdAdd};
            loadLinkData(layer, layui, url, "postCategoryId", "name", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "postCategoryIdAddShow").val(data.name);
                $("#" + "postCategoryIdAdd").val(data.postCategoryId);
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


        table.on('tool(demo)', function (obj) {
            data = obj.data;
            if (obj.event === 'detail') {
                layerShow(data, table, $, form)
            } else if (obj.event === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    layerDelete(data, table, $);
                    obj.del();
                    layer.close(index);
                });
            } else if (obj.event === 'edit') {
                $("#createOperator").attr("hidden", "hidden");
                $("#modifyOperator").attr("hidden", "hidden");
                layerShowAndEdit(data, table, $, form);
            }
        })

        //----------------------添加评分点击事件--------------------------
        $(document).on('click', '#addScore', function () {
            $("#createOperator").attr("hidden", "hidden");
            $("#modifyOperator").attr("hidden", "hidden");
            $("#reset").click();
            layer.open({
                type: 1,
                title: '添加评分',
                content: $('#form'),
                area: ['550px', '450px'],
                closeBtn: 1,
                btn: ['确定', '取消'],
                success: function (layero) {
                    // 校验方法添加（追加class，filter属性）
                    layero.addClass('layui-form');
                    layero.find('.layui-layer-btn0').attr('lay-filter', 'formVerify').attr('lay-submit', '');
                    layui.form.render();

                },
                yes: function (index, layero) {
                    layui.form.on('submit(formVerify)', function (data) {
                        var url = dataHost + "/manage/score/addScore";

                        var scoreMode = layero.find("select[name='scoreMode']");
                        scoreMode = scoreMode.find("option:selected").val();
                        var scoreAchievementID = layero.find("input[id='scoreAchievementIDAdd']").val();
                        var scorePostID = layero.find("input[id='postCategoryIdAdd']").val();
                        var params = {
                            scoreName: layero.find("input[name='scoreName']").val(),
                            scoreMode: scoreMode,
                            scoreAchievementID: scoreAchievementID,
                            scorePostID: scorePostID,
                            scoreHigh: layero.find("input[name='scoreHigh']").val(),
                            scoreLow: layero.find("input[name='scoreLow']").val(),
                            scoreDefault: layero.find("input[name='scoreDefault']").val(),
                            scoreBase: layero.find("input[name='scoreBase']").val(),
                            scoreProportion: layero.find("input[name='scoreProportion']").val(),
                            createOperator: "${currentUser.trueName!}"
                        };
                        $.post(url, params, function (res) {
                            if (res.responseStatusType.message == "Success") {
                                //重新加载表格
                                layer.msg("添加成功");
                                layer.close(index);
                                //重新加载表格
                                table.reload('score', {
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
            });
        });

    });

    //删除用户按钮事件
    function layerDelete(data, table, $) {
        //删除数据库数据
        var url = dataHost + "/manage/score/deleteScore";
        var data = {
            scoreID: data.scoreID,
            modifyOperator: "${currentUser.trueName!}"
        };
        $.post(url, data, function (res) {
            if (res.responseStatusType.message == "Success") {
                layer.open({
                    title: '删除'
                    , content: '删除成功！'
                });
                //重新加载表格
                //重新加载表格
                table.reload('score', {
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
            title: '用户详情',
            content: $('#form'),
            area: ['650px', '450px'],
            closeBtn: 1,
            btn: ['提交', '取消'],

            btn2: function () {
                layer.close(a1);
            },
            success: function (layero) {
                //表单赋值
                form.val('form', {
                    "scoreID": data.scoreID

                    , "scoreName": data.scoreName
                    , "scoreMode": data.scoreMode

                    , "scoreAchievementID": data.scoreAchievementID
                    , "scoreAchievementIDAddShow": data.achievementName


                    , "postCategoryId": data.scorePostID
                    , "postCategoryIdAddShow": data.postName

                    , "scoreHigh": data.scoreHigh
                    , "scoreLow": data.scoreLow
                    , "scoreDefault": data.scoreDefault
                    , "scoreBase": data.scoreBase
                    , "scoreProportion": data.scoreProportion
                });
                layero.addClass('layui-form');
                layero.find('.layui-layer-btn0').attr('lay-filter', 'formVerify').attr('lay-submit', '');
                layui.form.render();
            }
            , yes: function (index, layero) {
                form.on('submit(formVerify)', function (data) {
                    var url = dataHost + "/manage/score/updateScore";
                    var scoreID = layero.find("input[name='scoreID']").val();
                    var scoreName = layero.find("input[name='scoreName']").val();
                    var scoreMode = layero.find("select[name='scoreMode']");
                    scoreMode = scoreMode.find("option:selected").val();

                    var scoreAchievementID = layero.find("input[id='scoreAchievementIDAdd']").val();
                    var scorePostID = layero.find("input[id='postCategoryIdAdd']").val();

                    var scoreHigh = layero.find("input[name='scoreHigh']").val();
                    var scoreLow = layero.find("input[name='scoreLow']").val();
                    var scoreDefault = layero.find("input[name='scoreDefault']").val();
                    var scoreBase = layero.find("input[name='scoreBase']").val();
                    var scoreProportion = layero.find("input[name='scoreProportion']").val();
                    var params = {
                        "scoreID": scoreID
                        , "scoreName": scoreName
                        , "scoreMode": scoreMode
                        , "scoreAchievementID": scoreAchievementID
                        , "scorePostID": scorePostID
                        , "scoreHigh": scoreHigh
                        , "scoreLow": scoreLow
                        , "scoreDefault": scoreDefault
                        , "scoreBase": scoreBase
                        , "scoreProportion": scoreProportion
                        , modifyOperator: "${currentUser.trueName!}"
                    };
                    $.post(url, params, function (res) {
                        if (res.responseStatusType.message == "Success") {
                            //重新加载表格
                            layer.msg("修改成功");
                            layer.close(index);
                            //重新加载表格
                            table.reload('score', {
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

            }
        });
    }

    //查看按钮事件
    function layerShow(data, table, $, form) {
        //页面弹框
        var a2 = layer.open({
            type: 1,
            title: '门店标签详情',
            content: $('#form'),
            area: ['550px', '450px'],
            closeBtn: 1,
            btn: ['关闭'],
            btn2: function () {
                layer.close(a2);
            },
            success: function (layero) {
                //表单赋值
                form.val('form', {
                    "scoreName": data.scoreName
                    , "scoreMode": data.scoreMode
                    , "scoreAchievementID": data.scoreAchievementID
                    , "scoreAchievementIDAddShow": data.achievementName
                    , "postCategoryId": data.scorePostID
                    , "postCategoryIdAddShow": data.postName
                    , "scoreHigh": data.scoreHigh
                    , "scoreLow": data.scoreLow
                    , "scoreDefault": data.scoreDefault
                    , "scoreBase": data.scoreBase
                    , "scoreProportion": data.scoreProportion
                });
            },
            // end: function () {
            //     window.location.reload();
            // }
        });
    }

    function loadScoreMode(form) {
        var url = dataHost + "/manage/score/selectScoreMode";
        $.post(url, function (res) {
            if (res.responseStatusType.message == "Success") {
                scoreMode = res.result;
                for (var p in scoreMode) {
                    var option = "<option value='" + p + "'>" + scoreMode[p] + "</option>";
                    $("select[name='scoreMode']").append(option);
                }
                form.render();
            }
        })
    }


</script>
</body>
</html>
