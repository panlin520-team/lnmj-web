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
    <script src="${basePath!}/js/jquery.min.js" type="text/javascript"></script>
    <script src="${basePath!}/layui/layui.js" charset="utf-8"></script>
    <script src="${basePath!}/js/host.js" type="text/javascript"></script>
    <#include "../../baseFtl/pageAuth.ftl" />
</head>
<body>
<div class="layui-fluid">
    <div class="layui-row layui-col-space10">
        <div class="layui-col-md3">
            <fieldset class="layui-elem-field">
                <legend>商品分类</legend>
                <div class="layui-field-box">
                    <div class="layui-row layui-col-space10">
                        <div class="layui-col-md12">
                            <#--商品大类和商品小类的树-->
                            <div id="productPerformanceTree" class="demo-tree-more"></div>
                        </div>
                    </div>
                </div>
            </fieldset>
        </div>

        <div class="layui-col-md8">
            <fieldset id="menu_func_div" class="layui-elem-field">
                <legend>分类列表</legend>
                <div class="layui-field-box">
                    <div class="layui-col-md12 layui-col-space1">
                        <div style="height: 100%;" id="bodyForm" class="layui-form bodyForm" lay-filter="bodyForm">
                            <div class="layui-form-item">
                                <div class="layui-inline ">
                                    <label class="layui-form-label resetLabel" style="width: auto">商品分类类别</label>
                                    <div class="layui-input-inline">
                                        <select name="type" lay-filter="type" lay-verify="required">
                                            <option value="">请选择</option>
                                            <option value="1">商品大类</option>
                                            <option value="2">商品小类</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="layui-inline">
                                    <button class="layui-btn" onclick="addNewProductPerformance()" >添加商品分类</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-md12 layui-col-space1">
                        <#--显示商品分类详细-->
                        <table class="layui-hidden" id="productPerformanceTable" lay-filter="productPerformanceTable"></table>
                        <script type="text/html" id="performanceDemo">
                            <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
                            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
                        </script>
                    </div>
                </div>
            </fieldset>
        </div>
    </div>

    <#--商品大类的表单-->
    <form id="CommodityType" class="layui-form CommodityType layui-form-pane layui-personal" action="" lay-filter="CommodityType" hidden="true">
        <div class="layui-form-item" hidden>
            <label class="layui-form-label">商品大类ID</label>
            <div class="layui-input-block">
                <input type="text" name="commodityTypeID" lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">行业</label>
            <div class="layui-input-block">
                <select name="commodityTypeIndustry" lay-filter="commodityTypeIndustry" lay-verify="required">
                    <option value="">请选择</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">大类名称</label>
            <div class="layui-input-block">
                <input type="text" name="commodityTypeName" lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品分类</label>
            <div class="layui-input-block">
                <select name="commodityProductType" lay-filter="commodityProductType" lay-verify="required">
                    <option value="">请选择</option>
                    <option value="1">产品</option>
                    <option value="2">服务</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item" hidden>
            <label class="layui-form-label">状态</label>
            <div class="layui-input-block">
                <input type="text" name="status" lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" hidden>
            <label class="layui-form-label">创建人</label>
            <div class="layui-input-block">
                <input type="text" name="createOperator" lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" hidden>
            <label class="layui-form-label">修改人</label>
            <div class="layui-input-block">
                <input type="text" name="modifyOperator" lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
    </form>
    <#--商品小类的表单-->
    <form id="Subclass" class="layui-form Subclass layui-form-pane layui-personal" action="" lay-filter="Subclass" hidden="true">
        <div class="layui-form-item" hidden>
            <label class="layui-form-label">商品小类ID</label>
            <div class="layui-input-block">
                <input type="text" name="subclassID" lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">小类名称</label>
            <div class="layui-input-block">
                <input type="text" name="subclassName" lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">业绩</label>
            <div class="layui-input-block">
                <select name="subclassAchievement" lay-filter="subclassAchievement" lay-verify="required">
                    <option value="">请选择</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品大类</label>
            <div class="layui-input-block">
                <select name="commodityType" lay-filter="commodityType" lay-verify="required">
                    <option value="">请选择</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">职位分类</label>
            <div class="layui-input-block" id="post">
            </div>
        </div>
        <div class="layui-form-item" hidden>
            <label class="layui-form-label">客户评测</label>
            <div class="layui-input-block">
                <select name="subclassEvaluatingID" lay-filter="" lay-verify="required">
                    <option value="">请选择</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item" hidden>
            <label class="layui-form-label">状态</label>
            <div class="layui-input-block">
                <input type="text" name="status" lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" hidden>
            <label class="layui-form-label">创建人</label>
            <div class="layui-input-block">
                <input type="text" name="createOperator" lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" hidden>
            <label class="layui-form-label">修改人</label>
            <div class="layui-input-block">
                <input type="text" name="modifyOperator" lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
    </form>
