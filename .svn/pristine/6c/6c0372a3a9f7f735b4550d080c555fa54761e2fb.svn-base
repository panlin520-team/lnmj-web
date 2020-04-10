<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>限购设置</title>
    <#--<meta name="renderer" content="webkit">-->
<meta http-equiv="Access-Control-Allow-Origin" content="*">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${basePath!}/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${basePath!}/css/index.css" media="all"/>
    <script src="${basePath!}/js/jquery.min.js" type="text/javascript"></script>
    <script src="${basePath!}/layui/layui.js" charset="utf-8"></script>
    <script src="${basePath!}/js/host.js" type="text/javascript"></script>
    <#include "../baseFtl/pageAuth.ftl" />
    <style>
        .makerType {
            width: 1250px;
            margin-bottom: 50px;
            margin-left: 65px;
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -ms-flex-wrap: wrap;
            flex-wrap: wrap;
        }

        .somersCar {
            width: 250px;
            height: 184px;
            margin: 35px 22px 0 35px;
            border: 2px solid #eee;
            position: relative;
            bottom: 0;
            transition: .5s;
            -webkit-transition: .5s;
        }

        .somersCar .discovery {
            width: 247px;
            height: 141px;
        }

        .somersCar .dislabel {
            width: 220px;
            height: 30px;
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            margin: 8px;
            -ms-flex-pack: distribute;
            justify-content: space-around;
        }

        .somersCar:hover {
            cursor: pointer;
            bottom: 10px;
            -webkit-box-shadow: 0 0 11px 2px #cfcfcf;
            box-shadow: 0 0 11px 2px #cfcfcf;
               
        }
    </style>
</head>
<body>
<div class="layui-fluid">
    <#--显示参数类型-->
    <div class="makerType">
        <div class="somersCar">
            <div class="discovery">
                <img src="${basePath!}/images/system_parameter.png" alt="">
            </div>
            <div class="dislabel"><label>魔幻之旅</label><span
                >100元</span></div>
        </div>
        <div class="somersCar">
            <div class="discovery"><img
                        src="${basePath!}/images/system_parameter.png"
                        alt=""></div>
            <div class="dislabel"><label>春秋快乐</label><span
                >111元</span></div>
        </div>
        <div class="somersCar">
            <div class="discovery"><img
                        src="${basePath!}/images/system_parameter.png"
                        alt=""></div>
            <div class="dislabel"><label>春秋无敌</label><span
                >120元</span></div>
        </div>
        <div class="somersCar">
            <div class="discovery"><img
                        src="${basePath!}/images/system_parameter.png"
                        alt=""></div>
            <div class="dislabel"><label>春秋热会</label><span
                >123元</span></div>
        </div>
        <div class="somersCar">
            <div class="discovery"><img
                        src="${basePath!}/images/system_parameter.png"
                        alt=""></div>
            <div class="dislabel"><label>无敌好客</label><span
                >111元</span></div>
        </div>
        <div class="somersCar">
            <div class="discovery"><img
                        src="${basePath!}/images/system_parameter.png"
                        alt=""></div>
            <div class="dislabel"><label>限购体验卡</label><span>120元</span>
            </div>
        </div>
        <div class="somersCar">
            <div class="discovery"><img
                        src="${basePath!}/images/system_parameter.png"
                        alt=""></div>
            <div class="dislabel"><label>秋日无敌</label><span
                >200元</span></div>
        </div>
        <div class="somersCar">
            <div class="discovery"><img
                        src="${basePath!}/images/system_parameter.png"
                        alt=""></div>
            <div class="dislabel"><label>美丽人卡</label><span
                >500元</span></div>
        </div>
    </div>
    <#--显示参数-->
    <form class="layui-form layui-form-pane layui-personal" id="parameter" action="" lay-filter="parameter" method="post" hidden="true">
        <div class="layui-form-item"></div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <button id="addParameterButton" type="button" class="layui-btn">添加限购</button>
            </div>
        </div>
        <table id="parameterTable" class="parameterTable" lay-filter="parameterTable"></table>
    </form>
    <#-- 树：限购参数设置 -->
    <#--<div id="parameter" class="demo-tree demo-tree-box parameter" style="width: 400px; height: 450px;margin: 10px; overflow: scroll;border: 1px solid #d2d2d2;"></div>-->
    <#-- 参数 -->
    <form id="parameterForm" class="layui-form parameterForm layui-form-pane layui-personal" action="" lay-filter="parameterForm" method="post"
          hidden="true">
        <div class="layui-form-item">
            <label class="layui-form-label">参数类型</label>
            <div class="layui-input-block">
                <select name="parameterTypeId" lay-filter="parameterTypeId" lay-verify="required">
                    <option value="">请选择</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">参数名</label>
            <div class="layui-input-block">
                <input type="text" name="parameterName" lay-verify="required" autocomplete="off" placeholder="请输入参数名"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">参数值</label>
            <div class="layui-input-block">
                <input type="text" name="parameterValue" lay-verify="required" autocomplete="off" placeholder="请输入参数值"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">排序</label>
            <div class="layui-input-block">
                <input type="text" name="parameterSort" lay-verify="required" autocomplete="off" placeholder="0-9999"
                       class="layui-input">
            </div>
        </div>
    </form>
    <#-- 参数类型 -->
    <form id="parameterTypeForm" class="layui-form parameterTypeForm layui-form-pane layui-personal" action="" lay-filter="parameterTypeForm" method="post"
          hidden="true">
        <div class="layui-form-item">
            <label class="layui-form-label">参数类型名</label>
            <div class="layui-input-block">
                <input type="text" name="parameterType" lay-verify="required" autocomplete="off" placeholder="请输入参数类型名"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">父类参数类型</label>
            <div class="layui-input-block">
                <select name="parentId" lay-filter="parentId" lay-verify="required">
                    <option value="">请选择</option>
                </select>
            </div>
        </div>
    </form>
