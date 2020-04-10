<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>创客用户</title>
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
            width: 56px;
        }
    </style>
</head>
<body>

<div class="layui-fluid">
    <#--<div class="layui-btn-group demoTable">-->
        <#--<button class="layui-btn" data-type="addMakerUser">添加用户</button>-->
        <#--<button class="layui-btn" data-type="getCheckData" >获取选中行数据</button>-->
        <#--<button class="layui-btn" data-type="getCheckLength">获取选中数目</button>-->
        <#--<button class="layui-btn" data-type="isAll">验证是否全选</button>-->
    <#--</div>-->
    <div class="demoTable layui-form" lay-filter="demoTable" style="margin-top: 15px">
        <#-- benefactor nursingName storeName employeeCode presentationStatus -->
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label resetLabel">创客商品</label>
                <div class="layui-input-inline">
                    <select name="makerProduct" lay-filter="makerProduct" lay-verify="required">
                        <option value="">请选择</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">创客等级</label>
                <div class="layui-input-inline">
                    <select name="makerMemberLevel" lay-filter="makerMemberLevel" lay-verify="required">
                        <option value="">请选择</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <button class="layui-btn" data-type="search" ><i class="layui-icon layui-icon-search"></i></button>
            </div>
        </div>
    </div>
    <#--表格:显示创客会员等级-->
    <table id="makerUser" lay-filter="makerUser"></table>
    </div>
<#-- 按钮 -->
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="edit">编辑</a>
    <#--<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>-->
    <a class="layui-btn layui-btn-xs" lay-event="order">订单记录</a>
</script>

<#--点击编辑后的表单-->
<form id="editForm" class="layui-form editForm layui-form-pane layui-personal" action="" lay-filter="editForm" method="post" hidden="true">
    <div class="layui-form-item" hidden="hidden">
        <label class="layui-form-label">ID</label>
        <div class="layui-input-block">
            <input type="text" name="makerUserId" lay-verify="required" autocomplete="off" placeholder="请输入ID" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">创客产品</label>
        <div class="layui-input-block">
            <select name="makerProduct" lay-filter="makerProduct" lay-verify="required" >
                <option value="">请选择</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">产品编码</label>
        <div class="layui-input-block">
            <input type="text" name="productCode" lay-verify="required" autocomplete="off" placeholder="456123" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">用户等级</label>
        <div class="layui-input-block">
            <select name="makerMemberLevel" lay-filter="makerMemberLevel" lay-verify="required">
                <option value="">请选择</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">电话号</label>
        <div class="layui-input-block">
            <input type="text" name="mobile" lay-verify="required" autocomplete="off" placeholder="15555555555" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">名字</label>
        <div class="layui-input-block">
            <input type="text" name="name" lay-verify="required" autocomplete="off" placeholder="张三" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">唯一标识</label>
        <div class="layui-input-block">
            <input type="text" name="openId" lay-verify="required" autocomplete="off" placeholder="1234564589" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">上级</label>
        <div class="layui-input-block">
            <input type="text" name="parentId" lay-verify="required" autocomplete="off" placeholder="李四" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">总数</label>
        <div class="layui-input-block">
            <input type="text" name="sumNum" lay-verify="required" autocomplete="off" placeholder="10" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">总价</label>
        <div class="layui-input-block">
            <input type="text" name="totalAmount" lay-verify="required" autocomplete="off" placeholder="1000.00" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">剩余数量</label>
        <div class="layui-input-block">
            <input type="text" name="num" lay-verify="required" autocomplete="off" placeholder="5" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">已提现金额</label>
        <div class="layui-input-block">
            <input type="text" name="amount" lay-verify="required" autocomplete="off" placeholder="500.00" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">可提现金额</label>
        <div class="layui-input-block">
            <input type="text" name="drawmoney" lay-verify="required" autocomplete="off" placeholder="0.00" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" hidden="hidden">
        <label class="layui-form-label">状态</label>
        <div class="layui-input-block">
            <input type="text" name="status" lay-verify="required" autocomplete="off" placeholder="1" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">创建人</label>
        <div class="layui-input-block">
            <input type="text" name="createOperator" lay-verify="required" autocomplete="off" placeholder="11" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" hidden="hidden">
        <label class="layui-form-label">创建时间</label>
        <div class="layui-input-block">
            <input type="text" name="createTime" lay-verify="required" autocomplete="off" placeholder="2019-04-26 15:30:43" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">修改人</label>
        <div class="layui-input-block">
            <input type="text" name="modifyOperator" lay-verify="required" autocomplete="off" placeholder="11" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" hidden="hidden">
        <label class="layui-form-label">更新时间</label>
        <div class="layui-input-block">
            <input type="text" name="dataChangeLastTime" lay-verify="required" autocomplete="off" placeholder="2019-04-26 15:30:43" class="layui-input">
        </div>
    </div>
