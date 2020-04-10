<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>商品分类</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${basePath!}/layui/css/layui.css"  media="all">
    <link rel="stylesheet" href="${basePath!}/css/index.css" media="all"/>
    <script src="${basePath!}/layui/layui.js" charset="utf-8"></script>
    <script src="${basePath!}/js/jquery.min.js" type="text/javascript"></script>
    <script src="${basePath!}/js/Sortable.js" type="text/javascript"></script>
    <#--<script src="${basePath!}/layui/extend/treeGrid.js" type="text/javascript"></script>-->
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
    <div style="height: 100%;" id="bodyForm" class="layui-form bodyForm" lay-filter="bodyForm">
        <div class=" layui-form-item">
            <div class="dHead layui-btn-group layui-inline" style="margin-left: 2px">
            <#--<a class="layui-btn layui-btn-primary layui-btn-xs layui-btn-xstree"  onclick="getCheckData();">获取选中行数据</a>-->
            <#--<a class="layui-btn layui-btn-primary layui-btn-xs layui-btn-xstree"  onclick="getCheckLength();">获取选中数目</a>-->
            <#--<a class="layui-btn layui-btn-primary layui-btn-xs layui-btn-xstree"  onclick="print();">打印缓存对象</a>-->
                <a class="layui-btn layui-btn-xstree"  onclick="exportAll();">导出excel</a>
                <a class="layui-btn layui-btn-xstree " title="刷新当前页" href="javascript:void(0);"
                   onclick="layer.load(1);window.location.reload(true);"><i class="layui-icon"></i>刷新</a>
                <a class="layui-btn layui-btn-xstree"  onclick="openAll();">展开或收起</a>
            </div>
            <div class="layui-inline ">
                <div class="layui-input-inline">
                    <input class="layui-input" type="text" name="keyWord" autocomplete="off" placeholder="输入关键词">
                </div>
            </div>
            <div class="layui-inline">
                <button class="layui-btn" onclick="search()" ><i class="layui-icon layui-icon-search"></i></button>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline ">
                <label class="layui-form-label resetLabel" style="width: auto">商品类型</label>
                <div class="layui-input-inline">
                    <select name="type" lay-filter="type" lay-verify="required">
                        <option value="">请选择</option>
                        <option value="1">产品</option>
                        <option value="2">服务</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label" style="width: auto">商品分类类别</label>
                <div class="layui-input-inline">
                    <select name="productTypeKind" lay-filter="productTypeKind" lay-verify="required">
                        <option value="">请选择</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <button class="layui-btn" onclick="addNewProductType()" >添加商品分类</button>
            </div>
        </div>
        <div class="dBody layui-form-item" style="margin-: 10px">
            <#-- 树形组件：显示商品分类 -->
            <table class="layui-hidden" id="productType" lay-filter="productType"></table>
        </div>
    </div>
</div>

<#--点击查看，添加，编辑后的表单 layui-form -->
<form id="editForm" class="layui-form editForm layui-form-pane layui-personal" action="" lay-filter="editForm" method="post" hidden="true">
    <div class="layui-form-item" hidden="hidden">
        <label class="layui-form-label">ID</label>
        <div class="layui-input-inline">
            <input type="text" name="productTypeId" lay-verify="required" autocomplete="off" placeholder="请输入商品分类ID" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired">分类名称</label>
        <div class="layui-input-inline">
            <input type="text" name="productTypeName" lay-verify="required" autocomplete="off" placeholder="请输入分类名称" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired">商品种类</label>
        <div class="layui-input-inline">
            <select name="productKind" lay-filter="productKind">
                <option value="">请选择</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired">排序(A-Z)</label>
        <div class="layui-input-inline">
            <input type="text" name="productTypeOrder" lay-verify="required" autocomplete="off" placeholder="请输入排序" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired">显示</label>
        <div class="layui-input-inline">
            <select name="productTypeDisplay" lay-filter="productTypeDisplay">
                <option value="">请选择</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired">分类类别 </label>
        <div class="layui-input-inline">
            <select name="productTypeDistinguish" lay-filter="productTypeDistinguish">
                <option value="">请选择</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商品分类图标</label>
        <div class="layui-input-block">
            <button type="button" class="layui-btn" id="productTypeImage">
                <i class="layui-icon">&#xe67c;</i>请选择图片
            </button>
            <div class="layui-upload-list">
                <img class="layui-upload-img" id="upload"  style='width:160px;height: 80px'>
            </div>
            <#--<input type="image" name="productTypeImage" lay-verify="required" autocomplete="off" placeholder="请选择图片" class="layui-input">-->
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired" style="width: 150px;">积分比例(服务商)</label>
        <div class="layui-input-inline">
            <input type="text" name="integralratioService" lay-verify="required" autocomplete="off" placeholder="请输入" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired" style="width: 150px;">积分比例(联盟商)</label>
        <div class="layui-input-inline">
            <input type="text" name="integralratioUnion" lay-verify="required" autocomplete="off" placeholder="请输入" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired">积分比例VIP1</label>
        <div class="layui-input-inline">
            <input type="text" name="retailpriceVIP1" lay-verify="required" autocomplete="off" placeholder="请输入" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired">积分比例VIP2</label>
        <div class="layui-input-inline">
            <input type="text" name="retailpriceVIP2" lay-verify="required" autocomplete="off" placeholder="请输入" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired">积分比例VIP3</label>
        <div class="layui-input-inline">
            <input type="text" name="retailpriceVIP3" lay-verify="required" autocomplete="off" placeholder="请输入" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired">积分比例VIP4</label>
        <div class="layui-input-inline">
            <input type="text" name="retailpriceVIP4" lay-verify="required" autocomplete="off" placeholder="请输入" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired">积分比例VIP5</label>
        <div class="layui-input-inline">
            <input type="text" name="retailpriceVIP5" lay-verify="required" autocomplete="off" placeholder="请输入" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired">商品类型</label>
        <div class="layui-input-inline">
            <select name="productClassify" lay-filter="productClassify">
                <option value="1">产品</option>
                <option value="2">服务</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item" hidden="hidden">
        <label class="layui-form-label">状态</label>
        <div class="layui-input-inline">
            <input type="text" name="status" lay-verify="required" autocomplete="off" placeholder="1" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">创建人</label>
        <div class="layui-input-inline">
            <input type="text" name="createOperator" lay-verify="required" autocomplete="off" placeholder="11" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" hidden="hidden">
        <label class="layui-form-label">创建时间</label>
        <div class="layui-input-inline">
            <input type="text" name="createTime" lay-verify="required" autocomplete="off" placeholder="2019-04-26 15:30:43" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">修改人</label>
        <div class="layui-input-inline">
            <input type="text" name="modifyOperator" lay-verify="required" autocomplete="off" placeholder="11" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" hidden="hidden">
        <label class="layui-form-label">更新时间</label>
        <div class="layui-input-inline">
            <input type="text" name="dataChangeLastTime" lay-verify="required" autocomplete="off" placeholder="2019-04-26 15:30:43" class="layui-input">
        </div>
    </div>
</form>
<form id="showParent" class="layui-form layui-form-pane layui-personal" action="" lay-filter="showParent" method="post" hidden="true">
    <div class="layui-form-item">
        <label class="layui-form-label">ID</label>
        <div class="layui-input-block">
            <input type="text" name="ProductTypeId" lay-verify="required" autocomplete="off" placeholder="请输入商品分类ID" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">分类名称</label>
        <div class="layui-input-block">
            <input type="text" name="ProductTypeName" lay-verify="required" autocomplete="off" placeholder="请输入分类名称" class="layui-input">
        </div>
    </div>
</form>

