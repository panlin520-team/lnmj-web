<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>限购设置</title>
    <#--<meta name="renderer" content="webkit">-->
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${basePath!}/layui/css/layui.css"  media="all">
    <link rel="stylesheet" href="${basePath!}/css/index.css" media="all"/>
    <script src="${basePath!}/js/jquery.min.js" type="text/javascript"></script>
    <script src="${basePath!}/layui/layui.js" charset="utf-8"></script>
    <script src="${basePath!}/js/host.js" type="text/javascript"></script>
    <#include "../baseFtl/pageAuth.ftl" />
</head>
<body>
<div class="layui-fluid">
    <#-- 树：限购参数设置 -->
    <div id="parameter" class="demo-tree demo-tree-box parameter" style="width: 400px; height: 450px;margin: 10px; overflow: scroll;border: 1px solid #d2d2d2;"></div>
</div>
<#-- 参数 -->
<form id="parameterForm" class="layui-form parameterForm layui-form-pane layui-personal" action="" lay-filter="parameterForm" method="post" hidden="true">
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
                <input type="text" name="parameterName" lay-verify="required" autocomplete="off" placeholder="请输入参数名" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">参数值</label>
            <div class="layui-input-block">
                <input type="text" name="parameterValue" lay-verify="required" autocomplete="off" placeholder="请输入参数值" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">排序</label>
            <div class="layui-input-block">
                <input type="text" name="parameterSort" lay-verify="required" autocomplete="off" placeholder="0-9999" class="layui-input">
            </div>
        </div>
    </form><#-- 参数类型 -->
<#-- 参数类型 -->
<form id="parameterTypeForm" class="layui-form parameterTypeForm layui-form-pane layui-personal" action="" lay-filter="parameterTypeForm" method="post" hidden="true">
    <div class="layui-form-item">
        <label class="layui-form-label">参数类型名</label>
        <div class="layui-input-block">
            <input type="text" name="parameterType" lay-verify="required" autocomplete="off" placeholder="请输入参数类型名" class="layui-input">
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

