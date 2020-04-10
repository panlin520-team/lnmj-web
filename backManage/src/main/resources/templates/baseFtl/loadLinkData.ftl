<form class="layui-form" id="showLinDataForm" action="" lay-filter="showLinDataForm" method="post" hidden="true">
    <div class="demoTable layui-form">
        <div class="layui-form-item">
            <div class="layui-inline">
                <div class="layui-input-inline">
                    <input type="text" autocomplete="off" class="layui-input" placeholder="请输入关键字查询" name="wordSearchLinkData">
                </div>
                <div class="layui-inline">
                    <button class="layui-btn" data-type="search" type="button" id="searchwordLinkData"><i
                            class="layui-icon layui-icon-search"></i></button>
                </div>
                <div class="layui-inline">
<#--
                    <button type="button" class="layui-btn layui-btn-primary layui-btn-sm" id="refreshLinkData">刷新</button>
-->
                    <div class="layui-inline" lay-event="refresh" id="refreshLinkData"><i class="layui-icon layui-icon-refresh-3"></i></div>
                </div>
            </div>
        </div>
        <table id="showLinDataTable" lay-filter="showLinDataTable"></table>
    </div>
</form>

<script>
    var Open = null;

    function loadLinkData(layer, layui, url, IdName, name,param) {
        //----------------------搜索行业点击事件--------------------------123
            Open = layer.open({
                type: 1,
                title: '搜索列表',
                content: $("#showLinDataForm"),
                area: ['917px', '333px'],
                closeBtn: 1,
                id: "showLinDataFormReload",
                btn: ['关闭'],
                btn2: function () {
                    layer.close(Open)
                },
                success: function (layero) {
                    layui.use('table', function () {
                        var table = layui.table;
                        table.render({
                            elem: "#showLinDataTable"
                            , url: url
                            , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                            , page: true          //显示分页默认不显示
                            , method: 'post'
                            , id: "showLinDataTableRelod"
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
                            , where: param
                            , cols: [[
                                {field: IdName, title: 'id', fixed: 'left'}
                                , {field: name, title: '名称', fixed: 'left'}
                            ]]
                        });
                    })
                }

            });

    }
</script>
