<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>客户评测记录</title>
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
    <#include "../../baseFtl/pageAuth.ftl" />
    <style>
        .resetLabel {
            width: 133px;
        }
    </style>
</head>
<body>

<div class="layui-fluid">
    <div class="demoTable layui-form">
        <#------表格上的操作工具栏----->
         <div class="layui-form-item">
             <div class="layui-inline">
                 <label class="layui-form-label">测评</label>
                 <div class="layui-input-inline">
                     <select name="evaluatingIDSearch" id="evaluatingIDSearch" lay-filter="evaluatingIDSearch" lay-verify="required">
                         <option value="">请选择</option>
                     </select>
                 </div>
             </div>
             <div class="layui-inline">
                 <label class="layui-form-label">测评等级</label>
                 <div class="layui-input-inline">
                     <select name="evaluatingLevelSearch" id="evaluatingLevelSearch" lay-filter="evaluatingLevelSearch" lay-verify="required">
                         <option value="">请选择</option>
                     </select>
                 </div>
             </div>
            <div class="layui-inline" id="evaluatingLevel">
                <div class="layui-inline">
                    <button class="layui-btn" data-type="search"><i class="layui-icon layui-icon-search"></i></button>
                </div>
            </div>
         </div>
        <#--表格:显示客户评测-->
        <table id="userevaluating" lay-filter="demo"></table>
    </div>
</div>


