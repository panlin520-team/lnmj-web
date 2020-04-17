<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
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
    <script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.4&key=ad26780bfaabf0ca27ae6078e2e81682"></script>
    <script type="text/javascript" src="https://cache.amap.com/lbs/static/addToolbar.js"></script>
    <link rel="stylesheet" href="https://cache.amap.com/lbs/static/main1119.css" />
    <script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.15&key=39e67fa6d162e3cecd1ed71c2eb78e86&plugin=AMap.Autocomplete,AMap.PlaceSearch"></script>
    <#include "../baseFtl/pageAuth.ftl" />

    <style>
        .resetLabel {
            width: 56px;
        }

        label.xrequired:before {
            content: '* ';
            color: red;
        }
        .amap-sug-result{
            z-index: 99999999;!important;
        }


    </style>
</head>
<body>


<div class="layui-fluid">
    <div class="demoTable layui-form">
        <div class="layui-form-item">
            <div class="layui-inline">

                <div class="layui-input-block">
                    <label class="layui-form-label resetLabel">所属分类</label>
                    <div class="layui-input-inline">
                        <select id="storeCategoryIdSearch" name="storeCategoryId" lay-filter="storeCategoryId">
                        </select>
                    </div>
                    <label class="layui-form-label resetLabel">所属行业</label>
                    <div class="layui-input-inline">
                        <select id="industryIDSearch" name="industryID" lay-filter="industryID">
                        </select>
                    </div>

                    <label class="layui-form-label resetLabel">电话</label>
                    <div class="layui-input-inline">
                        <input class="layui-input" type="text" name="keyWordPhone" autocomplete="off"
                               placeholder="输入电话">
                    </div>
                    <label class="layui-form-label resetLabel">名字</label>
                    <div class="layui-input-inline">
                        <input class="layui-input" type="text" name="keyWordName" autocomplete="off" placeholder="输入名字">
                    </div>
                </div>

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
    <table id="store" lay-filter="demo"></table>

</div>


<script type="text/html" id="barDemo">
    <#--<a class="layui-btn layui-btn-xs" lay-event="enter">进入店铺</a>-->
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-xs" lay-event="updateStoreMap">修改门店位置</a>
    <#--<a class="layui-btn layui-btn-xs" lay-event="insertStock">生成仓库</a>
    <a class="layui-btn layui-btn-xs" lay-event="insertHeSuanFanWei">生成核算范围</a>
    <a class="layui-btn layui-btn-xs" lay-event="insertZhangBu">生成账簿</a>-->
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>


