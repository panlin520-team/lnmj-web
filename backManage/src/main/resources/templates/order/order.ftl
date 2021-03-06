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
    <#include "../baseFtl/pageAuth.ftl" />
    <style>
        .resetLabel {
            width: 56px;
        }
    </style>
</head>
<body>

<div class="layui-fluid">
    <div class="demoTable layui-form">
        <div class="layui-form-item">

            <label class="layui-form-label">日期</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="test1" placeholder="yyyy-MM-dd">
            </div>


            <label class="layui-form-label">请选择门店</label>
            <div class="layui-input-inline">
                <select name="stores" id="stores" lay-filter="stores">
                </select>
            </div>

            <label class="layui-form-label">订单分类</label>
            <div class="layui-input-inline" style="width: 100px">
                <select id="orderType" name="orderType" lay-filter="orderType">
                    <option value="0" selected="selected">请选择</option>
                </select>
            </div>

            <label class="layui-form-label">订单状态</label>
            <div class="layui-input-inline" style="width: 100px">
                <select id="orderStatus" name="orderStatus" lay-filter="orderStatus">
                    <option value="0" selected="selected">请选择</option>
                </select>
            </div>

            <label class="layui-form-label">订单来源</label>
            <div class="layui-input-inline" style="width: 100px">
                <select id="orderChannel" name="orderChannel" lay-filter="orderStatus">
                    <option value="0" selected="selected">请选择</option>
                </select>
            </div>

            <div class="layui-block">
                <label class="layui-form-label">订单号</label>
                <div class="layui-input-inline">
                    <input class="layui-input" type="text" name="keyWordOrderNum" autocomplete="off"
                           placeholder="输入订单号">
                </div>
            </div>

            <div class="layui-block">
                <label class="layui-form-label">联系人电话</label>
                <div class="layui-input-inline">
                    <input class="layui-input" type="text" name="keyWordMobile" autocomplete="off"
                           placeholder="输入联系人电话">
                </div>
            </div>
            <div class="layui-block">
                <div class="layui-inline">
                    <button class="layui-btn" data-type="search"><i class="layui-icon layui-icon-search"></i></button>
                </div>
            </div>
        </div>
    </div>
    <table id="order" lay-filter="demo"></table>
</div>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <button class="layui-btn layui-btn-xs" type="button" lay-event="refund" id="refund">退款</button>
</script>

