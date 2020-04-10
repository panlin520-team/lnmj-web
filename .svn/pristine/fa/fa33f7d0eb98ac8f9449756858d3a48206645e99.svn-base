<#--商城用户地址管理-->
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
            width: 30px;
        }
    </style>
</head>
<body>
<div class="layui-fluid">
    <div class="demoTable layui-form">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">请选择门店</label>
                <div class="layui-input-inline">
                    <select name="stores" id="stores" lay-filter="stores">
                    </select>
                </div>

                <label class="layui-form-label resetLabel">电话</label>
                <div class="layui-input-inline">
                    <input class="layui-input" type="text" name="keyWordPhone" autocomplete="off" placeholder="输入电话">
                </div>
                <label class="layui-form-label">名字</label>
                <div class="layui-input-inline">
                    <input class="layui-input" type="text" name="keyWordName" autocomplete="off" placeholder="输入名字">
                </div>
            </div>
            <div class="layui-inline">
                <button class="layui-btn" data-type="search"><i class="layui-icon layui-icon-search"></i></button>
            </div>
        </div>
    </div>
    <table id="member" lay-filter="demoUser"></table>
</div>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="editAddress">编辑收货地址</a>
</script>

<script type="text/html" id="addressBar">
    <a class="layui-btn layui-btn-xs" lay-event="setDefault" id="setDefault">设置默认</a>
    <a class="layui-btn layui-btn-xs" lay-event="addressDetail">查看地址</a>
    <a class="layui-btn layui-btn-xs" lay-event="addressUpdate">修改地址</a>
    <a class="layui-btn layui-btn-danger" lay-event="addressDel">删除地址</a>
</script>

<#--地址列表表单-->
<form class="layui-form layui-form-pane layui-personal" id="addressForm" action="" lay-filter="example" method="post" hidden="true">
    <button id="addAddress" type="button" class="layui-btn">添加地址</button>
    <table id="addressTable" lay-filter="demoAddress"></table>
</form>

<#--地址详情表单-->
<form class="layui-form layui-form-pane layui-personal" id="addressDetail" action="" lay-filter="addressDetail" method="post" hidden="true">
    <div class="layui-form-item" hidden='true'>
        <label class="layui-form-label">收货地址id</label>
        <span name="recipientAddressId"></span>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">收货人姓名</label>
        <span name="name"></span>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">收货人手机号码</label>
        <span name="mobile"></span>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">收货详细地址</label>
        <span name="addressDetail"></span>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">是否默认收货地址</label>
        <span name="isDefault"></span>
    </div>
</form>

<#--地址修改表单-->
<form class="layui-form layui-form-pane layui-personal" id="addressEdit" action="" lay-filter="addressEdit" method="post" hidden="true">
    <div class="layui-form-item" hidden='true'>
        <label class="layui-form-label">收货地址id</label>
        <div class="layui-input-block">
            <input type="text" name="recipientAddressId" lay-verify="required" autocomplete="off" placeholder=""
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" hidden='true'>
        <label class="layui-form-label">会员编号</label>
        <div class="layui-input-block">
            <input type="text" name="memberNum" lay-verify="required" autocomplete="off" placeholder=""
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">收货人姓名</label>
        <div class="layui-input-block">
            <input type="text" name="name" lay-verify="required" autocomplete="off" placeholder="请输入收货人姓名"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">收货人手机号码</label>
        <div class="layui-input-block">
            <input type="text" name="mobile" lay-verify="required" autocomplete="off" placeholder="请输入收货人手机号码"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">选择收货地区</label>
        <div class="layui-input-block">
            <div class="layui-inline">
                <select name="province" class="province" lay-filter="province">
                </select>
            </div>
            <div class="layui-inline">
                <select name="city" class="city" lay-filter="city">
                </select>
            </div>
            <div class="layui-inline">
                <select name="county" class="county" lay-filter="county">
                </select>
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">收货详细地址</label>
        <div class="layui-input-block">
            <input type="text" name="addressDetail" lay-verify="required" autocomplete="off" placeholder="请输入收货详细地址"
                   class="layui-input">
        </div>
    </div>
</form>

