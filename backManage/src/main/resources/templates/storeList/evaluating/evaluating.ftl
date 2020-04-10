<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>客户评测</title>
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
        <#------表格上门的操作工具栏----->
        <div class="demoTable layui-form" lay-filter="demoTable">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <button id="add" class="layui-btn">添加客户评测</button>
                </div>
            </div>
        </div>
        <#--表格:显示客户评测-->
        <table id="evaluating" lay-filter="demo"></table>
    </div>
</div>

<form id="evaluatingForm" class="layui-form layui-form-pane layui-personal" action="" lay-filter="form" method="post" hidden="true">
    <div class="layui-form-item">
        <label class="layui-form-label xrequired">客户评测名称</label>
        <div class="layui-inline">
            <input type="text" name="evaluatingName" lay-verify="required" autocomplete="off" placeholder="请输入客户评测名称"
                   class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">所属行业</label>
        <div class="layui-input-inline">
            <input name="evaluatingIndustryIDAddShow" id="evaluatingIndustryIDAddShow" readonly="readonly"
                   type="text"
                   autocomplete="off" placeholder="请输入行业" class="layui-input" style="padding-right: 80px;"
                    <#-- lay-verify="required"-->>
            <input name="evaluatingIndustryID" id="evaluatingIndustryIDAdd" hidden="true" type="text">
            <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachEvaluatingIndustryIDAdd"><i
                        class="layui-icon layui-icon-search"></i></button>

        </div>
    </div>



    <div class="layui-form-item">
        <label class="layui-form-label xrequired">订单类型</label>
        <div class="layui-input-inline">
            <select name="evaluatingType" id="evaluatingType" lay-filter="evaluatingType" lay-verify="required">
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired">统计方式</label>
        <div class="layui-input-inline">
            <select name="evaluatingMethods" lay-filter="evaluatingMethods" lay-verify="required">
                <option value="">请选择</option>
                <option value="1">个数</option>
                <option value="2">金额</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">备注</label>
            <div class="layui-input-block">
                <input type="text" name="remark" autocomplete="off" placeholder="请输入备注"
                       class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item" id="createOperator" hidden="hidden">
        <div class="layui-inline">
            <label class="layui-form-label">创建人</label>
            <div class="layui-input-block">
                <input type="text" name="createOperator" autocomplete="off" placeholder="请输入创建人"
                       class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item" id="modifyOperator" hidden="hidden">
        <div class="layui-inline">
            <label class="layui-form-label">修改人</label>
            <div class="layui-input-block">
                <input type="text" name="modifyOperator" autocomplete="off" placeholder="请输入修改人"
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

    var dataEvaluatingType,form,table;
    //列表显示
    layui.use('table', function () {
        var dataIndustry = loadIndustryReturn();
        var table = layui.table;
        table.render({
            elem: '#evaluating'
            , url: dataHost + "/evaluating/selectEvaluatingList"
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
            ,id:'evaluating'
            , cols: [[
                {type: 'checkbox', fixed: 'left', width: 40}
                , {field: 'evaluatingName', title: ' 客户评测名称', sort: true, fixed: 'left'}
                , {
                    field: 'industryName', title: ' 行业名称', sort: true, fixed: 'left'
                }
                , {
                    field: 'evaluatingType', title: '订单类型', sort: true, fixed: 'left',templet: function (d) {
                        var orderType = "";
                        for (var p in dataEvaluatingType) {
                            if (d.evaluatingType == p) {
                                orderType = dataEvaluatingType[p];
                            }
                        }
                        return orderType;
                    }
                }
                , {
                    field: 'evaluatingMethods', title: ' 统计方式', sort: true, fixed: 'left', templet: function (d) {
                        if (d.evaluatingMethods == '1') {
                            return "个数";
                        }
                        return "金额";
                    }
                }
                , {field: 'remark', title: ' 备注', sort: true, fixed: 'left'}
                , {fixed: 'right', title: '操作', align: 'center', toolbar: '#barDemo'}
            ]]
        });
    });

    //------------------------------------------------增删改查操作实现-------------------------------------------------
    layui.use(['table', 'layer', 'jquery', 'form'], function () {
            table = layui.table;
        var layer = layui.layer,
            $ = layui.jquery;
            form = layui.form;
        //加载订单类型
        loadEvaluatingType(form);

        /*------行业关联数据查看-添加/修改------*/
        $("#" + "serachEvaluatingIndustryIDAdd").click(function () {
            var url = storeHost + "/manage/industry/selectList";
            var param = {};
            loadLinkData(layer, layui, url, "industryID", "industryName", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "evaluatingIndustryIDAddShow").val(data.industryName);
                $("#" + "evaluatingIndustryIDAdd").val(data.industryID);
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





        /*-----------------------监听工具条----------------------*/
        var data = null;
        table.on('tool(demo)', function (obj) {
            data = obj.data;
            /*------------查看详情---------------*/
            if (obj.event === 'detail') {
                layerShow(data, table, $, form)
            }
            /*--------------编辑----------------*/
            else if (obj.event === 'edit') {
                $("#createOperator").attr("hidden", "hidden");
                $("#modifyOperator").attr("hidden", "hidden");
                layerShowAndEdit(data, table, $, form);
            }
            /*---------------删除--------------*/
            else if (obj.event === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    layerDelete(data, $,table);
                    obj.del();
                    layer.close(index);
                });
            }
        })

        /*-----------------------监听行业下拉框----------------------*/
        form.on('select(Industry)', function (data) {
            var industryId = data.value;
            table.render({
                elem: '#evaluating'
                , url: dataHost + "/evaluating/selectEvaluatingByCondition"
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
                    evaluatingIndustryID: industryId == null ? 0 : industryId
                }
                , cols: [[
                    {type: 'checkbox', fixed: 'left', width: 40}
                    , {field: 'evaluatingName', title: ' 客户评测名称', sort: true, fixed: 'left'}
                    , {field: 'evaluatingIndustryID', title: ' 行业', sort: true, fixed: 'left',templet:function (d) {
                            //显示行业
                            for (var p in dataIndustry) {
                                if (d.evaluatingIndustryID == dataIndustry[p].industryID) {
                                    return dataIndustry[p].industryName;
                                }
                            }
                        }}
                    , {
                        field: 'evaluatingType', title: '订单类型', sort: true, fixed: 'left', templet: function (d) {
                            var orderType = "";
                            for (var p in dataEvaluatingType) {
                                if (d.evaluatingType == p) {
                                    orderType = dataEvaluatingType[p];
                                }
                            }
                            return orderType;
                        }
                    }
                    , {
                        field: 'evaluatingMethods', title: ' 统计方式', sort: true, fixed: 'left', templet: function (d) {
                            if (d.evaluatingMethods == '1') {
                                return "个数";
                            }
                            return "金额";
                        }
                    }
                    , {field: 'remark', title: ' 备注', sort: true, fixed: 'left'}
                    , {fixed: 'right', title: '操作', align: 'center', toolbar: '#barDemo'}
                ]]
            });
        })

    });


    /*---------------------添加客户评测信息---------------------*/
    $("#add").click(
        function () {
        // var evaluating = $(".demoTable select[name='evaluating'] option:selected").val();
        // if (evaluating == null || evaluating == 0 || evaluating == "") {
        //     layer.msg("请选择客户评测标准");
        //     return;
        // }
        // document.getElementById("evaluatingLevelForm").reset();
        // $('#evaluatingLevelForm')[0].reset();
        var a1 = layer.open({
            type: 1,
            title: '添加客户评测',
            content: $('#evaluatingForm'),
            area: ['400px', '450px'],
            closeBtn: 1,
            btn: ['提交', '取消'],
            btn2: function () {
                layer.close(a1);
            },
            success: function (layero) {
                $("#reset").click();
                layero.addClass('layui-form');
                layero.find('.layui-layer-btn0').attr('lay-filter', 'formVerify').attr('lay-submit', '');
                // layero.find("input[name='evaluatingName']").val("");
                // layero.find("input[name='remark']").val("");
                $("#createOperator").attr("hidden", true);
                $("#modifyOperator").attr("hidden", true);
            },
            yes: function (index, layero) {
                $("#createOperator input[name='createOperator']").val("${currentUser.trueName!}");
                form.on('submit(formVerify)', function (data) {
                    $.ajax({
                        type: "POST",
                        url: dataHost + "/evaluating/insertEvaluating",
                        data: $('#evaluatingForm').serialize(),
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
                                    title: '新增客户评测'
                                    , content: '添加成功！'
                                    , btn: ["关闭"]
                                    , yes: function (index) {
                                        layer.close(index); //如果设定了yes回调，需进行手工关闭
                                    }, end: function () {
                                        layer.close(index);
                                        layer.close(a1);
                                        $("#reset").click();//重置表单
                                        table.reload("evaluating");
                                    }
                                });
                            }
                        }
                    });
                    return false
                })
            },
            end: function () {
                loadEvaluatingType();
            }
        });
    })

    /*------------------查看按钮事件------------------*/
    function layerShow(data, table, $, form) {
        $("#createOperator").attr("hidden", false);
        $("#modifyOperator").attr("hidden", false);
        //页面弹框
        var a2 = layer.open({
            type: 1,
            title: '客户评测详情',
            content: $('#evaluatingForm'),
            area: ['400px', '450px'],
            closeBtn: 1,
            btn: ['关闭'],
            btn2: function () {
                layer.close(a2);
            },
            success: function (layero) {
                //表单赋值
                form.val('form', {
                    "evaluatingName": data.evaluatingName
                    , "evaluatingIndustryID": data.evaluatingIndustryID
                    , "evaluatingIndustryIDAddShow": data.industryName
                    , "evaluatingType": data.evaluatingType
                    , "evaluatingMethods": data.evaluatingMethods
                    , "remark": data.remark
                    , "createOperator": data.createOperator
                    , "modifyOperator": data.modifyOperator
                });
            }
            , end: function () {

            }
        });
    }

    /*-------------------修改按钮事件----------------*/
    function layerShowAndEdit(data, table, $, form) {
        //页面弹框
        var a1 = layer.open({
            type: 1,
            title: '测评编辑详情',
            content: $('#evaluatingForm'),
            area: ['400px', '450px'],
            closeBtn: 1,
            btn: ['提交', '取消'],
            btn2: function () {
                layer.close(a1);
            },
            success: function (layero) {
                layero.addClass('layui-form');
                layero.find('.layui-layer-btn0').attr('lay-filter', 'formVerify').attr('lay-submit', '');
                //表单赋值
                form.val('form', {
                    "evaluatingName": data.evaluatingName
                    , "evaluatingIndustryID": data.evaluatingIndustryID
                    , "evaluatingIndustryIDAddShow": data.industryName
                    , "evaluatingType": data.evaluatingType
                    , "evaluatingMethods": data.evaluatingMethods
                });
                layui.form.render();
            },
            yes: function (index, layero) {
                $("#modifyOperator input[name='modifyOperator']").val("${currentUser.trueName!}");
                form.on('submit(formVerify)', function (a) {
                    $.ajax({
                        type: "POST",
                        url: dataHost + "/evaluating/updateEvaluatingByID",
                        data: $('#evaluatingForm').serialize() +"&evaluatingID=" + data.evaluatingID,
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
                                    title: '修改客户评测'
                                    , content: '修改成功！'
                                    , btn: ["关闭"]
                                    , yes: function (index) {
                                        layer.close(index); //如果设定了yes回调，需进行手工关闭
                                    }, end: function () {
                                        layer.close(index);
                                        layer.close(a1);
                                        $("#reset").click();//重置表单
                                        table.reload("evaluating");
                                    }
                                });
                            }
                        }
                    });
                    return false
                })
            },
            end: function () {

            }
        });
    }

    /*-------------------删除按钮事件----------------*/
    function layerDelete(data, $,table) {
        //删除数据库数据
        var url = dataHost + "/evaluating/deleteEvaluatingByID";
        var data = {
            evaluatingID: data.evaluatingID,
            modifyOperator: "${currentUser.trueName!}"
        };
        $.post(url, data, function (res) {
            if (res.responseStatusType.message == "Success") {
                layer.open({
                    title: '删除'
                    , content: '删除成功！'
                });
                //重新加载表格
                // table.reload("evaluating");
                table.reload('evaluating', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                }, 'data');
            }else{
                layer.msg("删除失败！");
            }
        })
    }

    /*-------------------加载行业-------------------*/
    function loadIndustryReturn() {
        var url = storeHost + "/manage/industry/selectListIndustryNoPage";
        var dataIndustry = null;
        $.ajax({
            url: url,
            type: "post",
            async: false,
            success: function (result) {
                if (result.responseStatusType.message == "Success") {
                    dataIndustry = result.result;

                } else {
                }
            }
        });
        return dataIndustry
    }


    function loadIndustry(form) {
        $("select[name='evaluatingIndustryID']").html("<option value='' selected='selected'>请选择</option>");
        var url = storeHost + "/manage/industry/selectListIndustryNoPage";
        $.post(url, function (res) {
            if (res.responseStatusType.message == "Success") {
                for (var p in res.result) {
                    var option = "<option value='" + res.result[p].industryID + "'>" + res.result[p].industryName + "</option>";
                    $("select[name='evaluatingIndustryID']").append(option);
                }
                form.render();
            }
        })
    }


    /*-------------------加载订单类型---------------*/
    function loadEvaluatingType(form) {
        var url = orderHost + "/order/selectOrderTypeListForYeji";
        var data = {};
        $.ajax({
            type: "POST",
            url: url,
            data: data,
            async: false,
            error: function (request) {
                layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
            },
            success: function (result) {
                if (result.responseStatusType.message == "Success") {
                    var list = result.result;    //返回的数据
                    dataEvaluatingType = list;
                    var server = document.getElementById("evaluatingType"); //server为select定义的id
                    server.innerHTML = "<option value='' selected='selected'>请选择</option>";
                    for (var p in list) {
                        var option = document.createElement("option");  // 创建添加option属性
                        option.setAttribute("value", p); // 给option的value添加值
                        option.innerText = list[p];     // 打印option对应的纯文本
                        server.appendChild(option);           //给select添加option子标签
                    }
                    layui.form.render();
                } else {

                }
            }
        })
    }

</script>


</body>
</html>