</div>

<script>
    var dataCommitType,dataSubclass,dataIndustry,dataPostCategory,dataProductTypeTree = new Array(),
        dataProductTypeTable = new Array(),dataPerformance,tree,layer,$,table,form;
    layui.use(['tree', 'jquery','table','form'], function() {
        tree = layui.tree;
        layer = layui.layer;
        $ = layui.jquery;
        table = layui.table;
        form = layui.form;
        getData();

        //大类小类数据初始化树
        tree.render({
            elem: '#productPerformanceTree'
            , data: dataProductTypeTree
            , showLine: false  //是否开启连接线
            ,onlyIconControl: true  //是否仅允许节点左侧图标控制展开收缩
            ,click: function(obj){
                //获取点击的数据
                // console.log(obj.data); //得到当前点击的节点数据
                // console.log(obj.state); //得到当前节点的展开状态：open、close、normal
                // console.log(obj.elem); //得到当前节点元素
                // console.log(obj.data.children); //当前节点下是否有子节点
                var data = obj.data;
                var objData = new Array();
                for(var i in dataProductTypeTable){
                    if(data.type == dataProductTypeTable[i].type){
                        if(data.id == dataProductTypeTable[i].id){
                            objData.push(dataProductTypeTable[i]);
                        }
                    }
                    if(data.id == dataProductTypeTable[i].commodityTypeID){
                        objData.push(dataProductTypeTable[i]);
                    }
                }
                //右侧表单联动
                table.reload('productPerformanceTableReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,data: objData
                });
            }
        });

        //初始化表单（大类，小类数据）
        table.render({
            elem: '#productPerformanceTable'
            ,data: dataProductTypeTable
            ,cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            // ,page: false          //显示分页默认不显示
            ,method: 'post'
            ,height: 350
            ,limit: 100
            // ,request: {
            //     pageName: 'pageNum', //页码的参数名称，默认：page
            //     limitName: 'pageSize' //每页数据量的参数名，默认：limit
            // }
            ,parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                return {
                    "code": 0, //解析接口状态
                    "msg": res.responseStatusType.error.errorMsg, //解析提示文本
                    "count": res.result==null?0:res.result.total, //解析数据长度
                    "data": res.result==null?0:res.result.list //解析数据列表
                }
            }
            ,cols: [[
                {type: 'checkbox', fixed: 'left',width:40,hide:true}
                ,{field: 'id', title: '序号', width:70, sort: true, fixed: 'left'}
                ,{field: 'title', title: '分类名称'}
                ,{field: 'type', title: '分类类别'}
                ,{field: 'industry', title: '行业',sort:true}
                ,{field: 'subclassAchievement', title: '业绩',sort:true}
                ,{field: 'commodityTypeID', title: '大类ID',sort:true}
                ,{fixed: 'right',title: '操作', width: 120, align: 'center',toolbar: '#performanceDemo'}
            ]]
            ,id: "productPerformanceTableReload"
        });

        //监听分类操作
        table.on('tool(productPerformanceTable)', function(obj){
            var data = obj.data;
            if(obj.event === 'edit'){
                editProductPerformance(data);
                // layer.msg('ID：'+ data.membershipLevelId + ' 的查看操作');
            }else if(obj.event === 'del'){
                delProductPerformance(data);
                // layer.alert('编辑行：<br>'+ JSON.stringify(data))
            }
        });

        //职位(监听大类的选择，大类选择后获取大类的行业，获取行业职位分类)
        form.on('select(commodityType)', function (data) {
            $("#post").val("");
            var id = data.value;//大类id
            var inId;//行业id
            for(var p in dataCommitType){
                if(id == dataCommitType[p].commodityTypeID){
                    inId = dataCommitType[p].commodityTypeIndustryID;
                }
            }
            for(var p in dataPostCategory){
                if(dataPostCategory[p].industryID == inId){
                    var input = "<input type='checkbox' name='post' value='"+dataPostCategory[p].postCategoryId+"' lay-skin='primary' title='"+dataPostCategory[p].name+"'>";
                    $("#post").append(input);
                }
            }
            form.render();
        });
    });

    function editProductPerformance(data){
        var type = data.type;
        //商品大类
        if(type=="商品大类"){
            var b1 = layer.open({
                type: 1,
                title: '修改商品大类',
                content: $('#CommodityType'),
                closeBtn: 1,
                btn: ['提交', '取消'],
                yes: function (index, layero) {
                    var url = dataHost + "/commodityType/updateCommodityType";
                    //下拉框
                    var commodityTypeIndustryID = layero.find("select[name='commodityTypeIndustryID']");
                    commodityTypeIndustryID = commodityTypeIndustryID.find("option:selected").val();
                    var commodityProductType = layero.find("select[name='commodityProductType']");
                    commodityProductType = commodityProductType.find("option:selected").val();
                    var params = {
                        commodityTypeID:data.id,
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
                                    layer.close(b1);
                                }
                            });
                            //重新加载表格
                            table.reload("productPerformanceTable");
                        } else {
                            layer.open({
                                title: '修改'
                                , content: '修改失败！'
                                , btn: ["关闭"]
                            });
                        }
                    })
                    // layer.close(); //如果设定了yes回调，需进行手工关闭
                },
                btn2: function () {
                    layer.close(b1);
                },
                success: function (layero) {
                    selectCommitType();
                    //回显数据
                    var commodityTypeIndustry = layero.find("select[name='commodityTypeIndustry']");
                    commodityTypeIndustry.find("option[value='"+data.data.commodityTypeIndustryID+"']").attr("selected",true);
                    layero.find("input[name='commodityTypeName']").val(data.data.commodityTypeName);
                    var commodityProductType = layero.find("select[name='commodityProductType']");
                    commodityProductType.find("option[value='"+data.data.commodityProductType+"']").attr("selected",true);
                    form.render("select","CommodityType")
                    //编辑则隐藏创建人和编辑人
                    layero.find("input[name='createOperator']").parent().parent().hide();
                    layero.find("input[name='modifyOperator']").parent().parent().hide();
                },
                area: ['600px', '500px'],
                // end: function () {
                //     window.location.reload();
                // }
            });
        }else{
            var b2 = layer.open({
                type: 1,
                title: '修改商品小类',
                content: $('#Subclass'),
                closeBtn: 1,
                btn: ['提交', '取消'],
                yes: function (index, layero) {
                    var url = dataHost + "/commodityType/updateSubclass";
                    //下拉框
                    var subclassAchievement = layero.find("select[name='subclassAchievement']");
                    subclassAchievement = subclassAchievement.find("option:selected").val();
                    var commodityType = layero.find("select[name='commodityType']");
                    commodityType = commodityType.find("option:selected").val();
                    var post = layero.find("input[name='post']:checked");
                    var postArr = loadParams(post);
                    var params = {
                        subclassID: data.id,
                        subclassName: layero.find("input[name='subclassName']").val(),
                        subclassAchievementID: subclassAchievement,
                        commodityTypeID: commodityType,
                        postCategoryIds: postArr.toString(),
                        // subclassEvaluatingID: subclassEvaluatingID,
                        createOperator: "${currentUser.trueName!}",
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
                            table.reload("productPerformanceTable");
                        } else {
                            layer.open({
                                title: '修改'
                                , content: '修改失败！'
                                , btn: ["关闭"]
                            });
                        }
                    })
                    // layer.close(); //如果设定了yes回调，需进行手工关闭
                },
                btn2: function () {
                    layer.close(b2);
                },
                success: function (layero) {
                    selectSubclass();
                    layero.find("input[name='subclassName']").val(data.data.subclassName);
                    var subclassAchievement = layero.find("select[name='subclassAchievement']");
                    subclassAchievement.find("option[value='"+data.data.subclassAchievementID+"']").attr("selected",true);
                    var commodityType = layero.find("select[name='commodityType']");
                    commodityType.find("option[value='"+data.data.commodityTypeID+"']").attr("selected",true);
                    //职位分类回显
                    $("#post").val("");
                    var postCategoryIds = data.data.postCategoryIds;
                    var postArr = postCategoryIds.trim().replace("[","").replace("]","").split(",");
                    for(var i in postArr){
                        for(var p in dataPostCategory){
                            if(dataPostCategory[p].postCategoryId == postArr[i]){
                                var input = "<input type='checkbox' name='post' value='"+dataPostCategory[p].postCategoryId+"' lay-skin='primary' title='"+dataPostCategory[p].name+"' checked>";
                                $("#post").append(input);
                            }
                        }
                    }
                    form.render();
                    //编辑则隐藏创建人和编辑人
                    layero.find("input[name='createOperator']").parent().parent().hide();
                    layero.find("input[name='modifyOperator']").parent().parent().hide();
                },
                area: ['600px', '500px'],
                // end: function () {
                //     window.location.reload();
                // }
            });
        }
    }

    function delProductPerformance(data){
        var type = data.type;
        if(type=="商品大类"){
            //删除数据库数据
            var url = dataHost+"/commodityType/deleteCommodityTypeByID";
            var params={
                commodityTypeId: data.id,
                modifyOperator: "${currentUser.trueName!}"
            };
            $.post(url,params,function (res) {
                if(res.responseStatusType.message=="Success"){
                    layer.open({
                        title: '删除'
                        ,content: '删除成功！'
                        ,btn: ["关闭"]
                    });
                    //重新加载表格
                    table.reload("productPerformanceTable");
                }else{
                    layer.open({
                        title: '删除'
                        ,content: '删除失败！'
                        ,btn: ["关闭"]
                    });
                }
            })
        }else{
            //删除数据库数据
            var url = dataHost+"/commodityType/deleteSubclass";
            var params={
                subclassID: data.id,
                modifyOperator: "${currentUser.trueName!}"
            };
            $.post(url,params,function (res) {
                if(res.responseStatusType.message=="Success"){
                    layer.open({
                        title: '删除'
                        ,content: '删除成功！'
                        ,btn: ["关闭"]
                    });
                    //重新加载表格
                    table.reload("productPerformanceTable");
                }else{
                    layer.open({
                        title: '删除'
                        ,content: '删除失败！'
                        ,btn: ["关闭"]
                    });
                }
            })
        }
    }

    function getData(){
        //请求职位数据
        $.ajax({
            url: storeHost+"/manage/beautician/selectPostCategoryNoPage",
            // data: param,
            method: "POST",
            async: false,
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    dataPostCategory = res.result;
                }
            }
        });
        //请求业绩数据
        $.ajax({
            url: dataHost+"/performance/selectPerformanceList",
            // data: param,
            method: "POST",
            async: false,
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    dataPerformance = res.result.list;
                }
            }
        });
        //请求行业数据
        $.ajax({
            url: storeHost+"/manage/industry/selectList",
            // data: param,
            method: "POST",
            async: false,
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    dataIndustry = res.result.list;
                }
            }
        });

        //请求商品大类数据
        $.ajax({
            url: dataHost+"/commodityType/selectCommodityTypeList",
            // data: param,
            method: "POST",
            async: false,
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    dataCommitType = res.result.list;
                }
            }
        });

        //请求商品小类数据
        $.ajax({
            url: dataHost+"/commodityType/selectSubclassList",
            // data: param,
            method: "POST",
            async: false,
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    dataSubclass = res.result.list;
                }
            }
        });
        //树形组件数据 dataProductTypeTree
        //表格数据 dataProductTypeTable
        for(var i in dataCommitType){
            var dataTypeJson = {};
            dataTypeJson.id = dataCommitType[i].commodityTypeID;
            dataTypeJson.title = dataCommitType[i].commodityTypeName;
            var dataChildren = new Array();
            for(var j in dataSubclass){
                if(dataCommitType[i].commodityTypeID == dataSubclass[j].commodityTypeID){
                    var dataChildrenJson = {};
                    dataChildrenJson.id = dataSubclass[j].subclassID;
                    dataChildrenJson.title = dataSubclass[j].subclassName;
                    dataChildrenJson.type = "商品小类";
                    dataChildren.push(dataChildrenJson);
                }
            }
            dataTypeJson.type = "商品大类";
            dataTypeJson.children = dataChildren;
            dataProductTypeTree.push(dataTypeJson);
        }
        for(var i in dataCommitType){
            var dataTypeJson = {};
            dataTypeJson.id = dataCommitType[i].commodityTypeID;
            dataTypeJson.title = dataCommitType[i].commodityTypeName;
            var industry = "";
            for(var j in dataIndustry){
                if(dataCommitType[i].commodityTypeIndustryID == dataIndustry[j].industryID){
                    industry = dataIndustry[j].industryName;
                }
            }
            dataTypeJson.industry = industry;
            // dataTypeJson.commodityProductType = dataCommitType[i].commodityProductType;
            dataTypeJson.type = "商品大类";
            dataTypeJson.data = dataCommitType[i];
            dataProductTypeTable.push(dataTypeJson);
        }
        for(var i in dataSubclass){
            var dataTypeJson = {};
            dataTypeJson.id = dataSubclass[i].subclassID;
            dataTypeJson.title = dataSubclass[i].subclassName;
            var performance = "";
            for(var j in dataPerformance){
                if(dataSubclass[i].subclassAchievementID == dataPerformance[j].achievementID){
                    performance = dataPerformance[j].achievementName;
                }
            }
            dataTypeJson.subclassAchievement = performance;
            dataTypeJson.commodityTypeID = dataSubclass[i].commodityTypeID;
            // dataTypeJson.postID = dataSubclass[i].postID;
            // dataTypeJson.subclassEvaluatingID = dataSubclass[i].subclassEvaluatingID;
            dataTypeJson.type = "商品小类";
            dataTypeJson.data = dataSubclass[i];
            dataProductTypeTable.push(dataTypeJson);
        }
    }

    function addNewProductPerformance(){
       var  type = $("select[name='type']").val();
       if(type == null || type == undefined || type == ""){
           layer.msg("请选择商品分类类别");
           return
       }
       //商品大类
       if(type==1){
           var a1 = layer.open({
               type: 1,
               title: '添加商品大类',
               content: $('#CommodityType'),
               closeBtn: 1,
               btn: ['提交', '取消'],
               yes: function (index, layero) {
                   var url = dataHost + "/commodityType/insertCommodityType";
                   //下拉框
                   var commodityTypeIndustryID = layero.find("select[name='commodityTypeIndustryID']");
                   commodityTypeIndustryID = commodityTypeIndustryID.find("option:selected").val();
                   var commodityProductType = layero.find("select[name='commodityProductType']");
                   commodityProductType = commodityProductType.find("option:selected").val();
                   var params = {
                       commodityTypeIndustryID: commodityTypeIndustryID,
                       commodityTypeName: layero.find("input[name='commodityTypeName']").val(),
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
                           table.reload("productPerformanceTable");
                       } else {
                           layer.open({
                               title: '添加'
                               , content: '添加失败！'
                               , btn: ["关闭"]
                           });
                       }
                   })
                   // layer.close(); //如果设定了yes回调，需进行手工关闭
               },
               btn2: function () {
                   layer.close(a1);
               },
               success: function (layero) {
                   selectCommitType();
                   layero.find("input[name='commodityTypeName']").val("");
                   var commodityProductType = layero.find("select[name='commodityProductType']");
                   commodityProductType.find("option[value='']").attr("selected",true);
                   form.render("select","CommodityType");
                   //编辑则隐藏创建人和编辑人
                   layero.find("input[name='createOperator']").parent().parent().hide();
                   layero.find("input[name='modifyOperator']").parent().parent().hide();
               },
               area: ['600px', '500px'],
               // end: function () {
               //     window.location.reload();
               // }
           });
       }else{
           var a2 = layer.open({
               type: 1,
               title: '添加商品小类',
               content: $('#Subclass'),
               closeBtn: 1,
               btn: ['提交', '取消'],
               yes: function (index, layero) {
                   var url = dataHost + "/commodityType/insertSubclass";
                   //下拉框
                   var subclassAchievement = layero.find("select[name='subclassAchievement']");
                   subclassAchievement = subclassAchievement.find("option:selected").val();
                   var commodityType = layero.find("select[name='commodityType']");
                   commodityType = commodityType.find("option:selected").val();
                   var post = layero.find("input[name='post']:checked");
                   var postArr = loadParams(post);
                   var params = {
                       subclassName: layero.find("input[name='subclassName']").val(),
                       subclassAchievementID: subclassAchievement,
                       commodityTypeID: commodityType,
                       postCategoryIds: postArr.toString(),
                       // subclassEvaluatingID: subclassEvaluatingID,
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
                                   layer.close(a2);
                               }
                           });
                           //重新加载表格
                           table.reload("productPerformanceTable");
                       } else {
                           layer.open({
                               title: '添加'
                               , content: '添加失败！'
                               , btn: ["关闭"]
                           });
                       }
                   })
                   // layer.close(); //如果设定了yes回调，需进行手工关闭
               },
               btn2: function () {
                   layer.close(a2);
               },
               success: function (layero) {
                   selectSubclass();
                   layero.find("input[name='subclassName']").val("");
                   //职位分类回显
                   $("#post").val("");
                   form.render();
                   //编辑则隐藏创建人和编辑人
                   layero.find("input[name='createOperator']").parent().parent().hide();
                   layero.find("input[name='modifyOperator']").parent().parent().hide();
               },
               area: ['600px', '500px'],
               // end: function () {
               //     window.location.reload();
               // }
           });
       }
    }
    function loadParams(name) {
        var arr = new Array(name.length);
        for (var i = 0; i < name.length; i++) {
            // arr[i] = name[i].title
            arr[i] = name[i].value
        }
        return arr;
    }

    //数据显示到下拉框
    function selectSubclass(){
        $("select[name='subclassAchievement']").val("<option value='' checked>请选择</option>");
        $("select[name='commodityType']").val("<option value='' checked>请选择</option>");
        for (var p in dataPerformance) {
            var option = "<option value='" + dataPerformance[p].achievementID + "'>" + dataPerformance[p].achievementName + "</option>";
            $("select[name='subclassAchievement']").append(option);
        }
        for (var p in dataCommitType) {
            var option = "<option value='" + dataCommitType[p].commodityTypeID + "'>" + dataCommitType[p].commodityTypeName + "</option>";
            $("select[name='commodityType']").append(option);
        }
        //职位分类(监听大类的选择，大类选择后获取大类的行业，获取行业职位分类)
        // form.render("select","Subclass");
    }
    function selectCommitType() {
        $("select[name='commodityTypeIndustry']").val("<option value='0' checked>请选择</option>");
        for (var p in dataIndustry) {
            var option = "<option value='" + dataIndustry[p].industryID + "'>" + dataIndustry[p].industryName + "</option>";
            $("select[name='commodityTypeIndustry']").append(option);
        }
        // form.render("select","CommodityType");
    }

</script>

</body>
</html>