<#--↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓add↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓-->
<div id="addeditformdivid" hidden="" class="layui-fluid layui-form-pane layui-personal"
     style="margin: 0;padding-top: 10px;">
    <form class="layui-form" action="" id="addeditformid">
        <div class="layui-form-item" hidden="false">
            <label class="layui-form-label">店铺id</label>
            <div class="layui-input-block">
                <input type="text" name="storeId" lay-verify="<#--required-->" autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label xrequired">门店所属分类</label>
            <div class="layui-input-block" style="width:150px;" id="storeCategory">
                <input name="storeCategoryIdAddShow" id="storeCategoryIdAddShow" readonly="readonly" type="text"
                       autocomplete="off" placeholder="请输入门店所属分类" class="layui-input"
                       style="padding-right: 0px;width: 144px;height: 38px;padding-left: 10px;"
                       lay-verify="required">
                <input name="storeCategoryId" id="storeCategoryIdAdd" hidden="true" type="text">
                <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachstoreCategoryIdAdd"><i
                            class="layui-icon layui-icon-search"></i></button>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label xrequired">门店所属行业</label>
            <div class="layui-input-block" style="width:150px;">
                <input name="industryIDShowAdd" id="industryIDShowAdd" readonly="readonly" type="text"
                       autocomplete="off" placeholder="请输入行业" class="layui-input"
                       style="padding-right: 0px;width: 144px;height: 38px;padding-left: 10px;"
                       lay-verify="required">
                <input name="industryID" id="industryIDAdd" hidden="true" type="text">
                <button style="position: absolute;top: 0;right: 6px;cursor: pointer;" type="button" class="layui-btn"
                        id="serachindustryIDAdd"><i
                            class="layui-icon layui-icon-search"></i></button>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label xrequired">K3编号</label>
            <div class="layui-input-block">
                <input type="text" name="k3Number" lay-verify="required" autocomplete="off"
                       placeholder="请输入K3编号"
                       class="layui-input"><span style="color: red;">K3编号格式:例 100.001.001 </span>
            </div>
        </div>

        <#-- <div class="layui-form-item" id="subCompanySelect">
             <label class="layui-form-label xrequired">门店所属子公司</label>
             <div class="layui-input-inline" style="width:270px;">
                 &lt;#&ndash;<select name="subCompanyId" id="subCompanyIdAdd" lay-filter="subCompanyId"
                         lay-verify="required">
                 </select>&ndash;&gt;
                 <span name="subCompanyId" id="subCompanyIdAdd"></span>
             </div>
         </div>-->


        <div class="layui-form-item" hidden="hidden">
            <label class="layui-form-label">门店所属子公司</label>
            <div class="layui-input-block">
                <input type="text" name="subCompanyId" id="subCompanyIdAdd" autocomplete="off" placeholder="请输入店铺名称"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">门店所属子公司</label>
            <div class="layui-input-block">
                <input type="text" name="subCompanyIdParam" id="subCompanyIdAddParam" autocomplete="off"
                       placeholder="请输入店铺名称"
                       class="layui-input" disabled="disabled">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label xrequired">店铺名称</label>
            <div class="layui-input-block">
                <input type="text" name="name" lay-verify="required" autocomplete="off" placeholder="请输入店铺名称"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">店铺编号</label>
            <div class="layui-input-block">
                <input type="text" name="code" <#--lay-verify="required"--> autocomplete="off" placeholder="请输入店铺编号"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label xrequired">选择地区</label>
            <div class="layui-input-block">
                <div class="layui-inline">
                    <select name="provinceId" class="province" lay-filter="provinceId">
                    </select>
                </div>
                <div class="layui-inline">
                    <select name="cityId" class="city" lay-filter="cityId">
                    </select>
                </div>
                <div class="layui-inline">
                    <select name="countyId" class="county" lay-filter="countyId">
                    </select>
                </div>
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label xrequired">详细地址</label>
            <div class="layui-input-block">
                <input type="text" name="shopDetailedAddress" lay-verify="required" autocomplete="off"
                       placeholder="请输入详细地址"
                       class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label xrequired">联系电话</label>
            <div class="layui-input-block" style="width:370px;">
                <input type="text" name="phoneNumber" lay-verify="required" autocomplete="off" placeholder="请输入联系电话"
                       class="layui-input"> <span style="color: red;">电话格式:例 028-38221918 手机格式：例 18284521115</span>
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label xrequired">店铺营业时间</label>
            <div class="layui-input-block" style="width:150px;">
                <input name="shopBusinessTime" type="text" lay-verify="required" class="layui-input"
                       id="shopBusinessTimeAdd"
                       placeholder=" - ">
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
<#--↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑add↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑-->
<#--点击单行后的修改或查看表单-->
<form class="layui-form layui-form-pane layui-personal" id="editForm" action="" lay-filter="exampleEdit" method="post"
      hidden="true">

    <div class="layui-form-item" hidden="false">
        <label class="layui-form-label">店铺id</label>
        <div class="layui-input-block">
            <input type="text" name="storeId" lay-verify="required" autocomplete="off" placeholder=""
                   class="layui-input">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label xrequired">门店所属分类</label>
        <div class="layui-input-block" style="width:150px;">
            <input name="storeCategoryIdShowEdit" id="storeCategoryIdShowEdit" readonly="readonly" type="text"
                   autocomplete="off" placeholder="请输入门店所属分类" class="layui-input"
                   style="padding-right: 0px;width: 144px;height: 38px;padding-left: 10px;" lay-verify="required">
            <input name="storeCategoryId" id="storeCategoryIdEdit" hidden="true" type="text">
            <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachstoreCategoryIdEdit"><i
                        class="layui-icon layui-icon-search"></i></button>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label xrequired">门店所属行业</label>
        <div class="layui-input-block" style="width:150px;">
            <input name="industryIDShowEdit" id="industryIDShowEdit" readonly="readonly" type="text"
                   autocomplete="off" placeholder="请输入门店所属行业" class="layui-input"
                   style="padding-right: 0px;width: 144px;height: 38px;padding-left: 10px;" lay-verify="required">
            <input name="industryID" id="industryIDEdit" hidden="true" type="text">
            <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachindustryIDEdit"><i
                        class="layui-icon layui-icon-search"></i></button>

        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label xrequired">店铺名称</label>
        <div class="layui-input-block">
            <input type="text" name="name" lay-verify="required" autocomplete="off" placeholder="请输入店铺名称"
                   class="layui-input">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">店铺编号</label>
        <div class="layui-input-block">
            <input type="text" name="code" <#--lay-verify="required"--> autocomplete="off" placeholder="请输入店铺编号"
                   class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label xrequired">选择地区</label>
        <div class="layui-input-block">
            <div class="layui-inline">
                <select name="provinceId" class="province" lay-filter="provinceId">
                </select>
            </div>
            <div class="layui-inline">
                <select name="cityId" class="city" lay-filter="cityId">
                </select>
            </div>
            <div class="layui-inline">
                <select name="countyId" class="county" lay-filter="countyId">
                </select>
            </div>
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label xrequired">详细地址</label>
        <div class="layui-input-block">
            <input type="text" name="shopDetailedAddress" lay-verify="required" autocomplete="off" placeholder="请输入详细地址"
                   class="layui-input">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label xrequired">联系电话</label>
        <div class="layui-input-block" style="width:370px;">
            <input type="text" name="phoneNumber" lay-verify="required" autocomplete="off" placeholder="请输入联系电话"
                   class="layui-input"><span style="color: red;">电话格式:例 028-38221918 手机格式：例 18284521115</span>
        </div>

    </div>

    <div class="layui-form-item">
        <label class="layui-form-label xrequired">店铺营业时间</label>
        <div class="layui-input-block" style="width:150px;">
            <input name="shopBusinessTime" type="text" class="layui-input" id="shopBusinessTime" placeholder=" - ">
        </div>
    </div>
