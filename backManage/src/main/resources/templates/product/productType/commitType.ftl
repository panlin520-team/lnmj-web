<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>商品大类</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${basePath!}/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${basePath!}/css/index.css" media="all"/>
    <script src="${basePath!}/js/jquery.min.js" type="text/javascript"></script>
    <script src="${basePath!}/layui/layui.js" charset="utf-8"></script>
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
    <div class="demoTable layui-form" lay-filter="demoTable">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label resetLabel">行业</label>
                <div class="layui-input-inline">
                    <select name="industry" lay-filter="industry" lay-verify="required">
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">商品分类</label>
                <div class="layui-input-inline">
                    <select name="commodityProductType" lay-filter="commodityProductType" lay-verify="required">
                        <option value="0">请选择</option>
                        <option value="1">产品</option>
                        <option value="2">服务</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <button class="layui-btn" data-type="search"><i class="layui-icon layui-icon-search"></i></button>
            </div>
            <div class="layui-inline">
                <button class="layui-btn" onclick="addNewCommitType()">添加大类</button>
            </div>
        </div>
    </div>
<#--表格:显示商品大类-->
    <table id="CommodityType" lay-filter="CommodityType"></table>
<#--商品大类的表单-->
    <form id="CommodityTypeForm" class="layui-form CommodityTypeForm layui-form-pane layui-personal" action=""
          lay-filter="CommodityTypeForm" hidden="true">
        <div class="layui-form-item" hidden>
            <label class="layui-form-label">商品大类ID</label>
            <div class="layui-input-block">
                <input type="text" name="commodityTypeID" id="commodityTypeID"<#--lay-verify="required"--> autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label xrequired">行业</label>
            <div class="layui-input-inline">
                <input name="commodityTypeIndustryAddShow" id="commodityTypeIndustryAddShow" readonly="readonly"
                       type="text"
                       autocomplete="off" placeholder="请输入行业" class="layui-input" style="padding-right: 80px;"
                       lay-verify="required">
                <input name="commodityTypeIndustry" id="commodityTypeIndustryAdd" hidden="true" type="text">
                <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachCommodityTypeIndustryAdd"><i
                        class="layui-icon layui-icon-search"></i></button>

            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label xrequired">大类名称</label>
            <div class="layui-input-block">
                <input type="text" name="commodityTypeName" lay-verify="required" autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label xrequired">商品分类</label>
            <div class="layui-input-block">
                <select name="commodityProductType" lay-filter="commodityProductType" lay-verify="required">
                    <option value="1">产品</option>
                    <option value="2">服务</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label xrequired">pos端显示</label>
            <div class="layui-input-block">
                <select name="isShowInPos" lay-filter="isShowInPos" lay-verify="required">
                    <option value="1">是</option>
                    <option value="0">否</option>
                </select>
            </div>
        </div>

    </form>