</div>
<#--按钮：限购类别参数-->
<script type="text/html" id="parameterTableDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script>
    var dataType = [], dataParameter = [],
        form = null,table=null;
    layui.use(['form','table'], function () {
        form = layui.form;
        table = layui.table;

        //首页显示参数类别
        showParent();
        //参数修改表单下拉框
        showParameterTypeSelect();

        //监听参数表格
        table.on('tool(parameterTable)', function(obj){
            var data = obj.data;
            if(obj.event === 'edit'){
                editParameter(data);
                // layer.alert('编辑行：<br>'+ JSON.stringify(data))
            }else if(obj.event === 'del'){
                layer.confirm('真的删除ID为'+data.parameterId+'的限购么？', function(index){
                    delParameter(data);
                    obj.del();
                });
            }
        });
    });

    function editParameter(data) {
        var a1 = layer.open({
            type: 1,
            title: '修改参数',
            content: $('#parameterForm'),
            closeBtn: 1,
            btn: ['确定', '取消'],
            yes: function (index, layero) {
                var parameterTypeId = layero.find("select[name='parameterTypeId']");
                parameterTypeId = parameterTypeId.find("option:selected").val();
                var url = systemHost + "/manage/system/updateParameter", parameterArray = new Array(),
                    json = {
                        parameterId: data.parameterId
                        , parameterTypeId: parameterTypeId
                        , parameterName: layero.find("input[name='parameterName']").val()
                        , parameterValue: layero.find("input[name='parameterValue']").val()
                        , parameterSort: layero.find("input[name='parameterSort']").val()
                        , modifyOperator: "${currentUser.trueName!}"
                    };
                parameterArray.push(json);
                var params = {parameterArray: JSON.stringify(parameterArray)};
                $.post(url, params, function (res) {
                    if (res.responseStatusType.message == "Success") {
                        layer.open({
                            title: '修改'
                            , content: '修改成功！'
                            , btn: ["关闭"]
                            , yes: function (index) {
                                layer.close(index);
                                layer.close(a1);
                            }
                        });
                        //重新加载table
                        table.reload("parameterTableReload");
                    } else {
                        layer.open({
                            title: '修改'
                            , content: '修改失败！'
                            , btn: ["关闭"]
                        });
                    }
                })
            },
            btn2: function (index, layero) {
                layer.close(index);
                layer.close(a1);
            },
            success: function (layero, index) {
                //回显
                var accountType = layero.find("select[name='parameterTypeId']");
                accountType.find("option[value='" + data.parameterTypeId + "']").attr("selected", true);
                layero.find("select[name='parameterTypeId']").attr("disabled","disabled");
                layero.find("input[name='parameterName']").val(data.parameterName);
                layero.find("input[name='parameterValue']").val(data.parameterValue);
                layero.find("input[name='parameterSort']").val(data.parameterSort);
                form.render("select", "parameterForm");
            },
            area: ['600px', '500px']
        });
    }

    function delParameter(data){
        //删除数据库数据
        var url = systemHost + "/manage/system/deleteParameter";
        var params = {
            parameterId: data.parameterId,
            modifyOperator: "${currentUser.trueName!}"
        };
        $.post(url, params, function (res) {
            if (res.responseStatusType.message == "Success") {
                layer.open({
                    title: '删除'
                    , content: '删除成功！'
                    , btn: ["关闭"]
                    , yes: function (index) {
                        layer.close(index);
                    }
                });
                //重新加载
                table.reload("parameterTableReload");
            } else {
                layer.open({
                    title: '删除'
                    , content: '删除失败！'
                    , btn: ["关闭"]
                });
            }
        })
    }

    $("#addParameterButton").click(function () {
        //获取add按钮的id的值
        var type = $("#addParameterButton").attr("type-id");
        var a3 = layer.open({
            type: 1,
            title: '添加参数',
            content: $('#parameterForm'),
            closeBtn: 1,
            btn: ['确定', '取消'],
            yes: function (index, layero) {
                var parameterTypeId = layero.find("select[name='parameterTypeId']");
                parameterTypeId = parameterTypeId.find("option:selected").val();
                var url = systemHost + "/manage/system/insertParameter",
                    param = {
                        parameterTypeId: parameterTypeId
                        , parameterName: layero.find("input[name='parameterName']").val()
                        , parameterValue: layero.find("input[name='parameterValue']").val()
                        , parameterSort: layero.find("input[name='parameterSort']").val()
                        , createOperator: "${currentUser.trueName!}"
                    };
                $.post(url, param, function (res) {
                    if (res.responseStatusType.message == "Success") {
                        layer.open({
                            title: '添加'
                            , content: '添加成功！'
                            , btn: ["关闭"]
                            , yes: function (index) {
                                layer.close(index);
                                layer.close(a3);
                            }
                        });
                        //重新加载table
                        table.reload("parameterTableReload");
                    } else {
                        layer.open({
                            title: '添加'
                            , content: '添加失败！'
                            , btn: ["关闭"]
                        });
                    }
                })
            },
            btn2: function (index, layero) {
                layer.close(index);
                layer.close(a3);
            },
            success: function (layero, index) {
                //回显当前限购类别，并不能修改
                var accountType = layero.find("select[name='parameterTypeId']");
                accountType.find("option[value='" + type + "']").attr("selected", true);
                layero.find("select[name='parameterTypeId']").attr("disabled","disabled");
                form.render("select", "parameterForm");
            },
            area: ['600px', '500px']
        });
    });

    function editParameterType(data) {
        var a2 = layer.open({
            type: 1,
            title: '参数类型',
            content: $('#parameterTypeForm'),
            closeBtn: 1,
            btn: ['修改', '删除'],
            yes: function (index, layero) {
                var parentId = layero.find("select[name='parentId']");
                parentId = parentId.find("option:selected").val();
                var url = systemHost + "/manage/system/updateParameterType",
                    params = {
                        parameterTypeId: data.id
                        , parentId: parentId
                        , parameterType: layero.find("input[name='parameterType']").val()
                        , modifyOperator: "${currentUser.trueName!}"
                    };
                $.post(url, params, function (res) {
                    if (res.responseStatusType.message == "Success") {
                        layer.open({
                            title: '修改'
                            , content: '修改成功！'
                            , btn: ["关闭"]
                            , yes: function (index) {
                                layer.close(index);
                                layer.close(a2);
                            }
                        });
                        //重新加载
                        showParent();
                    } else {
                        layer.open({
                            title: '修改'
                            , content: '修改失败！'
                            , btn: ["关闭"]
                        });
                    }
                })
            },
            btn2: function (index, layero) {
                //删除数据库数据
                var url = systemHost + "/manage/system/deleteParameterType";
                var params = {
                    parameterTypeId: data.id,
                    modifyOperator: "${currentUser.trueName!}"
                };
                $.post(url, params, function (res) {
                    if (res.responseStatusType.message == "Success") {
                        layer.open({
                            title: '删除'
                            , content: '删除成功！'
                            , btn: ["关闭"]
                            , yes: function (index) {
                                layer.close(index);
                                layer.close(a2);
                            }
                        });
                        //重新加载
                        showParent();
                    } else {
                        layer.open({
                            title: '删除'
                            , content: '删除失败！'
                            , btn: ["关闭"]
                        });
                    }
                })
            },
            success: function (layero, index) {
                //回显
                // if(data.cId == 0){  //最高父类
                //
                // }
                var accountType = layero.find("select[name='parentId']");
                accountType.find("option[value='" + data.cId + "']").attr("selected", true);
                layero.find("input[name='parameterType']").val(data.title);
                form.render("select", "parameterTypeForm");
            },
            area: ['600px', '500px']
        });
    }

    function showParameterTypeSelect() {
        $("#parameterForm select[name='parameterTypeId']").html("<option value=''>请选择</option>");
        $("#parameterTypeForm select[name='parentId']").html("<option value=''>请选择</option>");
        for (var p in dataType) {
            var option = "<option value='" + dataType[p].parameterTypeId + "'>" + dataType[p].parameterType + "</option>";
            $("#parameterForm select[name='parameterTypeId']").append(option);
            $("#parameterTypeForm select[name='parentId']").append(option);
        }
        form.render("select", "parameterForm");
        form.render("select", "parameterTypeForm");
    }

    function showParent(){
        //加载参数类型
        getParameterType();
        $(".makerType").html("<button type='button' class='layui-btn layui-btn-warm' onclick='addParameterType()'>新增限购类别</button>");
        //显示参数类型
        for (var p in dataType) {
            var someCar =
                "<div class='somersCar' onclick=\"showParameter('"+dataType[p].parameterTypeId+"','"+dataType[p].parameterType+"')\">" +
                "     <div class='discovery'>" +
                "         <img src='${basePath!}/images/system_parameter.png' alt=''>" +
                "     </div>" +
                "     <div class='dislabel'>" +
                "       <label>"+dataType[p].parameterType+"</label>" +
                "       <span>"+dataType[p].createTime+"</span>" +
                "      </div>" +
                " </div>";
            $(".makerType").append(someCar);
        }
    }
    
    function addParameterType() {
        var a3 = layer.open({
            type: 1,
            title: '参数类型',
            content: $('#parameterTypeForm'),
            closeBtn: 1,
            btn: ['确定', '取消'],
            yes: function (index, layero) {
                var parentId = layero.find("select[name='parentId']");
                parentId = parentId.find("option:selected").val();
                var url = systemHost + "/manage/system/insertParameterType",
                    params = {
                        parentId: parentId
                        , parameterType: layero.find("input[name='parameterType']").val()
                        , createOperator: "${currentUser.trueName!}"
                        , modifyOperator: "${currentUser.trueName!}"
                    };
                $.post(url, params, function (res) {
                    if (res.responseStatusType.message == "Success") {
                        layer.open({
                            title: '添加'
                            , content: '添加成功！'
                            , btn: ["关闭"]
                            , yes: function (index) {
                                layer.close(index);
                                layer.close(a3);
                            }
                        });
                        //重新加载
                        showParent();
                    } else {
                        layer.open({
                            title: '添加'
                            , content: '添加失败！'
                            , btn: ["关闭"]
                        });
                    }
                })
            },
            btn2: function (index, layero) {
                layer.close(index);
                layer.close(a3);
            },
            success: function (layero, index) {
            },
            area: ['600px', '500px']
        });
    }

    function showParameter(id,name) {
        //将parameterType 的id 写入到parameter表单的add按钮
        $("#addParameterButton").attr("type-id",id);
        //渲染表格
        var a4 = layer.open({
            type: 1,
            title: name+' 限购类别',
            content: $('#parameter'),
            // scrollbar: true,
            closeBtn: 1,
            btn: ['确定','取消'],
            area: ['900px', '600px'],
            yes: function (index, layero) {
                layer.close(index);
                layer.close(a4);
            },
            success: function (layero, index) {
                table.render({
                    elem: '#parameterTable'
                    , url: systemHost + "/manage/system/selectParameterList"     // selectAllMemberList(状态为0的也查询)
                    , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    , page: true          //显示分页默认不显示
                    , method: 'post'
                    , request: {
                        pageName: 'pageNum', //页码的参数名称，默认：page
                        limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    }
                    , where: {
                        parameterTypeId: id
                    }
                    , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                        return {
                            "code": 0, //解析接口状态
                            "msg": res.responseStatusType.error.errorMsg, //解析提示文本
                            "count": res.result == null ? 0 : res.result.total, //解析数据长度
                            "data": res.result == null ? 0 : res.result.list //解析数据列表
                        }
                    }
                    , cols: [[
                        {type: 'checkbox', fixed: 'left', width: 40,hide:true}
                        , {field: 'parameterName', title: '限购名'}
                        , {field: 'parameterValue', title: '限购值'}
                        , {field: 'parameterSort', title: '排序', sort: true}
                        , {field: 'parameterTypeId', title: '限购类别', templet: function (d) {
                                var parType = name;
                                // for (var p in dataType) {
                                //     if (dataType[p].parameterTypeId == d.parameterTypeId) {
                                //         parType = dataType[p].parameterType
                                //     }
                                // }
                                return parType;
                            }}
                        , {field: 'status', title: '状态', hide: true}
                        , {field: 'createOperator', title: '创建人', hide: true}
                        , {field: 'createTime', title: '创建时间', hide: true}
                        , {field: 'modifyOperator', title: '修改人', hide: true}
                        , {field: 'dataChangeLastTime', title: '更新时间', hide: true}
                        , {fixed: 'right', title: '操作', width: 230, align: 'center', toolbar: '#parameterTableDemo'}
                    ]]
                    , id: 'parameterTableReload'
                });
            }
        });
    }

    function getParameterType() {
        $.ajax({
            url: systemHost + "/manage/system/selectParameterTypeList",
            async: false,
            method: "POST",
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    dataType = res.result.list;
                }
            }
        })
    }

    function getParameter(id) {
        $.ajax({
            url: systemHost + "/manage/system/selectParameterList",
            data: {parameterTypeId: id},
            async: false,
            method: "POST",
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    dataParameter = res.result.list;
                }
            }
        })
    }
</script>
</body>
</html>