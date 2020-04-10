<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>业绩阶梯</title>
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
            width: 79px;
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
            <label class="layui-form-label resetLabel">业绩</label>
            <div class="layui-input-inline" style="width: 250px">
                <select id="achievementSearch" name="achievementSearch" lay-filter="achievementSearch">

                </select>
            </div>
            <div class="layui-inline">
                <button class="layui-btn" data-type="search" id="searchBtn"><i class="layui-icon layui-icon-search"></i>
                </button>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label resetLabel">业绩</label>
            <div class="layui-input-inline" style="width: 250px">
                <select id="achievementAdd" name="achievementAdd" lay-filter="achievementAdd">

                </select>
            </div>
            <div class="layui-inline">
                <button class="layui-btn" onclick="addNewLadder()">添加业绩阶梯</button>
            </div>
        </div>
    </div>
    <#--显示阶梯-->
        <table id="ladder" lay-filter="ladder"></table>
    <#--阶梯操作表单-->
    <form class="layui-form ladderForm layui-form-pane layui-personal" action="" id="ladderForm" lay-filter="ladderForm"
          hidden="true">
        <div class="layui-form-item" hidden>
            <label class="layui-form-label">阶梯ID</label>
            <div class="layui-input-block">
                <input type="text" name="ladderID" <#--lay-verify="required"--> autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label xrequired">阶梯名称</label>
            <div class="layui-input-block" style="width:150px;">
                <input type="text" name="ladderName" lay-verify="required" autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label xrequired">业绩</label>
            <div class="layui-input-block" style="width:150px;">
                <select name="ladderAchievement" id="ladderAchievement" lay-filter="ladderAchievementID"
                        lay-verify="required">
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label xrequired">下限</label>
            <div class="layui-input-block" style="width:150px;">
                <input type="text" name="ladderLower" lay-verify="required" autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" name="ladderProportiondiv">
            <label class="layui-form-label xrequired">提成比例</label>
            <div class="layui-input-block" style="width:194px;display: flex;">
                <input type="text" name="ladderProportion" lay-verify="required" autocomplete="off" placeholder=""
                       class="layui-input">
                <span style="margin: 10px 0 0 5px;">（%）</span>
            </div>
        </div>
        <div class="layui-form-item" name="ladderBonusdiv">
            <label class="layui-form-label xrequired">单个奖金</label>
            <div class="layui-input-block" style="width:150px;">
                <input type="text" name="ladderBonus" lay-verify="required" autocomplete="off" placeholder=""
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
</div>

<#--阶梯操作-->
<script type="text/html" id="ladderDemo">
    <button class="layui-btn layui-btn-xs" lay-event="show">查看</button>
    <button class="layui-btn layui-btn-xs layui-btn-primary" lay-event="edit">编辑</button>
    <button class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del" id="deleteButton">删除</button>
</script>