</div>
<#include "../../baseFtl/loadLinkData.ftl" />
<#--大类按钮-->
<script type="text/html" id="CommodityTypeDemo">
    <a class="layui-btn layui-btn-xs" lay-event="show">查看</a>
    <a class="layui-btn layui-btn-xs layui-btn-primary" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script>
    var dataIndustry, table, form;
    //数据显示,分页实现
    layui.use(['table', 'layer', 'jquery', 'form'], function () {
        table = layui.table;
        layer = layui.layer;
        var $ = layui.jquery;
        form = layui.form;

        //加载行业
        loadIndustry();

        table.render({
            elem: '#CommodityType'
            , url: dataHost + "/commodityType/selectCommodityTypeByCondition" //selectCommodityTypeList
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
                    "msg": res.responseStatusType.error.errorMsg, //解析提示文本
                    "count": res.result == null ? 0 : res.result.total, //解析数据长度
                    "data": res.result == null ? 0 : res.result.list //解析数据列表
                }
            }
            , cols: [[
                {type: 'checkbox', fixed: 'left', width: 40, hide: true}
                , {field: 'commodityTypeID', title: '序号', width: 75, sort: true, fixed: 'left'}
                , {field: 'commodityTypeName', title: '大类'}
                , {
                    field: 'commodityTypeIndustryID', title: '行业', templet: function (d) {
                        for (var p in dataIndustry) {
                            if (dataIndustry[p].industryID == d.commodityTypeIndustryID) {
                                return dataIndustry[p].industryName;
                            }
                        }
                        return "";
                    }, sort: true
                }
                , {
                    field: 'commodityProductType', title: '商品分类', templet: function (d) {
                        if (d.commodityProductType == 1) {
                            return "产品";
                        }
                        if (d.commodityProductType == 2) {
                            return "服务";
                        }
                    }, sort: true
                }
                , {
                    field: 'status', title: '状态', templet: function (d) {
                        if (d.status == 1) {
                            return "正常"
                        } else {
                            return "删除"
                        }
                    }
                }
                , {field: 'createOperator', title: '创建人'}
                , {field: 'createTime', title: '创建时间'}
                , {field: 'modifyOperator', title: '修改人'}
                , {field: 'dataChangeLastTime', title: '修改时间'}
                , {fixed: 'right', title: '操作', width: 180, align: 'center', toolbar: '#CommodityTypeDemo'}
            ]]
            , id: 'CommodityTypeReload'
        });


        /*------行业关联数据查看-添加/修改------*/
        $("#" + "serachCommodityTypeIndustryAdd").click(function () {
            var url = storeHost + "/manage/industry/selectList";
            var param = {};
            123
            loadLinkData(layer, layui, url, "industryID", "industryName", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "commodityTypeIndustryAddShow").val(data.industryName);
                $("#" + "commodityTypeIndustryAdd").val(data.industryID);
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


        //查看，编辑，删除
        table.on('tool(CommodityType)', function (obj) {
            var data = obj.data;
            if (obj.event === 'edit') {
                editCommodityType(data);
            } else if (obj.event === 'del') {
                layer.confirm('真的删除ID为' + data.commodityTypeID + '的大类么？', function (index) {
                    delCommodityType(data);
                    obj.del();
                });
            } else if (obj.event === 'show') {
                showCommodityType(data);
            }
        });

        //搜索
        var $ = layui.$, active = {
            search: function () {
                var commodityProductType = $(".demoTable select[name='commodityProductType'] option:selected").val(),
                        industry = $(".demoTable select[name='industry'] option:selected").val();
                var params = {
                    commodityProductType: null,
                    commodityTypeIndustryID: null
                };
                if (commodityProductType != null && commodityProductType != 0) {
                    params.commodityProductType = commodityProductType;
                }
                if (industry != null && industry != 0) {
                    params.commodityTypeIndustryID = industry;
                }
                table.reload('CommodityTypeReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    , where: params
                }, 'data');
            }
        };
        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    });

    function editCommodityType(data) {
        var b2 = layer.open({
            type: 1,
            title: '修改商品大类',
            content: $('#CommodityTypeForm'),
            closeBtn: 1,
            btn: ['提交', '取消'],
            yes: function (index, layero) {
                form.on('submit(formVerify)', function (data) {
                var url = dataHost + "/commodityType/updateCommodityType";
                //下拉框
                var commodityTypeID = layero.find("input[id='commodityTypeID']").val();
                var commodityTypeIndustryID = layero.find("input[id='commodityTypeIndustryAdd']").val();
                var commodityProductType = layero.find("select[name='commodityProductType']");
                commodityProductType = commodityProductType.find("option:selected").val();
                var params = {
                    commodityTypeID: commodityTypeID,
                    isShowInPos: layero.find("select[name='isShowInPos']").find("option:selected").val(),
                    commodityTypeIndustryID: commodityTypeIndustryID,
                    commodityTypeName: layero.find("input[name='commodityTypeName']").val(),
                    commodityProductType: commodityProductType,
                    modifyOperator: "${currentUser.trueName!}"
                };
                $.post(url, params, function (res) {
                    if (res.responseStatusType.message == "Success") {
                        layer.open({
                            title: '修改'
                            , content: '修改成功！'
                            , btn: ["关闭"]
                            , yes: function (index) {
                                layer.close(index); //如果设定了yes回调，需进行手工关闭
                                layer.close(b2);
                            }
                        });
                        //重新加载表格
                        table.reload("CommodityTypeReload");
                    } else {
                        layer.open({
                            title: '修改'
                            , content: '修改失败！' + res.responseStatusType.error.errorMsg
                            , btn: ["关闭"]
                        });
                    }
                })
                })
                // layer.close(); //如果设定了yes回调，需进行手工关闭
            },
            btn2: function () {
                layer.close(b2);
            },
            success: function (layero) {
                layero.addClass('layui-form');
                layero.find('.layui-layer-btn0').attr('lay-filter', 'formVerify').attr('lay-submit', '');
                //回显数据
                layero.find("input[name='commodityTypeID']").val(data.commodityTypeID);
                layero.find("input[id='commodityTypeIndustryAdd']").val(data.commodityTypeIndustryID);
                layero.find("input[id='commodityTypeIndustryAddShow']").val(data.commodityTypeIndustryName);

                layero.find("input[name='commodityTypeName']").val(data.commodityTypeName);
                var commodityProductType = layero.find("select[name='commodityProductType']");
                commodityProductType.find("option[value='" + data.commodityProductType + "']").attr("selected", true);
                var isShowInPos = layero.find("select[name='isShowInPos']");
                isShowInPos.find("option[value='" + data.isShowInPos + "']").attr("selected", true);
                form.render("select", "CommodityTypeForm");
            },
            area: ['600px', '326px'],
            // end: function () {
            //     window.location.reload();
            // }
        });
    }

    function delCommodityType(data) {
        //删除数据库数据
        var url = dataHost + "/commodityType/deleteCommodityTypeByID";
        var params = {
            commodityTypeId: data.commodityTypeID,
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
                table.reload("CommodityTypeReload");
            } else {
                layer.open({
                    title: '删除'
                    , content: '删除失败！' + res.responseStatusType.error.errorMsg
                    , btn: ["关闭"]
                });
            }
        })
    }

    function showCommodityType(data) {
        var b1 = layer.open({
            type: 1,
            title: '查看商品大类',
            content: $('#CommodityTypeForm'),
            closeBtn: 1,
            btn: ['确定'],
            yes: function () {
                layer.close(b1);
            },
            success: function (layero) {
                //回显数据
                layero.find("input[id='commodityTypeIndustryAdd']").val(data.commodityTypeIndustryID);
                layero.find("input[id='commodityTypeIndustryAddShow']").val(data.commodityTypeIndustryName);
                layero.find("input[name='commodityTypeName']").val(data.commodityTypeName);
                var commodityProductType = layero.find("select[name='commodityProductType']");
                commodityProductType.find("option[value='" + data.commodityProductType + "']").attr("selected", true);
                form.render("select", "CommodityTypeForm");
                if (data.status == 1) {
                    layero.find("input[name='status']").val("正常");
                } else {
                    layero.find("input[name='status']").val("删除");
                }
                layero.find("input[name='createOperator']").val(data.createOperator);
                layero.find("input[name='createTime']").val(data.createTime);
                layero.find("input[name='modifyOperator']").val(data.modifyOperator);
                layero.find("input[name='dataChangeLastTime']").val(data.dataChangeLastTime);
                //查看显示创建人和编辑人
                layero.find("input[name='status']").parent().parent().show();
                layero.find("input[name='createOperator']").parent().parent().show();
                layero.find("input[name='createTime']").parent().parent().show();
                layero.find("input[name='modifyOperator']").parent().parent().show();
                layero.find("input[name='dataChangeLastTime']").parent().parent().show();
            },
            area: ['600px', '500px'],
            // end: function () {
            //     window.location.reload();
            // }
        });
    }

    function addNewCommitType() {
        var a1 = layer.open({
            type: 1,
            title: '添加商品大类',
            content: $('#CommodityTypeForm'),
            closeBtn: 1,
            btn: ['提交', '取消'],
            yes: function (index, layero) {
                form.on('submit(formVerify)', function (data) {
                    var url = dataHost + "/commodityType/insertCommodityType";
                    //下拉框
                    var commodityTypeIndustryID = layero.find("input[id='commodityTypeIndustryAdd']").val();
                    var commodityProductType = layero.find("select[name='commodityProductType']");
                    commodityProductType = commodityProductType.find("option:selected").val();
                    var isShowInPos = layero.find("select[name='isShowInPos']");
                    isShowInPos = isShowInPos.find("option:selected").val();
                    var params = {
                        commodityTypeIndustryID: commodityTypeIndustryID,
                        commodityTypeName: layero.find("input[name='commodityTypeName']").val(),
                        isShowInPos: isShowInPos,
                        commodityProductType: commodityProductType,
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
                                    layer.close(a1);
                                }
                            });
                            //重新加载表格
                            table.reload("CommodityTypeReload");
                        } else {
                            layer.open({
                                title: '添加'
                                , content: '添加失败！' + res.responseStatusType.error.errorMsg
                                , btn: ["关闭"]
                            });
                        }
                    })
                });
            },
            btn2: function () {
                layer.close(a1);
            },
            success: function (layero) {
                layero.find("input[id='commodityTypeIndustryAddShow']").val("");
                layero.find("input[id='commodityTypeIndustryAdd']").val("");
                layero.find("input[name='commodityTypeName']").val("");

                var commodityProductType = layero.find("select[name='commodityProductType']");
                commodityProductType.find("option[value='']").attr("selected", true);
                layero.addClass('layui-form');
                layero.find('.layui-layer-btn0').attr('lay-filter', 'formVerify').attr('lay-submit', '');
                form.render("select", "CommodityTypeForm");
            },
            area: ['600px', '326px'],
            // end: function () {
            //     window.location.reload();
            // }

        });
    }

    function loadIndustry() {
        $.ajax({
            url: storeHost + "/manage/industry/selectListIndustryNoPage",
            // data: param,
            method: "POST",
            async: false,
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    dataIndustry = res.result;
                }
            }
        });
        $("#CommodityTypeForm select[name='commodityTypeIndustry']").val("");
        $(".demoTable select[name='industry']").val("");
        for (var p in dataIndustry) {
            var option = "<option value='" + dataIndustry[p].industryID + "'>" + dataIndustry[p].industryName + "</option>";
            $("#CommodityTypeForm select[name='commodityTypeIndustry']").append(option);
            $(".demoTable select[name='industry']").append(option);
        }
        form.render("select", "CommodityTypeForm");
        form.render("select", "demoTable");
    }
</script>
</body>
</html>