</form>

<form class="layui-form layui-form-pane layui-personal" id="userOrderForm" action="" lay-filter="userOrderForm" method="post" hidden="true">
    <#--表格：显示会员订单-->
    <table id="userOrder" class="userOrder" lay-filter="userOrder" hidden="true"></table>
</form>

<script>
    //数据显示,分页实现
    var table,form,laydate,layer,dataProuct,dataMakerMember,dataOrderStatus,dataMakerUser;
    layui.use(['table','laydate'], function(){
        table = layui.table;
        laydate = layui.laydate;

        loadProduct();
        loadMakerMember();
        showSelect();
        loadOrderStatus();

        table.render({
            elem: '#makerUser'
            ,url: systemHost+"/manage/maker/user/selectMakerUserByCondition"     // selectAllMemberList(状态为0的也查询)
            ,cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            ,page:true          //显示分页默认不显示
            ,method: 'post'
            ,request: {
                pageName: 'pageNum', //页码的参数名称，默认：page
                limitName: 'pageSize' //每页数据量的参数名，默认：limit
            }
            ,parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                dataMakerUser = res.result==null?0:res.result.list;
                return {
                    "code": 0, //解析接口状态
                    "msg": res.responseStatusType.error.errorMsg, //解析提示文本
                    "count": res.result==null?0:res.result.total, //解析数据长度
                    "data": res.result==null?0:res.result.list //解析数据列表
                }
            }
            ,cols: [[
                {type: 'checkbox', fixed: 'left',width:40}
                ,{field: 'makerUserId', title: '序号', width:75, sort: true, fixed: 'left'}
                ,{field: 'makerProduct', title: '创客商品',templet: function (d) {
                        for(var p in dataProuct){
                            if(dataProuct[p].makerProductId == d.makerProduct){
                                return dataProuct[p].makerProduct
                            }
                        }
                        return ""
                    }, sort:true}
                ,{field: 'makerMemberLevel', title: '等级',templet: function (d) {
                        for(var p in dataMakerMember){
                            if(dataMakerMember[p].makerMemberLevelId == d.makerMemberLevel){
                                return dataMakerMember[p].makerMemberLevel
                            }
                        }
                        return ""
                    }, sort:true}
                ,{field: 'mobile', title: '电话'}
                ,{field: 'name', title: '姓名'}
                ,{field: 'parentId', title: '上级',templet: function (d) {
                        for(var p in dataMakerUser){
                            if(dataMakerUser[p].makerUserId == d.parentId){
                                return dataMakerUser[p].name
                            }
                        }
                        return ""
                    }, sort:true}
                ,{field: 'sumNum', title: '总数'}
                ,{field: 'totalAmount', title: '总价'}
                ,{field: 'num', title: '剩余数量'}
                ,{field: 'amount', title: '已提现'}
                ,{field: 'drawmoney', title: '可提现'}
                ,{field: 'status', title: '状态',hide:true}
                ,{field: 'createOperator', title: '创建人',hide:true}
                ,{field: 'createTime', title: '创建时间',hide:true}
                ,{field: 'modifyOperator', title: '修改人',hide:true}
                ,{field: 'dataChangeLastTime', title: '更新时间',hide:true}
                ,{fixed: 'right',title: '操作', width: 180, align: 'center',toolbar: '#barDemo'}
            ]]
            ,id: 'makerUserReload'
        });
    });
    //增删改查操作实现
    layui.use(['table','layer','form'], function(){
        table = layui.table;
        form = layui.form;
        layer=layui.layer;
        //监听表格复选框选择
        // table.on('checkbox(demo)', function(obj){
        // });
        //监听工具条
        table.on('tool(makerUser)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                detailMakerUser(data);
                // layer.msg('ID：'+ data.membershipLevelId + ' 的查看操作');
            } else if(obj.event === 'edit'){
                editMakerUser(data);
                // layer.alert('编辑行：<br>'+ JSON.stringify(data))
            }else if(obj.event === 'order'){
                showMakerUserOrder(data);
            }
        });

        var $ = layui.$, active = {
            // getCheckData: function(){ //获取选中数据
            //     var checkStatus = table.checkStatus('member')
            //         ,data = checkStatus.data;
            //     layer.alert(JSON.stringify(data));
            // }
            // ,getCheckLength: function(){ //获取选中数目
            //     var checkStatus = table.checkStatus('member')
            //         ,data = checkStatus.data;
            //     layer.msg('选中了：'+ data.length + ' 个');
            // }
            // ,isAll: function(){ //验证是否全选
            //     var checkStatus = table.checkStatus('member');
            //     layer.msg(checkStatus.isAll ? '全选': '未全选')
            // },
            search: function (){
                var makerProduct = $(".demoTable select[name='makerProduct'] option:selected").val(),
                    makerMemberLevel = $(".demoTable select[name='makerMemberLevel'] option:selected").val();
                table.reload('makerUserReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        makerProduct: makerProduct,
                        makerMemberLevel:makerMemberLevel
                    }
                }, 'data');
            }
        };

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    });
    function detailMakerUser(data){
        var a2 = layer.open({
            type: 1,
            title: '创客用户',
            content: $('#editForm'),
            closeBtn: 1,
            btn: ['确定'],
            yes: function(index,layero){
                layer.close(index);
            },
            success: function(layero,index){
                //回显
                var makerMemberLevel = layero.find("select[name='makerMemberLevel']");
                makerMemberLevel.find("option[value='"+data.makerMemberLevel+"']").attr("selected",true);
                var makerProduct = layero.find("select[name='makerProduct']");
                makerProduct.find("option[value='"+data.makerProduct+"']").attr("selected",true);
                form.render("select","editForm");
                var parent = "";
                for(var p in dataMakerUser){
                    if(dataMakerUser[p].makerUserId == data.parentId){
                        parent = dataMakerUser[p].name
                    }
                }
                layero.find("input[name='makerUserId']").val(data.makerUserId);
                layero.find("input[name='productCode']").val(data.productCode);
                layero.find("input[name='makerMemberLevel']").val(data.makerMemberLevel);
                layero.find("input[name='mobile']").val(data.mobile);
                layero.find("input[name='name']").val(data.name);
                layero.find("input[name='openId']").val(data.openId);
                layero.find("input[name='parentId']").val(parent);
                layero.find("input[name='sumNum']").val(data.sumNum);
                layero.find("input[name='totalAmount']").val(data.totalAmount);
                layero.find("input[name='num']").val(data.num);
                layero.find("input[name='amount']").val(data.amount);
                layero.find("input[name='drawmoney']").val(data.drawmoney);
                layero.find("input[name='status']").val(data.status);
                layero.find("input[name='createOperator']").val(data.createOperator);
                layero.find("input[name='createTime']").val(data.createTime);
                layero.find("input[name='modifyOperator']").val(data.modifyOperator);
                layero.find("input[name='dataChangeLastTime']").val(data.dataChangeLastTime);
                // layero.find("input[name='createOperator']").parent().parent().hide();
                // layero.find("input[name='modifyOperator']").parent().parent().hide();
            },
            area:['600px', '500px']
        });
    }

    function editMakerUser(data){
        var a3 = layer.open({
            type: 1,
            title: '创客用户',
            content: $('#editForm'),
            closeBtn: 1,
            btn: ['提交', '取消'],
            yes: function(index,layero){
                var url = systemHost+"/manage/maker/user/updateMakerUser",
                    params={
                        makerUserId:data.makerUserId,
                        mobile: layero.find("input[name='mobile']").val(),
                        name: layero.find("input[name='name']").val(),
                        modifyOperator: "${currentUser.trueName!}"
                    };
                $.post(url,params,function (res) {
                    if(res.responseStatusType.message=="Success"){
                        layer.open({
                            title: '修改'
                            ,content: '修改成功！'
                            ,btn: ["关闭"]
                            ,yes: function (index) {
                                layer.close(index);
                                layer.close(a3);
                            }
                        });
                        table.reload("makerUserReload");
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
                layer.close(index);
            },
            success: function(layero,index){
                //回显
                var makerMemberLevel = layero.find("select[name='makerMemberLevel']");
                makerMemberLevel.find("option[value='"+data.makerMemberLevel+"']").attr("selected",true);
                var makerProduct = layero.find("select[name='makerProduct']");
                makerProduct.find("option[value='"+data.makerProduct+"']").attr("selected",true);
                form.render("select","editForm");
                var parent = "";
                for(var p in dataMakerUser){
                    if(dataMakerUser[p].makerUserId == data.parentId){
                        parent = dataMakerUser[p].name
                    }
                }
                layero.find("input[name='makerUserId']").val(data.makerUserId);
                layero.find("input[name='productCode']").val(data.productCode);
                layero.find("input[name='makerMemberLevel']").val(data.makerMemberLevel);
                layero.find("input[name='mobile']").val(data.mobile);
                layero.find("input[name='name']").val(data.name);
                layero.find("input[name='openId']").val(data.openId);
                layero.find("input[name='parentId']").val(parent);
                layero.find("input[name='sumNum']").val(data.sumNum);
                layero.find("input[name='totalAmount']").val(data.totalAmount);
                layero.find("input[name='num']").val(data.num);
                layero.find("input[name='amount']").val(data.amount);
                layero.find("input[name='drawmoney']").val(data.drawmoney);
                layero.find("input[name='status']").val(data.status);
                layero.find("input[name='createOperator']").val(data.createOperator);
                layero.find("input[name='createTime']").val(data.createTime);
                layero.find("input[name='modifyOperator']").val(data.modifyOperator);
                layero.find("input[name='dataChangeLastTime']").val(data.dataChangeLastTime);
                //不能编辑
                layero.find("input[name='createOperator']").parent().parent().hide();
                layero.find("input[name='modifyOperator']").parent().parent().hide();
                layero.find("input[name='productCode']").parent().parent().hide();
                layero.find("input[name='openId']").parent().parent().hide();
                layero.find("input[name='parentId']").parent().parent().hide();
                layero.find("input[name='sumNum']").parent().parent().hide();
                layero.find("input[name='totalAmount']").parent().parent().hide();
                layero.find("input[name='num']").parent().parent().hide();
                layero.find("input[name='amount']").parent().parent().hide();
                layero.find("input[name='drawmoney']").parent().parent().hide();
                layero.find("select[name='makerProduct']").parent().parent().hide();
                layero.find("select[name='makerMemberLevel']").parent().parent().hide();

            },
            area:['600px', '500px']
        });
    }

    function showMakerUserOrder(data){
        var s2 = layer.open({
            type: 1,
            title: '创客用户订单详情',
            content: $('#userOrderForm'),
            success: function(layero, index){
                table.render({
                    elem: '#userOrder'
                    , url: systemHost+"/manage/maker/order/selectMakerOrderByCondition"     // selectAllMemberList(状态为0的也查询)
                    , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    , page: true          //显示分页默认不显示
                    , method: 'post'
                    , request: {
                        pageName: 'pageNum', //页码的参数名称，默认：page
                        limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    }
                    , where: {
                        makerUserId: data.makerUserId
                    }
                    , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                        return {
                            "code": 0, //解析接口状态
                            "msg": res.responseStatusType.error.errorMsg, //解析提示文本
                            "count": res.result == null ? 0 : res.result.total, //解析数据长度
                            "data": res.result == null ? 0 : res.result.list //解析数据列表
                        }
                    }
                    , cols: [[
                        {type: 'checkbox', fixed: 'left', width: 40,hide: true}
                        , {field: 'makerOrderId', title: '序号', width: 75, sort: true, fixed: 'left'}
                        , {field: 'purchaserName', title: '用户', sort: true}
                        , {field: 'mobile', title: '电话号', sort: true}
                        , {field: 'productCode', title: '购买商品', sort: true,templet: function (d) {
                                var makerProduct = "";
                                for(var i in dataProuct){
                                    if(dataProuct[i].productCode == d.productCode){
                                        makerProduct = dataProuct[i].makerProduct;
                                    }
                                }
                                return makerProduct;
                            }}
                        , {field: 'num', title: '购买数量'}
                        , {field: 'totalAmount', title: '总价',sort: true}
                        , {field: 'orderStatus', title: '订单状态',templet: function (d) {
                                var orderStatus = "";
                                for(var i in dataOrderStatus){
                                    if(i ==  d.orderStatus){
                                        orderStatus = dataOrderStatus[i];
                                    }
                                }
                                return orderStatus;
                            }}
                        , {field: 'orderSource', title: '订单来源',hide: true}
                        , {field: 'status', title: '状态', hide: true}
                        , {field: 'createOperator', title: '创建人', hide: true}
                        , {field: 'createTime', title: '创建时间', hide: true}
                        , {field: 'modifyOperator', title: '修改人', hide: true}
                        , {field: 'dataChangeLastTime', title: '更新时间', hide: true}
                    ]]
                });
            },
            area:['600px', '500px']
        });
    }

    function loadMakerMember(){
        $.ajax({
            url: systemHost+"/manage/maker/member/selectMakerMemberList",
            async:false,
            method: "POST",
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    dataMakerMember = res.result.list;
                }
            }
        })
    }
    function loadOrderStatus(){
        $.ajax({
            url: systemHost+"/manage/maker/order/selectOrderStatusEnum",
            data: {name:"OrderStatusEnum"},
            async:false,
            method: "POST",
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    dataOrderStatus = res.result;
                }
            }
        })
    }

    function showSelect() {
        $(".demoTable select[name='makerMemberLevel']").html("<option value=''>请选择</option>");
        $(".demoTable select[name='makerProduct']").html("<option value=''>请选择</option>");
        $("#editForm select[name='makerMemberLevel']").html("<option value=''>请选择</option>");
        $("#editForm select[name='makerProduct']").html("<option value=''>请选择</option>");
        for (var p in dataMakerMember) {
            var option = "<option value='" + dataMakerMember[p].makerMemberLevelId + "'>" + dataMakerMember[p].makerMemberLevel + "</option>";
            $(".demoTable select[name='makerMemberLevel']").append(option);
            $("#editForm select[name='makerMemberLevel']").append(option);
        }
        for (var p in dataProuct) {
            var option = "<option value='" + dataProuct[p].makerProductId + "'>" + dataProuct[p].makerProduct + "</option>";
            $(".demoTable select[name='makerProduct']").append(option);
            $("#editForm select[name='makerProduct']").append(option);
        }
        form.render("select","demoTable");
        form.render("select","editForm");
    }

    function loadProduct(){
        $.ajax({
            url: systemHost+"/manage/maker/product/selectMakerProductList",
            async:false,
            method: "POST",
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    dataProuct = res.result.list;
                }
            }
        })
    }

</script>

</body>
</html>