<#--点击单行后的表单-->
<form class="layui-form layui-form-pane layui-personal" id="editForm" action="" lay-filter="example" method="post"
      hidden="true">

    <div class="layui-form-item" hidden="true">
        <label class="layui-form-label">美容师id</label>
        <div class="layui-input-block">
            <input type="text" name="beauticianId" lay-verify="<#--required-->" autocomplete="off" placeholder=""
                   class="layui-input">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">美容师名字</label>
        <div class="layui-input-block">
            <input type="text" name="name" lay-verify="required" autocomplete="off" placeholder="请输入美容师名称"
                   class="layui-input">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">美容师电话</label>
        <div class="layui-input-block">
            <input type="text" name="mobile" lay-verify="required" autocomplete="off" placeholder="请输入美容师电话"
                   class="layui-input">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
            <input type="radio" name="sexs" value="1" title="男" checked="">
            <input type="radio" name="sexs" value="2" title="女">
        </div>
    </div>


    <div class="layui-form-item" hidden="true">
        <label class="layui-form-label">员工号码</label>
        <div class="layui-input-block">
            <input type="text" name="staffNumber" lay-verify="required" autocomplete="off" placeholder="请输入员工号"
                   class="layui-input">
        </div>
    </div>


    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">入职时间</label>
            <div class="layui-input-inline">
                <input type="text" name="entryTime" class="layui-input" id="entryTime"
                       placeholder="yyyy-MM-dd HH:mm:ss">
            </div>
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">所属店铺</label>
        <div class="layui-input-block" style="width:150px;">
            <select name="store" id="store" lay-filter="store" lay-verify="required">
            </select>
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">所属分组</label>
        <div class="layui-input-block" style="width:150px;">
            <select name="groupId" id="groupId" lay-filter="groupId" lay-verify="required">
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">所属职位</label>
        <div class="layui-input-block" style="width:150px;">
            <select name="postId" id="postId" lay-filter="postId" lay-verify="required">
            </select>
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">是否跳过轮班</label>
        <div class="layui-input-block">
            <input type="radio" name="isSkipTurn" value="0" title="否" checked="">
            <input type="radio" name="isSkipTurn" value="1" title="是">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">手法评分</label>
        <div class="layui-input-block">
            <input type="text" name="tactGrade" lay-verify="required" autocomplete="off" placeholder="请输入员工手法评分"
                   class="layui-input">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">技能评分</label>
        <div class="layui-input-block">
            <input type="text" name="skillGrade" lay-verify="required" autocomplete="off" placeholder="请输入员工技能评分"
                   class="layui-input">
        </div>
    </div>


    <div class="layui-form-item" hidden="true">
        <label class="layui-form-label">累计客户</label>
        <div class="layui-input-block">
            <input type="text" name="cumulativeCustomer" lay-verify="required" autocomplete="off"
                   placeholder="请输入员工累计评分"
                   class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">排序</label>
        <div class="layui-input-block">
            <input type="text" name="sort" lay-verify="required" autocomplete="off" placeholder="请输入员工排序"
                   class="layui-input">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">美容师等级</label>
        <div class="layui-input-block">
            <select name="gradeId" id="gradeId" lay-filter="gradeId" lay-verify="required">
                <option value="1">一级</option>
                <option value="2">二级</option>
                <option value="3">三级</option>
                <option value="4">四级</option>
                <option value="5">五级</option>
            </select>
        </div>
    </div>


    <div class="layui-upload">
        <button type="button" class="layui-btn" id="test2">选择美容师头像图片</button>
        <button type="button" class="layui-btn" id="startUp">开始上传</button>
        <div class="layui-upload-list">
            <img class="layui-upload-img" id="demo2" style="width:100px;height: 100px">
            <p id="demoText2"></p>
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">在职状态</label>
        <div class="layui-input-block">
            <input type="radio" name="workingState" value="0" title="不在职" checked="">
            <input type="radio" name="workingState" value="1" title="在职">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">人物简介</label>
        <div class="layui-input-block">
            <input type="text" name="introduction" lay-verify="required" autocomplete="off" placeholder="请输入员工人物简介"
                   class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">是否兼职</label>
        <div class="layui-input-block">
            <input type="radio" name="isPartTime" value="0" title="否" checked="">
            <input type="radio" name="isPartTime" value="1" title="是">
        </div>
    </div>

    <div class="layui-form-item" hidden="true">
        <label class="layui-form-label">用户userId</label>
        <div class="layui-input-block">
            <input type="text" name="userId" lay-verify="required" autocomplete="off" placeholder="请输入员工用户id"
                   class="layui-input">
        </div>
    </div>

</form>


