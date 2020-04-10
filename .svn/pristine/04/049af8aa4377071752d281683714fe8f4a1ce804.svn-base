<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>备份还原</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${basePath!}/layui/css/layui.css"  media="all">
    <link rel="stylesheet" href="${basePath!}/css/index.css" media="all"/>
    <script src="${basePath!}/js/jquery.min.js" type="text/javascript"></script>
    <script src="${basePath!}/layui/layui.js" charset="utf-8"></script>
    <script src="${basePath!}/js/host.js" type="text/javascript"></script>
    <#include "../baseFtl/pageAuth.ftl" />
    <style>
        .resetLabel {
            width: 42px;
        }
    </style>
</head>
<body>
<div class="layui-fluid">
    <div class="demoTable layui-form" lay-filter="demoTable">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label resetLabel">操作人</label>
                <div class="layui-input-inline">
                    <select name="createOperator" lay-filter="createOperator" lay-verify="required">
                        <option value="">请选择</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">操作</label>
                <div class="layui-input-inline">
                    <select name="operation" lay-filter="operation" lay-verify="required">
                        <option value="">请选择</option>
                        <option value="备份">备份</option>
                        <option value="还原">还原</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">操作时间</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="operationDate" id="operationDate" placeholder="yyyy-MM-dd">
                </div>
            </div>
            <div class="layui-inline">
                <button class="layui-btn" data-type="search" ><i class="layui-icon layui-icon-search"></i></button>
            </div>
        </div>
        <div class="layui-form-item">
            <div class=" layui-btn-group layui-inline" <#--style="margin-left: 2px"-->>
                <a class="layui-btn layui-btn-xstree " title="刷新当前页" href="javascript:void(0);"
                   onclick="layer.load(1);window.location.reload(true);"><i class="layui-icon"></i>刷新</a>
                <a class="layui-btn layui-btn-xstree"  onclick="backup();">备份</a>
                <a class="layui-btn layui-btn-xstree" id="backupAll" onclick="backupAll();">全部备份</a>
                <a class="layui-btn layui-btn-xstree"  onclick="restore();">还原</a>
            </div>
        </div>
    </div>

    <#--表格:显示备份还原记录-->
    <table id="backupRestoreRecord" lay-filter="demo"></table>
</div>
<#--表格:备份-->
<form id="backup" class="layui-form backup" action="" lay-filter="backup" method="post" hidden="hidden">
    <div class="layui-form-item">
        <label class="layui-form-label">数据库</label>
        <div class="layui-input-inline">
            <select name="tableSchema" lay-filter="tableSchema">
                <option value="">请选择</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">备份表</label>
        <div class="layui-input-inline">
            <select name="flag" lay-filter="flag">
                <option value="">请选择</option>
                <option value=true>是</option>
                <option value=false>否</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item" hidden="hidden">
        <label class="layui-form-label">表</label>
        <div class="layui-input-inline">
            <select name="tableName" lay-filter="tableName">
                <option value="">请选择</option>
            </select>
        </div>
    </div>
</form>
<#--表格:还原-->
<form id="restore" class="layui-form restore" action="" lay-filter="restore" method="post" hidden="hidden">
    <div class="layui-form-item">
        <label class="layui-form-label">数据库</label>
        <div class="layui-input-block">
            <input type="tableSchema" name="tableSchema" lay-verify="tableSchema" autocomplete="off" placeholder="请输入目标数据库" class="layui-input">
        </div>
        <#--<div class="layui-input-inline" hidden="hidden">
            <select name="tableSchema" lay-filter="tableSchema">
                <option value="">请选择</option>
            </select>
        </div>-->
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">还原文件</label>
        <div class="layui-input-inline">
            <select name="fileName" lay-filter="fileName">
                <option value="">请选择</option>
            </select>
        </div>
    </div>
</form>