<script>
    //列表显示
    layui.use(['table', 'layer', 'jquery', 'form'], function () {
        var table = layui.table;
        var form = layui.form;
        loadEvaluatingRecordSearch(form);

        table.render({
            elem: '#userevaluating'
            , url: dataHost + "/statistic/selectUserEvaluatingList"
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
                    "msg": "", //解析提示文本
                    "count": res.result == null ? 0 : res.result.total, //解析数据长度
                    "data": res.result == null ? 0 : res.result.list //解析数据列表
                };
            }
            , cols: [[
                {type: 'checkbox', fixed: 'left', width: 40}
                , {field: 'userId', title: ' 用户编号', fixed: 'left'}
                , {field: 'evaluatingName', title: '客户评测名称', fixed: 'left'}
                , {field: 'evaluatingLevelName', title: ' 客户评测等级', fixed: 'left'}
                , {field: 'evaluatingAmount', title: ' 消费金额', sort: true, fixed: 'left'}
                , {field: 'evaluatingNumber', title: ' 消费个数', sort: true, fixed: 'left'}
                , {field: 'evaluatingDateStart', title: ' 开始时间', fixed: 'left'}
                , {field: 'evaluatingDateEnd', title: ' 结束时间', fixed: 'left'}
                , {field: 'evaluatingDetailed', title: ' 评测明细', fixed: 'left'}
                , {field: 'remark', title: ' 备注', fixed: 'left'}
            ]]
        });

        var $ = layui.$, active = {
            search: function () {
                var evaluatingID = $("select[name='evaluatingIDSearch'] option:selected").val();
                var evaluatingLevelID = $("select[name='evaluatingLevelSearch'] option:selected").val();
                //根据测评和测评等级查询
                table.render({
                    elem: '#userevaluating'
                    , url: dataHost + "/statistic/selectUserEvaluatingList"
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
                            "msg": "", //解析提示文本
                            "count": res.result == null ? 0 : res.result.total, //解析数据长度
                            "data": res.result == null ? 0 : res.result.list //解析数据列表
                        };
                    },
                    where:{
                        evaluatingID:evaluatingID,
                        evaluatingLevelID:evaluatingLevelID
                    }
                    , cols: [[
                        {type: 'checkbox', fixed: 'left', width: 40}
                        , {field: 'userId', title: ' 用户编号', fixed: 'left'}
                        , {field: 'evaluatingName', title: '客户评测名称', fixed: 'left'}
                        , {field: 'evaluatingLevelName', title: ' 客户评测等级', fixed: 'left'}
                        , {field: 'evaluatingAmount', title: ' 消费金额', sort: true, fixed: 'left'}
                        , {field: 'evaluatingNumber', title: ' 消费个数', sort: true, fixed: 'left'}
                        , {field: 'evaluatingDateStart', title: ' 开始时间', fixed: 'left'}
                        , {field: 'evaluatingDateEnd', title: ' 结束时间', fixed: 'left'}
                        , {field: 'evaluatingDetailed', title: ' 评测明细', fixed: 'left'}
                        , {field: 'remark', title: ' 备注', fixed: 'left'}
                    ]]
                });
            }
        };

        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

    })
    function loadEvaluatingRecordSearch(form) {
        //加载测评
        var dataEvaluating = loadEvaluatingReturn();
        //加载测评等级
        var dataEvaluatingLevel = loadEvaluatingLevel();
        //加载测评的下拉框
        var server = document.getElementById("evaluatingIDSearch"); //server为select定义的id
        server.innerHTML = "<option value='' selected='selected'>请选择</option>";
        for (var i in dataEvaluating) {
            var option = document.createElement("option");  // 创建添加option属性
            option.setAttribute("value", dataEvaluating[i].evaluatingID); // 给option的value添加值
            option.innerText = dataEvaluating[i].evaluatingName;     // 打印option对应的纯文本
            server.appendChild(option);           //给select添加option子标签
        }
        form.render();
        //联动
        form.on('select(evaluatingIDSearch)', function (data) {
            var evaluatingID = data.value;
            var server = document.getElementById("evaluatingLevelSearch"); //server为select定义的id
            server.innerHTML = "<option value='' selected='selected'>请选择</option>";
            for(var j in dataEvaluatingLevel) {
                if (evaluatingID == dataEvaluatingLevel[j].evaluatingLevelEvaluatingID) {
                    var option = document.createElement("option");  // 创建添加option属性
                    option.setAttribute("value", dataEvaluatingLevel[j].evaluatingLevelID); // 给option的value添加值
                    option.innerText = dataEvaluatingLevel[j].evaluatingLevelName;     // 打印option对应的纯文本
                    server.appendChild(option);           //给select添加option子标签
                }
            }
            form.render();
        });
        // var m = 0;
        // var itemS = "";
        // var item = "";
        // for(var i in dataEvaluating){
        //     m += 1;
        //     var label = "<label class='layui-form-label' data-id='"+dataEvaluating[i].evaluatingID+"'>"+dataEvaluating[i].evaluatingName+"等级</label>";
        //     var option = "<option value=''>请选择</option>";
        //     for(var j in dataEvaluatingLevel){
        //         if(dataEvaluating[i].evaluatingID == dataEvaluatingLevel[j].evaluatingLevelEvaluatingID){
        //             option += "<option value='"+dataEvaluatingLevel[j].evaluatingLevelID+"'>"+dataEvaluatingLevel[j].evaluatingLevelName+" </option>"
        //         }
        //     }
        //     var div = "<div class='layui-input-inline'>\n" +
        //         "       <select name='evaluatingLevelSearch' lay-filter='evaluatingLevelSearch'>\n" +option+
        //         "       </select>\n" +
        //         "      </div>";
        //     item += label + div;
        //     if(m%3==0){
        //         if(i == dataEvaluating.length){
        //             itemS += "<div class='layui-form-item'>\n" + item +
        //                 "     <div class='layui-inline'>\n" +
        //                 "       <button class='layui-btn' data-type='search'><i class='layui-icon layui-icon-search'></i></button>\n" +
        //                 "     </div>\n" +
        //                 "    </div>";
        //         }else{
        //             itemS += "<div class='layui-form-item'>\n" + item +"</div>";
        //         }
        //         item = "";
        //     }
        // }
        // if(item != ""){
        //     itemS += "<div class='layui-form-item'>\n" + item +
        //         "     <div class='layui-inline'>\n" +
        //         "       <button class='layui-btn' data-type='search'><i class='layui-icon layui-icon-search'></i></button>\n" +
        //         "     </div>\n" +
        //         "    </div>";
        // }
        // $(".demoTable").prepend(itemS);
        // form.render();
    }
    /*---------------------加载客户评测信息---------------------*/
    function loadEvaluatingReturn() {
        var url = dataHost + "/evaluating/selectEvaluatingList";
        var dataEvaluating = null;
        $.ajax({
            url: url,
            type: "post",
            async: false,
            success: function (result) {
                if (result.responseStatusType.message == "Success") {
                    dataEvaluating = result.result.list;
                } else {
                }
            }
        });
        return dataEvaluating
    }

    /*---------------------加载客户评测等级信息---------------------*/
    function loadEvaluatingLevel() {
        var url = dataHost + "/evaluatingLevel/selectEvaluatingLeveldList";
        var dataEvaluatingLevel = null;
        $.ajax({
            url: url,
            type: "post",
            async: false,
            success: function (result) {
                if (result.responseStatusType.message == "Success") {
                    dataEvaluatingLevel = result.result.list;
                } else {
                }
            }
        });
        return dataEvaluatingLevel
    }
</script>

</body>
</html>