<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    //列表显示--订单
    var storeArray = loadSubCompanyStore();
    var chooseDate;
    layui.use('table', function () {
        var table = layui.table;
        var orderType = $("select[name='orderType'] option:selected").val();
        var payStatus = $("select[name='orderStatus'] option:selected").val();
        var storeId = $("select[name='storeId'] option:selected").val();
        table.render({
            elem: '#order'
            , url: orderHost + "/order/selectOrderList"
            , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , page: true          //显示分页默认不显示
            , method: 'post'
            , id: "orderReload"
            , request: {
                pageName: 'pageNum', //页码的参数名称，默认：page
                limitName: 'pageSize' //每页数据量的参数名，默认：limit
            }
            , where: {
                orderType: orderType == 0 ? null : orderType,
                orderStatus: payStatus == 0 ? null : payStatus,
                storeId: JSON.stringify(storeArray)
            }
            , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                return {
                    "code": 0, //解析接口状态
                    "msg": "", //解析提示文本
                    "count": res.result == null ? 0 : res.result.total, //解析数据长度
                    "data": res.result == null ? 0 : res.result.list //解析数据列表
                };
            }
            ,
            cols: [[
                {type: 'checkbox', fixed: 'left', width: 60}
                , {field: 'orderNumber', title: '订单号'}
                , {field: 'orderLink', title: '联系人'}
                , {field: 'mobile', title: '联系人电话'}
                , {field: 'cardNumber', title: '会员卡号'}
                , {field: 'orderStatueValue', title: '订单状态'}
                , {field: 'payPrice', title: '订单总价'}
                , {field: 'createTime', title: '下单时间'}
                , {
                    field: 'orderStatus', title: '订单状态', templet: function (d) {
                        var orderStatusName = "";
                        var color = "";
                        if (d.orderStatus == 4) {
                            orderStatusName = "已退款"
                            color = "gray"
                        } else if (d.orderStatus == 2) {
                            orderStatusName = "已支付"
                            color = "green"
                        } else if (d.orderStatus == 1) {
                            orderStatusName = "待支付"
                            color = "red"
                        }
                        return "<span id='orderStatusName'" + "style='color: " + color + "'" + ">" + orderStatusName + "</span>"
                    }, unresize: true
                }
                , {fixed: 'right', title: '操作', width: 170, align: 'center', toolbar: '#barDemo'}
            ]]
            , done: function (res, curr, count) {
                for (var i = 0; i < res.data.length; i++) {
                    if (res.data[i].orderStatus == 4) {//如果此行已经退款过了
                        $("tbody tr:eq(" + i + ")").children().find("#refund").attr("class", "layui-btn layui-btn-xs layui-btn-disabled")
                        $("tbody tr:eq(" + i + ")").children().find("#refund").attr("disabled", true)
                    }
                }

            }
        })
        ;
    });


    //增删改查操作实现
    layui.use(['table', 'layer', 'jquery', 'form'], function () {
        var table = layui.table,
            layer = layui.layer,
            $ = layui.jquery,
            form = layui.form;

        loadOrderType(form)
        loadOrderChannel(form)
        //订单类型变化时触发的事件
        form.on('select(orderType)', function (data) {
            var list = null;

            //如果选择的护理订单
            list = [{"name": "待支付", "value": "1"},
                {"name": "已支付", "value": "2"},
                {"name": "待服务", "value": "3"},
                {"name": "服务中", "value": "4"},
                {"name": "已服务", "value": "5"},
                {"name": "已取消", "value": "6"}]


            var server = document.getElementById("orderStatus"); //server为select定义的name
            server.innerHTML = "<option value='0' selected='true'>请选择</option>";
            for (var p in list) {
                var option = document.createElement("option");  // 创建添加option属性
                option.setAttribute("value", list[p].value); // 给option的value添加值
                option.innerText = list[p].name;     // 打印option对应的纯文本
                server.appendChild(option);           //给select添加option子标签
            }
            layui.form.render();
        });


        //监听表格复选框选择
        table.on('checkbox(demo)', function (obj) {
        });


        //监听工具条
        table.on('tool(demo)', function (obj) {
            var data = obj.data;
            if (obj.event === 'detail') {

            } else if (obj.event === 'refund') {
                layer.confirm('当前的支付情况为：' + getPayType(data) + '确认要进行退款吗?', function (index) {
                    orderRefund(data, table);
                });
            }
        });


        var $ = layui.$, active = {
            search: function () {
                var keyWordOrderNum = $(".demoTable input[name='keyWordOrderNum']").val();
                var keyWordMobile = $(".demoTable input[name='keyWordMobile']").val();
                var orderType = $("select[name='orderType'] option:selected").val();
                var payStatus = $("select[name='orderStatus'] option:selected").val();
                var orderChannel = $("select[name='orderChannel'] option:selected").val();
                var storeId = $("select[name='stores'] option:selected").val() == 0 ? JSON.stringify(storeArray) : $("select[name='stores'] option:selected").val();
                table.render({
                    elem: '#order'
                    , url: orderHost + "/order/selectOrderList"
                    , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    , page: true          //显示分页默认不显示
                    , method: 'post'
                    , request: {
                        pageName: 'pageNum', //页码的参数名称，默认：page
                        limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    }
                    , where: {
                        keyWordOrderNum: keyWordOrderNum,
                        keyWordMobile: keyWordMobile,
                        orderChannel: orderChannel,
                        orderType: orderType == 0 ? null : orderType,
                        orderStatus: payStatus == 0 ? null : payStatus,
                        storeId: storeId == 0 ? null : storeId,
                        date: chooseDate
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
                        {type: 'checkbox', fixed: 'left', width: 60}
                        , {field: 'orderNumber', title: '订单号'}
                        , {field: 'orderLink', title: '联系人'}
                        , {field: 'mobile', title: '联系人电话'}
                        , {field: 'cardNumber', title: '会员卡号'}
                        , {field: 'orderStatueValue', title: '订单状态'}
                        , {field: 'payPrice', title: '订单总价'}
                        , {field: 'createTime', title: '下单时间'}
                        , {fixed: 'right', title: '操作', width: 170, align: 'center', toolbar: '#barDemo'}
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


    /*查看订单类型信息*/
    function loadOrderType(form) {
        //加载店铺列表信息
        var url = orderHost + "/order/selectOrderTypeList";
        var data = {};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("orderType"); //server为select定义的id
                server.innerHTML = "<option value='0' selected='selected'>请选择</option>";
                for (var p in list) {
                    var option = document.createElement("option");  // 创建添加option属性
                    option.setAttribute("value", p); // 给option的value添加值
                    option.innerText = list[p];     // 打印option对应的纯文本
                    server.appendChild(option);           //给select添加option子标签
                }
                form.render();
            } else {

            }
        })
    }

    /*查看订单来源渠道信息*/
    function loadOrderChannel(form) {
        //加载店铺列表信息
        var url = orderHost + "/order/selectOrderChannelList";
        var data = {};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("orderChannel"); //server为select定义的id
                server.innerHTML = "<option value='' selected='selected'>请选择</option>";
                for (var p in list) {
                    var option = document.createElement("option");  // 创建添加option属性
                    option.setAttribute("value", p); // 给option的value添加值
                    option.innerText = list[p];     // 打印option对应的纯文本
                    server.appendChild(option);           //给select添加option子标签
                }
                form.render();
            } else {

            }
        })
    }

    //初始化子公司分组列表
    function loadSubCompanyStore() {
        var url = storeHost + "/manage/store/selectSubCompanyAndStoreNoPage";
        var data = {companyId: "${currentUser.companyId!}", companyType: "${currentUser.companyType!}"};
        var storeArray = new Array();
        $.ajax({
            url: url,
            type: "post",
            data: data,
            async: false,
            success: function (result) {
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
                            optgroup.appendChild(option);
                            storeArray.push(storeVOList[n].storeId);
                        }
                        server.appendChild(optgroup);           //给select添加option子标签
                    }

                } else {
                }

            }
        });
        return storeArray

    }

    //退款
    function orderRefund(data, table) {
        //删除数据库数据
        var url = orderHost + "/order/payOrderRefund";
        var params = {
            isTiYanKaOrDingzhi: 0,
            storeId: data.nurseStore,
            isTiYanKa: 0,
            isHuaKa: 0,
            outStorageIdQiTa: data.outStorageIdQiTa,
            outStorageIdXiaoShou: data.outStorageIdXiaoShou,
            payTypeAndAmount: data.payTypeAndAmount,
            memberNum: data.cardNumber,
            orderNumber: data.orderNumber,
            modifyOperator: "${currentUser.trueName!}"
        };
        $.post(url, params, function (res) {
            if (res.responseStatusType.message == "Success") {
                layer.open({
                    title: '退款'
                    , content: '退款成功！'
                    , btn: ["关闭"]
                });
                //重新加载表格
                table.reload("orderReload");
            } else {
                layer.open({
                    title: '退款'
                    , content: res.responseStatusType.error.errorMsg
                    , btn: ["关闭"]
                });
            }
        })
    }

    //退款前获取支付情况
    function getPayType(data) {
        var result = "";
        var payTypeAndAmountArray = JSON.parse(data.payTypeAndAmount);
        $.each(payTypeAndAmountArray, function (n, value) {
            var textstr = value.payTypeName + "支付" + value.amount + "元";
            result = result + "," + textstr
        });
        return result;
    }
</script>


<script>
    //关于时间范围的js
    layui.use('laydate', function () {
        var laydate = layui.laydate;
        //时间范围
        laydate.render({
            elem: '#shopBusinessTime'
            , type: 'time'
            , range: true
        });
        //日期时间选择器-添加
        laydate.render({
            elem: '#entryTimeAdd'
            , type: 'datetime'
        });
        //日期时间选择器-修改
        laydate.render({
            elem: '#entryTime'
            , type: 'datetime'
        });
    });

    layui.use('laydate', function () {
        var laydate = layui.laydate;
        //常规用法
        laydate.render({
            elem: '#test1'
            , done: function (value, date) {
                chooseDate = value;
            }
        });
    });
</script>


</body>
</html>