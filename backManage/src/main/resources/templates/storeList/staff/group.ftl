<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>分组管理</title>
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
</head>

<style>
    label.xrequired:before {
        content: '* ';
        color: red;
    }
</style>
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

           <#-- <div class="layui-inline">
                <button class="layui-btn" data-type="search"><i class="layui-icon layui-icon-search"></i></button>
            </div>-->
            <div class="layui-inline">
                <div class="layui-btn-group demoTable">
                    <button class="layui-btn" id="add" data-type="add">增加</button>
                </div>
            </div>
        </div>
    </div>
    <table id="selectGroup" lay-filter="demo"></table>
</div>

<div class="layui-fluid layui-form-pane layui-personal" id="addDiv" hidden="" style="margin: 15px;">
    <form class="layui-form" id="addForm" action="" lay-filter="example" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label xrequired">分组名称</label>
            <div class="layui-input-block">
                <input type="text" name="name" lay-verify="required" autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label xrequired">请选择门店</label>
            <div class="layui-input-inline">
                <select name="storeId" id="storesAdd" lay-filter="storesAdd">
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="addsubmitfilter">立即提交</button>
                <button id="resetAdd" type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

<div class="layui-fluid layui-form-pane layui-personal" id="editDiv" hidden="" style="margin: 15px;">
    <form class="layui-form" id="editForm" action="" lay-filter="exampleEdit" method="post">
        <div class="layui-form-item" hidden='true'>
            <label class="layui-form-label">分组id</label>
            <div class="layui-input-block">
                <input type="text" name="groupId" lay-verify="required" autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label xrequired">分组名称</label>
            <div class="layui-input-block">
                <input type="text" name="name" lay-verify="required" autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">组长</label>
            <div class="layui-input-block" style="width:150px;">
                <select name="groupLeaderId" id="groupLeaderIdEdit" lay-filter="groupLeaderId" lay-verify="required">

                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="editsubmitfilter">立即提交</button>
                <button id="resetEdit" type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>


