<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户管理表格</title>

    <!-- jqGrid组件基础样式包-必要 -->
    <link href="${basePath!}/jqgrid/css/ui.jqgrid.css" type="text/css" media="screen" rel="stylesheet"/>
    <link href="${basePath!}/jqgrid/css/jquery-ui.css" type="text/css" media="screen" rel="stylesheet"/>
    <link href="${basePath!}/css/global.css" type="text/css" media="screen" rel="stylesheet"/>
    <link href="${basePath!}/plugins/font-awesome/css/font-awesome.min.css" type="text/css" media="screen"
          rel="stylesheet"/>
    <link href="${basePath!}/layui/css/layui.css" type="text/css" media="screen" rel="stylesheet"/>

    <!-- jquery插件包-必要 -->
    <!-- 这个是所有jquery插件的基础，首先第一个引入 -->
    <script src="${basePath!}/js/jquery.min.js" type="text/javascript"></script>
    <script src="${basePath!}/jqgrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>
    <!-- jqGrid插件的多语言包-非必要 -->
    <!-- 在jqgrid/js/i18n下还有其他的多语言包，可以尝试更换看效果 -->
    <script src="${basePath!}/jqgrid/js/i18n/grid.locale-cn.js" type="text/javascript"></script>
    <script src="${basePath!}/jqgrid/js/jquery-ui.js" type="text/javascript"></script>
    <script src="${basePath!}/layui/layui.js" type="text/javascript"></script>
    <script src="${basePath!}/js/host.js" type="text/javascript"></script>
    <#include "../baseFtl/pageAuth.ftl" />
    <link rel="stylesheet" href="${basePath!}/css/index.css" media="all"/>
    <base href="${basePath!}/">
    <style type="text/css">
        .resetLabel {
            width: 105px;
        }
    </style>
    <script type="text/javascript">
        var layerid;//当前弹层id;这个id可以定义多个，主要的目的是为了在回调函数关闭弹层时使用的
        $(function () {
            //页面加载完成之后执行
            pageInit();
            layui.use(['layer', 'form', 'layedit', 'laydate', 'table'], function () {
                var layer = layui.layer,
                    layedit = layui.layedit,
                    $ = layui.$,
                    form = layui.form,
                    table = layui.table;
                loadCompany(form)
                loadSubCompany(form);
                loadFiliale(form);
                loadCompanySearch(form);
                //创建一个编辑器
                var editIndex = layedit.build('LAY_demo_editor');
                //自定义验证规则
                form.verify({
                    userName: function (value) {
                        if (value.length < 5) {
                            return '用户名至少得5个字符';
                        }
                    },
                    password: [/(.+){6,12}$/, '密码必须6到12位'],
                    content: function (value) {
                        layedit.sync(editIndex);
                    }
                });

                //监听子公司选择下拉框
                form.on('select(subCompanySelect)', function (data) {
                    var subCompanyValue = data.value;
                    loadStoreInfo(subCompanyValue, layer, form);
                });

                //监听修改密码表单提交事件
                form.on('submit(passwordSubmit)', function (data) {
                    var passwordAgain = $("input[name='passwordAgain']").val();
                    var password = $("input[name='password']").val();
                    if (passwordAgain != password) {
                        layer.open({
                            content: "两次输入密码不一致，请重新输入！",
                            yes: function (index, layero) {
                                //do something
                                layer.close(index);
                            }
                        });
                        return false;
                    } else {
                        var userId = $("#passwordEditForm").attr("data-userId");
                        $.ajax({
                            type: "POST",
                            url: authHost + "/admin/user/updatePassword",
                            data: $("#passwordEditForm").serialize() + "&id=" + userId,
                            async: false,
                            error: function (request) {
                                layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
                            },
                            success: function (data) {
                                if (data.state == 'fail') {
                                    layer.alert(data.mesg);
                                    return false;
                                }
                                if (data.state == 'success') {
                                    layer.open({
                                        content: data.mesg,
                                        yes: function (index, layero) {
                                            layer.close(index);
                                            layer.close(layerid);
                                        }
                                    });
                                    return false;
                                }
                            }
                        });

                        return false;//防止表单提交
                    }
                });


                //监听公司类型搜索选择下拉框
                form.on('select(companyType)', function (data) {
                    var companyTypeSelect = data.value;
                    table.reload('userReload', {
                        page: {
                            curr: 1 //重新从第 1 页开始
                        }
                        , where: {
                            isSuperAdmin: "${currentUser.isSuperAdmin!}",
                            companyType: "${currentUser.companyType!}",
                            companyId: "${currentUser.companyId!}",
                            selectCompanyType: companyTypeSelect
                        }
                    }, 'data');
                });

                //监听确认-打开管理员编辑框
                form.on('submit(chooseUserTypeConfir)', function (data) {
                    var div = null
                    if ($('input[name="companyType"]:checked').val() === "1") {
                        div = $('#addeditformdividForZhong')
                        $("#companyName").html("${currentUser.companyName!}")
                    } else if ($('input[name="companyType"]:checked').val() === "2") {

                        div = $('#addeditformdividForZhi')
                        if ("${currentUser.companyType!}" === "2") {
                            loadStoreInfo(${currentUser.companyId!}, layer, form);
                        } else if ("${currentUser.companyType!}" === "1") {
                            $("#subCompanySelect").attr("disabled", false).removeAttr("style");
                        }
                    } else if ($('input[name="companyType"]:checked').val() === "3") {
                        div = $('#addeditformdividForFen')
                        $("#filialeNameDiv").css("display", "none");
                    }

                    $("#resetZhong").click();
                    $("#resetZhi").click();
                    $("#resetFen").click();
                    layerid = layer.open({//开启表单弹层
                        // skin: 'layui-layer-molv',
                        area: '60%',
                        type: 1,
                        title: '添加管理员',
                        content: div, //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
                        success: function (layero) {

                        }
                    });
                    return false;//防止表单提交后跳转
                });


                //监听提交-添加或修改管理员
                form.on('submit(addeditsubmitfilter)', function (data) {
                    //添加管理门店
                    var storeId = []

                    //获取公司或子公司id
                    var companyType = $("input[type='radio']:checked").val();
                    var companyId = null;
                    var div = null;
                    var id = null;
                    if (companyType == "1" && "${currentUser.companyType!}" != "0") {
                        companyId = "${currentUser.companyId!}";
                        div = $("form[name='addeditformidForZhong']");
                        storeId = "${currentUser.storeId!}";
                        id = $("#addeditformdividForZhong").attr("data-id")
                    } else if (companyType == "2") {
                        companyId = $("#subCompanySelect option:selected").val();
                        if(companyId=="null"){
                            companyId = "${currentUser.companyId!}";
                        }
                        $('input[class="checkboxStore"]:checked').each(function (index, element) {
                            //追加到数组中
                            storeId.push($(this).val());
                        });
                        div = $("form[name='addeditformidForZhi']")
                        id = $("#addeditformdividForZhi").attr("data-id")
                    } else if (companyType == "3") {
                        div = $("form[name='addeditformidForFen']")
                        storeId.push($("#filialeSelect option:selected").val())
                        companyId = $('#filialeSelect option:selected').attr("value");
                        id = $("#addeditformdividForFen").attr("data-id")
                    } else if (companyType == "1" && "${currentUser.companyType!}" == "0") {
                        //如果是系统管理员选择总公司
                        companyId = $("#companyZhongSelect option:selected").val() == "null" ? $("#addeditformid").attr("data-companyId") : $("#companyZhongSelect option:selected").val();
                        div = $("form[name='addeditformidForZhong']");
                        id = $("#addeditformdividForZhong").attr("data-id")
                    }


                    if (id == "undefined") {
                        id = null
                    }
                    //为了防止form中的id值被重置后置空,将编辑的id存放在label中
                    $("#editid").val($("#editlabelid").html());
                    $("#editlabelid").html("");
                    var idforAdd = null;
                    if (typeof id == "undefined") {
                        idforAdd = 0
                    } else {
                        idforAdd = id
                    }
                    $.ajax({
                        type: "POST",
                        url: authHost + "/admin/user/addupdateuser",
                        data: div.serialize() + "&id=" + idforAdd + "&storeId=" + storeId + "&companyId=" + companyId + "&companyType=" + companyType,
                        async: false,
                        error: function (request) {
                            layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
                        },
                        success: function (data) {
                            if (data.state == 'fail') {
                                layer.alert(data.mesg);
                            }
                            if (data.state == 'success') {
                                layer.open({
                                    title: '操作成功'
                                    , content: data.mesg
                                    , btn: ["关闭"],
                                    yes: function (index) {
                                        layer.close(layerid);//消息提示结束后回调，关闭上一级新建表单所在弹层
                                        layer.close(index); //如果设定了yes回调，需进行手工关闭
                                        $("#reset").click();//重置表单
                                    }
                                });
                                //重新加载表格
                                layui.table.reload("userReload");

                            }
                        }
                    });
                    return false;//防止表单提交后跳转
                });


                //监听提交-设置用户角色
                form.on('submit(editroleformsubmit)', function (data) {
                    var id = $("#editroleformid").attr("data-id");
                    $.ajax({
                        type: "POST",
                        url: authHost + "/admin/user/saveRoleSet",
                        data: $('#editroleformid').serialize() + "&id=" + id,// 你的formid
                        async: false,
                        error: function (request) {
                            layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
                        },
                        success: function (data) {
                            if (data.state == 'fail') {
                                layer.alert(data.mesg);
                            }
                            if (data.state == 'success') {
                                layer.open({
                                    title: '操作成功'
                                    , content: '操作成功！'
                                    , btn: ["关闭"],
                                    yes: function (index) {
                                        layer.close(layerid);//消息提示结束后回调，关闭上一级新建表单所在弹层
                                        layer.close(index); //如果设定了yes回调，需进行手工关闭
                                        $("#reset").click();//重置表单
                                    }
                                });
                                //重新加载表格
                                layui.table.reload("userReload");
                            }
                        }
                    });


                    return false;
                });

            });
        });


        function pageInit() {
            var PostData = {
                isSuperAdmin: "${currentUser.isSuperAdmin!}",
                companyType: "${currentUser.companyType!}",
                companyId: "${currentUser.companyId!}",
                selectCompanyType: "${currentUser.companyType!}"
            };

            //列表显示
            layui.use('table', function () {
                var table = layui.table;
                table.render({
                    elem: '#list2'
                    , url: authHost + '/admin/user/list'
                    , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    , page: true          //显示分页默认不显示
                    , method: 'post'
                    , id: "userReload"
                    , request: {
                        pageName: 'pageNum', //页码的参数名称，默认：page
                        limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    }
                    , where: PostData
                    , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                        return {
                            "code": 0, //解析接口状态
                            "msg": "", //解析提示文本
                            "count": res.result == null ? 0 : res.result.total, //解析数据长度
                            "data": res.result == null ? 0 : res.result.list //解析数据列表
                        };
                    }
                    , cols: [[
                        {field: 'userName', width: 90, title: '用户名'}
                        , {field: 'trueName', width: 147, title: '真实姓名'}
                        , {field: 'companyName', title: '公司名称'}
                        , {field: 'bz', width: 195, title: '备注'}
                        , {field: 'roles', width: 234, title: '拥有角色'}
                        , {fixed: 'right', width: 450, title: '操作', align: 'center', toolbar: '#barDemo'}

                    ]]
                    , done: function (res, curr, count) {
                        for (var i = 0; i < res.data.length; i++) {
                            if (res.data[i].companyType == 3) {//如果这行是门店
                                $("tbody tr:eq(" + i + ")").children().find("#editrole").attr("class", "layui-btn layui-btn-xs layui-btn-disabled")
                                $("tbody tr:eq(" + i + ")").children().find("#editrole").attr("disabled", true)
                            }
                        }
                        for (var i = 0; i < res.data.length; i++) {
                            if (res.data[i].companyType == "${currentUser.companyType!}" && res.data[i].companyId == "${currentUser.companyId!}") {//此条记录为当前登录组织的管理员
                                $("tbody tr:eq(" + i + ")").children().find("#del").attr("class", "layui-btn layui-btn-xs layui-btn-disabled")
                                $("tbody tr:eq(" + i + ")").children().find("#del").attr("disabled", true)
                            }
                            if (res.data[i].id == "${currentUser.id!}") {//如果此条记录为当前登录人的记录隐藏修改密码
                                $("#editPassword").css("display", "none");
                            }
                        }

                    }
                });
            });


            layui.use(['table', 'layer', 'jquery', 'form'], function () {
                var table = layui.table,
                    $ = layui.jquery,
                    form = layui.form;

                //监听工具条
                table.on('tool(demo)', function (obj) {
                    var data = obj.data;
                    if (obj.event === 'editrole') {//设置角色
                        setRole(form, data, table, $)
                    } else if (obj.event === 'del') {//删除用户
                        deleteUser(form, data, table, $);
                    } else if (obj.event === 'edit') {//修改用户
                        editUser(form, data, table, $);
                    } else if (obj.event === 'editPassword') {//修改密码
                        editPassword(form, data, table, $);
                    }
                });

                var $ = layui.$, active = {
                    search: function () {
                        var companyNameKeyword = $(".demoTable input[name='companyNameKeyword']").val();
                        table.render({
                            elem: '#company'
                            , url: storeHost + "/manage/company/selectCompanyList"
                            , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                            , page: true          //显示分页默认不显示
                            , method: 'post'
                            , request: {
                                pageName: 'pageNum', //页码的参数名称，默认：page
                                limitName: 'pageSize' //每页数据量的参数名，默认：limit
                            }
                            , where: {
                                companyNameKeyword: companyNameKeyword
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
                                , {field: 'companyId', title: 'id', sort: true, fixed: 'left'}
                                , {field: 'companyName', title: '公司名称'}
                                , {field: 'corporate', title: '法人'}
                                , {fixed: 'right', title: '操作', align: 'center', toolbar: '#barDemo'}

                            ]]
                        });
                    }
                };
                $('.demoTable .layui-btn').on('click', function () {
                    var type = $(this).data('type');
                    active[type] ? active[type].call(this) : '';
                });
            });


            //打开修改管理员按钮
            var div = null

            //修改用户按钮事件
            function editUser(form, data, table, $) {
                $("#addeditformid").attr("data-companyId", data.companyId);
                $("#subCompanySelect").attr("disabled", "disabled").css("background-color", "#EEEEEE");
                var storeIds = JSON.parse(data.storeId);
                var jsonObj = {};
                for (var p in storeIds) {
                    jsonObj[storeIds[p]] = true;
                }
                jsonObj.companyType = data.companyType;
                jsonObj.subCompanySelect = data.companyId;
                if (data.companyType === 2) {

                }
                loadEditPage(data.companyType);
                layui.use(['layer', 'form', 'layedit', 'laydate'], function () {
                    var layer = layui.layer,
                        form = layui.form;
                    loadStoreInfo(data.companyId, layer, form);
                });
                form.val('exampleEdit', jsonObj);
                if (data.companyType === "1") {//总公司修改
                    $('#addeditformdividForZhong').attr("data-id", data.id);
                    div = $('#addeditformdividForZhong')
                    $("#companyZhongDivSelect").css("display", "none");
                    $("#companyDiv").css("display", "block");
                    $("#companyName").html(data.companyName);
                } else if (data.companyType === "2") {//子公司修改
                    $('#addeditformdividForZhi').attr("data-id", data.id);
                    div = $('#addeditformdividForZhi')
                    $("#subCompanyDiv").css("display", "none");
                    $("#subCompanyNameDiv").css("display", "block");
                    $("#subCompanyName").html(data.companyName);
                } else if (data.companyType === "3") {//分公司修改
                    $('#addeditformdividForFen').attr("data-id", data.id);
                    div = $('#addeditformdividForFen')
                    $("#filialeDiv").css("display", "none");
                    $("#filialeNameDiv").css("display", "block");
                    $("#filialeName").html(data.companyName);
                } else if (data.companyType === "0") {//系统管理
                    $('#addeditformdividForZhong').attr("data-id", data.id);
                    div = $('#addeditformdividForZhong')
                    $("#companyZhongDivSelect").css("display", "none");
                    $("#companyDiv").css("display", "none");
                }

                $("div[name='passwordDiv']").css("display", "none");
                //页面弹框
                layerid = layer.open({
                    type: 1,
                    title: '修改管理员',
                    content: div,
                    area: ['900px', '500px'],
                    scrollbar: true,
                    closeBtn: 1,
                    btn: ['关闭'],
                    btn2: function () {
                        layer.close(layerid)
                    },
                    success: function () {
                        form.val('exampleEdit', {
                            "userName": data.userName,
                            "password": data.password,
                            "trueName": data.trueName,
                            "companyName": data.companyName,
                            "bz": data.bz
                        });
                        layui.form.render();
                    }, end: function () {
                        window.location.reload();
                    }

                });
            }

            //修改密码按钮事件
            function editPassword(form, data, table, $) {
                //页面弹框
                layerid = layer.open({
                    type: 1,
                    title: '修改密码',
                    content: $('#passwordEditDiv'),
                    area: ['559px', '418px'],
                    scrollbar: true,
                    closeBtn: 1,
                    btn: ['关闭'],
                    btn2: function () {
                        layer.close(layerid)
                    },
                    success: function (layero) {
                        $("#passwordEditForm").attr("data-userId", data.id);
                        $("input[name='userName']").val(data.userName)
                    }

                });
            }

            //设置角色按钮事件
            function setRole(form, data, table, $) {
                $("#editroleformid").attr("data-id", data.id);
                //获得当前用户已经拥有的角色集合和未拥有的角色集合，并组装表单的复选按钮
                $.ajax({
                    type: "POST",
                    url: authHost + "/admin/user/selectUserById",
                    data: {id: data.id, isSuperAdmin: "${currentUser.roleId!}"},
                    async: false,
                    error: function (request) {
                        layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
                    },
                    success: function (data) {
                        if (data.state == 'fail') {
                            layer.alert(data.mesg);
                            return false;
                        }
                        if (data.state == 'success') {
                            $("#editrolelabelid").html(data.id);//临时存放id，当提交时再去除赋值给input
                            var roleList = [];
                            roleList = data.roleList;//该记录已经拥有的记录集合
                            var notinrolelist = [];
                            notinrolelist = data.notinrolelist;//该记录尚未拥有的记录集合

                            var strs = "";
                            $.each(roleList, function (n, value) {//n从0开始自增+1；value为每次循环的单个对象
                                strs += '<input type="radio" name="role" title="' + value.name + '" value="' + value.id + '"  checked="checked">';
                            });
                            $.each(notinrolelist, function (n, value) {
                                strs += '<input type="radio" name="role" title="' + value.name + '"  value="' + value.id + '" >';
                            });
                            $("#checkboxlistid").empty();//每次填充前都要清空所有按钮，重新填充
                            $("#checkboxlistid").append(strs);

                            layui.form.render(); //更新全部

                            layerid = layer.open({
                                // skin: 'layui-layer-molv',
                                area: '60%',
                                type: 1,
                                title: '编辑用户角色',
                                content: $('#editroleformdivid') //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
                            });

                        }
                    }
                });
            }

            //删除管理员按钮事件
            function deleteUser(form, data, table, $) {
                layerid = layer.open({
                    content: '请确定是否真的要删除id为' + data.id + '的记录?',
                    btn: ['yes', 'no'],//定义两个按钮，是和否
                    yes: function (index, layero) {//点击是时候的回调
                        layer.close(index); //如果设定了yes回调，需进行手工关闭
                        //请求后台，执行删除操作
                        $.ajax({
                            type: "POST",
                            url: authHost + "/admin/user/deleteuser",
                            data: {id: data.id},
                            async: false,
                            error: function (request) {
                                layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
                            },
                            success: function (data) {
                                if (data.state == 'fail') {
                                    layer.alert(data.mesg);
                                }
                                if (data.state == 'success') {
                                    layer.open({
                                        title: '操作成功'
                                        , content: '操作成功！'
                                        , btn: ["关闭"],
                                        yes: function (index) {
                                            layer.close(index); //如果设定了yes回调，需进行手工关闭
                                            layer.close(layerid);
                                        }
                                    });
                                    //重新加载表格
                                    table.reload("userReload");
                                }
                            }
                        });
                    }
                });
            }

            //添加管理员弹出框
            $("#add").click(function () {
                $("div[name='passwordDiv']").css("display", "block");
                $("#reset").click();//重置表单(新建时在进入表单前要重置一下表单的内容，不然表单打开后会显示上一次的表单的内容。这里调用表单中重置按钮的点击方法来重置)
                layerid = layer.open({//开启表单弹层
                    // skin: 'layui-layer-molv',
                    area: '60%',
                    type: 1,
                    title: '选择管理员类型',
                    content: $('#chooseUserType'), //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
                    success: function (layero) {
                        if ("${currentUser.companyType!}" === "1") {
                            $("#subCompanyDiv").css("display", "block");
                            $("#subCompanyNameDiv").css("display", "none");
                            $("#companyZhongDivSelect").css("display", "none");
                            $("#companyDiv").css("display", "block");
                        } else if ("${currentUser.companyType!}" === "2") {
                            $("input[type=radio][name='companyType'][value='1']").attr("disabled", true)
                            $("input[type=radio][name='companyType'][value='2']").attr("checked", 'checked')
                            $("#subCompanyDiv").css("display", "none");
                            $("#subCompanyNameDiv").css("display", "block");
                            $("#subCompanyName").html("${currentUser.companyName!}")
                        } else if ("${currentUser.companyType!}" === "0") {
                            $("#subCompanyDiv").css("display", "block");
                            $("#subCompanyNameDiv").css("display", "none");
                            $("#companyZhongDivSelect").css("display", "block");
                            $("#companyDiv").css("display", "none");
                        }
                    }
                });
            });

        }

        //加载店铺信息多选
        function loadStoreInfo(data, layer, form) {
            $.ajax({
                type: "POST",
                url: storeHost + "/manage/store/selectStoreListNoPage",
                data: {"subCompanyId": data},
                async: false,
                error: function (request) {
                    layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
                },
                success: function (data) {
                    if (data.responseStatusType.message == 'Success') {
                        var strs = "";
                        $.each(data.result, function (n, value) {
                            strs += '<input class="checkboxStore" type="checkbox" name=' + value.storeId + ' title="' + value.name + '"  value="' + value.storeId + '" >';
                        });
                        $("#checkboxStorelistid").empty();//每次填充前都要清空所有按钮，重新填充
                        $("#checkboxStorelistid").append(strs);
                        form.render(); //更新全部
                    } else {
                        layer.alert(data.responseStatusType.error.errorMsg);
                    }
                }
            });

        }


        //初始化总公司列表
        function loadCompany(form) {
            //加载店铺列表信息
            var url = storeHost + "/manage/company/selectCompanyListNoPage";
            var data = {};
            $.post(url, data, function (result) {
                if (result.responseStatusType.message == "Success") {
                    var list = result.result;    //返回的数据
                    var server = document.getElementById("companyZhongSelect"); //server为select定义的id
                    var valuedefualt = null;
                    server.innerHTML = "<option value=" + valuedefualt + " selected='selected'>请选择</option>";
                    for (var p in list) {
                        var option = document.createElement("option");  // 创建添加option属性
                        option.setAttribute("value", list[p].companyId); // 给option的value添加值
                        option.innerText = list[p].companyName;     // 打印option对应的纯文本
                        server.appendChild(option);           //给select添加option子标签
                    }
                    form.render();
                } else {

                }
            });

        }

        //初始化子公司列表
        function loadSubCompany(form) {
            //加载店铺列表信息
            var url = storeHost + "/manage/company/selectSubsidiary";
            var data = {companyId: "${currentUser.companyId!}", companyType: "${currentUser.companyType!}"};
            $.post(url, data, function (result) {
                if (result.responseStatusType.message == "Success") {
                    var list = result.result;    //返回的数据
                    var server = document.getElementById("subCompanySelect"); //server为select定义的id
                    var valuedefualt = null;
                    server.innerHTML = "<option value=" + valuedefualt + " selected='selected'>请选择</option>";
                    for (var p in list) {
                        var optgroup = document.createElement("optgroup");  // 创建添加optgroup属性
                        optgroup.setAttribute("label", list[p].companyName); // 给optgroup的label添加值
                        optgroup.setAttribute("value", list[p].companyId); // 给optgroup的label添加值
                        var subsidiaryList = list[p].subsidiaryList;
                        for (var n in subsidiaryList) {
                            var option = document.createElement("option");  // 创建添加option属性
                            option.setAttribute("value", subsidiaryList[n].subsidiaryId); // 给option的value添加值
                            option.innerText = subsidiaryList[n].subsidiaryName;     // 打印option对应的纯文本
                            optgroup.appendChild(option)
                        }
                        server.appendChild(optgroup);           //给select添加option子标签
                    }
                    form.render();
                } else {

                }
            });

        }

        //初始化子公司分组列表
        function loadFiliale(form) {
            var url = storeHost + "/manage/store/selectSubCompanyAndStoreNoPage";
            var data = {companyId: "${currentUser.companyId!}", companyType: "${currentUser.companyType!}"};
            $.post(url, data, function (result) {
                if (result.responseStatusType.message == "Success") {
                    var list = result.result;    //返回的数据
                    var server = document.getElementById("filialeSelect"); //server为select定义的id
                    server.innerHTML = "<option value='0' selected='selected'>直接选择或搜索选择</option>";
                    for (var p in list) {
                        var optgroup = document.createElement("optgroup");  // 创建添加optgroup属性
                        optgroup.setAttribute("label", list[p].subsidiaryName); // 给optgroup的label添加值
                        optgroup.setAttribute("value", list[p].subsidiaryId); // 给optgroup的label添加值
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


        //初始化公司类型选择
        function loadCompanySearch(form) {
            var server = document.getElementById("companyType"); //server为select定义的id
            server.innerHTML = "<option value='' selected='selected'>请选择</option>";
            var option1 = document.createElement("option");  // 创建添加option属性
            var option2 = document.createElement("option");  // 创建添加option属性
            var option3 = document.createElement("option");  // 创建添加option属性
            option1.setAttribute("value", 1);
            option1.innerText = "总公司";
            option2.setAttribute("value", 2);
            option2.innerText = "子公司";
            option3.setAttribute("value", 3);
            option3.innerText = "分公司";

            if ("${currentUser.companyType!}" == 1) {
                server.appendChild(option1);
                server.appendChild(option2);
                server.appendChild(option3);
            } else if ("${currentUser.companyType!}" == 2) {
                server.appendChild(option2);
                server.appendChild(option3);
            } else if ("${currentUser.companyType!}" == 0) {
                server.appendChild(option1);
                server.appendChild(option2);
                server.appendChild(option3);
            }

            form.render();
        }


        //编辑时初始化-单选公司类型自动
        function loadEditPage(data) {
            if (data === '1') {//总公司
                $("#companyNameDiv").css("display", "block");
                $("#subCompanySelectDiv").css("display", "none");
                $("#storeSelectDiv").css("display", "none");
                $("#companyName").html("${currentUser.companyName!}")
            } else {//子公司
                $("#companyNameDiv").css("display", "none");
                $("#subCompanySelectDiv").css("display", "block");
                $("#storeSelectDiv").css("display", "block");
            }
        }


    </script>
</head>
<body>
<div class="layui-fluid">
    <div class="demoTable layui-form">
        <div class="layui-form-item">
            <div class="layui-inline">
                <div class="layui-btn-group demoTable">
                    <button class="layui-btn" id="add">增加</button>
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label resetLabel">请选择公司类型</label>
                <div class="layui-input-inline">
                    <select name="companyType" id="companyType" lay-filter="companyType">
                    </select>
                </div>
            </div>
        </div>
    </div>
    <table id="list2" lay-filter="demo"></table>
</div>

<script type="text/html" id="barDemo">
    <button type="button" class="layui-btn layui-btn-primary layui-btn-xs" lay-event="edit">修改</button>
    <button type="button" class="layui-btn layui-btn-primary layui-btn-xs" lay-event="editPassword" id="editPassword">修改密码</button>
    <button type="button" class="layui-btn layui-btn-primary layui-btn-xs" lay-event="editrole" id="editrole">设置角色
    </button>
    <button type="button" class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del" id="del">删除</button>


</script>
<#--↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓add↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓-->
<#--带有 class="layui-fluid" 的容器中，那么宽度将不会固定，而是 100% 适应-->
    <div id="chooseUserType" hidden="" class="layui-fluid layui-form-pane layui-personal" style="margin: 15px;">
        <form class="layui-form" action="" id="chooseUserTypeformid" lay-filter="exampleEdit">
            <div class="layui-form-item">
                <label class="layui-form-label">选择管理员类型</label>
                <div class="layui-input-block">
                    <input type="radio" name="companyType" value="1" title="总公司管理员" checked="" lay-filter="userType">
                    <input type="radio" name="companyType" value="2" title="子公司管理员" lay-filter="userType">
                    <input type="radio" name="companyType" value="3" title="分公司管理员" lay-filter="userType">
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit="" lay-filter="chooseUserTypeConfir">确认</button>
                </div>
            </div>

        </form>
    </div>


    <div id="passwordEditDiv" hidden="" class="layui-fluid layui-form-pane layui-personal" style="margin: 15px;">
        <form class="layui-form" action="" id="passwordEditForm" name="passwordEditForm"
              lay-filter="exampleEditPassword">
            <div class="layui-form-item">
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-inline">
                    <input type="text" name="userName" readonly lay-verify="required"
                           placeholder="请输入用户名" autocomplete="off" class="layui-input">
                </div>
            </div>
          <#--  <div class="layui-form-item">
                <label class="layui-form-label">旧密码</label>
                <div class="layui-input-inline">
                    <input type="password" name="oldPassword" required lay-verify="required" placeholder="请输入旧密码"
                           autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">旧密码</div>
            </div>-->
            <div class="layui-form-item">
                <label class="layui-form-label">新密码</label>
                <div class="layui-input-inline">
                    <input type="password" name="password" required lay-verify="required" placeholder="请输入新密码"
                           autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">新密码</div>
            </div>


            <div class="layui-form-item">
                <label class="layui-form-label">再次输入新密码</label>
                <div class="layui-input-inline">
                    <input type="password" name="passwordAgain" required lay-verify="required" placeholder="请再次输入新密码"
                           autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">再次输入新密码</div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit="" lay-filter="passwordSubmit">立即提交</button>
                </div>
            </div>
        </form>
    </div>


    <div id="addeditformdividForZhong" hidden="" class="layui-fluid layui-form-pane layui-personal"
         style="margin: 15px;">
        <form class="layui-form" action="" id="addeditformid" name="addeditformidForZhong" id="addeditformidForZhong"
              lay-filter="exampleEdit">
            <div class="layui-form-item">
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-block">
                    <input type="text" id="userName" name="userName" lay-verify="userName" autocomplete="off"
                           placeholder="请输入用户名" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" name="passwordDiv">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-block">
                    <input type="text" id="password" name="password" lay-verify="password" autocomplete="off"
                           placeholder="请输入密码" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">真实姓名</label>
                <div class="layui-input-block">
                    <input type="text" id="trueName" name="trueName" autocomplete="off" placeholder="请输入真实姓名"
                           class="layui-input">
                </div>
            </div>

            <div class="layui-form-item" id="companyZhongDivSelect">
                <label class="layui-form-label">选择总公司</label>
                <div class="layui-input-block">
                    <select name="companyZhongSelect" id="companyZhongSelect" lay-filter="companyZhongSelect">
                    </select>
                </div>
            </div>

            <div class="layui-form-item" id="companyDiv">
                <label class="layui-form-label">当前总公司</label>
                <div class="layui-input-block">
                    <span id="companyName" name="companyName"></span>
                </div>
            </div>


            <div class="layui-form-item">
                <label class="layui-form-label">备注信息</label>
                <div class="layui-input-block">
                    <input type="text" id="bz" name="bz" autocomplete="off" placeholder="请输入备注信息" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit="" lay-filter="addeditsubmitfilter">立即提交</button>
                    <button id="resetZhong" type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>

        </form>
    </div>

    <div id="addeditformdividForZhi" hidden="" class="layui-fluid layui-form-pane layui-personal" style="margin: 15px;">
        <form class="layui-form" action="" id="addeditformid" name="addeditformidForZhi" id="addeditformidForZhi"
              lay-filter="exampleEdit">
            <div class="layui-form-item">
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-block">
                    <input type="text" id="userName" name="userName" lay-verify="userName" autocomplete="off"
                           placeholder="请输入用户名" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" name="passwordDiv">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-block">
                    <input type="text" id="password" name="password" lay-verify="password" autocomplete="off"
                           placeholder="请输入密码" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">真实姓名</label>
                <div class="layui-input-block">
                    <input type="text" id="trueName" name="trueName" autocomplete="off" placeholder="请输入真实姓名"
                           class="layui-input">
                </div>
            </div>


            <div class="layui-form-item" id="subCompanyDiv">
                <label class="layui-form-label">选择子公司</label>
                <div class="layui-input-block">
                    <select name="subCompanySelect" id="subCompanySelect" lay-filter="subCompanySelect">
                    </select>
                </div>
            </div>

            <div class="layui-form-item" id="subCompanyNameDiv">
                <label class="layui-form-label">当前子公司</label>
                <div class="layui-input-block">
                    <span id="subCompanyName" name="companyName"></span>
                </div>
            </div>


            <div class="layui-form-item" id="storeDiv">
                <label class="layui-form-label">管理门店</label>
                <div class="layui-input-block" id="checkboxStorelistid">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">备注信息</label>
                <div class="layui-input-block">
                    <input type="text" id="bz" name="bz" autocomplete="off" placeholder="请输入备注信息" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit="" lay-filter="addeditsubmitfilter">立即提交</button>
                    <button id="resetZhi" type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>

        </form>
    </div>

    <div id="addeditformdividForFen" hidden="" class="layui-fluid layui-form-pane layui-personal" style="margin: 15px;">
        <form class="layui-form" action="" id="addeditformid" name="addeditformidForFen" id="addeditformidForFen"
              lay-filter="exampleEdit">
            <div class="layui-form-item">
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-block">
                    <input type="text" id="userName" name="userName" lay-verify="userName" autocomplete="off"
                           placeholder="请输入用户名" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" name="passwordDiv">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-block">
                    <input type="text" id="password" name="password" lay-verify="password" autocomplete="off"
                           placeholder="请输入密码" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">真实姓名</label>
                <div class="layui-input-block">
                    <input type="text" id="trueName" name="trueName" autocomplete="off" placeholder="请输入真实姓名"
                           class="layui-input">
                </div>
            </div>

            <div class="layui-form-item" id="filialeNameDiv">
                <label class="layui-form-label">当前分公司</label>
                <div class="layui-input-inline">
                    <span id="filialeName" name="companyName"></span>
                </div>
            </div>


            <div class="layui-form-item" id="filialeDiv">
                <label class="layui-form-label">选择分公司</label>
                <div class="layui-input-inline">
                    <select name="filialeSelect" id="filialeSelect" lay-filter="filialeSelect">
                    </select>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">备注信息</label>
                <div class="layui-input-block">
                    <input type="text" id="bz" name="bz" autocomplete="off" placeholder="请输入备注信息" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit="" lay-filter="addeditsubmitfilter">立即提交</button>
                    <button id="resetFen" type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>

        </form>
    </div>
<#--↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑add↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑-->

<#--↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓为用户设置角色↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓-->

<#--带有 class="layui-fluid" 的容器中，那么宽度将不会固定，而是 100% 适应-->
<div id="editroleformdivid" hidden="" class="layui-fluid" style="margin: 15px;">
    <form class="layui-form layui-form-pane layui-personal" action="" id="editroleformid">
        <#--            <label hidden="true" id="editrolelabelid"></label>
                    <input id="editroleid" name="id" value="" hidden/>-->
        <div class="layui-form-item">
            <label class="layui-form-label">角色复选框</label>
            <div class="layui-input-block" id="checkboxlistid">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="editroleformsubmit">立即提交</button>
                <button id="editroleformreset" type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>

    </form>
</div>
<#--↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑为用户设置角色↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑-->


</body>
</html>