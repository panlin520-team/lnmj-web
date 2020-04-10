<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>标签</title>
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
    </style>
</head>
<body>

<div class="layui-fluid">
    <div class="demoTable layui-form">
        <div class="layui-btn-group" align="left">
            <button class="layui-btn" onclick="addLableCategory()" style="float: right">添加标签大类</button>
        </div>
        <table class="layui-hidden" id="label" lay-filter="label"></table>
    </div>
</div>


<form id="form" class="layui-form layui-form-pane layui-personal" action="" lay-filter="form" method="post" hidden="true">
    <div class="layui-form-item">
        <label class="layui-form-label">标签名称</label>
        <div class="layui-input-block">
            <#--<input type="text" name="labelName" lay-verify="required" autocomplete="off" placeholder="请输入分类名称" class="layui-input">-->
            <select id="labels" name="labels" lay-verify="labels" lay-filter="labels"></select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">标签描述</label>
        <div class="layui-input-block">
            <input type="text" name="labelDescribe" lay-verify="required" autocomplete="off" placeholder="请输入分类描述"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">行业</label>
        <div class="layui-input-block">
            <select name="industry" lay-verify="industry" lay-filter="industry">
                <option>美容</option>
                <option>美发</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">升级条件(储值)</label>
        <div class="layui-input-block">
            <input type="text" name="upgradeStandardStorage" lay-verify="required" autocomplete="off" placeholder="请输入储值升级条件的金额" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">升级条件(消费)</label>
        <div class="layui-input-block">
            <input type="text" name="upgradeStandardConsumption" lay-verify="required" autocomplete="off" placeholder="请输入消费升级条件的金额" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" id="createOperator">
        <label class="layui-form-label">创建人</label>
        <div class="layui-input-block">
            <input type="text" name="createOperator" lay-verify="required" autocomplete="off" placeholder="请输入分类名称"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" id="modifyOperator">
        <label class="layui-form-label">修改人</label>
        <div class="layui-input-block">
            <input type="text" name="modifyOperator" lay-verify="required" autocomplete="off" placeholder="请输入分类名称"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" hidden="hidden">
        <div class="layui-input-block">
            <button id="reset" type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<form id="parentForm" class="layui-form layui-form-pane layui-personal" action="" lay-filter="parentForm" method="post" hidden="true">
    <div class="layui-form-item">
        <label class="layui-form-label">标签大类名称</label>
        <div class="layui-input-block">
            <input type="text" name="labelTypeName" lay-verify="required" autocomplete="off" placeholder="请输入标签大类名称"
                   class="layui-input">
        </div>
    </div>
</form>