<script>
    /*----------------渲染表格数据-------------------*/
    //列表显示
    var list = loadFindBeautician();
    loadShop();
    loadShopAdd();
    var addForm = null;
    var editForm = null;
    layui.use('table', function () {
        var table = layui.table;
        var $ = layui.jquery;
        var form = layui.form;
        table = $.extend(table, {config: {checkName: 'isChecked'}});
        table.render({
            elem: "#selectGroup"
            , url: storeHost + "/manage/beautician/selectGroup"
            , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , page: true          //显示分页默认不显示
            , method: 'post'
            , id: "selectGroupReload"
            , request: {
                pageName: 'pageNum', //页码的参数名称，默认：page
                limitName: 'pageSize' //每页数据量的参数名，默认：limit
            }
            , where: {
                storeId: 0
            }
            , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                return {
                    "code": 0, //解析接口状态
                    "msg": "暂无数据", //解析提示文本
                    "count": res.result == null ? 0 : res.result.total, //解析数据长度
                    "data": res.result == null ? 0 : res.result.list //解析数据列表
                };
            }
            , cols: [[
                {type: 'checkbox', fixed: 'left', width: 100}
                , {field: 'groupId', title: '分组id', sort: true}
                , {field: 'name', edit: 'text', title: '分组名称'}
                , {field: 'storeName', title: '所属门店'}
                , {
                    field: 'groupLeaderId', title: '组长名称', templet: function (d) {
                        if (d.groupLeaderId == 0) {
                            return "<span id='groupLeaderName'>" + "未指定" + "</span>"
                        } else{
                            for (var p in list) {
                                if (d.groupLeaderId == list[p].beauticianId) {
                                    groupLeaderName = list[p].name;
                                    return "<span id='groupLeaderName'>" + groupLeaderName + "</span>"
                                }
                            }

                        }
                    }, unresize: true
                }
                , {fixed: 'right', title: '操作', width: 170, align: 'center', toolbar: '#barDemo'}
            ]],
            done: function (res, curr, count) {

            }
        });

    });
    /*----------------渲染表格数据-------------------*/


    layui.use(['table', 'layer', 'jquery', 'form'], function () {
        var table = layui.table,
                layer = layui.layer,
                $ = layui.jquery,
                form = layui.form;

        //监听表格复选框选择
        table.on('checkbox(demo)', function (obj) {
        });

        //监听添加提交-分组
        form.on('submit(addsubmitfilter)', function () {
            $.ajax({
                type: "POST",
                url: storeHost + "/manage/beautician/addGroup",
                data: $('#addForm').serialize() + "&modifyOperator=" + "${currentUser.trueName!}",
                async: false,
                error: function (request) {
                    layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
                },
                success: function (data) {
                    if (data.responseStatusType.message == 'Success') {
                        //重新加载表格
                        layer.msg("添加成功");
                        table.reload("selectGroupReload");
                        layer.close(addForm);
                        //重新加载表格
                        $("#resetAdd").click();//重置表单
                    } else {
                        layer.alert(data.responseStatusType.error.errorMsg);
                    }
                }
            });
            return false;
        });


        //监听修改提交-分组
        form.on('submit(editsubmitfilter)', function () {
            $.ajax({
                type: "POST",
                url: storeHost + "/manage/beautician/updateGroup",
                data: $('#editForm').serialize() + "&modifyOperator=" + "${currentUser.trueName!}",
                async: false,
                error: function (request) {
                    layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
                },
                success: function (data) {
                    if (data.responseStatusType.message == 'Success') {
                        //重新加载表格
                        layer.msg("修改成功");
                        table.reload("selectGroupReload");
                        layer.close(editForm);
                    } else {
                        layer.alert(data.responseStatusType.error.errorMsg);
                    }
                }
            });
            return false;
        });


        form.on('select(stores)', function (data) {
            var storeId = data.value;
            table.reload('selectGroupReload', {
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                , where: {
                    storeId: storeId
                }
            }, 'data');
        });

        //监听工具条
        table.on('tool(demo)', function (obj) {
            var data = obj.data;
            if (obj.event === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    groupDelete(data, table, $);
                    obj.del();
                    layer.close(index);
                });
            } else if (obj.event === 'edit') {
                loadBeauticianForEdit(data, form);
                groupShowAndEdit(data, table, $, form);
            }
        });


        var $ = layui.$, active = {
            getCheckData: function () { //获取选中数据
                var checkStatus = table.checkStatus('selectGroup')
                        , data = checkStatus.data;
                layer.alert(JSON.stringify(data));
            }
            , getCheckLength: function () { //获取选中数目
                var checkStatus = table.checkStatus('selectGroup')
                        , data = checkStatus.data;
                layer.msg('选中了：' + data.length + ' 个');
            }
            , isAll: function () { //验证是否全选
                var checkStatus = table.checkStatus('selectGroup');
                layer.msg(checkStatus.isAll ? '全选' : '未全选')
            }
            , search: function () {
                var keyWordStaffNumber = $(".demoTable input[name='keyWordStaffNumber']").val();
                var keyWordName = $(".demoTable input[name='keyWordName']").val();
                table.render({
                    elem: '#beautician'
                    , url: storeHost + "/manage/beautician/selectBeauticianList"
                    , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    , page: true          //显示分页默认不显示
                    , method: 'post'
                    , request: {
                        pageName: 'pageNum', //页码的参数名称，默认：page
                        limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    }
                    , where: {
                        keyWordStaffNumber: keyWordStaffNumber,
                        keyWordName: keyWordName
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
                        {type: 'checkbox', fixed: 'left', width: 60}
                        , {
                            field: 'headUrl', title: '美容师头像', width: 150, fixed: 'left', templet: function (d) {
                                return d.headUrl == "" || d.headUrl == null ? "<div><img src='/noImg.png' style='width:60px;height: 60px'></div>" : "<div><img src=" + d.headUrl + " style='width:60px;height: 60px'></div>"
                            }
                        }
                        , {field: 'name', title: '美容师名称', width: 150, sort: true, fixed: 'left'}
                        , {field: 'staffNumber', title: '员工号码', width: 150}
                        , {field: 'introduction', title: '人物简介', width: 600}
                        , {fixed: 'right', title: '操作', width: 250, align: 'center', toolbar: '#barDemo'}
                    ]]
                });
            }
            , add: function () {
                $("#resetAdd").click();//重置表单(新建时在进入表单前要重置一下表单的内容，不然表单打开后会显示上一次的表单的内容。这里调用表单中重置按钮的点击方法来重置)
                addForm = layer.open({
                    type: 1,
                    title: '添加分组',
                    content: $('#addDiv'),
                    area: ['900px'],
                    closeBtn: 1,
                    success: function (layero) {
                    }
                });
            }


        };

        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });


    });


    //删除分组按钮事件
    function groupDelete(data, table, $) {
        var isDelete = true
        //删除数据库数据
        var url = storeHost + "/manage/beautician/deleteGroup";
        var data = {
            groupId: data.groupId
        };
        $.post(url, data, function (res) {
            if (res.responseStatusType.message == "Success") {
                layer.open({
                    title: '删除'
                    , content: '删除成功！'
                });
                //重新加载表格
                table.reload("selectGroup");
            } else {
                layer.open({
                    title: '删除'
                    , content: res.responseStatusType.error.errorMsg
                });
                isDelete = false
            }
        })
    }


    layui.use('table', function () {
        var table = layui.table;

        //监听单元格编辑
        table.on('edit(demo)', function (obj) {
            var value = obj.value //得到修改后的值
                    , data = obj.data //得到所在行所有键值
                    , field = obj.field; //得到字段
            layer.msg('[ID: ' + data.groupId + '] ' + field + ' 字段更改为：' + value, {
                time: 20000, //20s后自动关闭
                btn: ['确认修改', '取消'],
                yes: function (index, layero) {
                    var url = storeHost + "/manage/beautician/updateGroup";
                    var params = {
                        groupId: data.groupId,
                        name: value,
                        modifyOperator: JSON.parse(sessionStorage.getItem("currentUserStore")).trueName
                    };
                    $.post(url, params, function (res) {
                        if (res.responseStatusType.message == "Success") {
                            layer.msg("修改成功")
                            table.reload("selectGroup");
                        } else {
                            layer.msg(res.responseStatusType.error.errorMsg, {
                                time: 20000, //20s后自动关闭
                                btn: ['明白了']
                            });
                        }
                    })
                },
                btn2: function () {
                    table.reload("selectGroup");
                }
            });
        });
    });


    /*获取所有的美容师*/
    function loadFindBeautician() {
        var url = storeHost + "/manage/beautician/selectBeauticianListNoPage";
        var data = {};
        var resultList = new Array();
        $.ajax({
            url: url,
            type: "post",
            data: data,
            async: false,
            success: function (result) {
                if (result.responseStatusType.message == "Success") {
                    resultList = result.result;    //返回的数据
                } else {
                }
            }
        });
        return resultList
    }

    //加载美容师信息渲染下拉框
    function loadBeauticianForEdit(datas, form) {
        var url = storeHost + "/manage/beautician/selectBeauticianList";
        var data = {"storeId": datas.storeId};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result.list;    //返回的数据
                var server = document.getElementById("groupLeaderIdEdit"); //server为select定义的name
                server.innerHTML = "";
                for (var p in list) {
                    var option = document.createElement("option");  // 创建添加option属性
                    option.setAttribute("value", list[p].beauticianId); // 给option的value添加值
                    option.innerText = list[p].name;     // 打印option对应的纯文本
                    server.appendChild(option);           //给select添加option子标签
                }
                for (var i = 0; i < server.options.length; i++) {
                    if (server.options[i].value == datas.groupLeaderId) {
                        server.options[i].selected = true;
                        break;
                    }
                }
                form.render('select');
            } else {

            }
        })
    }

    //初始化店铺分组列表
    function loadShop() {
        var paramJson = {"subCompanyId": "${currentUser.companyId!}"}
        var url = storeHost + "/manage/store/selectStoreListNoPage";
        var data = paramJson;
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("stores"); //server为select定义的id
                server.innerHTML = "<option value='0' selected='selected'>请选择</option>";
                for (var p in list) {
                    var option = document.createElement("option");  // 创建添加option属性
                    option.setAttribute("value", list[p].storeId); // 给option的value添加值
                    option.innerText = list[p].name;     // 打印option对应的纯文本
                    server.appendChild(option);           //给select添加option子标签
                }

            } else {

            }
        })
    }

    //初始化店铺分组列表
    function loadShopAdd() {
        var paramJson = {"subCompanyId": "${currentUser.companyId!}"}
        var url = storeHost + "/manage/store/selectStoreListNoPage";
        var data = paramJson;
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("storesAdd"); //server为select定义的id
                server.innerHTML = "<option value='0' selected='selected'>请选择</option>";
                for (var p in list) {
                    var option = document.createElement("option");  // 创建添加option属性
                    option.setAttribute("value", list[p].storeId); // 给option的value添加值
                    option.innerText = list[p].name;     // 打印option对应的纯文本
                    server.appendChild(option);           //给select添加option子标签
                }

            } else {

            }
        })
    }

    //修改分组按钮事件
    function groupShowAndEdit(data, table, $, form) {
        editForm = layer.open({
            type: 1,
            title: '修改分组',
            content: $('#editDiv'),
            area: ['900px'],
            closeBtn: 1,
            success: function (layero) {
                //表单初始赋值
                form.val('exampleEdit', {
                    "name": data.name,
                    "groupLeaderId": data.groupLeaderId,
                    "groupId": data.groupId
                })

            }
        });
    }
</script>


</body>
</html>