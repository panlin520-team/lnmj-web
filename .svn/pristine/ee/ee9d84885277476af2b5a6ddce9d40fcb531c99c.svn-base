<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>业绩分类</title>
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
            width: 85px;
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
                <label class="layui-form-label">请选择行业</label>
                <div class="layui-input-inline">
                    <select name="achievementIndustryIDSearch" id="achievementIndustryIDSearch" lay-filter="stores">
                    </select>
                </div>

                <label class="layui-form-label resetLabel">业绩分类名称</label>
                <div class="layui-input-inline">
                    <input class="layui-input" type="text" name="keyWordAchievementName" autocomplete="off"
                           placeholder="输入业绩分类名称">
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
        <table id="achievementTable" lay-filter="demo"></table>
    </div>


<#--业绩添加表单-->
<div id="addAchiForm" hidden="" class="layui-fluid" style="margin: 15px;">
    <form class="layui-form layui-form-pane layui-personal" action="" id="addeditformid" lay-filter="addAch">

        <div class="layui-form-item">
            <label class="layui-form-label">所属行业</label>
            <div class="layui-input-inline">
                <input name="achievementIndustryIDAddShow" id="achievementIndustryIDAddShow" readonly="readonly"
                       type="text"
                       autocomplete="off" placeholder="请输入行业" class="layui-input" style="padding-right: 80px;"
                        <#-- lay-verify="required"-->>
                <input name="achievementIndustryID" id="achievementIndustryIDAdd" hidden="true" type="text">
                <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachAchievementIndustryIDAdd"><i
                            class="layui-icon layui-icon-search"></i></button>

            </div>
        </div>





        <div class="layui-form-item">
            <label class="layui-form-label xrequired">业绩名称</label>
            <div class="layui-input-block">
                <input type="text" name="achievementName" lay-verify="required" autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label xrequired">订单类型</label>
            <div class="layui-input-block" style="width:150px;">
                <select name="achievementType" id="achievementType" lay-filter="achievementType"
                        lay-verify="required">
                </select>
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">员工审核</label>
            <div class="layui-input-block" style="width:150px;">
                <select name="isStaffReview" id="isStaffReview" lay-filter="isStaffReview" lay-verify="required">
                    <option value="0">否</option>
                    <option value="1">是</option>
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-inline">
                <button class="layui-btn" lay-submit="" lay-filter="addeditsubmitfilter">立即提交</button>
                <button id="reset" type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

<#--业绩修改表单-->
<div id="editAchiForm" hidden="" class="layui-fluid" style="margin: 15px;">
    <form class="layui-form layui-form-pane layui-personal" action="" id="editeditformid" lay-filter="editAch">
        <div class="layui-form-item" hidden="hidden">
            <label class="layui-form-label xrequired">业绩分类id</label>
            <div class="layui-input-block">
                <input type="text" name="id" lay-verify="required" autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">所属行业</label>
            <div class="layui-input-inline">
                <input name="achievementIndustryIDEditShow" id="achievementIndustryIDEditShow" readonly="readonly"
                       type="text"
                       autocomplete="off" placeholder="请输入行业" class="layui-input" style="padding-right: 80px;"
                        <#-- lay-verify="required"-->>
                <input name="achievementIndustryID" id="achievementIndustryIDEdit" hidden="true" type="text">
                <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachAchievementIndustryIDEdit"><i
                            class="layui-icon layui-icon-search"></i></button>

            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label xrequired">业绩名称</label>
            <div class="layui-input-block">
                <input type="text" name="achievementName" lay-verify="required" autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label xrequired">订单类型</label>
            <div class="layui-input-block" style="width:150px;">
                <select name="achievementType" id="achievementTypeEdit" lay-filter="achievementTypeEdit"
                        lay-verify="required">
                </select>
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">员工审核</label>
            <div class="layui-input-block" style="width:150px;">
                <select name="isStaffReview" id="isStaffReviewEdit" lay-filter="isStaffReviewEdit"
                        lay-verify="required">
                    <option value="0">否</option>
                    <option value="1">是</option>
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-inline">
                <button class="layui-btn" lay-submit="" lay-filter="editeditsubmitfilter">立即提交</button>
                <button id="resetEdit" type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>



<#include "../../baseFtl/loadLinkData.ftl" />
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="edit" id="edit">修改</a>
</script>