<script type="text/html" id="display">
    {{#  if(d.ProductTypeDisplayId == 1){ }}
    <#--显示-->
    显示
    {{#  }else if(d.ProductTypeDisplayId == 2){ }}
    <#--不显示-->
    不显示
    {{#  }else if(d.ProductTypeDisplayId == 3){ }}
    <#--分类显示-->
    分类显示
    {{#  }else if(d.ProductTypeDisplayId == 4){ }}
    <#--支付提醒-->
    首页显示
    {{#  } }}
</script>

<script>
    //树形表格显示
    var tree1 = null, treeGrid = null,tableId = 'productType',layer = null
        ,upload = null,productTypeImage = null,multipartFile = null
        ,sortable = null, treeData = null,form = null;
    layui.config({
        base: '${basePath!}/layui/extend/'
    }).extend({
        treeGrid:'treeGrid'
    }).use(['jquery','treeGrid','layer','upload','form'], function() {
        var  $ = layui.jquery;
        upload = layui.upload;
        treeGrid = layui.treeGrid; //很重要
        layer = layui.layer;
        form = layui.form;

        tree1 = treeGrid.render({
                id: tableId
                , elem: '#' + tableId
                //, width: '100%'       //宽度
                , height: '100%'      //长度
                , heightRemove:[".dHead",10]
                , idField: 'ProductTypeId'
                // , isPage: true
                , loading:true
                <#--, url: "${basePath!}/treeData.json"-->
                ,url: productHost+"/manage/productType/selectProductType"
                , method: 'post'
                , treeId: 'ProductTypeId'//树形id字段名称
                , treeUpId: 'pId'//树形父id字段名称
                , treeShowName: 'ProductTypeName'//以树形式显示的字段
                // ,request: {
                //     pageName: 'pageNum',
                //     limitName: 'pageSize'
                // }
                // ,pagination: true
                , cols: [[
                    {type: 'checkbox', fixed: 'left', /*width: 60,*/ flex:5,  align: 'center'}
                    // ,{field:'ProductTypeId', title: 'ID', /*width:100,*/ flex:8, sort:true, align: 'left'}
                    ,{field:'ProductTypeName', /*width:250,*/ flex:21, title: '分类名称', align: 'left' /*,edit:'text'*/}
                    ,{field:'ProductType', /*width:150,*/ flex:13, title: '分类类别', align: 'left'}
                    ,{field: 'imageUrl', title: '分类图标', /*width: 150 ,*/ flex:13, align: 'center', templet: function (d) {
                            return d.imageUrl == "" || d.imageUrl == null ?
                                "<div class='imgs'><img src='/noImg.png' style='width:60px;height: 30px'></div>" :
                                "<div class='imgs'><img src=http://" + d.imageUrl + " style='width:60px;height: 30px'></div>";
                        }
                    }
                    // ,{field:'pId', title: '父类ID', /*width:100,*/ flex:8, sort:true, align: 'center'}
                    ,{field:'ProductTypeDisplayId', title: '显示',/* width:100,*/ align: 'left',templet:"#display" }
                    ,{/*width: 250,*/ flex:21,title: '操作', align: 'left', fixed: 'right' /*toolbar: '#barDemo'*/
                        , templet: function (d) {
                            var html = '';
                            if(d.pId == 0 ){     //一级父类只显示查看
                                html += '<a class="layui-btn layui-btn-xs" lay-event="show" title="查看详情"><i class="layui-icon">&#xe602</i></a>';
                                return html;
                            }
                            html += '<a class="layui-btn layui-btn-xs" lay-event="show" title="查看详情"><i class="layui-icon">&#xe602</i></a>';
                            html += '<a class="layui-btn layui-btn-xs" lay-event="add"><i class="layui-icon">&#xe654;</i></a>';
                            html += '<a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit"><i class="layui-icon">&#xe642;</i></a>';
                            html += '<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon">&#xe640;</i></a>';
                            html += '<a class="layui-btn layui-btn-warm layui-btn-xs drop" lay-event="drop" title="单击拖拽，开启排序功能"> 拖拽 ↑↓ </a>';
                            return html;
                        }
                    }
                ]]
                ,parseData:function (res) { //数据加载后回调
                    var result = [
                        {"ProductTypeId":"1", "pId":0,"imageUrl":"",  "ProductTypeName":"产品","ProductType":"","ProductTypeDisplayId":"","ProductTypeData":"","lay_icon_open":"/images/1_open.png","lay_icon_close":"/images/1_close.png"}
                        ,{"ProductTypeId":"2", "pId":0,"imageUrl":"",  "ProductTypeName":"服务","ProductType":"","ProductTypeDisplayId":"","ProductTypeData":"","lay_icon_open":"/images/1_open.png","lay_icon_close":"/images/1_close.png"}
                    ];
                    if(res.result != null){
                        //获取res的数据
                        var site =  res.result.productTypeListSite.productTypeListSite;
                        var kind =  res.result.productTypeListKind.productTypeListKind;
                        var division =  res.result.productTypeListDivision.productTypeListDivision;
                        var effect =  [];
                        var category =  [];
                        var brand =  [];
                        var data = res.result;
                        for(var prop in data){
                            //动态属性遍历
                            var effectT = data[prop].productTypeListEffect
                                ,categoryT = data[prop].productTypeListCategory
                                ,brandT = data[prop].productTypeListBrand;
                            if(effectT != null && effectT.length != 0 ){
                                for(var i=0;i<effectT.length;i++){
                                    effect.push(effectT[i]);
                                }
                            }
                            if(categoryT != null && categoryT.length != 0){
                                for(var i=0;i<categoryT.length;i++){
                                    category.push(categoryT[i]);
                                }
                            }
                            if(brandT != null && brandT.length != 0){
                                for(var i=0;i<brandT.length;i++){
                                    brand.push(brandT[i]);
                                }
                            }
                        }
                        //处理site
                        for(var i=0;i<site.length;i++){
                            var json = {
                            lay_icon_open:"/images/1_open.png"
                            ,lay_icon_close:"/images/1_close.png"
                            };
                            json.ProductTypeId = "s_"+site[i].productTypeId;
                            json.ProductTypeName = site[i].productTypeName;
                            json.imageUrl = site[i].imageUrl;
                            if(site[i].productClassifyId == 1){
                                json.pId = "1";   //产品
                            }
                            json.ProductType = "商品产地";
                            json.ProductTypeDisplayId = site[i].productTypeDisplayId;
                            json.ProductTypeData = site[i];
                            result.push(json);
                        }
                        //处理kind
                        for(var i=0;i<kind.length;i++){
                            var json = {
                                lay_icon_open:"/images/1_open.png"
                                ,lay_icon_close:"/images/1_close.png"
                            };
                            json.ProductTypeId = "k_"+kind[i].productTypeId;
                            json.ProductTypeName = kind[i].productTypeName;
                            json.imageUrl = kind[i].imageUrl;
                            if(kind[i].productClassifyId == 1){
                                json.pId = "1";   //产品
                            }else if(kind[i].productClassifyId == 2){
                                json.pId = "2";   //服务
                            }
                            json.ProductType = "商品种类";
                            json.ProductTypeDisplayId = kind[i].productTypeDisplayId;
                            json.ProductTypeData = kind[i];
                            result.push(json);
                        }
                        //处理division
                        for(var i=0;i<division.length;i++){
                            var json = {
                                lay_icon_open:"/images/1_open.png"
                                ,lay_icon_close:"/images/1_close.png"
                            };
                            json.ProductTypeId = "d_"+division[i].productTypeId;
                            json.ProductTypeName = division[i].productTypeName;
                            json.imageUrl = division[i].imageUrl;
                            if(division[i].productClassifyId == 1){
                                json.pId = "1";   //产品
                            }else if(division[i].productClassifyId == 2){
                                json.pId = "2";   //服务
                            }
                            json.ProductType = "商品专区";
                            json.ProductTypeDisplayId = division[i].productTypeDisplayId;
                            json.ProductTypeData = division[i];
                            result.push(json);
                        }
                        //处理effect
                        for(var i=0;i<effect.length;i++){
                            var json = {
                                lay_icon_open:"/images/1_open.png"
                                ,lay_icon_close:"/images/1_close.png"
                            };
                            json.ProductTypeId = "e_"+effect[i].productTypeId;
                            json.ProductTypeName = effect[i].productTypeName;
                            json.imageUrl = effect[i].imageUrl;
                            json.pId = "k_"+effect[i].productKindId;
                            json.ProductType = "商品功效";
                            json.ProductTypeDisplayId = effect[i].productTypeDisplayId;
                            json.ProductTypeData = effect[i];
                            result.push(json);
                        }
                        //处理category
                        for(var i=0;i<category.length;i++){
                            var json = {
                                lay_icon_open:"/images/1_open.png"
                                ,lay_icon_close:"/images/1_close.png"
                            };
                            json.ProductTypeId = "c_"+category[i].productTypeId;
                            json.ProductTypeName = category[i].productTypeName;
                            json.imageUrl = category[i].imageUrl;
                            json.pId = "k_"+category[i].productKindId;
                            json.ProductType = "商品品类";
                            json.ProductTypeDisplayId =category[i].productTypeDisplayId;
                            json.ProductTypeData = category[i];
                            result.push(json);
                        }
                        //处理brand
                        for(var i=0;i<brand.length;i++){
                            var json = {
                                lay_icon_open:"/images/1_open.png"
                                ,lay_icon_close:"/images/1_close.png"
                            };
                            json.ProductTypeId = "b_"+brand[i].productTypeId;
                            json.ProductTypeName = brand[i].productTypeName;
                            json.imageUrl = brand[i].imageUrl;
                            json.pId = "k_"+brand[i].productKindId;
                            json.ProductType = "商品品牌";
                            json.ProductTypeDisplayId = brand[i].productTypeDisplayId;
                            json.ProductTypeData = brand[i];
                            result.push(json);
                        }
                    }
                    treeData = result;
                    return {
                        "msg": res.responseStatusType.error.errorMsg,
                        "code": 0,
                        "data": result,
                        "count": result==null?2:result.length,
                        "is": true,
                        "tip": "操作成功！"
                    }
                }
                ,done: function (res) {
                    // $('.imgs').prev().remove();
                    $('.imgs').prev().hide();
                    $(".layui-table-main table tbody").attr("id","productTypeTbody");
                    var data = res.data;
                    for(var i=0;i<res.count;i++){
                        if(data[i].pId == 0 ){    //不能移动的行
                            $("#productTypeTbody tr:nth-child("+(i+1)+")").attr("class","filtered");
                        }
                    }
                }
                // ,onClickRow:function (index, o) {
                //     console.log(index,o,"单击！");
                //     msg("单击！,按F12，在控制台查看详细参数！");
                // }
                // ,onCheck:function (obj,checked,isAll) {//复选事件
                //     console.log(obj,checked,isAll,"复选");
                //     msg("复选,按F12，在控制台查看详细参数！");
                // }
            });

        treeGrid.on('tool(' + tableId + ')', function (obj) {
            if (obj.event === 'del') {  //删除行
                del(obj);
            } else if (obj.event === "add") {   //添加行
                add(obj);
            } else if (obj.event === "edit") {  //编辑行
                edit(obj);
            } else if(obj.event === "show"){    //查看行
                show(obj);
            } else if(obj.event === "drop"){    //拖拽行
                drop();
            }
        });
        //查询商品分类类别
        selectProductTypeKind();
        form.on('select(type)', function (data) {
            $("select[name='productTypeKind']").html("<option value='' checked='true'>请选择</option>");
            if(data.value == 1){ //产品
                for(var p in dataPk){
                    var option = "<option value='"+p+"'>"+dataPk[p]+"</option>";
                    $("select[name='productTypeKind']").append(option);
                }
            }
            if(data.value == 2){ //服务
                for(var p in dataPk){
                    if(dataPk[p] != "商品产地"){
                        var option = "<option value='"+p+"'>"+dataPk[p]+"</option>";
                        $("select[name='productTypeKind']").append(option);
                    }
                }
            }
            form.render("select","bodyForm");
        });
    });
    //查询商品分类类别
    var dataPk=[];
    function selectProductTypeKind() {
        var url = productHost + "/manage/productType/selectProductTypeKind";
        $.ajax({
            url: url,
            method: "POST",
            async: false,
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    dataPk = res.result;
                }
            }
        });
    }

    function edit(obj) {
        var data = obj.data,result = obj.data.ProductTypeData;
        //页面弹框
        var a2 = layer.open({
            type: 1,
            title: '编辑商品分类',
            content: $('#editForm'),
            closeBtn: 1,
            btn: ['提交', '取消'],
            yes: function(index,layero){
                //提交到数据库
                var productKindId = layero.find("select[name='productKind']");
                productKindId = productKindId.find("option:selected").val();
                productKindId = parseInt(productKindId);
                var productTypeDisplayId = layero.find("select[name='productTypeDisplay']");
                productTypeDisplayId = productTypeDisplayId.find("option:selected").val();
                productTypeDisplayId = parseInt(productTypeDisplayId);
                var productTypeDistinguishId = layero.find("select[name='productTypeDistinguish']");
                productTypeDistinguishId = productTypeDistinguishId.find("option:selected").val();
                productTypeDistinguishId = parseInt(productTypeDistinguishId);
                var params= new FormData();
                params.append("productTypeId",layero.find("input[name='productTypeId']").val());
                params.append("productTypeName",layero.find("input[name='productTypeName']").val());
                params.append("productKindId",productKindId);
                params.append("productTypeOrder",layero.find("input[name='productTypeOrder']").val());
                params.append("productTypeDisplayId",productTypeDisplayId);
                params.append("productClassifyId",result.productClassifyId);
                params.append("imageType",result.imageType);
                if(multipartFile!=null){
                    params.append("multipartFile",multipartFile);
                }
                params.append("productTypeDistinguishId",productTypeDistinguishId);
                // params.append("createOperator",layero.find("input[name='createOperator']").val());
                params.append("modifyOperator","${currentUser.trueName!}");

                if(result.productTypeDistinguishId != 5 ){   //品牌，品类，功效，种类
                    params.append("integralratioService",layero.find("input[name='integralratioService']").val());
                    params.append("integralratioUnion",layero.find("input[name='integralratioUnion']").val());
                    params.append("retailpriceVIP1",layero.find("input[name='retailpriceVIP1']").val());
                    params.append("retailpriceVIP2",layero.find("input[name='retailpriceVIP2']").val());
                    params.append("retailpriceVIP3",layero.find("input[name='retailpriceVIP3']").val());
                    params.append("retailpriceVIP4",layero.find("input[name='retailpriceVIP4']").val());
                    params.append("retailpriceVIP5",layero.find("input[name='retailpriceVIP5']").val());
                }else{  //产地
                    params.append("integralratioService",0);
                    params.append("integralratioUnion",0);
                    params.append("retailpriceVIP1",0);
                    params.append("retailpriceVIP2",0);
                    params.append("retailpriceVIP3",0);
                    params.append("retailpriceVIP4",0);
                    params.append("retailpriceVIP5",0);
                }
                var url = productHost+"/manage/productType/updateProductType";
                $.ajax({
                    url: url
                    ,type:"POST"
                    ,data: params
                    ,dataType: "json"   //服务器传回的数据类型
                    ,processData: false
                    // ,contentType:"multipart/form-data"
                    ,contentType: false
                    ,success: function (res){
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
                            // tree1.reload(tableId);
                        } else {
                            layer.open({
                                title: '编辑'
                                , content: '编辑失败！'+res.responseStatusType.error.errorMsg
                                , btn: ["关闭"]
                            });
                        }
                    }
                });
                // layer.close(index);
            },
            btn2: function(){
                layer.closeAll();
            },
            success: function(layero){
                /* 回显 */
                //图片
                showImage();//加载图片
                var imageUrl = "http://"+result.imageUrl;
                layero.find("#upload").attr("src",imageUrl);
                layero.find("#upload").attr("onclick","window.open('"+imageUrl+"')"); //点击图片打开图片
                var productClassifyId = result.productClassifyId + "";
                if(productClassifyId == null || productClassifyId == ""){
                    //获取当前节点的父节点
                    var uObj = treeGrid.treeFindUpData(tableId,data);
                    productClassifyId = uObj.pId;
                }
                //下拉框
                allProductKind(result.productKindId,productClassifyId);//将kind遍历出来并选中
                allProductTypeDisplay(result.productTypeDisplayId);//将display遍历出来并选中
                var productTypeDistinguish = layero.find("select[name='productTypeDistinguish']");
                for(var p in dataPk){
                    var option = "<option value='"+p+"'>"+dataPk[p]+"</option>";
                    productTypeDistinguish.append(option);
                }
                productTypeDistinguish.find("option[value='"+result.productTypeDistinguishId+"']").attr("selected",true);
                //遍历选中productTypeDistinguish
                /*var productTypeDistinguish = "";
                $(".editForm select[name='productTypeDistinguish']").children("option").each(function () {
                    if ($(this).val() == result.productTypeDistinguishId){
                        $(this).attr("selected", "selected");
                        productTypeDistinguish = $(this).text();
                    } else {
                        if ($(this).attr("selected") == "selected"){
                            $(this).removeAttr("selected");
                        }
                    }
                });
                $(".editForm select[name='productTypeDistinguish']").siblings("div[class='layui-unselect layui-form-select']")
                    .children("div[class='layui-select-title']").children("input").val(productTypeDistinguish);
                $(".editForm select[name='productTypeDistinguish']").siblings("div[class='layui-unselect layui-form-select']")
                    .children("dl").children("dd").each(function (){
                    if ($(this).val() == result.productTypeDistinguishId) {
                        if (!$(this).hasClass("layui-this")) {
                            $(this).addClass("layui-this");
                            $(this).click();
                        }
                        return true;
                    } else {
                        if ($(this).hasClass("layui-this")) {
                            $(this).removeClass("layui-this");
                        }
                    }
                });*/
                //productClassify
                var productClassify = layero.find("select[name='productClassify']");
                productClassify.find("option[value='"+productClassifyId+"']").attr("selected",true);
                /*var productClassify = "";
                $(".editForm select[name='productClassify']").children("option").each(function () {
                    if ($(this).val() == productClassifyId){
                        $(this).attr("selected", "selected");
                        productClassify = $(this).text();
                    } else {
                        if ($(this).attr("selected") == "selected"){
                            $(this).removeAttr("selected");
                        }
                    }
                });
                $(".editForm select[name='productClassify']").siblings("div[class='layui-unselect layui-form-select']")
                    .children("div[class='layui-select-title']").children("input").val(productClassify);
                $(".editForm select[name='productClassify']").siblings("div[class='layui-unselect layui-form-select']")
                    .children("dl").children("dd").each(function (){
                    if ($(this).val() == productClassifyId) {
                        if (!$(this).hasClass("layui-this")) {
                            $(this).addClass("layui-this");
                            $(this).click();
                        }
                        return true;
                    } else {
                        if ($(this).hasClass("layui-this")) {
                            $(this).removeClass("layui-this");
                        }
                    }
                });*/

                //普通的input
                layero.find("input[name='productTypeId']").val(result.productTypeId);
                layero.find("input[name='productTypeName']").val(result.productTypeName);
                layero.find("input[name='productTypeOrder']").val(result.productTypeOrder);
                layero.find("input[name='integralratioService']").val(result.integralratioService);
                layero.find("input[name='integralratioUnion']").val(result.integralratioUnion);
                layero.find("input[name='retailpriceVIP1']").val(result.retailpriceVIP1);
                layero.find("input[name='retailpriceVIP2']").val(result.retailpriceVIP2);
                layero.find("input[name='retailpriceVIP3']").val(result.retailpriceVIP3);
                layero.find("input[name='retailpriceVIP4']").val(result.retailpriceVIP4);
                layero.find("input[name='retailpriceVIP5']").val(result.retailpriceVIP5);
                layero.find("input[name='retailpriceVIP5']").val(result.retailpriceVIP5);
                layero.find("input[name='status']").val(result.status);
                layero.find("input[name='createOperator']").val(result.createOperator);
                layero.find("input[name='createTime']").val(result.createTime);
                layero.find("input[name='modifyOperator']").val(result.modifyOperator);
                layero.find("input[name='dataChangeLastTime']").val(result.dataChangeLastTime);
                //隐藏一些列
                layero.find("input[name='productTypeId']").parent().parent().show();
                //隐藏创建人和修改人
                $(".editForm input[name='createOperator']").parent().parent().hide();
                $(".editForm input[name='modifyOperator']").parent().parent().hide();
                //禁用productTypeId和productClassify
                layero.find("input[name='productTypeId']").attr("disabled","disabled");
                layero.find("select[name='productClassify']").attr("disabled","disabled");

                if(result.productTypeDistinguishId == 4){ //kind
                    $(".editForm select[name='productKind']").parent().parent().hide();
                    //处理种类的productTypeDistinguish不可选
                    $(".editForm select[name='productTypeDistinguish']").children("option").each(function () {
                        if ($(this).val() != "4"){
                            $(this).attr("disabled","disabled");
                        }
                    });
                }else if(result.productTypeDistinguishId == 5){ //site
                    $(".editForm select[name='productKind']").parent().parent().hide();
                    $(".editForm input[name='integralratioService']").parent().parent().hide();
                    $(".editForm input[name='integralratioUnion']").parent().parent().hide();
                    $(".editForm input[name='retailpriceVIP1']").parent().parent().hide();
                    $(".editForm input[name='retailpriceVIP2']").parent().parent().hide();
                    $(".editForm input[name='retailpriceVIP3']").parent().parent().hide();
                    $(".editForm input[name='retailpriceVIP4']").parent().parent().hide();
                    $(".editForm input[name='retailpriceVIP5']").parent().parent().hide();
                    //处理只有产品有产地，服务没有产地
                    // $(".editForm select[name='productClassify']").children("option").each(function () {
                    //     if ($(this).val() == "2"){
                    //         $(this).attr("disabled","disabled");
                    //     }
                    // });
                    //处理产地的productTypeDistinguish不可选
                    $(".editForm select[name='productTypeDistinguish']").children("option").each(function () {
                        if ($(this).val() != "5"){
                            $(this).attr("disabled","disabled");
                        }
                    });
                }else if(result.productTypeDistinguishId == 6){ //division
                    $(".editForm select[name='productKind']").parent().parent().hide();
                    //处理种类的productTypeDistinguish不可选
                    $(".editForm select[name='productTypeDistinguish']").children("option").each(function () {
                        if ($(this).val() != "6"){
                            $(this).attr("disabled","disabled");
                        }
                    });
                }else { //brand,category,effect
                    //处理productTypeDistinguish 的不可选
                    $(".editForm select[name='productTypeDistinguish']").children("option").each(function () {
                        if ($(this).val() == "5" || $(this).val() == "4" || $(this).val() == "6"){
                            $(this).attr("disabled","disabled");
                        }
                    });
                }
                layui.form.render("select","editForm");
            },
            area:['600px', '500px'],
            end:function(){
                window.location.reload();
            }
        });
    }
    function drop() {
        //处理分类类别，商品类型的改变
        //创建拖拽事件
        sortable = Sortable.create(document.getElementById('productTypeTbody'),{
            group:{
                // name:"words", 指定可以拖动的列
                pull:true, //可以拖拽到其他列表 否则反之，pull: 'clone'
                put:true //可以从其他列表中放数据到改列表，false则反之
            }
            ,handle: '.drop'
            ,filter: '.filtered'
            ,animation: 150
            // onAdd: function (evt){ //拖拽时候添加有新的节点的时候发生该事件
            //     console.log('onAdd.foo:', [evt.item, evt.from]);
            // },
            // ,onUpdate: function (evt){ //拖拽更新节点位置发生该事件
            //     console.log('onUpdate.foo:', [evt.item, evt.from]);
            // }
            // onRemove: function (evt){ //删除拖拽节点的时候促发该事件
            //     console.log('onRemove.foo:', [evt.item, evt.from]);
            // },
            // onStart:function(evt){ //开始拖拽出发该函数
            //     console.log('onStart.foo:', [evt.item, evt.from]);
            // },
            // onSort:function(evt){ //发生排序发生该事件
            //     console.log('onSort.foo:', [evt.item, evt.from]);
            // },
            ,onEnd: function(evt){ //拖拽完毕之后发生该事件
                //改变级别的拖动
                //获取拖动的行，获取整个表格,obj是当前行的数据
                // console.log(obj);
                var eItem = evt.item,eFrom = evt.from,oPid = null,oId = null,
                    tpid = null,tId = null,
                    oIndex = evt.oldIndex,nIndex = evt.newIndex,oData = null;
                //获取拖动的行的pid
                for(var i=0;i < eItem.children.length; i++){
                    //获取拖动的行的pid
                    if(eItem.children[i].dataset.field == "pId"){
                        oPid = eItem.children[i].innerText;
                    }
                    //获取拖动的行的id
                    if(eItem.children[i].dataset.field == "ProductTypeId"){
                        oId = eItem.children[i].innerText;
                    }
                }
                //获取之前在这个位置上的元素的pid,判断pid是否想等，不相等则处理数据(加载表格时的数据)
                var oTd = eFrom.children[nIndex+1].children;
                for(var i=0;i < oTd.length; i++){
                    if(oTd[i].dataset.field == "pId"){
                        tpid = oTd[i].innerText;
                    }
                    // if(eItem.children[i].dataset.field == "ProductTypeId"){
                    //     tId = eItem.children[i].innerText;
                    // }
                }

                if(oPid == tpid){  //父id相同，则排序
                    layer.open({
                        title: '排序'
                        , content: '排序成功！'
                        , btn: ["关闭"]
                        , icon: 1
                        , yes: function (index) {
                            layer.close(index); //如果设定了yes回调，需进行手工关闭
                        }
                    });
                }else  if(oPid != tpid && oPid.match("_") && tpid.match("_") &&  //父id不同 ，但是是同一种分类类别的移动
                    oPid.split("_")[0] == tpid.split("_")[0]){   //提交到数据库
                    //获取完整的数据
                    for(var i=0;i < treeData.length; i++){
                        if(oId == treeData[i].ProductTypeId){
                            oData = treeData[i];
                        }
                    }
                    var data = oData.ProductTypeData;
                    var productKindId = parseInt(tpid.split("_")[1]);
                    //修改分类的父类
                    var params = {
                        productTypeId: data.productTypeId
                        ,productKindId: productKindId
                        ,productTypeDistinguishId: data.productTypeDistinguishId
                        ,modifyOperator: "${currentUser.trueName!}"
                    };
                    var url = productHost+"/manage/productType/updateProductType";
                    $.post(url,params,function (res){
                        if (res.responseStatusType.message == "Success") {
                            layer.open({
                                title: '排序'
                                , content: '排序成功！'
                                , btn: ["关闭"]
                                , yes: function (index) {
                                    layer.close(index); //如果设定了yes回调，需进行手工关闭
                                    //重新加载树形表格
                                    // tree1.reload(tableId);
                                }
                            });
                        } else {
                            layer.open({
                                title: '排序'
                                , content: '排序失败！'+res.responseStatusType.error.errorMsg
                                , btn: ["关闭"]
                                , yes: function (index) {
                                    layer.close(index); //如果设定了yes回调，需进行手工关闭
                                    //重新加载树形表格
                                    treeGrid.reload(tableId);
                                }
                            });
                        }
                    });
                    oData.pId = tpid;
                    oData.ProductTypeData.productKindId = productKindId;
                    //更新行数据
                    treeGrid.updateRow(tableId,oData);
                }else {
                    layer.open({
                        title: '排序'
                        , content: '不允许排序！'
                        , btn: ["关闭"]
                        , icon: 1
                        , yes: function (index) {
                            layer.close(index); //如果设定了yes回调，需进行手工关闭
                            //重新加载树形表格
                            treeGrid.reload(tableId);
                        }
                    });
                }
            }
        });
    }

    //添加
    function addNewProductType(){
        //按钮添加
        //获取选择的商品分类和商品分类类别
        var productTypeKind = $("select[name='productTypeKind']").val(),
            type = $("select[name='type']").val();
        if(type == null || type == ""){
            layer.msg("请选择商品类型");
            return
        }
        if(productTypeKind == null || productTypeKind == ""){
            layer.msg("请选择商品分类类别");
            return
        }
        var a2 = layer.open({
            type: 1,
            title: '添加商品分类',
            content: $('#editForm'),
            closeBtn: 1,
            btn: ['提交', '取消'],
            yes: function(index,layero){
                //提交到数据库
                var productKindId = layero.find("select[name='productKind']");
                productKindId = productKindId.find("option:selected").val();
                if(productTypeKind == 4 || productTypeKind == 5　|| productTypeKind == 6){
                    productKindId = 0;
                }else{
                    if(typeof productKindId == 'undefined'||productKindId==""){
                        layer.msg("请先添加商品种类！");
                        return;
                    }
                    productKindId = parseInt(productKindId);
                }
                productKindId = parseInt(productKindId);
                var productTypeDisplayId = layero.find("select[name='productTypeDisplay']");
                productTypeDisplayId = productTypeDisplayId.find("option:selected").val();
                productTypeDisplayId = parseInt(productTypeDisplayId);
                var params= new FormData();
                params.append("productTypeName",layero.find("input[name='productTypeName']").val());
                params.append("productKindId",productKindId);
                params.append("productTypeOrder",layero.find("input[name='productTypeOrder']").val());
                params.append("productTypeDisplayId",productTypeDisplayId);
                params.append("productClassifyId",type);
                params.append("imageType","productType");
                if(multipartFile!=null){
                    params.append("multipartFile",multipartFile);
                }
                params.append("productTypeDistinguishId",productTypeKind);
                params.append("createOperator","${currentUser.trueName!}");
                params.append("modifyOperator","${currentUser.trueName!}");
                // params.append("createOperator",layero.find("input[name='createOperator']").val());
                // params.append("modifyOperator",layero.find("input[name='modifyOperator']").val());

                if(productTypeKind != 5 ){   //品牌，品类，功效，种类,专区
                    params.append("integralratioService",layero.find("input[name='integralratioService']").val());
                    params.append("integralratioUnion",layero.find("input[name='integralratioUnion']").val());
                    params.append("retailpriceVIP1",layero.find("input[name='retailpriceVIP1']").val());
                    params.append("retailpriceVIP2",layero.find("input[name='retailpriceVIP2']").val());
                    params.append("retailpriceVIP3",layero.find("input[name='retailpriceVIP3']").val());
                    params.append("retailpriceVIP4",layero.find("input[name='retailpriceVIP4']").val());
                    params.append("retailpriceVIP5",layero.find("input[name='retailpriceVIP5']").val());
                }else{  //产地
                    params.append("integralratioService",0);
                    params.append("integralratioUnion",0);
                    params.append("retailpriceVIP1",0);
                    params.append("retailpriceVIP2",0);
                    params.append("retailpriceVIP3",0);
                    params.append("retailpriceVIP4",0);
                    params.append("retailpriceVIP5",0);
                }
                var url = productHost+"/manage/productType/insertProductType";
                $.ajax({
                    url: url
                    ,type:"POST"
                    ,data: params
                    ,dataType: "json"   //服务器传回的数据类型
                    ,processData: false
                    // ,contentType:"multipart/form-data"
                    ,contentType: false
                    ,success: function (res){
                        if (res.responseStatusType.message == "Success") {
                            layer.open({
                                title: '添加'
                                , content: '添加成功！'
                                , btn: ["关闭"]
                                , yes: function (index) {
                                    layer.close(index); //如果设定了yes回调，需进行手工关闭
                                    layer.close(a2);
                                }
                            });
                            //重新加载表格
                            // tree1.reload(tableId);
                        } else {
                            layer.open({
                                title: '添加'
                                , content: '添加失败！'+res.responseStatusType.error.errorMsg
                                , btn: ["关闭"]
                            });
                        }
                    }
                });
                // layer.close(index);
            },
            btn2: function(){
                layer.closeAll();
            },
            success: function(layero){
                //图片
                layero.find("#upload").parent().hide();
                showImage();
                //下拉框
                allProductKind(1,type);//将kind遍历出来并选中第一个
                allProductTypeDisplay(1);//将display遍历出来并选中第一个
                var productTypeDistinguish = layero.find("select[name='productTypeDistinguish']");
                for(var p in dataPk){
                    var option = "<option value='"+p+"'>"+dataPk[p]+"</option>";
                    productTypeDistinguish.append(option);
                }
                productTypeDistinguish.find("option[value='"+productTypeKind+"']").attr("selected",true);
                // var productTypeDistinguish = layero.find("select[name='productTypeDistinguish']");
                // productTypeDistinguish.find("option[value='"+productTypeKind+"']").attr("selected",true);
                var productClassify = layero.find("select[name='productClassify']");
                productClassify.find("option[value='"+type+"']").attr("selected",true);
                //遍历选中productTypeDistinguish
                /*var productTypeDistinguish = "";
                $(".editForm select[name='productTypeDistinguish']").children("option").each(function () {
                    if ($(this).val() == result.productTypeDistinguishId){
                        $(this).attr("selected", "selected");
                        productTypeDistinguish = $(this).text();
                    } else {
                        if ($(this).attr("selected") == "selected"){
                            $(this).removeAttr("selected");
                            $(this).remove();   //只留选中的option
                        }
                    }
                });
                $(".editForm select[name='productTypeDistinguish']").siblings("div[class='layui-unselect layui-form-select']")
                    .children("div[class='layui-select-title']").children("input").val(productTypeDistinguish);
                $(".editForm select[name='productTypeDistinguish']").siblings("div[class='layui-unselect layui-form-select']")
                    .children("dl").children("dd").each(function (){
                    if ($(this).val() == result.productTypeDistinguishId) {
                        if (!$(this).hasClass("layui-this")) {
                            $(this).addClass("layui-this");
                            $(this).click();
                        }
                        return true;
                    } else {
                        if ($(this).hasClass("layui-this")) {
                            $(this).removeClass("layui-this");
                            $(this).remove();   //只留选中的dd
                        }
                    }
                });*/
                //不可选择分类类别和分类区分id
                layero.find("select[name='productTypeDistinguish']").attr("disabled","disabled");
                layero.find("select[name='productClassify']").attr("disabled","disabled");
                //隐藏一些列
                // $(".editForm select[name='productClassify']").parent().parent().hide(); //隐藏产品和服务
                // $(".editForm select[name='productTypeDistinguish']").parent().parent().hide();//隐藏商品分类类别
                //隐藏创建人和修改人
                $(".editForm input[name='createOperator']").parent().parent().hide();
                $(".editForm input[name='modifyOperator']").parent().parent().hide();

                //kind / division
                if(productTypeKind == 4 || productTypeKind == 6){
                    $(".editForm select[name='productKind']").parent().parent().hide();
                }
                //site
                if(productTypeKind == 5){
                    $(".editForm select[name='productKind']").parent().parent().hide();
                    $(".editForm input[name='integralratioService']").parent().parent().hide();
                    $(".editForm input[name='integralratioUnion']").parent().parent().hide();
                    $(".editForm input[name='retailpriceVIP1']").parent().parent().hide();
                    $(".editForm input[name='retailpriceVIP2']").parent().parent().hide();
                    $(".editForm input[name='retailpriceVIP3']").parent().parent().hide();
                    $(".editForm input[name='retailpriceVIP4']").parent().parent().hide();
                    $(".editForm input[name='retailpriceVIP5']").parent().parent().hide();
                }
                layui.form.render("select","editForm");
            },
            area:['600px', '500px'],
            end:function(){
                window.location.reload();
            }
        });
    }
    function add(obj) {
        //添加是添加同分类类别的商品分类
        var data = obj.data;
        addProductType(data);   //添加数据到数据库并返回插入的对象
    }
    function addProductType(data){
        var result = data.ProductTypeData;
        //页面弹框
        var a1 = layer.open({
            type: 1,
            title: '添加商品分类',
            content: $('#editForm'),
            closeBtn: 1,
            btn: ['提交', '取消'],
            yes: function(index,layero){
                //提交到数据库
                var productKindId = layero.find("select[name='productKind']");
                productKindId = productKindId.find("option:selected").val();
                if(productTypeKind == 4 || productTypeKind == 5　|| productTypeKind == 6){
                    productKindId = 0;
                }else{
                    if(typeof productKindId == 'undefined'||productKindId==""){
                        layer.msg("请先添加商品种类！");
                        return;
                    }
                    productKindId = parseInt(productKindId);
                }
                var productTypeDisplayId = layero.find("select[name='productTypeDisplay']");
                productTypeDisplayId = productTypeDisplayId.find("option:selected").val();
                productTypeDisplayId = parseInt(productTypeDisplayId);
                var params= new FormData();
                params.append("productTypeName",layero.find("input[name='productTypeName']").val());
                params.append("productKindId",productKindId);
                params.append("productTypeOrder",layero.find("input[name='productTypeOrder']").val());
                params.append("productTypeDisplayId",productTypeDisplayId);
                params.append("productClassifyId",result.productClassifyId);
                params.append("imageType",result.imageType);
                if(multipartFile!=null){
                    params.append("multipartFile",multipartFile);
                }
                params.append("productTypeDistinguishId",result.productTypeDistinguishId);
                params.append("createOperator","${currentUser.trueName!}");
                params.append("modifyOperator","${currentUser.trueName!}");
                // params.append("createOperator",layero.find("input[name='createOperator']").val());
                // params.append("modifyOperator",layero.find("input[name='modifyOperator']").val());

                if(result.productTypeDistinguishId != 5 ){   //品牌，品类，功效，种类
                    params.append("integralratioService",layero.find("input[name='integralratioService']").val());
                    params.append("integralratioUnion",layero.find("input[name='integralratioUnion']").val());
                    params.append("retailpriceVIP1",layero.find("input[name='retailpriceVIP1']").val());
                    params.append("retailpriceVIP2",layero.find("input[name='retailpriceVIP2']").val());
                    params.append("retailpriceVIP3",layero.find("input[name='retailpriceVIP3']").val());
                    params.append("retailpriceVIP4",layero.find("input[name='retailpriceVIP4']").val());
                    params.append("retailpriceVIP5",layero.find("input[name='retailpriceVIP5']").val());
                }else{  //产地
                    params.append("integralratioService",0);
                    params.append("integralratioUnion",0);
                    params.append("retailpriceVIP1",0);
                    params.append("retailpriceVIP2",0);
                    params.append("retailpriceVIP3",0);
                    params.append("retailpriceVIP4",0);
                    params.append("retailpriceVIP5",0);
                }
                var url = productHost+"/manage/productType/insertProductType";
                $.ajax({
                    url: url
                    ,type:"POST"
                    ,data: params
                    ,dataType: "json"   //服务器传回的数据类型
                    ,processData: false
                    // ,contentType:"multipart/form-data"
                    ,contentType: false
                    ,success: function (res){
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
                            // tree1.reload(tableId);
                        } else {
                            layer.open({
                                title: '添加'
                                , content: '添加失败！'+res.responseStatusType.error.errorMsg
                                , btn: ["关闭"]
                            });
                        }
                    }
                });
                // layer.close(index);
            },
            btn2: function(){
                layer.closeAll();
            },
            success: function(layero){
                //图片
                layero.find("#upload").parent().hide();
                showImage();
                //下拉框
                var productClassifyId = result.productClassifyId + "";
                if(productClassifyId == null || productClassifyId == ""){
                    //获取当前节点的父节点
                    var uObj = treeGrid.treeFindUpData(tableId,data);
                    productClassifyId = uObj.pId;
                }
                allProductKind(result.productKindId,productClassifyId);//将kind遍历出来并选中第一个
                allProductTypeDisplay(result.productTypeDisplayId);//将display遍历出来并选中第一个
                var productTypeDistinguish = layero.find("select[name='productTypeDistinguish']");
                for(var p in dataPk){
                    var option = "<option value='"+p+"'>"+dataPk[p]+"</option>";
                    productTypeDistinguish.append(option);
                }
                productTypeDistinguish.find("option[value='"+result.productTypeDistinguishId+"']").attr("selected",true);
                // var productTypeDistinguish = layero.find("select[name='productTypeDistinguish']");
                // productTypeDistinguish.find("option[value='"+result.productTypeDistinguishId+"']").attr("selected",true);
                //productClassify
                var productClassify = layero.find("select[name='productClassify']");
                productClassify.find("option[value='"+productClassifyId+"']").attr("selected",true);

                //遍历选中productTypeDistinguish
                /*var productTypeDistinguish = "";
                $(".editForm select[name='productTypeDistinguish']").children("option").each(function () {
                    if ($(this).val() == result.productTypeDistinguishId){
                        $(this).attr("selected", "selected");
                        productTypeDistinguish = $(this).text();
                    } else {
                        if ($(this).attr("selected") == "selected"){
                            $(this).removeAttr("selected");
                            $(this).remove();   //只留选中的option
                        }
                    }
                });
                $(".editForm select[name='productTypeDistinguish']").siblings("div[class='layui-unselect layui-form-select']")
                    .children("div[class='layui-select-title']").children("input").val(productTypeDistinguish);
                $(".editForm select[name='productTypeDistinguish']").siblings("div[class='layui-unselect layui-form-select']")
                    .children("dl").children("dd").each(function (){
                    if ($(this).val() == result.productTypeDistinguishId) {
                        if (!$(this).hasClass("layui-this")) {
                            $(this).addClass("layui-this");
                            $(this).click();
                        }
                        return true;
                    } else {
                        if ($(this).hasClass("layui-this")) {
                            $(this).removeClass("layui-this");
                            $(this).remove();   //只留选中的dd
                        }
                    }
                });*/
                //不可选择分类类别和分类区分id
                layero.find("select[name='productTypeDistinguish']").attr("disabled","disabled");
                layero.find("select[name='productClassify']").attr("disabled","disabled");
                //隐藏一些列
                // $(".editForm select[name='productClassify']").parent().parent().hide(); //隐藏产品和服务
                // $(".editForm select[name='productTypeDistinguish']").parent().parent().hide();//隐藏商品分类类别
                //隐藏创建人和修改人
                $(".editForm input[name='createOperator']").parent().parent().hide();
                $(".editForm input[name='modifyOperator']").parent().parent().hide();

                //kind
                if(result.productTypeDistinguishId == 4){
                    $(".editForm select[name='productKind']").parent().parent().hide();
                }
                //site
                if(result.productTypeDistinguishId == 5){
                    $(".editForm select[name='productKind']").parent().parent().hide();
                    $(".editForm input[name='integralratioService']").parent().parent().hide();
                    $(".editForm input[name='integralratioUnion']").parent().parent().hide();
                    $(".editForm input[name='retailpriceVIP1']").parent().parent().hide();
                    $(".editForm input[name='retailpriceVIP2']").parent().parent().hide();
                    $(".editForm input[name='retailpriceVIP3']").parent().parent().hide();
                    $(".editForm input[name='retailpriceVIP4']").parent().parent().hide();
                    $(".editForm input[name='retailpriceVIP5']").parent().parent().hide();
                }
                layui.form.render("select","editForm");
            },
            area:['600px', '500px'],
            end:function(){
                window.location.reload();
            }
        });
    }
    //查看
    function show(obj) {
        var data = obj.data;
        if(data.pId == 0){
            layer.open({
                type: 1,
                title: '商品分类详情',
                content: $('#showParent'),
                closeBtn: 1,
                btn: ['确定', '取消'],
                yes: function(index){
                    layer.close(index);
                },
                btn2: function(){
                    layer.closeAll();
                },
                success: function(layero){
                    layero.find("input[name='ProductTypeId']").val(data.ProductTypeId);
                    layero.find("input[name='ProductTypeName']").val(data.ProductTypeName);
                },
                area:['600px', '500px'],
                end:function(){
                    window.location.reload();
                }
            });
        }else{
            showProductType(data);
        }
    }
    function showProductType(data) {
        var result = data.ProductTypeData;
        //页面弹框
        layer.open({
            type: 1,
            title: '商品分类详情',
            content: $('#editForm'),
            closeBtn: 1,
            btn: ['确定', '取消'],
            yes: function(index){
                layer.close(index);
            },
            btn2: function(){
                layer.closeAll();
            },
            success: function(layero){
                /* 回显 */
                //图片
                var imageUrl = "http://"+result.imageUrl;
                layero.find("#upload").attr("src",imageUrl);
                layero.find("#upload").attr("onclick","window.open('"+imageUrl+"')"); //点击图片打开图片
                layero.find("#productTypeImage").hide();
                //下拉框
                var productClassifyId = result.productClassifyId + "";
                if(productClassifyId == null || productClassifyId == ""){
                    //获取当前节点的父节点
                    var uObj = treeGrid.treeFindUpData(tableId,data);
                    productClassifyId = uObj.pId;
                }
                allProductKind(result.productKindId,productClassifyId);//将kind遍历出来并选中
                allProductTypeDisplay(result.productTypeDisplayId);//将display遍历出来并选中
                var productTypeDistinguish = layero.find("select[name='productTypeDistinguish']");
                for(var p in dataPk){
                    var option = "<option value='"+p+"'>"+dataPk[p]+"</option>";
                    productTypeDistinguish.append(option);
                }
                productTypeDistinguish.find("option[value='"+result.productTypeDistinguishId+"']").attr("selected",true);
                // var productTypeDistinguish = layero.find("select[name='productTypeDistinguish']");
                // productTypeDistinguish.find("option[value='"+result.productTypeDistinguishId+"']").attr("selected",true);
                //遍历选中productTypeDistinguish
                /*var productTypeDistinguish = "";
                $(".editForm select[name='productTypeDistinguish']").children("option").each(function () {
                    if ($(this).val() == result.productTypeDistinguishId){
                        $(this).attr("selected", "selected");
                        productTypeDistinguish = $(this).text();
                    } else {
                        if ($(this).attr("selected") == "selected"){
                            $(this).removeAttr("selected");
                            $(this).remove();
                        }
                    }
                });
                $(".editForm select[name='productTypeDistinguish']").siblings("div[class='layui-unselect layui-form-select']")
                    .children("div[class='layui-select-title']").children("input").val(productTypeDistinguish);
                $(".editForm select[name='productTypeDistinguish']").siblings("div[class='layui-unselect layui-form-select']")
                    .children("dl").children("dd").each(function (){
                    if ($(this).val() == result.productTypeDistinguishId) {
                        if (!$(this).hasClass("layui-this")) {
                            $(this).addClass("layui-this");
                            $(this).click();
                        }
                        return true;
                    } else {
                        if ($(this).hasClass("layui-this")) {
                            $(this).removeClass("layui-this");
                            $(this).remove();
                        }
                    }
                });*/
                //productClassify
                var productClassify = layero.find("select[name='productClassify']");
                productClassify.find("option[value='"+productClassifyId+"']").attr("selected",true);
                /*var productClassify = "";
                $(".editForm select[name='productClassify']").children("option").each(function () {
                    if ($(this).val() == productClassifyId){
                        $(this).attr("selected", "selected");
                        productClassify = $(this).text();
                    } else {
                        if ($(this).attr("selected") == "selected"){
                            $(this).removeAttr("selected");
                        }
                    }
                });
                $(".editForm select[name='productClassify']").siblings("div[class='layui-unselect layui-form-select']")
                    .children("div[class='layui-select-title']").children("input").val(productClassify);
                $(".editForm select[name='productClassify']").siblings("div[class='layui-unselect layui-form-select']")
                    .children("dl").children("dd").each(function (){
                    if ($(this).val() == productClassifyId) {
                        if (!$(this).hasClass("layui-this")) {
                            $(this).addClass("layui-this");
                            $(this).click();
                        }
                        return true;
                    } else {
                        if ($(this).hasClass("layui-this")) {
                            $(this).removeClass("layui-this");
                        }
                    }
                });*/
                //普通的input
                layero.find("input[name='productTypeId']").val(result.productTypeId);
                layero.find("input[name='productTypeName']").val(result.productTypeName);
                layero.find("input[name='productTypeOrder']").val(result.productTypeOrder);
                layero.find("input[name='integralratioService']").val(result.integralratioService);
                layero.find("input[name='integralratioUnion']").val(result.integralratioUnion);
                layero.find("input[name='retailpriceVIP1']").val(result.retailpriceVIP1);
                layero.find("input[name='retailpriceVIP2']").val(result.retailpriceVIP2);
                layero.find("input[name='retailpriceVIP3']").val(result.retailpriceVIP3);
                layero.find("input[name='retailpriceVIP4']").val(result.retailpriceVIP4);
                layero.find("input[name='retailpriceVIP5']").val(result.retailpriceVIP5);
                layero.find("input[name='retailpriceVIP5']").val(result.retailpriceVIP5);
                layero.find("input[name='status']").val(result.status);
                layero.find("input[name='createOperator']").val(result.createOperator);
                layero.find("input[name='createTime']").val(result.createTime);
                layero.find("input[name='modifyOperator']").val(result.modifyOperator);
                layero.find("input[name='dataChangeLastTime']").val(result.dataChangeLastTime);
                //选择框不可选
                layero.find("select[name='productKind']").attr("disabled","disabled");
                layero.find("select[name='productTypeDisplay']").attr("disabled","disabled");
                layero.find("select[name='productTypeDistinguish']").attr("disabled","disabled");
                layero.find("select[name='productClassify']").attr("disabled","disabled");
                //kind  /   division
                if(result.productTypeDistinguishId == 4 || result.productTypeDistinguishId == 6){
                    $(".editForm select[name='productKind']").parent().parent().hide();
                }
                //site
                if(result.productTypeDistinguishId == 5){
                    $(".editForm select[name='productKind']").parent().parent().hide();
                    $(".editForm input[name='integralratioService']").parent().parent().hide();
                    $(".editForm input[name='integralratioUnion']").parent().parent().hide();
                    $(".editForm input[name='retailpriceVIP1']").parent().parent().hide();
                    $(".editForm input[name='retailpriceVIP2']").parent().parent().hide();
                    $(".editForm input[name='retailpriceVIP3']").parent().parent().hide();
                    $(".editForm input[name='retailpriceVIP4']").parent().parent().hide();
                    $(".editForm input[name='retailpriceVIP5']").parent().parent().hide();
                }
                layui.form.render("select","editForm");
            },
            area:['600px', '500px'],
            end:function(){
                window.location.reload();
            }
        });
    }
    function showImage() {
        productTypeImage = upload.render({
            elem: '#productTypeImage'
            // ,url: ""
            // ,data:{ }
            // ,headers: {token: 'sasasas'}
            ,exts: 'jpg|jpeg|png|bmp|GIF|JPG|PNG|JPEG'  //common设定
            ,size: 60000    //限制文件大小，单位 KB
            ,auto: false
            // ,multiple: true     //多文件上传
            // ,bindAction: '#editForm .layui-layer-btn0'
            ,choose: function (obj) {
                //将图片回显到img标签
                obj.preview(function(index, file, result){
                    $('#upload').attr('src', result); //图片链接（base64）
                    multipartFile = file;
                });
                var html = '<i class="layui-icon">&#xe67c;</i>重新选择图片';
                $('#productTypeImage').html(html);
                $("#upload").parent().show();
            }
            // ,done: function(res){
            //     console.log(res)
            // }
        });
    }
    function allProductKind(id,productClassifyId) {
        var url = productHost+"/productKind/selectProductKindByProductClassifyId",
            param = {
                productClassifyId: productClassifyId
            },html1 = '', html2 = '';
        $.post(url,param,function(res){
            if (res.responseStatusType.message == "Success") {
                //加载店铺
                var data = res.result;
                for (var i = 0; i < data.length; i++) {
                    if(data[i].productKindId == id){ //选中  productTypeId -->productKindId   / productTypeName-->productKindName
                        html1 += '<dd lay-value="' + data[i].productKindId + '" class="layui-this">' + data[i].productKindName + '</dd>';
                        html2 += '<option value="' + data[i].productKindId + '" selected="selected">' + data[i].productKindName + '</option>';
                    }else {
                        html1 += '<dd lay-value="' + data[i].productKindId + '">' + data[i].productKindName + '</dd>';
                        html2 += '<option value="' + data[i].productKindId + '">' + data[i].productKindName + '</option>';
                    }
                }
                $(".editForm select[name='productKind']").next().children().eq(1).html(html1);
                $(".editForm select[name='productKind']").html(html2);
                layui.form.render("select","editForm"); // 更新 lay-filter="editForm" 所在容器内的全部 select 状态
            }
        });
    }
    function allProductTypeDisplay(id) {
        var url = productHost+"/productTypeDisplay/selectProductTypeDisplayList";
        var html1 = '';
        var html2 = '';
        $.post(url,function(res){
            if (res.responseStatusType.message == "Success") {
                //加载店铺
                var data = res.result;
                for (var i = 0; i < data.length; i++) {
                    if(data[i].productTypeDisplayId == id) { //选中
                        html1 += '<dd lay-value="' + data[i].productTypeDisplayId + '" class="layui-this">' + data[i].productTypeDisplayName + '</dd>';
                        html2 += '<option value="' + data[i].productTypeDisplayId + '" selected="selected">' + data[i].productTypeDisplayName + '</option>';
                    }else {
                        html1 += '<dd lay-value="' + data[i].productTypeDisplayId + '">' + data[i].productTypeDisplayName + '</dd>';
                        html2 += '<option value="' + data[i].productTypeDisplayId + '">' + data[i].productTypeDisplayName + '</option>';
                    }
                }
                $(".editForm select[name='productTypeDisplay']").next().children().eq(1).html(html1);
                $(".editForm select[name='productTypeDisplay']").html(html2);
                layui.form.render("select","editForm"); // 更新 lay-filter="editForm" 所在容器内的全部 select 状态
            }
        });
    }
    //删除
    function del(obj) {
        layer.confirm("你确定删除数据吗？如果存在下级节点则一并删除，此操作不能撤销！", {icon: 3, title:'提示'},
            function(index){//确定回调
                //删除数据库的数据
                var data = obj.data;
                if(data.ProductType == "商品产地"){
                    delSite(data);
                }else if(data.ProductType == "商品种类"){    //需要先删除所有的子分类
                    delKind(data);
                }else if(data.ProductType == "商品功效"){
                    delEffect(data);
                }else if(data.ProductType == "商品品类"){
                    delCategory(data);
                }else if(data.ProductType == "商品品牌"){
                    delBrand(data);
                }else if(data.ProductType == "商品专区"){
                    delDivision(data);
                }
                obj.del();
                layer.close(index);
            },function (index) {//取消回调
                layer.close(index);
            }
        );
    }
    function delDivision(data){
        var url = productHost+"/productDivision/deleteProductDivision",
            params = {
                productDivisionId: parseInt(data.ProductTypeId.substring(2))
                ,modifyOperator: "${currentUser.trueName!}"
            };
        $.post(url,params,function (res) {
            if(res.responseStatusType.message=="Success"){
                layer.open({
                    title: '删除商品专区'
                    ,content: '删除成功！'
                    ,btn: ["关闭"]
                });
                //重新加载表格
                // table.reload("appointment");
            }else{
                layer.open({
                    title: '删除商品专区'
                    ,content: '删除失败！'+res.responseStatusType.error.errorMsg
                    ,btn: ["关闭"]
                });
            }
        });
    }
    function delSite(data){
        var url = productHost+"/productSite/deleteProductSiteById",
            params = {
                productSiteId: parseInt(data.ProductTypeId.substring(2))
                ,modifyOperator: "${currentUser.trueName!}"
            };
        $.post(url,params,function (res) {
            if(res.responseStatusType.message=="Success"){
                layer.open({
                    title: '删除商品产地'
                    ,content: '删除成功！'
                    ,btn: ["关闭"]
                });
                //重新加载表格
                // table.reload("appointment");
            }else{
                layer.open({
                    title: '删除商品产地'
                    ,content: '删除失败！'+res.responseStatusType.error.errorMsg
                    ,btn: ["关闭"]
                });
            }
        });
    }
    function delKind(data){
        //根据商品种类id删除子分类
        var productKindId = parseInt(data.ProductTypeId.substring(2)),url = "",params = {};
        url = productHost+"/productKind/deleteProductTypeByProductKindId";
        params = {
            productKindId: productKindId
            ,modifyOperator: "${currentUser.trueName!}"
        };
        $.post(url,params,function (res) {
            if(res.responseStatusType.message=="Success"){
                //删除kind
                url = productHost+"/productKind/deleteProductKindById";
                params = {
                    productKindId: productKindId
                    ,modifyOperator: "${currentUser.trueName!}"
                };
                $.post(url,params,function (res) {
                    if(res.responseStatusType.message=="Success"){
                        layer.open({
                            title: '删除商品种类'
                            ,content: '删除成功！'
                            ,btn: ["关闭"]
                        });
                        //重新加载表格
                        // table.reload("appointment");
                    }else{
                        layer.open({
                            title: '删除商品种类'
                            ,content: '删除失败！'+res.responseStatusType.error.errorMsg
                            ,btn: ["关闭"]
                        });
                    }
                });
            }else{
                layer.open({
                    title: '删除商品种类'
                    ,content: '删除失败！'+res.responseStatusType.error.errorMsg
                    ,btn: ["关闭"]
                });
            }
        });
    }
    function delEffect(data){
        var url = productHost+"/productEffect/deleteProductEffectById"
            ,params = {
                productEffectId: parseInt(data.ProductTypeId.substring(2))
                ,modifyOperator: "${currentUser.trueName!}"
            };
        $.post(url,params,function (res) {
            if(res.responseStatusType.message=="Success"){
                layer.open({
                    title: '删除商品功效'
                    ,content: '删除成功！'
                    ,btn: ["关闭"]
                });
                //重新加载表格
                // table.reload("appointment");
            }else{
                layer.open({
                    title: '删除商品功效'
                    ,content: '删除失败！'+res.responseStatusType.error.errorMsg
                    ,btn: ["关闭"]
                });
            }
        });
    }
    function delCategory(data){
        var url = productHost+"/productCategory/deleteProductCategoryById"
            ,params = {
                productCategoryId: parseInt(data.ProductTypeId.substring(2))
                ,modifyOperator: "${currentUser.trueName!}"
            };
        $.post(url,params,function (res) {
            if(res.responseStatusType.message=="Success"){
                layer.open({
                    title: '删除商品种类'
                    ,content: '删除成功！'
                    ,btn: ["关闭"]
                });
                //重新加载表格
                // table.reload("appointment");
            }else{
                layer.open({
                    title: '删除商品种类'
                    ,content: '删除失败！'+res.responseStatusType.error.errorMsg
                    ,btn: ["关闭"]
                });
            }
        });
    }
    function delBrand(data){
        var url = productHost+"/productBrand/deleteProductBrandById"
            ,params = {
                productBrandId: parseInt(data.ProductTypeId.substring(2))
                ,modifyOperator: "${currentUser.trueName!}"
            };
        $.post(url,params,function (res) {
            if(res.responseStatusType.message=="Success"){
                layer.open({
                    title: '删除商品品牌'
                    ,content: '删除成功！'
                    ,btn: ["关闭"]
                });
                //重新加载表格
                // table.reload("appointment");
            }else{
                layer.open({
                    title: '删除商品品牌'
                    ,content: '删除失败！'+res.responseStatusType.error.errorMsg
                    ,btn: ["关闭"]
                });
            }
        });
    }
    //搜索
    function search() {
        var keyword = $("input[name='keyWord']").val();
        var searchCount = 0;
        $('#productType').next('.productType').find('.layui-table-body tbody tr td').each(function () {
            $(this).css('background-color', 'transparent');
            var text = $(this).text();
            if (keyword != '' && text.indexOf(keyword) >= 0) {
                $(this).css('background-color', 'rgba(250,230,160,0.5)');
                if (searchCount == 0) {
                    treeGrid.treeOpenAll(tableId,true);
                    $('html,body').stop(true);
                    $('html,body').animate({scrollTop: $(this).offset().top - 150}, 500);
                }
                searchCount++;
            }
        });
        if (keyword == '') {
            layer.msg("请输入搜索内容", {icon: 5});
        } else if (searchCount == 0) {
            layer.msg("没有匹配结果", {icon: 5});
        }
    }
    //导出
    function exportAll(){
        var url = productHost+"/manage/productType/exportProductType";
        var $eleForm = $("<form method='post'></form>");
        $eleForm.attr("action",url);
        $(document.body).append($eleForm);
        //提交表单，实现下载
        $eleForm.submit();
    }
    //展开或收起
    function openAll() {
        var treedata=treeGrid.getDataTreeList(tableId);
        treeGrid.treeOpenAll(tableId,!treedata[0][treeGrid.config.cols.isOpen]);
    }

    function getCheckData() {
        var checkStatus = treeGrid.checkStatus(tableId)
            ,data = checkStatus.data;
        layer.alert(JSON.stringify(data));
    }

    function getCheckLength() {
        var checkStatus = treeGrid.checkStatus(tableId)
            ,data = checkStatus.data;
        layer.msg('选中了：'+ data.length + ' 个');
    }

    function print() {
        msg("对象已打印，按F12，在控制台查看！");
    }

    function msg(msg) {
        var loadIndex=layer.msg(msg, {
            time:3000
            ,offset: 'b'//顶部
            ,shade: 0
        });
    }

</script>
</body>
</html>