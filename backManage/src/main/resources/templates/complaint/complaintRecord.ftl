<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>label</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${basePath!}/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${basePath!}/css/index.css" media="all"/>
    <script src="${basePath!}/layui/layui.js" charset="utf-8"></script>
    <script src="${basePath!}/js/jquery.js" charset="utf-8"></script>
    <style>
        .resetLabel {
            width: 30px;
        }
    </style>
</head>
<body>


<div class="layui-fluid">
    <div class="demoTable layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label resetLabel">所属门店</label>
            <div class="layui-inline">
                <select id="storeId" name="storeId" lay-filter="storeId">
                    <option value="0" selected="selected">请选择</option>
                </select>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-inline">
                    <input class="layui-input" type="text" name="keyWordUserName" autocomplete="off"
                           placeholder="输入用户名">
                </div>
            </div>

            <div class="layui-inline">
                <button class="layui-btn" data-type="search"><i class="layui-icon layui-icon-search"></i></button>
            </div>
        </div>
    </div>
    <table id="complaintRecord" lay-filter="demo"></table>
</div>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
</script>


<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script src="${basePath!}/js/host.js" type="text/javascript"></script>
<script>
    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#complaintRecord'
            , url: systemHost + "/complaint/complaintRecordList"
            , cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
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
                    "count": res.result == null ? 0 : res.result.length, //解析数据长度
                    "data": res.result == null ? 0 : res.result.list //解析数据列表
                };
            }
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'userName', title: '用户名称'}
                , {field: 'complaintTitle', title: '投诉标题'}
                , {field: 'complaintTime', title: '投诉时间'}
                , {field: 'complaintReason', title: '投诉原因'}
                , {field: 'handleMethod', title: '处理方案'}
                , {field: 'result', title: '结果'}
            ]]
        });
    });
    layui.use(['table', 'layer', 'jquery', 'form'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var $ = layui.jquery;
        var form = layui.form;
        loadShop(form)
        //监听表格复选框选择
        table.on('checkbox(demo)', function (obj) {
        });
        //监听工具条
        table.on('tool(demo)', function (obj) {
            var data = obj.data;
            if (obj.event === 'edit') {
            } else if (obj.event === 'del') {
            }
        });


        var $ = layui.$, active = {
            search: function () {
                var keyWordUserName = $(".demoTable input[name='keyWordUserName']").val();
                var keyWordStoreId = $("select[name='storeId'] option:selected").val();
                table.render({
                    elem: '#complaintRecord'
                    , url: systemHost + "/complaint/complaintRecordList"
                    , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    , page: true          //显示分页默认不显示
                    , method: 'post'
                    , request: {
                        pageName: 'pageNum', //页码的参数名称，默认：page
                        limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    }
                    , where: {
                        keyWordUserName: keyWordUserName,
                        keyWordStoreId: keyWordStoreId
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
                        {type: 'checkbox', fixed: 'left'}
                        , {field: 'userName', title: '用户名称'}
                        , {field: 'complaintTitle', title: '投诉标题'}
                        , {field: 'complaintTime', title: '投诉时间'}
                        , {field: 'complaintReason', title: '投诉原因'}
                        , {field: 'handleMethod', title: '处理方案'}
                        , {field: 'result', title: '结果'}
                    ]]
                });
            }
        };

        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

    });

    //加载店铺信息-下拉选
    function loadShop(form) {
        //加载店铺列表信息
        var url = storeHost + "/manage/store/selectStoreList";
        var data = {};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result.list;    //返回的数据
                var server = document.getElementById("storeId"); //server为select定义的id
                server.innerHTML = "<option value='0' selected='true'>请选择</option>";
                for (var p in list) {
                    var option = document.createElement("option");  // 创建添加option属性
                    option.setAttribute("value", list[p].storeId); // 给option的value添加值
                    option.innerText = list[p].name;     // 打印option对应的纯文本
                    server.appendChild(option);           //给select添加option子标签
                }
                form.render();
            } else {

            }
        })
    }
</script>
</body>
</html>