<script>
    var dataType = [],dataParameter = [],data1 = [],tree = null,tree1 = null,layer = null,util = null,form = null;
    layui.use(['tree', 'util','layer','form'], function() {
        tree = layui.tree;
        layer = layui.layer;
        util = layui.util;
        form = layui.form;

        getData();
        showTree();
    })
    function showTree(){
        tree1 = tree.render({
            id:"parameter"
            ,elem: '#parameter'
            ,data: data1
            // ,showCheckbox:true
            // ,isJump: true //是否允许点击节点时弹出新窗口跳转
            // ,edit: ['add', 'update', 'del'] //操作节点的图标
            ,click: function(obj){  //被点击的回调
                // console.log(obj);
                showParameterTypeSelect();
                var data = obj.data,elem = obj.elem;
                if(data.cId == null){ //参数
                    showParameter(data,elem);
                }else { //参数类型
                    showParameterType(data,elem);
                }
                // layer.msg(JSON.stringify(obj.data));
            }
            // ,oncheck: function(obj){    //复选框被点击的回调
            //     console.log(obj.data); //得到当前点击的节点数据
            //     console.log(obj.checked); //得到当前节点的展开状态：open、close、normal
            //     console.log(obj.elem); //得到当前节点元素
            // }
            // ,operate: function(obj){
            //     var type = obj.type; //得到操作类型：add、edit、del
            //     var data = obj.data; //得到当前节点的数据
            //     var elem = obj.elem; //得到当前节点元素
            //     // Ajax 操作
            //     var id = data.id; //得到节点索引
            //     if(type === 'add'){ //增加节点
            //         addParameter(obj);
            //         //返回 key 值
            //         // return 123;
            //     } else if(type === 'update'){ //修改节点
            //         addParameter(obj);
            //         // console.log(elem.find('.layui-tree-txt').html()); //得到修改后的内容
            //     } else if(type === 'del'){ //删除节点
            //         addParameter(obj);
            //     };
            // }
        });
        // tree.getChecked()
    }
    function showParameter(data,elem){
        var a1 = layer.open({
            type: 1,
            title: '参数',
            content: $('#parameterForm'),
            closeBtn: 1,
            btn: ['修改', '删除'],
            yes: function(index,layero){
                var parameterTypeId = layero.find("select[name='parameterTypeId']");
                parameterTypeId = parameterTypeId.find("option:selected").val();
                var url = systemHost+"/manage/system/updateParameter",parameterArray = new Array(),
                  json = {
                         parameterId:data.id
                         ,parameterTypeId:parameterTypeId
                         ,parameterName:layero.find("input[name='parameterName']").val()
                        ,parameterValue: layero.find("input[name='parameterValue']").val()
                        ,parameterSort: layero.find("input[name='parameterSort']").val()
                        ,modifyOperator:"${currentUser.trueName!}"
                    };
                parameterArray.push(json);
                var params = {parameterArray: JSON.stringify(parameterArray)};
                $.post(url,params,function (res) {
                    if(res.responseStatusType.message=="Success"){
                        layer.open({
                            title: '修改'
                            ,content: '修改成功！'
                            ,btn: ["关闭"]
                            ,yes: function (index) {
                                layer.close(index);
                                layer.close(a1);
                            }
                        });
                        //重新加载tree
                        getData();
                        tree.reload("parameter");
                    }else{
                        layer.open({
                            title: '修改'
                            ,content: '修改失败！'
                            ,btn: ["关闭"]
                        });
                    }
                })
            },
            btn2: function(index,layero){
                //删除数据库数据
                var url = systemHost+"/manage/system/deleteParameter";
                var params={
                    parameterId: data.id,
                    modifyOperator: "${currentUser.trueName!}"
                };
                $.post(url,params,function (res) {
                    if(res.responseStatusType.message=="Success"){
                        layer.open({
                            title: '删除'
                            ,content: '删除成功！'
                            ,btn: ["关闭"]
                            ,yes: function (index) {
                                layer.close(index);
                                layer.close(a1);
                            }
                        });
                        //重新加载tree
                        getData();
                        tree.reload("parameter");
                    }else{
                        layer.open({
                            title: '删除'
                            ,content: '删除失败！'
                            ,btn: ["关闭"]
                        });
                    }
                })
            },
            success: function(layero,index){
                //回显
                var accountType = layero.find("select[name='parameterTypeId']");
                accountType.find("option[value='"+data.data.parameterTypeId+"']").attr("selected",true);
                layero.find("input[name='parameterName']").val(data.title);
                layero.find("input[name='parameterValue']").val(data.data.parameterValue);
                layero.find("input[name='parameterSort']").val(data.data.parameterSort);
                form.render("select","parameterForm");
            },
            area:['600px', '500px']
        });
    }
    function showParameterType(data,elem){
        var a2 = layer.open({
            type: 1,
            title: '参数类型',
            content: $('#parameterTypeForm'),
            closeBtn: 1,
            btn: ['修改', '删除'],
            yes: function(index,layero){
                var parentId = layero.find("select[name='parentId']");
                parentId = parentId.find("option:selected").val();
                var url = systemHost+"/manage/system/updateParameterType",
                    params = {
                        parameterTypeId:data.id
                        ,parentId:parentId
                        ,parameterType:layero.find("input[name='parameterType']").val()
                        ,modifyOperator:"${currentUser.trueName!}"
                    };
                $.post(url,params,function (res) {
                    if(res.responseStatusType.message=="Success"){
                        layer.open({
                            title: '修改'
                            ,content: '修改成功！'
                            ,btn: ["关闭"]
                            ,yes: function (index) {
                                layer.close(index);
                                layer.close(a2);
                            }
                        });
                        //重新加载tree
                        getData();
                        tree.reload("parameter");
                    }else{
                        layer.open({
                            title: '修改'
                            ,content: '修改失败！'
                            ,btn: ["关闭"]
                        });
                    }
                })
            },
            btn2: function(index,layero){
                //删除数据库数据
                var url = systemHost+"/manage/system/deleteParameterType";
                var params={
                    parameterTypeId: data.id,
                    modifyOperator: "${currentUser.trueName!}"
                };
                $.post(url,params,function (res) {
                    if(res.responseStatusType.message=="Success"){
                        layer.open({
                            title: '删除'
                            ,content: '删除成功！'
                            ,btn: ["关闭"]
                            ,yes: function (index) {
                                layer.close(index);
                                layer.close(a2);
                            }
                        });
                        //重新加载tree
                        getData();
                        tree.reload("parameter",{

                        });
                    }else{
                        layer.open({
                            title: '删除'
                            ,content: '删除失败！'
                            ,btn: ["关闭"]
                        });
                    }
                })
            },
            success: function(layero,index){
                //回显
                // if(data.cId == 0){  //最高父类
                //
                // }
                var accountType = layero.find("select[name='parentId']");
                accountType.find("option[value='"+data.cId+"']").attr("selected",true);
                layero.find("input[name='parameterType']").val(data.title);
                form.render("select","parameterTypeForm");
            },
            area:['600px', '500px']
        });
    }

    function showParameterTypeSelect(){
        $("#parameterForm select[name='parameterTypeId']").html("<option value=''>请选择</option>");
        $("#parameterTypeForm select[name='parentId']").html("<option value=''>请选择</option>");
        for (var p in dataType) {
            var option = "<option value='" + dataType[p].parameterTypeId + "'>" + dataType[p].parameterType + "</option>";
            $("#parameterForm select[name='parameterTypeId']").append(option);
            $("#parameterTypeForm select[name='parentId']").append(option);
        }
        form.render("select","parameterForm");
        form.render("select","parameterTypeForm");
    }
    function getData(){
        data1 = []; //重新获取数据，将之前的数据置空
        //获取数据
        getParameterType();
        for(var  p in dataType){
            var json = {title: dataType[p].parameterType
                ,id: dataType[p].parameterTypeId
                ,data:dataType[p],
                cId:dataType[p].parentId};
            if(dataType[p].parentId == 0){
                getParameter(dataType[p].parameterTypeId);
                var children = [];
                for (var q in dataParameter) {
                    children.push({title: dataParameter[q].parameterName
                        ,id: dataParameter[q].parameterId
                        ,data:dataParameter[q]
                        ,cId:null})
                }
                json.children = children;
                data1.push(json);
                dataParameter = [];
            }
        }
        for(var  p in dataType){
            if(dataType[p].parentId != 0){
                var json = {title: dataType[p].parameterType
                    ,id: dataType[p].parameterTypeId
                    ,data:dataType[p]
                    ,cId:dataType[p].parentId};
                for(var i in data1){
                    if(dataType[p].parentId == data1[i].id){
                        getParameter(dataType[p].parameterTypeId);
                        var children = [];
                        for (var q in dataParameter) {
                            children.push({title: dataParameter[q].parameterName
                                ,id: dataParameter[q].parameterId
                                ,data:dataParameter[q]
                                ,cId:null})
                        }
                        json.children = children;
                        data1[i].children.push(json);
                        dataParameter = [];
                    }
                }
            }
        }
    }
    function getParameterType(){
        $.ajax({
            url: systemHost+"/manage/system/selectParameterTypeList",
            async:false,
            method: "POST",
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    dataType = res.result.list;
                }
            }
        })
    }
    function getParameter(id){
        $.ajax({
            url: systemHost+"/manage/system/selectParameterList",
            data:{parameterTypeId:id},
            async:false,
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