</form>

<form class="layui-form layui-form-pane layui-personal" id="map" action="" lay-filter="map" method="post"
      hidden="true">
    <div id="container"></div>


    <div id="myPageTop">
        <div class="input-card">
            <h4>左击获取经纬度：</h4>
            <div class="input-item">
                <input type="text" readonly="true" id="lnglat">
            </div>
        </div>



        <table>
            <tr>
                <td>
                    <label>请输入关键字：</label>
                </td>
            </tr>
            <tr>
                <td>
                    <input id="tipinput"/>
                </td>
            </tr>
        </table>
    </div>

</form>




<#include "../baseFtl/loadLinkData.ftl" />

<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    var catagorylist;

    //列表显示
    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#store'
            , url: storeHost + "/manage/store/selectStoreList"
            , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , page: true          //显示分页默认不显示
            , method: 'post'
            , id: "storeReload"
            , loading: true
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
                companyType: "${currentUser.companyType!}",
                companyId: "${currentUser.companyId!}"
            }
            , cols: [[
                {type: 'checkbox', fixed: 'left', width: 40}
                , {field: 'name', title: '店铺名称', sort: true, fixed: 'left'}
                , {field: 'shopDetailedAddress', title: '店铺详细地址'}
                , {field: 'phoneNumber', title: '联系电话'}
                , {field: 'code', title: '门店编号', width: 90}
                , {field: 'industryName', title: '所属行业', width: 90}
                , {field: 'subCompanyName', title: '所属子公司'}
                , {fixed: 'right', title: '操作', width: 400, align: 'center', toolbar: '#barDemo'}

            ]]
        });
    });

    //增删改查操作实现
    var layerid;//当前弹层id;这个id可以定义多个，主要的目的是为了在回调函数关闭弹层时使用的
    layui.use(['table', 'layer', 'jquery', 'form'], function () {
        var table = layui.table,
            layer = layui.layer,
            $ = layui.jquery,
            form = layui.form;
        // loadStoreCategoryForAdd(form);
        // loadStoreCategoryForEdit(form);
        // loadStoreIndustryIDForAdd(form);
        // loadStoreIndustryIDForEdit(form);
        if ("${currentUser.companyType!}" == "2") {
            loadSubCompanyAdd2(form);
        } else {
            loadSubCompanyAdd(form);
        }


        // loadStoreCategoryForSearch(form);
        // loadStoreIndustryIDForSearch(form);


        /*------门店所属分类关联数据添加------*/
        $("#" + "serachstoreCategoryIdAdd").click(function () {
            var url = storeHost + "/manage/store/storeCategoryList";
            var param = {};
            loadLinkData(layer, layui, url, "storeCategoryId", "storeCategoryName", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "storeCategoryIdAdd").val(data.storeCategoryId);
                $("#" + "storeCategoryIdAddShow").val(data.storeCategoryName);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {keyWordStoreCategoryName: wordSearch}
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

        /*------门店所属行业关联数据添加------*/
        $("#" + "serachindustryIDAdd").click(function () {
            var url = storeHost + "/manage/industry/selectList";
            var param = {};
            loadLinkData(layer, layui, url, "industryID", "industryName", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "industryIDAdd").val(data.industryID);
                $("#" + "industryIDShowAdd").val(data.industryName);
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

        /*------门店所属分类关联数据查看/修改------*/
        $("#" + "serachstoreCategoryIdEdit").click(function () {
            var url = storeHost + "/manage/store/storeCategoryList";
            var param = {};
            loadLinkData(layer, layui, url, "storeCategoryId", "storeCategoryName", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "storeCategoryIdEdit").val(data.storeCategoryId);
                $("#" + "storeCategoryIdShowEdit").val(data.storeCategoryName);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {keyWordStoreCategoryName: wordSearch}
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

        /*------门店所属行业关联数据查看/修改------*/
        $("#" + "serachindustryIDEdit").click(function () {
            var url = storeHost + "/manage/industry/selectList";
            var param = {};
            loadLinkData(layer, layui, url, "industryID", "industryName", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "industryIDEdit").val(data.industryID);
                $("#" + "industryIDShowEdit").val(data.industryName);
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


        //监听表格复选框选择
        table.on('checkbox(demo)', function (obj) {
        });
        //监听工具条
        table.on('tool(demo)', function (obj) {
            var data = obj.data;
            if (obj.event === 'detail') {
                //查询赋值
                query(form, data);
                /*监听省select*/
                form.on('select(provinceId)', function (data) {
                    cityChange(form, data.value, "", "")
                });
                /*监听市select*/
                form.on('select(cityId)', function (data) {
                    countyChange(form, data.value, "")
                });
                layerShow(form, data, table, $)

            } else if (obj.event === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    layerDelete(data, table, $);
                    obj.del();
                    layer.close(index);
                });
            } else if (obj.event === 'edit') {
                //查询赋值
                query(form, data);
                /*监听省select*/
                form.on('select(provinceId)', function (data) {
                    cityChange(form, data.value, "", "")
                });
                /*监听市select*/
                form.on('select(cityId)', function (data) {
                    countyChange(form, data.value, "")
                });
                layerShowAndEdit(form, data, table, $);
            } else if (obj.event === 'insertStock') {
                //查询此总公司是否有管理员
                layer.confirm('是否要生成仓库', function (index) {
                    insertStock(data, table, $);
                    layer.close(index);
                });
            } else if (obj.event === 'insertHeSuanFanWei') {
                //查询此总公司是否有管理员
                layer.confirm('是否要生成核算范围', function (index) {
                    insertHeSuanFanWei(data, table, $);
                    layer.close(index);
                });
            } else if (obj.event === 'insertZhangBu') {
                //查询此总公司是否有管理员
                layer.confirm('是否要生成账簿', function (index) {
                    insertZhangBu(data, table, $);
                    layer.close(index);
                });
            } else if (obj.event === 'updateStoreMap') {
                updateStoreMap(data, table, $);

            }
        });


        //监听添加提交
        form.on('submit(addeditsubmitfilter)', function (data) {
            //为了防止form中的id值被重置后置空,将编辑的id存放在label中
            $("#editid").val($("#editlabelid").html());
            $("#editlabelid").html("");
            console.log($('#addeditformid').serialize())
            var index = null;
            $.ajax({
                type: "POST",
                url: storeHost + "/manage/store/insertStore",
                data: $('#addeditformid').serialize() + "&createOperator=" + "${currentUser.trueName!}",
                async: true,
                beforeSend: function () {
                    index = layer.load(3, {
                        shade: [0.9, '#fff'] //0.1透明度的白色背景
                    });
                },
                error: function (request) {
                    layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
                    layer.close(index);    //返回数据关闭loading
                },
                success: function (data) {
                    layer.close(index);    //返回数据关闭loading
                    if (data.responseStatusType.message == 'Failure') {
                        layer.alert(data.responseStatusType.error.errorMsg);
                        layer.close(index);    //返回数据关闭loading
                    }
                    if (data.responseStatusType.message == 'Success') {
                        layer.open({
                            title: '添加'
                            , content: '添加成功！' + data.result
                            , btn: ["关闭"]
                            , yes: function (index) {
                                layer.close(index); //如果设定了yes回调，需进行手工关闭
                            }, end: function () {
                                layer.close(layerid);
                                $("#reset").click();//重置表单
                                table.reload("storeReload");
                            }
                        });
                    }
                }
            });
            return false;
        });


        var $ = layui.$, active = {
            search: function () {
                var keyWordName = $(".demoTable input[name='keyWordName']").val();
                var keyWordPhone = $(".demoTable input[name='keyWordPhone']").val();
                var storeCategoryId = $(".demoTable select[name='storeCategoryId'] option:selected").val();
                var industry = $(".demoTable select[name='industryID'] option:selected").val();
                table.render({
                    elem: '#store'
                    , url: storeHost + "/manage/store/selectStoreList"
                    , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    , page: true          //显示分页默认不显示
                    , method: 'post'
                    , request: {
                        pageName: 'pageNum', //页码的参数名称，默认：page
                        limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    }
                    , where: {
                        keyWordPhone: keyWordPhone,
                        keyWordName: keyWordName,
                        storeCategoryId: storeCategoryId,
                        industryID: industry,
                        companyType: "${currentUser.companyType!}",
                        companyId: "${currentUser.companyId!}"
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
                        , {field: 'name', title: '店铺名称', sort: true, fixed: 'left'}
                        , {field: 'shopDetailedAddress', title: '店铺详细地址'}
                        , {field: 'phoneNumber', title: '联系电话'}
                        , {field: 'code', title: '门店编号'}
                        , {field: 'subCompanyName', title: '所属子公司'}
                        , {fixed: 'right', title: '操作', align: 'center', toolbar: '#barDemo'}

                    ]]
                });
            }
            , add: function () {

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
        layerid = layer.open({//开启表单弹层
            // // skin: 'layui-layer-molv',
            area: '60%',
            type: 1,
            title: '新建店铺',
            content: $('#addeditformdivid'), //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
            success: function () {

                $("#subCompanyIdAddParam").val("${currentUser.companyName!}");
                $("#subCompanyIdAdd").val("${currentUser.companyId!}");

                var form = layui.form;
                var data = {"provinceId": "110000", "cityId": "110100", "countyId": "110101"}//默认北京
                //查询赋值
                query(form, data);
                /*监听省select*/
                form.on('select(provinceId)', function (data) {
                    cityChange(form, data.value, "", "")
                });
                /*监听市select*/
                form.on('select(cityId)', function (data) {
                    countyChange(form, data.value, "")
                });
            }
        });
    });


    //删除门店按钮事件
    function layerDelete(data, table, $) {
        //删除数据库数据
        var url = storeHost + "/manage/store/deleteStore";
        var data = {
            storeId: data.storeId,
            modifyOperator: "${currentUser.trueName!}"
        };
        $.post(url, data, function (res) {
            if (res.responseStatusType.message == "Success") {
                layer.open({
                    title: '删除'
                    , content: '删除成功！'
                });
                //同时删除仓库
                delStock(data.storeId, 3);
                //重新加载表格
                table.reload("storeReload");
            } else {
                layer.open({
                    title: '删除'
                    , content: '删除失败！'
                });
            }
        })
    }


    //修改按钮事件
    function layerShowAndEdit(form, data, table, $) {
        //页面弹框
        var a1 = layer.open({
            type: 1,
            title: '店铺详情',
            content: $('#editForm'),
            area: ['900px'],
            closeBtn: 1,
            btn: ['提交', '取消'],
            yes: function (index, layero) {
                form.on('submit(formVerify)', function (data) {
                    var url = storeHost + "/manage/store/updateStoreByCodeOrId";
                    //下拉框
                    var province = layero.find("select[name='provinceId']");
                    provinceId = province.find("option:selected").val();
                    var city = layero.find("select[name='cityId']");
                    cityId = city.find("option:selected").val();
                    var county = layero.find("select[name='countyId']");
                    countyId = county.find("option:selected").val();
                    var subCompany = layero.find("select[name='subCompanyId']");
                    subCompanyId = subCompany.find("option:selected").val();
                    // if (storeCategoryId == 0) {
                    //     alert("请选择店铺分类")
                    //     return
                    // }
                    // if (industryID == 0) {
                    //     alert("请选择店铺行业")
                    //     return
                    // }
                    // if (subCompanyId == 0) {
                    //     alert("请选择店铺所属子公司")
                    //     return
                    // }
                    var params = {
                        storeId: layero.find("input[name='storeId']").val(),
                        code: layero.find("input[name='code']").val(),
                        nursingType: layero.find("input[name='nursingType']:checked").val(),//护理类型
                        name: layero.find("input[name='name']").val(),//店铺名称
                        provinceId: provinceId, //省
                        cityId: cityId,//市
                        countyId: countyId,//区
                        shopDetailedAddress: layero.find("input[name='shopDetailedAddress']").val(),//详细地址
                        phoneNumber: layero.find("input[name='phoneNumber']").val(),//联系电话
                        shopBusinessTime: layero.find("input[name='shopBusinessTime']").val(),//营业时间
                        storeCategoryId: layero.find("input[name='storeCategoryId']").val(),//门店分类
                        industryID: layero.find("input[name='industryID']").val(),//行业
                        subCompanyId: subCompanyId,
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
                                    layer.close(a1);
                                }
                            });
                            //重新加载表格
                            table.reload("storeReload");
                        } else {
                            layer.msg(res.responseStatusType.error.errorMsg, {
                                time: 20000, //20s后自动关闭
                                btn: ['明白了']
                            });
                        }
                    })
                })
            },
            btn2: function () {
                layer.closeAll();
            },
            success: function (layero) {
                layero.addClass('layui-form');
                layero.find('.layui-layer-btn0').attr('lay-filter', 'formVerify').attr('lay-submit', '');
                form.render();
                //表单初始赋值
                form.val('exampleEdit', {
                    "storeId": data.storeId
                    , "name": data.name
                    , "code": data.code
                    , "shopDetailedAddress": data.shopDetailedAddress
                    , "phoneNumber": data.phoneNumber
                    , "shopBusinessTime": data.shopBusinessTime
                    , "nursingType": data.nursingType
                    , "storeCategoryIdShowEdit": data.storeCategoryName
                    , "industryIDShowEdit": data.industryName
                    , "subCompanyId": data.subCompanyId
                    , "storeCategoryId": data.storeCategoryId
                    , "industryID": data.industryID
                });
                layui.form.render();
            }, end: function () {
                window.location.reload();
            }

        });
    }


    //查看按钮事件
    function layerShow(form, data, table, $) {
        //页面弹框
        var a2 = layer.open({
            type: 1,
            title: '店铺详情',
            content: $('#editForm'),
            area: ['900px'],
            closeBtn: 1,
            btn: ['关闭'],
            btn2: function () {
                layer.close(a2)
            },
            success: function (layero) {
                layero.find(".layui-form-item").attr("hidden", false);
                //表单初始赋值
                form.val('exampleEdit', {
                    "storeId": data.storeId
                    , "name": data.name
                    , "code": data.code
                    , "shopDetailedAddress": data.shopDetailedAddress
                    , "phoneNumber": data.phoneNumber
                    , "shopBusinessTime": data.shopBusinessTime
                    , "nursingType": data.nursingType
                    , "storeCategoryIdShowEdit": data.storeCategoryName
                    , "industryIDShowEdit": data.industryName
                    , "subCompanyId": data.subCompanyId

                });
                layui.form.render();
            }, end: function () {
                window.location.reload();
            }

        });
    }


    // $("#storeCategory").click(function (){
    //     catagorylist = loadStoreCategoryForAdd(layui.form);
    //     // console.log(catagorylist)
    //     var options = $("#storeCategoryIdAdd").get(0).options;
    //     // console.log(options)
    //
    //     if (catagorylist.length == (options.length) - 1) {
    //         for (var i = 0; i < catagorylist.length; i++) {
    //             if (catagorylist[i].storeCategoryName != options[i + 1].innerHTML) {
    //                 loadStoreCategoryForAdd(layui.form);
    //             }
    //         }
    //     } else {
    //         loadStoreCategoryForAdd(layui.form);
    //     }
    //     $("#storeCategory").unbind("click");
    // });


    // $("#storeCategory").focus(function (){
    //     catagorylist = loadStoreCategoryForAdd(layui.form);
    //     var options = $("#storeCategoryIdAdd").get(0).options;
    //     if (catagorylist.length == (options.length) -1) {
    //         for (var i = 0; i < catagorylist.length; i++) {
    //             if (catagorylist[i].storeCategoryName != options[i+1].innerHTML) {
    //                 loadStoreCategoryForAdd(layui.form);
    //             }
    //         }
    //     }
    //     // $("#storeCategory").unbind("click");
    //     console.log(options);
    // });

    $("#storeCategoryIdAdd").next().children().eq(1).find("input").bind("onclick", function () {
        console.log(111);
    });

    //加载店铺分类信息-添加中初始化
    // function loadStoreCategoryForAdd(form) {
    //     //加载店铺列表信息
    //     var url = storeHost + "/manage/store/storeCategoryListNoPage";
    //     var data = {};
    //     $.post(url, data, function (result) {
    //         if (result.responseStatusType.message == "Success") {
    //             var list = result.result;    //返回的数据
    //             catagorylist = list;
    //             var server = document.getElementById("storeCategoryIdAdd"); //server为select定义的id
    //             server.innerHTML = "<option value='' selected='selected'>请选择</option>";
    //             for (var p in list) {
    //                 var option = document.createElement("option");  // 创建添加option属性
    //                 option.setAttribute("value", list[p].storeCategoryId); // 给option的value添加值
    //                 option.innerText = list[p].storeCategoryName;     // 打印option对应的纯文本
    //                 server.appendChild(option);           //给select添加option子标签
    //             }
    //             form.render();
    //         } else {
    //
    //         }
    //     })
    //     return catagorylist;
    // }

</script>


<script>

    //关于时间范围的js
    layui.use('laydate', function () {
        var laydate = layui.laydate;
        //时间范围--添加
        laydate.render({
            elem: '#shopBusinessTimeAdd'
            , type: 'time'
            , range: true
        });
        //时间范围--修改
        laydate.render({
            elem: '#shopBusinessTime'
            , type: 'time'
            , range: true
        });
    });


    //加载店铺分类信息-修改及查看中初始化
    // function loadStoreCategoryForEdit(form) {
    //     //加载店铺列表信息
    //     var url = storeHost + "/manage/store/storeCategoryListNoPage";
    //     var data = {};
    //     $.post(url, data, function (result) {
    //         if (result.responseStatusType.message == "Success") {
    //             var list = result.result;    //返回的数据
    //             var server = document.getElementById("storeCategoryIdEdit"); //server为select定义的id
    //             server.innerHTML = "<option value='' selected='selected'>请选择</option>";
    //             for (var p in list) {
    //                 var option = document.createElement("option");  // 创建添加option属性
    //                 option.setAttribute("value", list[p].storeCategoryId); // 给option的value添加值
    //                 option.innerText = list[p].storeCategoryName;     // 打印option对应的纯文本
    //                 server.appendChild(option);           //给select添加option子标签
    //             }
    //             form.render();
    //         } else {
    //
    //         }
    //     })
    // }

    //加载店铺分类信息-搜索
    // function loadStoreCategoryForSearch(form) {
    //     //加载店铺列表信息
    //     var url = storeHost + "/manage/store/storeCategoryListNoPage";
    //     var data = {};
    //     $.post(url, data, function (result) {
    //         if (result.responseStatusType.message == "Success") {
    //             var list = result.result;    //返回的数据
    //             var server = document.getElementById("storeCategoryIdSearch"); //server为select定义的id
    //             server.innerHTML = "<option value='' selected='selected'>请选择</option>";
    //             for (var p in list) {
    //                 var option = document.createElement("option");  // 创建添加option属性
    //                 option.setAttribute("value", list[p].storeCategoryId); // 给option的value添加值
    //                 option.innerText = list[p].storeCategoryName;     // 打印option对应的纯文本
    //                 server.appendChild(option);           //给select添加option子标签
    //             }
    //             form.render();
    //         } else {
    //
    //         }
    //     })
    // }


    //加载店铺行业信息-搜索中
    // function loadStoreIndustryIDForSearch(form) {
    //     //加载店铺列表信息
    //     var url = storeHost + "/manage/industry/selectListIndustryNoPage";
    //     var data = {};
    //     $.post(url, data, function (result) {
    //         if (result.responseStatusType.message == "Success") {
    //             var list = result.result;    //返回的数据
    //             var server = document.getElementById("industryIDSearch"); //server为select定义的id
    //             server.innerHTML = "<option value='' selected='selected'>请选择</option>";
    //             for (var p in list) {
    //                 var option = document.createElement("option");  // 创建添加option属性
    //                 option.setAttribute("value", list[p].industryID); // 给option的value添加值
    //                 option.innerText = list[p].industryName;     // 打印option对应的纯文本
    //                 server.appendChild(option);           //给select添加option子标签
    //             }
    //             form.render();
    //         } else {
    //
    //         }
    //     })
    // }

    //加载店铺行业信息-添加中初始化
    function loadStoreIndustryIDForAdd(form) {
        //加载店铺列表信息
        var url = storeHost + "/manage/industry/selectListIndustryNoPage";
        var data = {};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("industryIDAdd"); //server为select定义的id
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

    //加载店铺行业信息-修改及查看中初始化
    function loadStoreIndustryIDForEdit(form) {
        //加载店铺列表信息
        var url = storeHost + "/manage/industry/selectListIndustryNoPage";
        var data = {};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("industryIDEdit"); //server为select定义的id
                server.innerHTML = "<option value='' selected='true'>请选择</option>";
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

    //初始化子公司列表-添加
    function loadSubCompanyAdd(form) {
        //加载店铺列表信息
        var url = storeHost + "/manage/company/selectSubsidiary";
        var data = {companyId: "${currentUser.companyId!}", companyType: "${currentUser.companyType!}"};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("subCompanyIdAdd"); //server为select定义的id
                /*server.innerHTML = "<option value='' selected='selected'>请选择</option>";*/
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

    //初始化子公司列表-添加
    function loadSubCompanyAdd2(form) {
        var server = document.getElementById("subCompanyIdAdd"); //server为select定义的id
        server.innerHTML = "<option value='' selected='selected'>请选择</option>";
        var option = document.createElement("option");  // 创建添加option属性
        option.setAttribute("value", "${currentUser.companyId!}"); // 给option的value添加值
        option.innerText = "${currentUser.companyName!}";     // 打印option对应的纯文本
        server.appendChild(option);           //给select添加option子标签
        form.render();
    }

    //删除仓库
    function delStock(companyId, companyType) {
        //加载店铺列表信息
        var url = productHost + "/stock/delStockById";
        var data = {"companyId": companyId, "companyType": companyType};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var a1 = layer.open({
                    title: '删除',
                    content: "门店删除成功-仓库删除成功",
                    btn: ["确定", "关闭"],
                    yes: function (index) {
                        layer.close(index); //如果设定了yes回调，需进行手工关闭
                    },
                    btn2: function (index) {
                    }, end: function () {
                        layer.close(a1);
                    }
                });
            } else {

            }
        })
    }

    //生成仓库
    function insertStock(data, table, $) {
        var url = productHost + "/stock/addStock";
        var data = {
            companyId: data.storeId,
            companyType: 3,
            company: data.name,
            k3Number: data.k3Number,
            createOperator: "${currentUser.trueName!}"
        };
        var index = null
        $.ajax({
            type: "POST",
            url: url,
            data: data,
            async: true,
            beforeSend: function () {
                index = layer.load(3, {
                    shade: [0.9, '#fff'] //0.1透明度的白色背景
                });
            },
            error: function (request) {
                layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
            },
            success: function (data) {
                layer.close(index);    //返回数据关闭loading
                if (data.responseStatusType.message == 'Failure') {
                    layer.alert(data.responseStatusType.error.errorMsg);
                }
                if (data.responseStatusType.message == 'Success') {
                    layer.open({
                        title: '添加'
                        , content: data.result
                        , btn: ["关闭"]
                        , btn2: function (index) {
                            layer.close(index);
                        }, end: function () {
                            table.reload("storeReload");
                            layer.close(openId);
                        }
                    });
                    //重新加载表格
                    layui.form.render();
                }
            }
        });
    }

    //生成核算范围
    function insertHeSuanFanWei(data, table, $) {
        var url = storeHost + "/manage/store/insertHeSuanFanWei";
        var data = {
            subCompanyId: data.subCompanyId,
            name: data.name,
            storeId: data.storeId,
            k3Number: data.k3Number
        };
        var index = null
        $.ajax({
            type: "POST",
            url: url,
            data: data,
            async: true,
            beforeSend: function () {
                index = layer.load(3, {
                    shade: [0.9, '#fff'] //0.1透明度的白色背景
                });
            },
            error: function (request) {
                layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
            },
            success: function (data) {
                layer.close(index);    //返回数据关闭loading
                if (data.responseStatusType.message == 'Failure') {
                    layer.alert(data.responseStatusType.error.errorMsg);
                }
                if (data.responseStatusType.message == 'Success') {
                    layer.open({
                        title: '生成核算范围'
                        , content: data.result
                        , btn: ["关闭"]
                        , btn2: function (index) {
                            layer.close(index);
                        }, end: function () {
                            table.reload("storeReload");
                            layer.close(openId);
                        }
                    });
                    //重新加载表格
                    layui.form.render();
                }
            }
        });
    }

    //生成账簿
    function insertZhangBu(data, table, $) {
        var url = storeHost + "/manage/store/insertZhangBu";
        var data = {
            companyId: data.storeId,
            companyType: "3"
        };
        var index = null
        $.ajax({
            type: "POST",
            url: url,
            data: data,
            async: true,
            beforeSend: function () {
                index = layer.load(3, {
                    shade: [0.9, '#fff'] //0.1透明度的白色背景
                });
            },
            error: function (request) {
                layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
            },
            success: function (data) {
                layer.close(index);    //返回数据关闭loading
                if (data.responseStatusType.message == 'Failure') {
                    layer.alert(data.responseStatusType.error.errorMsg);
                }
                if (data.responseStatusType.message == 'Success') {
                    layer.open({
                        title: '生成核算范围'
                        , content: data.result
                        , btn: ["关闭"]
                        , btn2: function (index) {
                            layer.close(index);
                        }, end: function () {
                            table.reload("storeReload");
                            layer.close(openId);
                        }
                    });
                    //重新加载表格
                    layui.form.render();
                }
            }
        });
    }

    //生成门店地图坐标
    function updateStoreMap(data, table, $) {
        var longitude ="";
        var latitude ="";
        //页面弹框
        var a2 = layer.open({
            type: 1,
            title: '店铺地图',
            content: $('#map'),
            area: ['1257px','560px'],
            closeBtn: 1,
            btn: ['确认','关闭'],
            yes: function (index, layero) {
                if (longitude == "" || latitude == "") {
                    layer.msg("请先选取地图位置")
                    return false
                }
                var url = storeHost + "/manage/store/updateStoreLatById";
                var params = {"storeId":data.storeId,"gaodeLongitude":longitude,"gaodeLatitude":latitude};
                $.post(url, params, function (res) {
                    if (res.responseStatusType.message == "Success") {
                        layer.msg("修改成功")
                        table.reload("storeReload");
                    } else {
                        layer.msg(res.responseStatusType.error.errorMsg, {
                            time: 20000, //20s后自动关闭
                            btn: ['明白了']
                        });
                    }
                })
            },
            btn2: function () {
                layer.close(a2)
            },
            success: function (layero) {
                //地图加载
                var map = new AMap.Map("container", {
                    resizeEnable: true
                });
                //为地图注册click事件获取鼠标点击出的经纬度坐标
                map.on('click', function(e) {
                    longitude =e.lnglat.getLng();
                    latitude = e.lnglat.getLat();
                    document.getElementById("lnglat").value = e.lnglat.getLng() + ',' + e.lnglat.getLat()
                });
                //输入提示
                var autoOptions = {
                    input: "tipinput"
                };
                var auto = new AMap.Autocomplete(autoOptions);
                var placeSearch = new AMap.PlaceSearch({
                    map: map
                });  //构造地点查询类
                AMap.event.addListener(auto, "select", select);//注册监听，当选中某条记录时会触发
                function select(e) {
                    placeSearch.setCity(e.poi.adcode);
                    placeSearch.search(e.poi.name);  //关键字查询查询
                }

            }
        });
    }

</script>
</body>
</html>