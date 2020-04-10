<!DOCTYPE html>
<html lang="cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>角色管理表格</title>
    <!-- jqGrid组件基础样式包-必要 -->
    <script src="${basePath!}/layui/layui.js" type="text/javascript"></script>
    <link href="${basePath!}/jqgrid/css/ui.jqgrid.css" type="text/css" media="screen" rel="stylesheet"/>
    <link href="${basePath!}/jqgrid/css/jquery-ui.css" type="text/css" media="screen" rel="stylesheet"/>
    <link href="${basePath!}/css/global.css" type="text/css" media="screen" rel="stylesheet"/>
    <link href="${basePath!}/plugins/font-awesome/css/font-awesome.min.css" type="text/css" media="screen"
          rel="stylesheet"/>
    <link href="${basePath!}/layui/css/layui.css" type="text/css" media="screen" rel="stylesheet"/>
    <link href="${basePath!}/css/ztree/metroStyle/metroStyle.css" type="text/css" media="screen" rel="stylesheet"/>
    <link href="${basePath!}/css/ztree/demo.css" type="text/css" media="screen" rel="stylesheet"/>

    <!-- jquery插件包-必要 -->
    <!-- 这个是所有jquery插件的基础，首先第一个引入 -->
    <script src="${basePath!}/js/jquery.min.js" type="text/javascript"></script>
    <script src="${basePath!}/jqgrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>
    <!-- jqGrid插件的多语言包-非必要 -->
    <!-- 在jqgrid/js/i18n下还有其他的多语言包，可以尝试更换看效果 -->
    <script src="${basePath!}/jqgrid/js/i18n/grid.locale-cn.js" type="text/javascript"></script>
    <script src="${basePath!}/jqgrid/js/jquery-ui.js" type="text/javascript"></script>

    <script src="${basePath!}/js/ztree/jquery.ztree.all.js" type="text/javascript"></script>
    <script src="${basePath!}/js/host.js" type="text/javascript"></script>
    <link rel="stylesheet" href="${basePath!}/css/index.css" media="all"/>
    <base href="${basePath!}/">
    <#include "../baseFtl/pageAuth.ftl" />
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
        </div>
    </div>
    <table id="list2" lay-filter="demo"></table>
</div>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="del">删除</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="setMenu">设置菜单权限</a>
</script>
<#--↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓add↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓-->
<#--带有 class="layui-fluid" 的容器中，那么宽度将不会固定，而是 100% 适应-->

<div id="addeditformdivid" hidden="" class="layui-fluid" style="margin: 15px;">
    <form class="layui-form layui-form-pane layui-personal" action="" id="addeditformid" lay-filter="example">

        <div class="layui-form-item" hidden="hidden">
            <label class="layui-form-label xrequired">角色id</label>
            <div class="layui-input-block">
                <input type="text" name="id" id="id" <#--lay-verify="required"--> autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">角色名称</label>
            <div class="layui-input-block">
                <input type="text" id="name" name="name" lay-verify="name" autocomplete="off" placeholder="请输入角色名称"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label" style="width:183px;">是否为总公司默认角色</label>
            <div class="layui-input-block">
                <input type="checkbox" name="companyDefaultClose" lay-skin="switch" lay-text="ON|OFF"
                       id="companyDefault">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label" style="width:183px;">是否为子公司默认角色</label>
            <div class="layui-input-block">
                <input type="checkbox" name="subCompanyDefaultClose" lay-skin="switch" lay-text="ON|OFF"
                       id="subCompanyDefault">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">备注</label>
            <div class="layui-input-block">
                <input type="text" id="bz" name="bz" autocomplete="off" placeholder="请输入备注信息" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="addeditsubmitfilter">立即提交</button>
                <button id="reset" type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>

    </form>
</div>
<#--↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑add↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑-->