<script>
    //列表显示
    var addForm = null;
    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#achievementTable'
            , url: dataHost + "/performance/selectPerformanceList"
            , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , page: true          //显示分页默认不显示
            , method: 'post'
            , id: "listStoreAchievementTable"
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

            }
            , cols: [[
                {type: 'checkbox', fixed: 'left', width: 40}
                , {field: 'achievementID', title: '业绩ID'}
                , {field: 'achievementName', edit: 'text', title: '业绩名称'}
                , {field: 'achievementIndustryName', title: '行业'}
                , {field: 'achievementOrderTypeName', title: '订单类型'}
                , {fixed: 'right', title: '操作', width: 180, align: 'center', toolbar: '#barDemo'}

            ]]
        });

        //监听单元格编辑
        var table = layui.table;
        table.on('edit(demo)', function (obj) {
            var value = obj.value //得到修改后的值
                , data = obj.data //得到所在行所有键值
                , field = obj.field; //得到字段
            var paramsValue = null;
            if (field == "achievementName") {
                paramsValue = {
                    id: data.id,
                    achievementName: value,
                    modifyOperator: "${currentUser.trueName!}"
                };
            }
            layer.msg('[ID: ' + data.id + '] ' + field + ' 字段更改为：' + value, {
                time: 20000, //20s后自动关闭
                btn: ['确认修改', '取消'],
                yes: function (index, layero) {
                    var url = dataHost + "/performance/updatePerformance";
                    var params = paramsValue;
                    $.post(url, params, function (res) {
                        if (res.responseStatusType.message == "Success") {
                            layer.msg("修改成功")
                            table.reload("listStoreAchievementTable");
                        } else {
                            layer.msg(res.responseStatusType.error.errorMsg, {
                                time: 20000, //20s后自动关闭
                                btn: ['明白了']
                            });
                        }
                    })
                },
                btn2: function () {
                    table.reload("listStoreAchievementTable");
                }
            });
        });
    });

    //增删改查操作实现
    layui.use(['table', 'layer', 'jquery', 'form'], function () {
        var table = layui.table,
            layer = layui.layer,
            $ = layui.jquery,
            form = layui.form;


        loadAchievementIndustrySearch(form)
        loadAchievementType(form);
        loadAchievementTypeEdit(form);


        /*------行业关联数据查看-添加------*/
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

        /*------行业关联数据查看-修改------*/
        $("#" + "serachAchievementIndustryIDEdit").click(function () {
            var url = storeHost + "/manage/industry/selectList";
            var param = {};
            loadLinkData(layer, layui, url, "industryID", "industryName", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "achievementIndustryIDEditShow").val(data.industryName);
                $("#" + "achievementIndustryIDEdit").val(data.industryID);
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

        //监听指定开关
        form.on('switch(switchTest)', function (data) {
            if (this.checked) {
                var parsm = loadDefault()
                $("input[name='achievementInterval']").val(parsm);
                $("input[name='achievementInterval']").attr("disabled", true);
            } else {
                $("input[name='achievementInterval']").attr("disabled", false);
            }
        });


        //监听表格复选框选择
        table.on('checkbox(demo)', function (obj) {
        });
        //监听工具条
        table.on('tool(demo)', function (obj) {
            var data = obj.data;
            if (obj.event === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    layerDelete(data, table, $);
                    obj.del();
                    layer.close(index);
                });
            } else if (obj.event === "edit") {
                edit(data, table, $, form);

            }

        });


        //监听添加提交
        form.on('submit(addeditsubmitfilter)', function () {
            var achievementID = typeof ($("#addBranchAchievement").attr("data-achievenCode")) == "undefined" ? 0 : $("#addBranchAchievement").attr("data-achievenCode")
            console.log(achievementID)
            //为了防止form中的id值被重置后置空,将编辑的id存放在label中
            $("#editid").val($("#editlabelid").html());
            $("#editlabelid").html("");
            $.ajax({
                type: "POST",
                url: dataHost + "/performance/insertPerformance",
                data: $('#addeditformid').serialize() + "&createOperator=" + "${currentUser.trueName!}" + "&achievementID=" + achievementID,
                async: false,
                error: function (request) {
                    layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
                },
                success: function (data) {
                    if (data.responseStatusType.message == 'Success') {
                        //重新加载表格
                        layer.msg("添加成功");
                        layer.close(addForm);
                        //重新加载表格
                        table.reload('listStoreAchievementTable', {
                            page: {
                                curr: 1 //重新从第 1 页开始
                            }
                        }, 'data');
                        $("#reset").click();//重置表单
                    } else {
                        layer.alert(data.responseStatusType.error.errorMsg);
                    }
                }
            });
            return false;
        });

        //监听修改提交-业绩分类
        form.on('submit(editeditsubmitfilter)', function () {
            $.ajax({
                type: "POST",
                url: dataHost + "/performance/updatePerformance",
                data: $('#editeditformid').serialize() + "&modifyOperator=" + "${currentUser.trueName!}",
                async: false,
                error: function (request) {
                    layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
                },
                success: function (data) {
                    if (data.responseStatusType.message == 'Success') {
                        //重新加载表格
                        layer.msg("修改成功");
                        layer.close(addForm);
                        //重新加载表格
                        table.reload('listStoreAchievementTable', {
                            page: {
                                curr: 1 //重新从第 1 页开始
                            }
                        }, 'data');
                        $("#resetEdit").click();//重置表单
                    } else {
                        layer.alert(data.responseStatusType.error.errorMsg);
                    }
                }
            });
            return false;
        });


        var $ = layui.$, active = {
            search: function () {
                var achievementIndustryIDSearch = $("select[name='achievementIndustryIDSearch'] option:selected").val();
                var keyWordAchievementName = $("input[name='keyWordAchievementName']").val();
                table.render({
                    elem: '#achievementTable'
                    , url: dataHost + "/performance/selectPerformanceList"
                    , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    , page: true          //显示分页默认不显示
                    , method: 'post'
                    , id: "listStoreAchievementTable"
                    , request: {
                        pageName: 'pageNum', //页码的参数名称，默认：page
                        limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    }
                    , where: {
                        "achievementIndustryID": achievementIndustryIDSearch,
                        "keyWordAchievementName":keyWordAchievementName
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
                        , {field: 'achievementID', title: '业绩ID'}
                        , {field: 'achievementName', edit: 'text', title: '业绩名称'}
                        , {field: 'achievementIndustryName', title: '行业'}
                        , {field: 'achievementOrderTypeName', title: '订单类型'}
                        , {fixed: 'right', title: '操作', width: 180, align: 'center', toolbar: '#barDemo'}
                    ]]
                });
            }
        };

        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });


    });


    //添加按钮点击事件
    $("#add").click(function () {
        $("#reset").click();//重置表单(新建时在进入表单前要重置一下表单的内容，不然表单打开后会显示上一次的表单的内容。这里调用表单中重置按钮的点击方法来重置)
        addForm = layer.open({//开启表单弹层
            // // skin: 'layui-layer-molv',
            area: '60%',
            type: 1,
            id: "addAchiFormReload",
            title: '新建业绩分类',
            content: $('#addAchiForm'), //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
            success: function () {

            }

        });
    });


    //删除业绩分类按钮事件
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

    //修改业绩分类
    function edit(data, table, $, form) {
        //页面弹框
        addForm = layer.open({
            type: 1,
            title: '编辑业绩分类',
            content: $('#editAchiForm'),
            closeBtn: 1,
            area: ['600px', '500px'],
            success: function (layero) {
                //表单初始赋值
                form.val('editAch', {
                    "id": data.id,
                    "achievementIndustryID": data.achievementIndustryID,
                    "achievementIndustryIDEditShow": data.achievementIndustryName,
                    "achievementName": data.achievementName,
                    "achievementType": data.achievementType,
                    "isStaffReview": data.isStaffReview == false ? 0 : 1
                })
            }
        });
    }






    //加载行业信息-查询
    function loadAchievementIndustrySearch(form) {
        var url = storeHost + "/manage/industry/selectListIndustryNoPage";
        var data = {};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("achievementIndustryIDSearch"); //server为select定义的id
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

    //加载业绩类型枚举-添加
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

    //加载业绩类型枚举-修改
    function loadAchievementTypeEdit(form) {
        var url = orderHost + "/order/selectOrderTypeListForYeji";
        var data = {};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("achievementTypeEdit"); //server为select定义的id
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