<script>
    var table, form, dataPostAchievement, achPost;
    layui.use(['table', 'form'], function () {
        table = layui.table;
        form = layui.form;
        loadachPost();
        loadselectPerformancePost();
        loadAchievement("${currentUser.storeId!}");

        table.render({
            elem: '#ladder'
            , url: dataHost + "/performance/selectLadderByCondition"
            , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , page: true          //显示分页默认不显示
            , method: 'post'
            , id: "ladderReload"
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
            , cols: [[
                {type: 'checkbox', fixed: 'left', width: 40}
                , {field: 'rownum', title: '序号', width: 75, sort: true, fixed: 'left'}
                , {
                    field: 'ladderAchievementPostID', title: '业绩', templet: function (d) {
                        var achievement = "";
                        for (var p in dataPostAchievement) {
                            if (dataPostAchievement[p].id == d.ladderAchievementPostID) {
                                achievement = dataPostAchievement[p].achievementPostName
                            }
                        }
                        return achievement;
                    }
                }
                , {
                    field: 'ladderAchievementPostID', width: 250, title: '职位', templet: function (d) {
                        var post = "";
                        for (var p in achPost) {
                            if (achPost[p].id == d.ladderAchievementPostID) {
                                post = achPost[p].achievementPostCategoryName == null ? "所有职位" : achPost[p].achievementPostCategoryName;

                            }
                        }
                        return post;
                    }
                }
                , {field: 'ladderName', title: '阶梯'}
                , {field: 'ladderLower', title: '下限'}
                , {
                    field: 'ladderProportion', title: '提成比例(%)', templet: function (d) {
                        return (d.ladderProportion * 100).toFixed(2);
                    }, hide: false
                }

                , {field: 'ladderBonus', title: '单个奖金'}
                , {
                    field: 'status', title: '状态', templet: function (d) {
                        if (d.status == 1) {
                            return "正常";
                        } else {
                            return "删除";
                        }
                    }, hide: true
                }
                , {field: 'createOperator', title: '创建人', hide: true}
                , {field: 'createTime', title: '创建时间', hide: true}
                , {field: 'modifyOperator', title: '修改人', hide: true}
                , {field: 'dataChangeLastTime', title: '修改时间', hide: true}
                , {fixed: 'right', title: '操作', width: 180, align: 'center', toolbar: '#ladderDemo'}
            ]]
            , done: function (res, curr, count) {
                for (var i = 0; i < res.data.length; i++) {
                    if (res.data[i].ishaveParentAch == 1) {//如果是固定的业绩阶梯并且有对应的固定业绩
                        $("tbody tr:eq(" + i + ")").children().find("#deleteButton").attr("class", "layui-btn layui-btn-xs layui-btn-disabled")
                        $("tbody tr:eq(" + i + ")").children().find("#deleteButton").attr("disabled", true)
                    }
                }

            }
        });

        //监听工具条
        table.on('tool(ladder)', function (obj) {
            var data = obj.data;
            if (obj.event === 'edit') {
                editLadder(data);
                // layer.msg('ID：'+ data.membershipLevelId + ' 的查看操作');
            } else if (obj.event === 'del') {
                delLadder(data);
                // layer.alert('编辑行：<br>'+ JSON.stringify(data))
            } else if (obj.event === 'show') {
                showLadder(data);
                // layer.alert('编辑行：<br>'+ JSON.stringify(data))
            }
        });

        var $ = layui.$, active = {
            search: function () {
                var achievement = $(".demoTable select[name='achievementSearch'] option:selected").val();
                table.reload('ladderReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    , where: {
                        ladderAchievementPostID: achievement == 0 ? null : achievement,
                    }
                }, 'data');
            }
        };

        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    });

    function editLadder(data) {
        var a2 = layer.open({
            type: 1,
            title: '编辑业绩阶梯',
            content: $('#ladderForm'),
            closeBtn: 1,
            btn: ['提交', '取消'],
            yes: function (index, layero) {
                layui.form.on('submit(formVerify)', function (data1) {
                    var ladderAchievement = layero.find("select[name='ladderAchievement']");
                    ladderAchievement = ladderAchievement.find("option:selected").val();
                    var url = dataHost + "/performance/updateLadder";
                    var params = {
                        ladderID: data.ladderID,
                        LadderAchievementPostID: ladderAchievement,
                        ladderName: layero.find("input[name='ladderName']").val(),
                        ladderLower: layero.find("input[name='ladderLower']").val(),
                        ladderProportion: layero.find("input[name='ladderProportion']").val(),
                        ladderBonus: layero.find("input[name='ladderBonus']").val(),
                        modifyOperator: "${currentUser.trueName!}"
                    };
                    $.post(url, params, function (res) {
                        if (res.responseStatusType.message == "Success") {
                            layer.open({
                                title: '编辑'
                                , content: '编辑成功！'
                                , btn: ["关闭"]
                                , yes: function (index) {
                                    layer.close(index); //如果设定了yes回调，需进行手工关闭
                                    layer.close(a2);
                                }
                            });
                            //重新加载表格
                            layui.table.reload("ladderReload");
                        } else {
                            layer.open({
                                title: '编辑'
                                , content: '编辑失败！'
                                , btn: ["关闭"]
                            });
                        }
                    })
                })
                // layer.close(); //如果设定了yes回调，需进行手工关闭
            },
            btn2: function () {
                layer.close(a2);
            },
            success: function (layero) {
                layero.addClass('layui-form');
                layero.find('.layui-layer-btn0').attr('lay-filter', 'formVerify').attr('lay-submit', '');
                layui.form.render();
                if (data.ladderBonus === 0) {
                    $("div[name='ladderBonusdiv']").attr("style", "display:none;");
                    $("div[name='ladderProportiondiv']").attr("style", "display:block;");
                } else if (data.ladderProportion === 0) {
                    $("div[name='ladderBonusdiv']").attr("style", "display:block;");
                    $("div[name='ladderProportiondiv']").attr("style", "display:none;");
                }


                form.val('ladderForm', {
                    "ladderAchievement": data.ladderAchievementPostID
                });
                form.render("select", "ladderForm");
                layero.find("input[name='ladderName']").val(data.ladderName);
                layero.find("input[name='ladderLower']").val(data.ladderLower);
                layero.find("input[name='ladderProportion']").val(data.ladderProportion * 100);
                layero.find("input[name='ladderBonus']").val(data.ladderBonus);
                layero.find("input[name='ladderID']").val(data.ladderID);
                if (data.status == 1) {
                    layero.find("input[name='status']").val("正常");
                } else {
                    layero.find("input[name='status']").val("删除");
                }
                layero.find("input[name='createOperator']").val(data.createOperator);
                layero.find("input[name='createTime']").val(data.createTime);
                layero.find("input[name='modifyOperator']").val(data.modifyOperator);
                layero.find("input[name='dataChangeLastTime']").val(data.dataChangeLastTime);
                //显示业绩
                layero.find("select[name='ladderAchievement']").parent().parent().show();
                //查看显示创建人和编辑人
                layero.find("input[name='createOperator']").parent().parent().hide();
                layero.find("input[name='modifyOperator']").parent().parent().hide();
                layero.find("input[name='status']").parent().parent().hide();
                layero.find("input[name='createTime']").parent().parent().hide();
                layero.find("input[name='dataChangeLastTime']").parent().parent().hide();
            },
            area: ['600px', '500px'],
            // end: function () {
            //     window.location.reload();
            // }
        });
    }

    function delLadder(data) {
        //删除数据库数据
        var url = dataHost + "/performance/deleteLadderByID";
        var params = {
            ladderID: data.ladderID,
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
                layui.table.reload("ladderReload");
            } else {
                layer.open({
                    title: '删除'
                    , content: '删除失败！'
                    , btn: ["关闭"]
                });
            }
        })
    }

    function showLadder(data) {
        var a1 = layer.open({
            type: 1,
            title: '添加业绩阶梯',
            content: $('#ladderForm'),
            area: ['358px', '288px'],
            closeBtn: 1,
            btn: ['确定'],
            yes: function () {
                layer.close(a1);
            },
            success: function (layero) {
                var ladderAchievement = layero.find("select[name='ladderAchievement']");
                ladderAchievement.find("option[value='" + data.ladderAchievementID + "']").attr("selected", true);
                form.render("select", "ladderForm");
                layero.find("input[name='ladderName']").val(data.ladderName);
                layero.find("input[name='ladderLower']").val(data.ladderLower);
                layero.find("input[name='ladderProportion']").val(data.ladderProportion);
                layero.find("input[name='ladderBonus']").val(data.ladderBonus);
                layero.find("input[name='ladderID']").val(data.ladderID);
                if (data.status == 1) {
                    layero.find("input[name='status']").val("正常");
                } else {
                    layero.find("input[name='status']").val("删除");
                }
                layero.find("input[name='createOperator']").val(data.createOperator);
                layero.find("input[name='createTime']").val(data.createTime);
                layero.find("input[name='modifyOperator']").val(data.modifyOperator);
                layero.find("input[name='dataChangeLastTime']").val(data.dataChangeLastTime);
                //显示业绩
                layero.find("select[name='ladderAchievement']").parent().parent().show();
                //查看显示创建人和编辑人
                layero.find("input[name='createOperator']").parent().parent().show();
                layero.find("input[name='modifyOperator']").parent().parent().show();
                layero.find("input[name='status']").parent().parent().show();
                layero.find("input[name='createTime']").parent().parent().show();
                layero.find("input[name='dataChangeLastTime']").parent().parent().show();
            },
            area: ['600px', '500px'],
            // end: function () {
            //     window.location.reload();
            // }
        });
    }

    function addNewLadder() {
        $("input[name='ladderName']").val("");
        $("input[name='ladderLower']").val("");
        $("input[name='ladderProportion']").val("");
        $("input[name='ladderBonus']").val("");

        var achievementpost = $(".demoTable select[name='achievementAdd'] option:selected").val();
        var dataMethodstype = $(".demoTable select[name='achievementAdd'] option:selected").attr("data-methodstype");
        if (dataMethodstype == "3" || dataMethodstype == "2") {
            $("div[name='ladderBonusdiv']").attr("style", "display:none;");
            $("div[name='ladderProportiondiv']").attr("style", "display:block;");
            $("input[name='ladderBonus']").attr("lay-verify", "");
            $("input[name='ladderProportion']").attr("lay-verify", "required");
        } else {
            $("div[name='ladderBonusdiv']").attr("style", "display:block;");
            $("div[name='ladderProportiondiv']").attr("style", "display:none;");
            $("input[name='ladderBonus']").attr("lay-verify", "required");
            $("input[name='ladderProportion']").attr("lay-verify", "");
        }
        if (achievementpost == null || achievementpost == 0 || achievementpost == "") {
            layer.msg("请选择业绩添加业绩阶梯");
            return;
        }
        var b = layer.open({
            type: 1,
            title: '添加业绩阶梯',
            content: $('#ladderForm'),
            closeBtn: 1,
            area: ['358px', '288px'],
            btn: ['提交', '取消'],
            yes: function (index, layero) {
                layui.form.on('submit(formVerify)', function (data) {
                    var url = dataHost + "/performance/insertLadder";
                    var params = {
                        LadderAchievementPostID: achievementpost,
                        ladderName: layero.find("input[name='ladderName']").val(),
                        ladderLower: layero.find("input[name='ladderLower']").val(),
                        ladderProportion: layero.find("input[name='ladderProportion']").val(),
                        ladderBonus: layero.find("input[name='ladderBonus']").val(),
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
                                    layer.close(b);
                                }
                            });
                            //重新加载表格
                            layui.table.reload("ladderReload");
                        } else {
                            layer.open({
                                title: '添加'
                                , content: '添加失败！'
                                , btn: ["关闭"]
                            });
                        }
                    })
                })
                // layer.close(); //如果设定了yes回调，需进行手工关闭
            },
            btn2: function () {
                layer.close(b);
            },
            success: function (layero) {
                layero.addClass('layui-form');
                layero.find('.layui-layer-btn0').attr('lay-filter', 'formVerify').attr('lay-submit', '');
                layui.form.render();
                //隐藏业绩
                layero.find("select[name='ladderAchievement']").parent().parent().hide();
                //新增隐藏创建人和编辑人
                layero.find("input[name='createOperator']").parent().parent().hide();
                layero.find("input[name='modifyOperator']").parent().parent().hide();
                layero.find("input[name='status']").parent().parent().hide();
                layero.find("input[name='createTime']").parent().parent().hide();
                layero.find("input[name='dataChangeLastTime']").parent().parent().hide();

                $("select[name='ladderAchievement'] option:selected").val($("select[name='achievementAdd'] option:selected").val());
            },
            area: ['600px', '500px'],
            // end: function () {
            //     window.location.reload();
            // }
        });
    }

    function loadAchievement(storeIds) {
        var param = {storeId: storeIds}
        $.ajax({
            url: dataHost + "/performance/selectPerformanceList",
            data: param,
            method: "POST",
            async: false,
            success: function (res) {
                var serverAchievementSearch = document.getElementById("achievementSearch");
                var serverAchievementAdd = document.getElementById("achievementAdd");
                var serverLadderAchievement = document.getElementById("ladderAchievement");
                if (res.responseStatusType.message == "Success") {
                    dataAchievement = res.result.list;
                    serverAchievementSearch.innerHTML = "<option value='' selected='selected'>请选择</option>";
                    for (var p in dataAchievement) {
                        var optgroup = document.createElement("optgroup");  // 创建添加optgroup属性
                        optgroup.setAttribute("label", dataAchievement[p].achievementName); // 给optgroup的label添加值
                        optgroup.setAttribute("value", dataAchievement[p].achievementID); // 给option的value添加值
                        var performancePostList = dataAchievement[p].performancePostList;
                        for (var n in performancePostList) {
                            var option = document.createElement("option");  // 创建添加option属性
                            option.setAttribute("value", performancePostList[n].id); // 给option的value添加值
                            /*
                                                        option.innerText = (performancePostList[n].achievementPostCategoryName == null ? "所有职位" : performancePostList[n].achievementPostCategoryName) + "-" + performancePostList[n].achievementMethodsName + (performancePostList[n].isBasicSalary == 0 ? "（无底薪）" : "（有底薪）");     // 打印option对应的纯文本
                            */
                            option.innerText = performancePostList[n].achievementPostName;
                            optgroup.appendChild(option)

                        }
                        serverAchievementSearch.appendChild(optgroup);           //给select添加option子标签

                    }


                    serverAchievementAdd.innerHTML = "<option value='' selected='selected'>请选择</option>";
                    for (var p in dataAchievement) {
                        var optgroup = document.createElement("optgroup");  // 创建添加optgroup属性
                        optgroup.setAttribute("label", dataAchievement[p].achievementName); // 给optgroup的label添加值
                        optgroup.setAttribute("value", dataAchievement[p].achievementID); // 给option的value添加值
                        var performancePostList = dataAchievement[p].performancePostList;
                        for (var n in performancePostList) {
                            if (performancePostList[n].achievementMethods === 3 || performancePostList[n].achievementMethods === 4) {
                                var option = document.createElement("option");  // 创建添加option属性
                                option.setAttribute("value", performancePostList[n].id); // 给option的value添加值
                                option.setAttribute("data-methodsType", performancePostList[n].achievementMethods); // 给option的value添加值
                                /*     option.innerText = (performancePostList[n].achievementPostCategoryName == null ? "所有职位" : performancePostList[n].achievementPostCategoryName) + "-" + performancePostList[n].achievementMethodsName + (performancePostList[n].isBasicSalary == 0 ? "（无底薪）" : "（有底薪）");*/     // 打印option对应的纯文本
                                option.innerText = performancePostList[n].achievementPostName;
                                optgroup.appendChild(option)
                            }
                        }
                        serverAchievementAdd.appendChild(optgroup);           //给select添加option子标签

                    }

                    serverLadderAchievement.innerHTML = "<option value='' selected='selected'>请选择</option>";
                    for (var p in dataAchievement) {
                        var optgroup = document.createElement("optgroup");  // 创建添加optgroup属性
                        optgroup.setAttribute("label", dataAchievement[p].achievementName); // 给optgroup的label添加值
                        optgroup.setAttribute("value", dataAchievement[p].achievementID); // 给option的value添加值
                        var performancePostList = dataAchievement[p].performancePostList;
                        for (var n in performancePostList) {
                            var option = document.createElement("option");  // 创建添加option属性
                            option.setAttribute("value", performancePostList[n].id); // 给option的value添加值
                            /*
                                                        option.innerText = (performancePostList[n].achievementPostCategoryName == null ? "所有职位" : performancePostList[n].achievementPostCategoryName) + "-" + performancePostList[n].achievementMethodsName + (performancePostList[n].isBasicSalary == 0 ? "（无底薪）" : "（有底薪）");     // 打印option对应的纯文本
                            */
                            option.innerText = performancePostList[n].achievementPostName;
                            optgroup.appendChild(option)
                        }
                        serverLadderAchievement.appendChild(optgroup);           //给select添加option子标签

                    }

                    /*  form.render("select");*/
                    form.render("select", "demoTable");
                    form.render("select", "ladderForm");
                    $("#searchBtn").attr("disabled", false);
                    $("#searchBtn").removeAttr('style');
                } else {
                    $("#achievementSearch").find("option").remove();
                    $("#achievementAdd").find("option").remove();
                    $("#searchBtn").attr("disabled", true);
                    $("#searchBtn").css({'background-color': 'gray'});
                    form.render("select");
                }
            }
        });
    }



    /*-------------------加载行业-------------------*/
    function loadachPost() {
        var url = dataHost + "/performance/selectPerformancePostListAll";
        $.ajax({
            url: url,
            type: "post",
            async: false,
            success: function (result) {
                if (result.responseStatusType.message == "Success") {
                    achPost = result.result;
                } else {
                }
            }
        });
    }

    /*获取充值类型id对应的名字*/
    function loadselectPerformancePost() {
        var url = dataHost + "/performance/selectPerformancePostListAll";
        var data = {};
        $.ajax({
            url: url,
            type: "post",
            data: data,
            async: false,
            success: function (result) {
                if (result.responseStatusType.message == "Success") {
                    dataPostAchievement = result.result;    //返回的数据
                } else {
                }
            }
        });
    }
</script>


</body>
</html>