<#--菜单权限设置弹窗-->
<div id="setpermisdiv" hidden="" class="layui-fluid">
    <ul id="treeDemo" class="ztree"></ul>
    <button class="layui-btn" id="savesetpermis">保存权限设置</button>
    <button class="layui-btn" id="closesetpermis">关闭</button>
    <script type="text/javascript">
        $('#savesetpermis').on('click', function () {
            var nodes = zTreeObj1.getCheckedNodes(true);
            var menuArrIds = [];
            for (var i = 0; i < nodes.length; i++) {
                menuArrIds.push(nodes[i].id);
            }
            var menuIds = menuArrIds.join(",");
            $.ajax({
                type: "POST",
                url: authHost + "/manager/role/saveMenuSet",
                data: {menuIds: menuIds, roleId: $("#setpermisdiv").attr("data-id")},
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
                            title: '操作成功'
                            , content: '操作成功！'
                            , btn: ["关闭"],
                            yes: function (index) {
                                layer.close(index); //如果设定了yes回调，需进行手工关闭
                                layer.close(layerid);
                            }
                        });
                        //重新加载表格
                        layui.table.reload("roleReload");

                    }
                }
            });

        });
        $('#closesetpermis').on('click', function () {
            layer.close(layerid);
        });
    </script>
</div>
</body>
</html>