<#--添加地址表单-->
<form class="layui-form layui-form-pane layui-personal" id="addressAdd" action="" lay-filter="addressAdd" method="post" hidden="true">
    <div class="layui-form-item">
        <label class="layui-form-label">收货人姓名</label>
        <div class="layui-input-block">
            <input type="text" name="nameAdd" lay-verify="required" autocomplete="off" placeholder="请输入收货人姓名"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">收货人手机号码</label>
        <div class="layui-input-block">
            <input type="text" name="mobileAdd" lay-verify="required" autocomplete="off" placeholder="请输入收货人手机号码"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">选择收货地区</label>
        <div class="layui-input-block">
            <div class="layui-inline">
                <select name="provinceAdd" class="province" lay-filter="province">
                </select>
            </div>
            <div class="layui-inline">
                <select name="cityAdd" class="city" lay-filter="city">
                </select>
            </div>
            <div class="layui-inline">
                <select name="countyAdd" class="county" lay-filter="county">
                </select>
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">收货详细地址</label>
        <div class="layui-input-block">
            <input type="text" name="addressDetailAdd" lay-verify="required" autocomplete="off" placeholder="请输入收货详细地址"
                   class="layui-input">
        </div>
    </div>
</form>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    //列表显示
    var list = loadFindStoreName();
    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#member'
            , url: accountHost + "/manage/memberUser/listByPage"
            , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , page: true          //显示分页默认不显示
            , method: 'post'
            , id: "memberReload"
            , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                return {
                    "code": 0, //解析接口状态
                    "msg": "", //解析提示文本
                    "count": res.result == null ? 0 : res.result.total, //解析数据长度
                    "data": res.result == null ? 0 : res.result.list //解析数据列表
                };
            }
            ,where: {
                storeId:"${currentUser.storeId!}"
            }
            , cols: [[
                {type: 'checkbox', fixed: 'left', width: 40}
                , {
                    field: 'storeId', title: '门店名称', templet: function (d) {
                        for (var p in list) {
                            if (d.storeId == list[p].storeId) {
                                storeName = list[p].name;
                                return "<span id='storeName'>" + storeName + "</span>"
                            }
                        }
                    }, unresize: true
                }
                , {field: 'memberNum', title: '会员号'}
                , {field: 'mobile', title: '电话'}
                , {field: 'name', title: '姓名'}
                , {fixed: 'right', title: '操作', align: 'center', toolbar: '#barDemo' ,width: 300}
            ]]
        });
    });

    //增删改查操作实现
    layui.use(['table', 'layer', 'jquery', 'form'], function () {
        var table = layui.table,
            layer = layui.layer,
            $ = layui.jquery,
            form = layui.form;
        loadSubCompanyStore(form)
        //监听表格复选框选择
        table.on('checkbox(demoUser)', function (obj) {
            console.log(obj)
        });
        //监听工具条-用户
        var checkMemberNum = null;
        table.on('tool(demoUser)', function (obj) {
            var data = obj.data;
            if (obj.event === 'editAddress') {
                //查询赋值
                query(form, data);
                /*监听省select*/
                form.on('select(province)', function (data) {
                    cityChange(form, data.value, "", "")
                });
                /*监听市select*/
                form.on('select(city)', function (data) {
                    countyChange(form, data.value, "")
                });
                checkMemberNum = data.memberNum
                //弹出指定用户地址列表
                addressShowAndEdit(data, table, $,form)
            }
        });

        //监听工具条-地址
        table.on('tool(demoAddress)', function (obj) {
            var data = obj.data;
            if (obj.event === 'setDefault') {
                //设置默认地址
                setDefault(data, table, $)
            }else if(obj.event === 'addressDetail'){
                //弹出地址详情表单
                getAddressDetail(data, table, $)
            }else if(obj.event === 'addressUpdate'){
                //查询赋值
                query(form, data);
                /*监听省select*/
                form.on('select(province)', function (data) {
                    cityChange(form, data.value, "", "")
                });
                /*监听市select*/
                form.on('select(city)', function (data) {
                    countyChange(form, data.value, "")
                });


                editAddress(data, table, $,form)
            }else if(obj.event === 'addressDel'){
                delAddress(checkMemberNum, data,table, $,form)
            }
        });

        var $ = layui.$, active = {
            search: function () {
                var keyWordName = $(".demoTable input[name='keyWordName']").val();
                var keyWordPhone = $(".demoTable input[name='keyWordPhone']").val();
                var storeId = $("select[name='stores'] option:selected").val()==0?"${currentUser.storeId!}":$("select[name='stores'] option:selected").val();
                table.render({
                    elem: '#member'
                    , url: accountHost + "/manage/memberUser/listByPage"
                    , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    , page: true          //显示分页默认不显示
                    , method: 'post'
                    , request: {
                        pageName: 'pageNum', //页码的参数名称，默认：page
                        limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    }
                    , where: {
                        mobile: keyWordPhone,
                        name: keyWordName,
                        storeId:storeId
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
                        , {
                            field: 'storeId', title: '门店名称', templet: function (d) {
                                for (var p in list) {
                                    if (d.storeId == list[p].storeId) {
                                        storeName = list[p].name;
                                        return "<span id='storeName'>" + storeName + "</span>"
                                    }
                                }
                            }, unresize: true
                        }
                        , {field: 'memberNum', title: '会员号'}
                        , {field: 'mobile', title: '电话'}
                        , {field: 'name', title: '姓名'}
                        , {fixed: 'right', title: '操作', align: 'center', toolbar: '#barDemo' ,width: 300}
                    ]]
                });
            }
        };
        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });



        $("#addAddress").click(function () {
            addAddress(checkMemberNum, table, $,form)
        });



    });




    //修改按钮事件
    function addressShowAndEdit(data, table, $,form) {
        //页面弹框
         layer.open({
            type: 1,
            title: '地址列表',
            content: $('#addressForm'),
            scrollbar: true,
            area: ['1000px', '500px'],
            closeBtn: 1,
            btn: ['关闭'],
            btn2: function () {

            },
            success: function (layero) {
                table.render({
                    elem: '#addressTable'
                    , url: accountHost + "/manage/address/listByPage"
                    , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    , page: false          //显示分页默认不显示
                    , method: 'post'
                    , id: "addressTable"
                    , request: {
                        pageName: 'pageNum', //页码的参数名称，默认：page
                        limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    }
                    , where: {
                        "memberNum": data.memberNum
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
                        , {field: 'name', title: '收货人姓名'}
                        , {field: 'mobile', title: '收货人电话'}
                        , {field: 'addressDetail', title: '详细地址'}
                        , {fixed: 'right', title: '操作', align: 'center', toolbar: '#addressBar'}
                    ]]
                    , done: function (res, curr, count) {
                        for (var i = 0; i < res.data.length; i++) {
                            if (parseInt(res.data[i].isDefault) == 1) {// 如果是默认
                                $("[lay-id='addressTable'] tbody tr[data-index=" + i + "]").children().find("#setDefault").attr("class", "layui-btn layui-btn-xs layui-btn-disabled").attr("disabled", true)
                            }
                        }
                    }
                });
                form.render();
            }
        });
    }

    //设置默认事件
    function setDefault(data, table, $) {
        //加载店铺列表信息
        var url = accountHost + "/manage/address/setDefault";
        var data = {"recipientAddressId":data.recipientAddressId, "modifyOperator": "${currentUser.trueName!}","memberNum":data.memberNum};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                alert("设置默认成功")
                table.reload("addressTable");
            } else {
                alert(result.responseStatusType.error.errorMsg)
            }
        })
    }

    //获取地址详情
    function getAddressDetail(data, table, $){
        //页面弹框
        var a2 = layer.open({
            type: 1,
            title: '地址详情',
            content: $('#addressDetail'),
            scrollbar: true,
            area: ['600px', '500px'],
            closeBtn: 1,
            btn: ['关闭'],
            btn2: function () {

            },
            success: function (layero) {
                layero.find("span[name='recipientAddressId']").text(data.recipientAddressId);
                layero.find("span[name='name']").text(data.name);
                layero.find("span[name='mobile']").text(data.mobile);
                layero.find("span[name='addressDetail']").text(data.addressDetail);
                var isDefault = ""
                if (data.isDefault == 1) {
                    isDefault = "是"
                } else {
                    isDefault = "否"
                }
                layero.find("span[name='isDefault']").text(isDefault);
            }, end: function () {

            }

        });
    }

    //修改地址
    function editAddress(data, table, $,form){
        //页面弹框
        var a1 = layer.open({
            type: 1,
            title: '修改地址',
            content: $('#addressEdit'),
            area: ['900px'],
            closeBtn: 1,
            btn: ['提交', '取消'],
            yes: function (index, layero) {
                var url = accountHost + "/manage/address/update";
                var provinceId = layero.find("select[name='province']").find("option:selected").val();
                var cityId = layero.find("select[name='city']").find("option:selected").val();
                var countyId = layero.find("select[name='county']").find("option:selected").val();
                var params = {
                    "recipientAddressId": layero.find("input[name='recipientAddressId']").val(),
                    "memberNum": layero.find("input[name='memberNum']").val(),
                    "name": layero.find("input[name='name']").val(),
                    "mobile": layero.find("input[name='mobile']").val(),
                    "provinceId": provinceId,
                    "cityId": cityId,
                    "countyId": countyId,
                    "addressDetail": layero.find("input[name='addressDetail']").val(),
                };
                $.post(url, params, function (res) {
                    if (res.responseStatusType.message == "Success") {
                        layer.open({
                            title: '修改'
                            , content: '修改成功！'
                            , btn: ["关闭"],
                            yes: function (index) {
                                layer.close(index); //如果设定了yes回调，需进行手工关闭
                                layer.close(a1);
                            }
                        });
                        //重新加载表格
                        table.reload("addressTable");
                    } else {
                        layer.msg(res.responseStatusType.error.errorMsg, {
                            time: 20000, //20s后自动关闭
                            btn: ['明白了']
                        });
                    }
                })
            },
            btn2: function () {

            },
            success: function (layero) {
                //表单初始赋值
                form.val('addressEdit', {
                    "recipientAddressId": data.recipientAddressId  //地址id
                    ,"memberNum": data.memberNum  // 用户id
                    ,"name": data.name  // 收货人姓名
                    ,"mobile": data.mobile   //收货人电话
                    ,"province": data.provinceId   //收货地址省
                    ,"city":data.cityId    //收货地址市
                    ,"county":data.countyId    //收货地址区
                    ,"addressDetail":data.addressDetail     //收货详细地址
                })
                layui.form.render();
            }, end: function () {

            }

        });
    }

    //添加地址
    function addAddress(checkMemberNum, table, $){
        //页面弹框
        var add = layer.open({
            type: 1,
            title: '添加地址',
            content: $('#addressAdd'),
            area: ['900px'],
            closeBtn: 1,
            btn: ['提交', '取消'],
            yes: function (index, layero) {
                var url = accountHost + "/manage/address/add";
                var provinceId = layero.find("select[name='provinceAdd']").find("option:selected").val();
                var cityId = layero.find("select[name='cityAdd']").find("option:selected").val();
                var countyId = layero.find("select[name='countyAdd']").find("option:selected").val();
                var params = {
                    "memberNum": checkMemberNum,
                    "name": layero.find("input[name='nameAdd']").val(),
                    "mobile": layero.find("input[name='mobileAdd']").val(),
                    "provinceId": provinceId,
                    "cityId": cityId,
                    "countyId": countyId,
                    "addressDetail": layero.find("input[name='addressDetailAdd']").val(),
                };
                $.post(url, params, function (res) {
                    if (res.responseStatusType.message == "Success") {
                        layer.open({
                            title: '添加'
                            , content: '添加成功！'
                            , btn: ["关闭"],
                            yes: function (index) {
                                layer.close(index); //如果设定了yes回调，需进行手工关闭
                                layer.close(add);
                            }
                        });
                        //重新加载表格
                        table.reload("addressTable");
                    } else {
                        layer.msg(res.responseStatusType.error.errorMsg, {
                            time: 20000, //20s后自动关闭
                            btn: ['明白了']
                        });
                    }
                })
            },
            btn2: function () {

            }
        });
    }

    //删除地址
    function delAddress(checkMemberNum, data,table, $) {
        //加载店铺列表信息
        var url = accountHost + "/manage/address/delete";
        var data = {"recipientAddressId":data.recipientAddressId, "memberNum":checkMemberNum,"modifyOperator": "${currentUser.trueName!}"};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                alert("删除成功")
                table.reload("addressTable");
            } else {
                alert(result.responseStatusType.error.errorMsg)
            }
        })
    }

    /*查看店铺信息*/
    function loadFindStoreName() {
        var url = storeHost + "/manage/store/selectStoreListNoPage";
        var data = {};
        var resultList = new Array();
        $.ajax({
            url: url,
            type: "post",
            data: data,
            async: false,
            success: function (result) {
                if (result.responseStatusType.message == "Success") {
                    resultList = result.result;    //返回的数据
                } else {
                }
            }
        });
        return resultList
    }

    //初始化子公司分组列表
    function loadSubCompanyStore(form) {
        var url = storeHost + "/manage/store/selectSubCompanyAndStoreNoPage";
        var data = {companyId:"${currentUser.companyId!}",companyType:"${currentUser.companyType!}"};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("stores"); //server为select定义的id
                server.innerHTML = "<option value='0' selected='selected'>直接选择或搜索选择</option>";
                for (var p in list) {
                    var optgroup = document.createElement("optgroup");  // 创建添加optgroup属性
                    optgroup.setAttribute("label", list[p].subsidiaryName); // 给optgroup的label添加值
                    var storeVOList = list[p].storeVOList;
                    for (var n in storeVOList){
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