<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>业绩明细</title>
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
    </style>
</head>
<body>

<div class="layui-fluid">
    <div class="demoTable layui-form" lay-filter="demoTable">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">请选择门店</label>
                <div class="layui-input-inline">
                    <select name="stores" id="stores" lay-filter="stores">
                    </select>
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label ">员工</label>
                <div class="layui-input-inline">
                    <select name="beautician" lay-filter="beautician" id="beautician" lay-verify="required">
                    </select>
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">业绩</label>
                <div class="layui-input-inline">
                    <select name="achievement" lay-filter="achievement" id="achievement" lay-verify="required">
                    </select>
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">日期</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" id="date" placeholder="yyyy-MM-dd">
                </div>
            </div>
            <div class="layui-inline">
                <button class="layui-btn" data-type="search"><i class="layui-icon layui-icon-search"></i></button>
            </div>
        </div>
    </div>
    <#--表格:显示业绩详细-->
    <table id="ladderDetailed" lay-filter="ladderDetailed"></table>
</div>

<script>
    var table, laydate, form;
    //数据显示,分页实现
    layui.use(['table', 'laydate', 'form'], function () {
        table = layui.table;
        laydate = layui.laydate;
        form = layui.form;
        laydate.render({
            elem: '#date'
        });
        //初始化子公司分组列表
        loadSubCompanyStore(form)
        //监听门店选中下拉框
        form.on('select(stores)', function (data) {
            var storeId = data.value;
            //加载员工
            var storeIds = storeId == 0 ? "${currentUser.storeId!}" : storeId;
            loadBeautician(storeIds);
            //加载业绩
            loadAchievement(storeIds);
        });
        table.render({
            elem: '#ladderDetailed'
            , url: dataHost + "/performance/selectLadderDetailedByCondition"
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
            , where: {
                storeIdList: "${currentUser.storeId!}"
            }
            , cols: [[
                {type: 'checkbox', fixed: 'left', width: 40, hide: true}
                , {field: 'rownum', title: '序号', width: 75, sort: true, fixed: 'left'}
                , {field: 'achievementName', title: '使用业绩'}
                , {field: 'storeName', title: '门店'}
                , {field: 'ladderDetailedAmount', title: '金额'}
                , {field: 'ladderDetailedNumber', title: '个数', width: 100}
                , {field: 'beauticianName', title: '员工'}
                , {
                    field: 'ladderDetailedState', title: '业绩状态', templet: function (d) {
                        if (d.ladderDetailedState == 1) {
                            return "正常";
                        } else {
                            return "删除";
                        }
                    }
                }
                , {field: 'ladderDetailedDatetime', title: '时间'}
                , {field: 'ladderDetailedOrderId', title: '订单号', width: 100}
                , {field: 'orderTypeName', title: '订单类型', width: 100}
                , {
                    field: 'salesmanConfirm', title: '员工确认', templet: function (d) {
                        if (d.salesmanConfirm == 1) {
                            return "已确认";
                        } else {
                            return "待确认";
                        }
                    }
                }
                , {
                    field: 'managementConfirm', title: '管理员确认', templet: function (d) {
                        if (d.managementConfirm == 1) {
                            return "已确认";
                        } else {
                            return "待确认";
                        }
                    }
                }
                , {
                    field: 'status', title: '状态', templet: function (d) {
                        if (d.status == 1) {
                            return "正常";
                        } else {
                            return "删除";
                        }
                    }, hide: true
                }
                , {field: 'createOperator', title: '创建人', hide: true}
                , {field: 'createTime', title: '创建时间', hide: true}
                , {field: 'modifyOperator', title: '修改人', hide: true}
                , {field: 'dataChangeLastTime', title: '修改时间', hide: true}
            ]]
            , id: 'ladderDetailedReload'
        });

        var $ = layui.$, active = {
            search: function () {
                var date = $("#date").val(),
                    store = $(".demoTable select[name='stores'] option:selected").val(),
                    beautician = $(".demoTable select[name='beautician'] option:selected").val(),
                    achievement = $(".demoTable select[name='achievement'] option:selected").val();
                table.reload('ladderDetailedReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    , where: {
                        ladderDetailedAchievementID: achievement == 0 ? null : achievement,
                        storeIdList: store == 0 ? "${currentUser.storeId!}" : store,
                        ladderDetailedBeauticianId: beautician == 0 ? null : beautician,
                        ladderDetailedDatetime: date
                    }
                }, 'data');
            }
        };

        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    });

    function loadAchievement(storeId) {
        var param = {storeId: storeId}
        $.ajax({
            url: dataHost + "/performance/selectPerformanceList",
            data: param,
            method: "POST",
            async: false,
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    var dataAchievement = res.result.list;
                    var server = document.getElementById("achievement"); //server为select定义的id
                    server.innerHTML = "<option value='0' selected='selected'>请选择</option>";
                    for (var p in dataAchievement) {
                        var option = document.createElement("option");  // 创建添加option属性
                        option.setAttribute("value", dataAchievement[p].id); // 给option的value添加值
                        option.innerText = dataAchievement[p].achievementName;     // 打印option对应的纯文本
                        server.appendChild(option);           //给select添加option子标签
                    }
                    form.render("select");
                } else {
                    $("#achievement").find("option").remove();
                    form.render("select");
                }
            }
        });
    }

    function loadBeautician(storeId) {
        var param = {"companyId": storeId,"companyType": "3"};
        $.ajax({
            url: storeHost + "/manage/beautician/selectBeauticianListNoPage",
            data: param,
            method: "POST",
            async: false,
            success: function (res) {
                var server = document.getElementById("beautician"); //server为select定义的id
                if (res.responseStatusType.message == "Success") {
                    //显示下拉 隐藏文本
                    var dataBeautician = res.result;
                    server.innerHTML = "<option value='0' selected='selected'>请选择</option>";
                    for (var p in dataBeautician) {
                        var option = document.createElement("option");  // 创建添加option属性
                        option.setAttribute("value", dataBeautician[p].beauticianId); // 给option的value添加值
                        option.innerText = dataBeautician[p].name;     // 打印option对应的纯文本
                        server.appendChild(option);           //给select添加option子标签
                    }
                    form.render("select");
                } else {
                    $("#beautician").find("option").remove();
                    form.render("select");
                }
            }
        });
    }


    //初始化子公司分组列表
    function loadSubCompanyStore(form) {
        var url = storeHost + "/manage/store/selectSubCompanyAndStoreNoPage";
        var data = {companyId: "${currentUser.companyId!}", companyType: "${currentUser.companyType!}"};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("stores"); //server为select定义的id
                server.innerHTML = "<option value='0' selected='selected'>直接选择或搜索选择</option>";
                for (var p in list) {
                    var optgroup = document.createElement("optgroup");  // 创建添加optgroup属性
                    optgroup.setAttribute("label", list[p].subsidiaryName); // 给optgroup的label添加值
                    var storeVOList = list[p].storeVOList;
                    for (var n in storeVOList) {
                        var option = document.createElement("option");  // 创建添加option属性
                        option.setAttribute("value", storeVOList[n].storeId); // 给option的value添加值
                        option.innerText = storeVOList[n].name;     // 打印option对应的纯文本
                        optgroup.appendChild(option)
                    }
                    server.appendChild(optgroup);           //给select添加option子标签
                }
                form.render();
            } else {

            }
        })
    }
</script>
</body>
</html>