<script>
    var zTreeObj1;
    var layerid;//当前弹层id;这个id可以定义多个，主要的目的是为了在回调函数关闭弹层时使用的
    //列表显示
    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#list2'
            , url: authHost + '/manager/role/list'
            , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , page: true          //显示分页默认不显示
            , method: 'post'
            , id: "roleReload"
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
                {field: 'name', title: '角色名称'}
                , {field: 'bz', title: '角色介绍'}
                , {
                    field: 'companyDefault', title: '是否为总公司默认角色', templet: function (d) {
                        if (d.companyDefault==1) {
                            return "是"
                        }else{
                            return "否"
                        }
                    }
                }
                , {
                    field: 'subCompanyDefault', title: '是否为子公司默认角色', templet: function (d) {
                        if (d.subCompanyDefault==1) {
                            return "是"
                        }else{
                            return "否"
                        }
                    }
                }
                , {fixed: 'right', title: '操作', align: 'center', toolbar: '#barDemo'}
            ]]
        });
    });

    layui.use(['layer', 'table', 'form', 'layedit', 'laydate'], function () {
        var layer = layui.layer,
                layedit = layui.layedit,
                $ = layui.jquery,
                form = layui.form,
                table = layui.table;


        //监听工具条
        table.on('tool(demo)', function (obj) {
            var data = obj.data;
            if (obj.event === 'edit') {//编辑
                edit(form, data, table, $);
            } else if (obj.event === 'del') {//删除
                del(form, data, table, $);
            } else if (obj.event === 'setMenu') {//设置菜单权限
                setrolelayer(data.id);
            }
        });


        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');
        //自定义验证规则
        form.verify({
            name: function (value) {
                if (value.length < 5) {
                    return '角色名至少得5个字符';
                }
            },
            password: [/(.+){6,12}$/, '密码必须6到12位'],
            content: function (value) {
                layedit.sync(editIndex);
            }
        });

        //监听提交
        form.on('submit(addeditsubmitfilter)', function (data) {
            //为了防止form中的id值被重置后置空,将编辑的id存放在label中
            $("#editid").val($("#editlabelid").html());
            $("#editlabelid").html("");
            var parm = $('#addeditformid').serialize() + "&companyDefault=" + ($("input[id='companyDefault']").is(":checked") == true ? 1 : 0) + "&subCompanyDefault=" + ($("input[id='subCompanyDefault']").is(":checked") == true ? 1 : 0)
            $.ajax({
                type: "POST",
                url: authHost + "/manager/role/addupdaterole",
                data: parm,
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
                            title: '操作成功'
                            , content: '操作成功！'
                            , btn: ["关闭"],
                            yes: function (index) {
                                layer.close(index); //如果设定了yes回调，需进行手工关闭
                                layer.close(layerid);
                            }
                        });
                        //重新加载表格
                        table.reload("roleReload");
                    }
                }
            });


            return false;
        });

        //监听提交
        form.on('submit(editroleformsubmit)', function (data) {
            //为了防止form中的id值被重置后置空,将编辑的id存放在label中
            $("#editroleid").val($("#editrolelabelid").html());
            $("#editrolelabelid").html("");

            $.ajax({
                type: "POST",
                url: authHost + "/manager/role/saveRoleSet",
                data: $('#editroleformid').serialize(),// 你的formid
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
                            // skin: 'layui-layer-molv',
                            type: 1,
                            area: "10%",
                            content: data.mesg,
                            shadeClose: true,
                            end: function () {
                                layer.close(layerid);
                                jQuery("#list2").jqGrid().trigger("reloadGrid");//重新加载数据
                                $("#reset").click();//重置表单
                            }
                        });

                    }
                }
            });


            return false;//防止跳转
        });

        $("#add").click(function () {
            $("#reset").click();//重置表单(新建时在进入表单前要重置一下表单的内容，不然表单打开后会显示上一次的表单的内容。这里调用表单中重置按钮的点击方法来重置)
            layerid = layer.open({//开启表单弹层
                // skin: 'layui-layer-molv',
                area: '60%',
                type: 1,
                title: '新建角色',
                content: $('#addeditformdivid') //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
            });
        })


        function del(form, data, table, $) {
            layer.open({
                content: '请确定是否真的要删除id为' + data.id + '的记录?',
                btn: ['yes', 'no'],//定义两个按钮，是和否
                yes: function (index, layero) {//点击是时候的回调
                    //do something
                    layer.close(index); //如果设定了yes回调，需进行手工关闭

                    //请求后台，执行删除操作
                    $.ajax({
                        type: "POST",
                        url: authHost + "/manager/role/deleterole",
                        data: {id: data.id},
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
                                    title: '操作成功'
                                    , content: '操作成功！'
                                    , btn: ["关闭"],
                                    yes: function (index) {
                                        layer.close(index); //如果设定了yes回调，需进行手工关闭
                                        layer.close(layerid);
                                    }
                                });
                                //重新加载表格
                                table.reload("roleReload");

                            }
                        }
                    });


                }
            });

        }

        function edit(form, data, table, $) {
            //请求后台，获取该记录的详细记录，并填充进表单
            $.ajax({
                type: "POST",
                url: authHost + "/manager/role/selectRoleById",
                data: {id: data.id},
                async: false,
                error: function (request) {
                    layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
                },
                success: function (data) {
                    if (data.responseStatusType.message == 'Failure') {
                        layer.alert(data.responseStatusType.error.errorMsg);
                        return false;
                    }
                    if (data.responseStatusType.message == "Success") {
                        //向表单填充数据
                        $("#id").val(data.result.id);
                        $("#name").val(data.result.name);
                        $("#bz").val(data.result.bz);


                        if (data.result.companyDefault == 1) {
                            form.val('example', {
                                "companyDefaultClose": true //开关状态
                            });
                        } else {
                            form.val('example', {
                                "companyDefaultClose": false //开关状态
                            });
                        }

                        if (data.result.subCompanyDefault == 1) {
                            form.val('example', {
                                "subCompanyDefaultClose": true //开关状态
                            });
                        } else {
                            form.val('example', {
                                "subCompanyDefaultClose": false //开关状态
                            });
                        }

                        //开启编辑表单所在的弹层。注意编辑和新建的表单是一套模板
                        layerid = layer.open({
                            // skin: 'layui-layer-molv',
                            area: '60%',
                            type: 1,
                            title: '编辑角色',
                            content: $('#addeditformdivid'), //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
                            end: function () {

                            }
                        });

                    }
                }
            });
        }


    });

    function setrolelayer(id) {
        $("#setpermisdiv").attr("data-id", id);
        // zTree 的参数配置，深入使用请参考 API 文档（setting 配置详解）
        var setting = {
            check: {
                enable: true,
                chkStyle: "checkbox",
                chkboxType: {"Y": "ps", "N": "ps"},
                nocheckInherit: true,
                chkDisabledInherit: true
            }
        };
        // zTree 的数据属性，深入使用请参考 API 文档（zTreeNode 节点数据详解）

        var zNodes = [
            {
                name: "test1", open: true, children: [
                    {name: "test1_1"}, {name: "test1_2"}]
            },
            {
                name: "test2", open: true, children: [
                    {name: "test2_1"}, {name: "test2_2"}]
            }
        ];


        $.ajax({
            type: "POST",
            url: authHost + '/manager/role/loadCheckMenuInfo?parentId=1&roleId=' + id,
            async: false,
            dataType: 'json',
            timeout: 1000,
            cache: false,
            error: function (request) {
                layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
            },
            success: function (data) {
                zNodes = JSON.parse(data.result);

                zTreeObj1 = $.fn.zTree.init($("#treeDemo"), setting, zNodes);

                layerid = layer.open({//开启表单弹层
                    // skin: 'layui-layer-molv',
                    type: 1,
                    title: '设置权限',
                    content: $('#setpermisdiv') //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
                });

            }
        });

    }

</script>