<script type="text/javascript">
    //树形表格显示
    var tree1 = null, treeGrid = null, tableId = 'label', layer = null
        , upload = null, productTypeImage = null, multipartFile = null
        , sortable = null, treeData = null,resultData = [];
    layui.config({
        base: '${basePath!}/layui/extend/'
    }).extend({
        treeGrid: 'treeGrid'
    }).use(['jquery', 'treeGrid', 'layer', 'upload', 'form', 'table'], function () {
        var $ = layui.jquery;
        upload = layui.upload;
        treeGrid = layui.treeGrid; //很重要
        layer = layui.layer;
        form = layui.form;
        var table = layui.table;
        // var resultData = [];
        loadData();
        loadLabels();
        treeGrid.render({
            id: tableId
            , elem: '#' + tableId
            , height: '100%'      //长度
            , heightRemove: [".dHead", 10]
            , idField: 'labelId'
            , isPage: true
            ,limit:20
            , loading: true
            , data: resultData
            ,parseData:function (res) {
                return {
                    "msg": "",
                    "code": 0,
                    "data": res,
                    "count": res==null?2:res.length,
                    "is": true,
                    "tip": "操作成功！"
                }
            }
            , treeId: 'labelId'//树形id字段名称
            , treeUpId: 'pId'//树形父id字段名称
            , treeShowName: 'labelName'//以树形式显示的字段
            , cols: [[
                {type: 'checkbox', fixed: 'left', /*width: 60,*/ flex: 5, align: 'center'}
                // , {field: 'labelId', title: 'ID', /*width:100,*/ flex: 8, sort: true, align: 'center'}
                , {field: 'labelName', /*width:250,*/ flex: 21, title: '分类名称'/*,edit:'text'*/}
                // , {field: 'standard', /*width:150,*/ flex: 13, title: '标准', align: 'center'}
                // , {field: 'pId', title: '父类ID', /*width:100,*/ flex: 8, sort: true, align: 'center'}
                , {/*width: 250,*/ flex: 21, title: '操作', align: 'left', fixed: 'right' /*toolbar: '#barDemo'*/
                    , templet: function (d) {
                        var html = '';
                        if (d.pId == 0) {     //一级父类只显示查看
                            // html += '<a class="layui-btn layui-btn-xs" lay-event="show" title="查看详情"><i class="layui-icon">&#xe602</i></a>';
                            html += '<a class="layui-btn layui-btn-xs" lay-event="add"><i class="layui-icon">&#xe654;</i></a>';
                            return html;
                        }
                        html += '<a class="layui-btn layui-btn-xs" lay-event="show" title="查看详情"><i class="layui-icon">&#xe602</i></a>';
                        html += '<a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit"><i class="layui-icon">&#xe642;</i></a>';
                        html += '<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon">&#xe640;</i></a>';
                        return html;
                    }
                }
            ]]
        });
        treeGrid.on('tool(' + tableId + ')', function (obj) {
            if (obj.event === 'del') {  //删除行
                layer.confirm('确定删除吗？', function (index) {
                    layerDelete(obj, table);
                    obj.del();
                });
            } else if (obj.event === "add") {   //添加行
                add(obj, table);
            } else if (obj.event === "edit") {  //编辑行
                edit(obj, form, table);
            } else if (obj.event === "show") {    //查看行
                show(obj, form);
            }
        });
    })

    function add(obj, table) {
        var data = obj.data;
        $("#reset").click();//重置表单
        $("#createOperator").attr("hidden", "hidden");
        $("#modifyOperator").attr("hidden", "hidden");
        layer.open({
            type: 1,
            title: '新增会员标签',
            content: $('#form'),
            closeBtn: 1,
            btn: ['确定', '取消'],
            success: function (layero) {
            },
            yes: function (index, layero) {
                var industry = layero.find("select[name='industry']");
                industry = industry.find("option:selected").text();

                var labelName = layero.find("select[name='labels']");
                labelName = labelName.find("option:selected").text();
                var params = {
                    labelName: labelName,
                    labelDescribe: layero.find("input[name='labelDescribe']").val(),
                    industry: industry,
                    upgradeStandardStorage: layero.find("input[name='upgradeStandardStorage']").val(),
                    upgradeStandardConsumption: layero.find("input[name='upgradeStandardConsumption']").val(),
                    parentId: data.labelId,
                    createOperator: "${currentUser.trueName!}"
                };
                var url = accountHost + "/manage/mall/label/addLabel";
                $.post(url, params, function (res) {
                    if (res.responseStatusType.message == "Success") {
                        layer.open({
                            title: '添加'
                            , content: '添加成功！'
                            , btn: ["关闭"]
                            , yes: function (index) {
                                layer.closeAll(); //如果设定了yes回调，需进行手工关闭
                            }
                        });
                        loadData();
                    } else {
                        layer.open({
                            title: '添加'
                            , content: '添加失败！'
                            , btn: ["关闭"]
                        });
                    }
                })
            },
            btn2: function () {
                layer.closeAll();
            },
            area: ['600px', '500px'],
            end: function () {
                window.location.reload();
            }
        });
    }

    function show(obj, form) {
        var data = obj.data;
        if (data.pId == 0) {
            layer.open({
                type: 1,
                title: '商品分类详情',
                content: $('#parentForm'),
                area: ['auto', 'auto'],
                closeBtn: 1,
                btn: ['确定', '取消'],
                yes: function (index,layero) {
                    var url = accountHost + "/manage/mall/labelCategory/updateLabelCategoryById";
                    var params = {
                        categoryName: layero.find("input[name='labelTypeName']").val(),
                        labelCategoryId: data.labelId,
                        modifyOperator: "${currentUser.trueName!}"
                    };
                    $.post(url, params, function (res) {
                        if (res.responseStatusType.message == "Success") {
                            layer.open({
                                title: '编辑'
                                , content: '修改成功！'
                                , btn: ["关闭"]
                                , yes: function (index) {
                                    layer.closeAll(); //如果设定了yes回调，需进行手工关闭
                                }
                            });
                        } else {
                            layer.open({
                                title: '修改'
                                , content: '修改失败！'
                                , btn: ["关闭"]
                            });
                        }
                    })
                },
                btn2: function () {
                    layer.closeAll();
                },
                success: function (layero) {
                    layero.find("input[name='labelTypeName']").val(data.labelName);
                    // layero.find("input[name='pId']").val(data.pId);
                },
                end: function () {
                    layer.closeAll();
                    window.location.reload();
                }
            });
        } else {
            showLabel(data, form);
        }
    }

    function showLabel(data, form) {
        //页面弹框
         var a = layer.open({
            type: 1,
            title: '会员标签详情',
            content: $('#form'),
             closeBtn: 1,
             btn: ['关闭'],
             // btn2: function () {
                 // layer.close(a);
             // },
            yes: function (index) {
                layer.close(a);
            },
            success: function (layero) {
                form.val('form', {
                    "labels": data.labelId,
                    "labelDescribe": data.labelDescribe,
                    "industry": data.industry,
                    "upgradeStandardStorage": data.upgradeStandardStorage,
                    "upgradeStandardConsumption": data.upgradeStandardConsumption,
                    "createOperator": data.createOperator,
                    "modifyOperator": data.modifyOperator,

                })
            },
            area: ['600px', '500px'],
            end: function () {
            }
        });
    }

    function edit(obj, form, table) {
        var data = obj.data;
        $("#createOperator").attr("hidden", "hidden");
        $("#modifyOperator").attr("hidden", "hidden");
        layer.open({
            type: 1,
            title: '会员标签编辑详情',
            content: $('#form'),
            closeBtn: 1,
            btn: ['确定', '取消'],
            btn2: function () {
                layer.closeAll();
            },
            success: function (layero) {
                form.val('form', {
                    "labels": data.labelId,
                    "labelDescribe": data.labelDescribe,
                    "industry": data.industry,
                    "upgradeStandardStorage": data.upgradeStandardStorage,
                    "upgradeStandardConsumption": data.upgradeStandardConsumption
                })
            },
            yes: function (index, layero) {
                var industry = layero.find("select[name='industry']");
                industry = industry.find("option:selected").text();
                var labels = layero.find("select[name='labels']");
                labels = labels.find("option:selected").text();
                var params = {
                    labelId: data.labelId,
                    labelName: labels,
                    labelDescribe: layero.find("input[name='labelDescribe']").val(),
                    industry: industry,
                    upgradeStandardStorage: layero.find("input[name='upgradeStandardStorage']").val(),
                    upgradeStandardConsumption: layero.find("input[name='upgradeStandardConsumption']").val(),
                    parentId: data.pId,
                    modifyOperator: "${currentUser.trueName!}"
                };
                var url = accountHost + "/manage/mall/label/updateLabel";
                $.post(url, params, function (res) {
                    if (res.responseStatusType.message == "Success") {
                        layer.open({
                            title: '编辑'
                            , content: '修改成功！'
                            , btn: ["关闭"]
                            , yes: function (index) {
                                layer.closeAll(); //如果设定了yes回调，需进行手工关闭
                            }
                        });
                    } else {
                        layer.open({
                            title: '修改'
                            , content: '修改失败！'
                            , btn: ["关闭"]
                        });
                    }
                })
            },
            area: ['600px', '500px'],
            end: function () {
                window.location.reload();
            }
        });
    }

    function layerDelete(obj, table) {
        var data = obj.data;
        //删除数据库数据
        var url = accountHost + "/manage/mall/label/deleteLabelById";
        var param = {
            labelId: data.labelId,
            modifyOperator: " ${currentUser.trueName!}"
        };
        $.post(url, param, function (res) {
            if (res.responseStatusType.message == "Success") {
                layer.open({
                    title: '删除'
                    , content: '删除成功！'
                    , btn: ["关闭"]
                });
                //重新加载表格
                window.location.reload();
            } else {
                layui.msg("删除失败！");
            }
        })
    };

    function loadParent(data, name) {
        //加载会员等级列表信息
        var url = accountHost + "/manage/mall/labelCategory/selectLabelCategoryList";
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result.list;    //返回的数据
                var server = null;
                if (name == "parentId") {
                    server = document.getElementById("parentId");
                }
                server.innerHTML = "";
                for (var p in list) {
                    var option = document.createElement("option");  // 创建添加option属性
                    option.setAttribute("value", list[p].labelCategoryId); // 给option的value添加值
                    option.innerText = list[p].categoryName;     // 打印option对应的纯文本
                    server.appendChild(option);           //给select添加option子标签
                    if (data.pId == option.getAttribute("value")) {
                        option.setAttribute("selected", true)
                    }
                }
                layui.form.render();
            }
        })
    }

    function addLableCategory() {
        layer.open({
            type: 1,
            title: '添加标签大类',
            content: $('#parentForm'),
            closeBtn: 1,
            btn: ['确定', '取消'],
            yes: function (index, layero) {
                var url = accountHost + "/manage/mall/labelCategory/addLabelCategory";
                var params = {
                    categoryName: layero.find("input[name='labelTypeName']").val(),
                    createOperator: "${currentUser.trueName!}"
                };
                $.post(url, params, function (res) {
                    if (res.responseStatusType.message == "Success") {
                        layer.open({
                            title: '添加'
                            , content: '添加成功！'
                            , btn: ["关闭"]
                            , yes: function (index) {
                                layer.closeAll(); //如果设定了yes回调，需进行手工关闭
                                //重新加载表格
                                // table.reload("label");
                            }
                        });
                    } else {
                        layer.open({
                            title: '添加'
                            , content: '添加失败！'
                            , btn: ["关闭"]
                        });
                    }
                })
            },
            btn2: function () {
                layer.closeAll();
            },
            success: function (layero) {
            },
            // area:['600px', '500px'],
            end: function () {
                window.location.reload();
            }
        });
    }

    function loadData() {
        $.ajax({
            url: accountHost + '/manage/mall/labelCategory/selectLabelCategoryList',
            type: 'post',
            dataType: 'json',
            async: false,
            success: function (res) {
                var data = res.result.list;
                for (var i = 0; i < data.length; i++) {
                    var json2 = {
                        lay_icon_open: "/images/1200271.jpg"
                        , lay_icon_close: "/images/1195195.jpg"
                    };
                    json2.labelId = res.result.list[i].labelCategoryId.toString();
                    json2.labelName = res.result.list[i].categoryName;
                    json2.pId = 0;
                    resultData.push(json2);
                    $.ajax({
                        url: accountHost + '/manage/mall/label/selectLabelList',
                        type: 'post',
                        data: {labelCategoryId: data[i].labelCategoryId},
                        dataType: 'json',
                        async: false,
                        success: function (res) {
                            if (res.responseStatusType.message == "Success") {
                                for (var j = 0; j < res.result.list.length; j++) {
                                    var json = {
                                        lay_icon_open: "/images/1200271.jpg"
                                        , lay_icon_close: "/images/1195195.jpg"
                                    };
                                    json.labelId = res.result.list[j].labelId;
                                    json.labelName = res.result.list[j].labelName;
                                    json.labelDescribe = res.result.list[j].labelDescribe;
                                    json.industry = res.result.list[j].industry;
                                    json.upgradeStandardStorage = res.result.list[j].upgradeStandardStorage;
                                    json.upgradeStandardConsumption = res.result.list[j].upgradeStandardConsumption;
                                    json.pId = res.result.list[j].parentId.toString();
                                    json.createOperator = res.result.list[j].createOperator;
                                    json.modifyOperator = res.result.list[j].modifyOperator;
                                    resultData.push(json);
                                }
                            }
                        }
                    });
                }
            }
        });
    }


    function loadLabels() {
        var url = accountHost + '/manage/mall/label/selectLabelList';
        $.post(url, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result.list;    //返回的数据
                var labelsSelect = document.getElementById("labels");
                labelsSelect.innerHTML = "";
                for (var p in list) {
                    var option = document.createElement("option");  // 创建添加option属性
                    option.setAttribute("value", list[p].labelId); // 给option的value添加值
                    option.innerText = list[p].labelName;     // 打印option对应的纯文本
                    labelsSelect.appendChild(option);           //给select添加option子标签
                }
                layui.form.render();
            }
        })
    }
</script>
</body>
</html>