<script>
    var data1 = null,table,element;
    //数据显示,分页实现
    layui.use(['table','laydate','form','element'], function(){
        table = layui.table;
        element = layui.element;
        var  laydate = layui.laydate,
        form = layui.form;

        //加载搜索的时间
        laydate.render({
            elem: '#operationDate'
            ,format: 'yyyy-MM-dd'
            // ,done: function (value,data,endDate) {
            //     console.log(value); //得到日期生成的值，如：2017-08-18
            //     console.log(date); //得到日期时间对象：{year: 2017, month: 8, date: 18, hours: 0, minutes: 0, seconds: 0}
            //     console.log(endDate); //得结束的日期时间对象，开启范围选择（range: true）才会返回。对象成员同上。
            // }
        });
        //加载表格
        table.render({
            elem: '#backupRestoreRecord'
            ,url: systemHost+"/manage/selectBackupRestoreList"
            ,cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            ,page:true          //显示分页默认不显示
            ,method: 'post'
            ,request: {
                pageName: 'pageNum', //页码的参数名称，默认：page
                limitName: 'pageSize' //每页数据量的参数名，默认：limit
            }
            ,parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                data1 = res.result.list;
                showOperator();//加载搜索的操作人
                return {
                    "code": 0, //解析接口状态
                    "msg": res.responseStatusType.error.errorMsg, //解析提示文本
                    "count": res.result==null?0:res.result.total, //解析数据长度
                    "data": res.result==null?0:res.result.list //解析数据列表
                }
            }
            ,cols: [[
                {field: 'backupRestoreId', title: 'Id', width:60, sort: true, fixed: 'left'}
                ,{field: 'fileUrl', title: '操作文件',align: 'center', templet: function (d) {
                    var fileName = d.fileUrl.split("/")[2];
                    return d.fileUrl == "" || d.fileUrl == null ?
                        "<div class='imgs'><img src='/noImg.png' style='width:60px;height: 30px'></div>" :
                        "<div class='imgs'><img src='http://"+ d.fileUrl +
                        "'>"+fileName+"</div>";
                    }
                }
                ,{field: 'startTime', title: '操作开始时间'}
                ,{field: 'endTime', title: '操作结束时间'}
                ,{field: 'fileSize', title: '文件大小'}
                ,{field: 'content', title: '内容'}
                ,{field: 'operation', title: '操作'}
                ,{field: 'status', title: '状态',hide:true}
                ,{field: 'createOperator', title: '操作人'}
                ,{field: 'createTime', title: '操作时间'}
                ,{field: 'modifyOperator', title: '修改人',hide:true}
                ,{field: 'dataChangeLastTime', title: '数据最后更新时间',hide:true}
            ]]
            ,done: function () {
                $('.imgs').prev().hide();
            }
            ,id: 'backupRestoreRecord'
        });

        var $ = layui.$, active = {
            search: function () {
                var operation = $(".demoTable select[name='operation'] option:selected").val(),
                    createOperator = $(".demoTable select[name='createOperator'] option:selected").val(),
                    operationDate = $(".demoTable input[name='operationDate']").val();
                var params = {};
                if(operation != null && operation != ""){
                    if(createOperator != null && createOperator != ""){
                        if(operationDate != null && operationDate != ""){
                            params.endTime = operationDate+" 00:00:00";
                        }
                        params.createOperator = createOperator;
                    }
                    if(operationDate != null && operationDate != ""){
                        params.endTime = operationDate+" 00:00:00";
                    }
                    params.operation = operation;
                }
                if((operation == null || operation == "") &&
                    (createOperator != null && createOperator != "")){
                    if(operationDate != null && operationDate != ""){
                        params.endTime = operationDate+" 00:00:00";
                    }
                    params.createOperator = createOperator;
                }
                if((operation == null || operation == "") &&
                    (createOperator == null || createOperator == "") &&
                    (operationDate != null && operationDate != "")){
                    params.endTime = operationDate+" 00:00:00";
                }
                table.reload('backupRestoreRecord', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: params
                }, 'data');
            }
        };

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        // form.on('select(tableSchema)',function (obj) {
        //     var schema = obj.value;    //option的值
        //     var id = obj.elem.parentNode.parentNode.parentNode.getAttribute("lay-filter");
        //     showTable(id,schema);
        // });
        form.on('select(flag)',function (obj) {
            var flag = obj.value;    //option的值
            var id = obj.elem.parentNode.parentNode.parentNode.getAttribute("lay-filter");
            if(flag == "true"){
                var schema = $("."+id+" select[name='tableSchema']").find("option:selected").val();    //option的值
                showTable(id,schema);
                $("."+id+" select[name='tableName']").parent().parent().show();
            }else {
                $("."+id+" select[name='tableName']").next().children().eq(1).html(
                    '<dd lay-value="">请选择</dd>');
                $("."+id+" select[name='tableName']").html('<option value="">请选择</option>');
                $("."+id+" select[name='tableName']").parent().parent().hide();
            }
        });

    });

    //加载操作人
    function showOperator(){
        var html1 = '';
        var html2 = '';
        for(var i=0;i<data1.length;i++){
            html1 += '<dd lay-value="' + data1[i].createOperator + '">' + data1[i].createOperator + '</dd>';
            html2 += '<option value="' + data1[i].createOperator + '">' + data1[i].createOperator + '</option>';
        }
        $(".demoTable select[name='createOperator']").next().children().eq(1).html(html1);
        $(".demoTable select[name='createOperator']").html(html2);
        $(".demoTable select[name='createOperator']").children("option").eq(0).attr("selected", "selected");
        layui.form.render('select', 'demoTable'); // 更新 lay-filter="demoTable" 所在容器内的全部 select 状态
    }

    //还原
    function restore() {
        var a2 = layer.open({
            type: 1
            ,title: '还原'
            ,content: $('#restore')
            ,closeBtn: 1
            ,btn: ['确定', '取消']
            ,yes: function(index,layero){
                //提交还原请求
                var tableSchema = layero.find("input[name='tableSchema']").val();
                // var tableSchema = layero.find("select[name='tableSchema']");
                // tableSchema = tableSchema.find("option:selected").val();
                var fileName = layero.find("select[name='fileName']");
                fileName = fileName.find("option:selected").val();
                var fileUrl = null;
                for(var i=0;i<data1.length;i++){
                    if(data1[i].fileUrl.split("/")[2] == fileName){
                        fileUrl = data1[i].fileUrl;
                    }
                }
                var params = {
                    tableSchema: tableSchema
                    ,fileUrl: fileUrl
                    ,createOperator: "${currentUser.trueName!}"
                };
                var url = systemHost+"/manage/restore";
                $.post(url,params,function (res) {
                    if (res.responseStatusType.message == "Success") {
                        layer.open({
                            title: '还原'
                            , content: '还原成功！'
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
                            title: '还原'
                            , content: '还原失败！'
                            , btn: ["关闭"]
                        });
                    }
                });
                // layer.close(index);
            }
            ,btn2: function(){
                layer.closeAll();
            }
            ,success: function (layero) {
                //加载可选项
                // showSchema("restore");
                showFile();
            }
            ,area:['600px', '500px']
            ,end:function(){
                window.location.reload();
            }
        });
    }
    //备份
    function backup() {
        var a1 = layer.open({
            type: 1
            ,title: '备份'
            ,content: $('#backup')
            ,closeBtn: 1
            ,btn: ['确定', '取消']
            ,yes: function(index,layero){
                //提交备份请求
                var tableName = layero.find("select[name='tableName']");
                tableName = tableName.find("option:selected").val();
                var tableSchema = layero.find("select[name='tableSchema']");
                tableSchema = tableSchema.find("option:selected").val();
                var params = {
                    tableName: tableName
                    ,tableSchema: tableSchema
                    ,createOperator: "${currentUser.trueName!}"
                };
                var url = systemHost+"/manage/backup";
                $.post(url,params,function (res) {
                    if (res.responseStatusType.message == "Success") {
                        layer.open({
                            title: '备份'
                            , content: '备份成功！'
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
                            title: '备份'
                            , content: res.responseStatusType.error.errorMsg == null ? '备份失败': res.responseStatusType.error.errorMsg
                            , btn: ["关闭"]
                        });
                    }
                });
                // layer.close(index);
            }
            ,btn2: function(){
                layer.closeAll();
            }
            ,success: function (layero) {
                //加载可选项
                showSchema("backup");
            }
            ,area:['600px', '500px']
            ,end:function(){
                window.location.reload();
            }
        });
    }
    /**
     * 查询过程显示的进度条
     * layer:固定参数；
     * text：定义到页面上的显示信息.例如：text='正在查询中。。'
     */
    // 显示正在查询的转态<br>var text='正在加载中。。'
    function showLoading() {
        //不可点击按钮
        var DISABLED = 'layui-btn-disabled';
        if($("#backupAll").hasClass(DISABLED)) return;
        $("#backupAll").addClass(DISABLED);
        var a = layer.msg("demo",{
            title: '备份进度',
            time: 60000, //20s后自动关闭
            skin: 'layui-layer-molv',
            area: ['800px', '100px'],
            content: "<div class=\"layui-progress layui-progress-big\" lay-showpercent=\"true\" lay-filter=\"demo\">\n" +
                " <div class=\"layui-progress-bar layui-bg-red\" lay-percent=\"0%\"></div>\n" +
                " </div>\n"
        });
        element.render('progress');
        //模拟loading
        var n = 0, timer = setInterval(function(){
            n = n + Math.random()*7|0;
            if(n>100){
                n = 100;
                clearInterval(timer);
                $("#backupAll").removeClass(DISABLED);
            }
            element.progress('demo', n+'%');
        }, 300+Math.random()*2000);
        return a;
        // layer.msg(text, {
        //     icon: 16, //代表加载的图标
        //     time: 0,  //0秒关闭（如果不配置，默认是3秒）
        //     shade: 0.5
        // });
    }
    // 查询结果后隐藏状态
    function hideLoading(i)
    {
        layer.close(i);
    }

    //全部备份
    function backupAll() {
        var url = systemHost+"/manage/backup";
        var params = {
            // tableName: tableName
            // ,tableSchema: tableSchema
            createOperator: "${currentUser.trueName!}"
        };
        $.ajax({
            url: url,
            data: params,
            method: "POST",
            async: true,
            beforeSend: function () {
                i=showLoading();
            },
            success:function (res) {
                hideLoading(i);
                if (res.responseStatusType.message == "Success") {
                    layer.open({
                        title: '全部备份'
                        , content: '全部备份成功！'
                        , btn: ["关闭"]
                        , yes: function (index) {
                            layer.close(index); //如果设定了yes回调，需进行手工关闭
                        }
                    });
                    //重新加载表格
                    table.render("backupRestoreRecord");
                } else {
                    layer.open({
                        title: '全部备份'
                        , content: res.responseStatusType.error.errorMsg == null?"备份失败":res.responseStatusType.error.errorMsg
                        , btn: ["关闭"]
                    });
                }
            }
        });
    }

    function showFile() {
        var html1 = '';
        var html2 = '';
        for(var i=0;i<data1.length;i++){
            var fileName = data1[i].fileUrl.split("/")[2];
            html1 += '<dd lay-value="' + fileName + '">' + fileName + '</dd>';
            html2 += '<option value="' + fileName + '">' + fileName + '</option>';
        }
        $(".restore select[name='fileName']").next().children().eq(1).html(html1);
        $(".restore select[name='fileName']").html(html2);
        $(".restore select[name='fileName']").children("option").eq(0).attr("selected", "selected");
        layui.form.render('select', 'restore'); // 更新 lay-filter="demoTable" 所在容器内的全部 select 状态
    }
    
    function showSchema(id) {
        var url = systemHost+"/manage/showSchema";
        var html1 = '';
        var html2 = '';
        $.post(url,function(res){
            if (res.responseStatusType.message == "Success") {
                //加载店铺
                var data = res.result;
                for (var i = 0; i < data.length; i++) {
                    html1 += '<dd lay-value="' + data[i] + '">' + data[i] + '</dd>';
                    html2 += '<option value="' + data[i] + '">' + data[i] + '</option>';
                }
                $("."+id+" select[name='tableSchema']").next().children().eq(1).html(html1);
                $("."+id+" select[name='tableSchema']").html(html2);
                $("."+id+" select[name='tableSchema']").children("option").eq(0).attr("selected", "selected");
                layui.form.render('select',id); // 更新 lay-filter="editForm" 所在容器内的全部 select 状态
            }
        });
    }

    function showTable(id,schema) {
        var url = systemHost+"/manage/showTable";
        var params = {
            schema: schema
        };
        var html1 = '',html2 = '';
        $.post(url,params,function(res){
            if (res.responseStatusType.message == "Success") {
                //加载店铺
                var data = res.result;
                for (var i = 0; i < data.length; i++) {
                    html1 += '<dd lay-value="' + data[i] + '">' + data[i] + '</dd>';
                    html2 += '<option value="' + data[i] + '">' + data[i] + '</option>';
                }
                $("."+id+" select[name='tableName']").next().children().eq(1).html(html1);
                $("."+id+" select[name='tableName']").html(html2);
                $("."+id+" select[name='tableName']").children("option").eq(0).attr("selected", "selected");
                layui.form.render('select',id); // 更新 lay-filter="editForm" 所在容器内的全部 select 状态
            }
        });
    }

</script>
</body>
</html>