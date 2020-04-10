<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>创客等级</title>
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
    <div class="demoTable layui-form" lay-filter="demoTable" style="margin-top: 15px">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label resetLabel">限购类别</label>
                <div class="layui-input-inline">
                    <select name="makerTypeSearch" lay-filter="makerTypeSearch" lay-verify="required">
                        <option value="">请选择</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">创客产品</label>
                <div class="layui-input-inline">
                    <select name="makerProductSearch" lay-filter="makerProductSearch" lay-verify="required">
                        <option value="">请选择</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <button class="layui-btn" data-type="search" ><i class="layui-icon layui-icon-search"></i></button>
            </div>
            <div class="layui-inline">
                <div class="layui-btn-group demoTable">
                    <button class="layui-btn" data-type="addMakerMember">添加等级</button>
                    <#--<button class="layui-btn" data-type="getCheckData" >获取选中行数据</button>-->
                    <#--<button class="layui-btn" data-type="getCheckLength">获取选中数目</button>-->
                    <#--<button class="layui-btn" data-type="isAll">验证是否全选</button>-->
                </div>
            </div>
        </div>
    </div>
    <#--表格:显示创客会员等级-->
    <table id="makerMember" lay-filter="makerMember"></table>
</div>
<#-- 按钮 -->
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="makerUser">会员</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<#-- 按钮 -->
<script type="text/html" id="userDemo">
    <#--<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detailMakerUser">查看创客会员</a>-->
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="showMakerUserOrder">创客会员订单</a>
</script>

<#--点击编辑后的表单-->
<form id="editForm" class="layui-form editForm layui-form-pane layui-personal" action="" lay-filter="editForm" method="post" hidden="true">
    <div class="layui-form-item" hidden="hidden">
        <label class="layui-form-label">ID</label>
        <div class="layui-input-block">
            <input type="text" name="makerMemberLevelId" lay-verify="required" autocomplete="off" placeholder="请输入ID" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">等级</label>
        <div class="layui-input-block">
            <input type="text" name="makerMemberLevel" lay-verify="required" autocomplete="off" placeholder="请输入等级" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">限购分类</label>
        <div class="layui-input-block">
            <select name="makerType" lay-filter="makerType" lay-verify="required">
                <option value="">请选择</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">升级价格</label>
        <div class="layui-input-block">
            <input type="text" name="levelUpdatePrice" lay-verify="required" autocomplete="off" placeholder="10000.00" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">销售数量</label>
        <div class="layui-input-block">
            <input type="text" name="salesNumber" lay-verify="required" autocomplete="off" placeholder="100" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">销售金额</label>
        <div class="layui-input-block">
            <input type="text" name="salesPrice" lay-verify="required" autocomplete="off" placeholder="100.00" class="layui-input">
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
        <label class="layui-form-label">产品价格</label>
        <div class="layui-input-block">
            <input type="text" name="productPrice" lay-verify="required" autocomplete="off" placeholder="98.00" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">一级奖金</label>
        <div class="layui-input-block">
            <input type="text" name="bonus1" lay-verify="required" autocomplete="off" placeholder="5.00" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">二级奖金</label>
        <div class="layui-input-block">
            <input type="text" name="bonus2" lay-verify="required" autocomplete="off" placeholder="5.00" class="layui-input">
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

<form class="layui-form layui-form-pane layui-personal" id="makerUserForm" action="" lay-filter="makerUserForm" method="post" hidden="true">
    <#--表格：显示等级的会员-->
    <table id="makerUser" class="makerUser" lay-filter="makerUser" hidden="true"></table>
</form>
<form class="layui-form layui-form-pane layui-personal" id="userOrderForm" action="" lay-filter="userOrderForm" method="post" hidden="true">
    <#--表格：显示会员订单-->
    <table id="userOrder" class="userOrder" lay-filter="userOrder" hidden="true"></table>
</form>

<script>
    //数据显示,分页实现
    var table,form,laydate,layer,dataMakerType,dataProuct,dataMakerMember,dataOrderStatus;
    layui.use(['table','laydate'], function(){
        table = layui.table;
        laydate = layui.laydate;

        loadMakerType();
        loadProduct();
        showSelect();
        loadMakerMember();
        loadOrderStatus();

        table.render({
            elem: '#makerMember'
            ,url: systemHost+"/manage/maker/member/selectMakerMemberByCondition"     // selectAllMemberList(状态为0的也查询)
            ,cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            ,page:true          //显示分页默认不显示
            ,method: 'post'
            ,request: {
                pageName: 'pageNum', //页码的参数名称，默认：page
                limitName: 'pageSize' //每页数据量的参数名，默认：limit
            }
            ,parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                return {
                    "code": 0, //解析接口状态
                    "msg": res.responseStatusType.error.errorMsg, //解析提示文本
                    "count": res.result==null?0:res.result.total, //解析数据长度
                    "data": res.result==null?0:res.result.list //解析数据列表
                }
            }
            ,cols: [[
                {type: 'checkbox', fixed: 'left',width:40}
                ,{field: 'makerMemberLevelId', title: 'Id', width:60, sort: true, fixed: 'left'}
                ,{field: 'makerMemberLevel', title: '等级', sort:true}
                ,{field: 'makerType', title: '限购分类',templet: function (d) {
                        for(var p in dataMakerType){
                            if(dataMakerType[p].parameterId == d.makerType){
                                return dataMakerType[p].parameterName
                            }
                        }
                        return ""
                }, sort:true}
                ,{field: 'levelUpdatePrice', title: '升级价格'}
                ,{field: 'salesNumber', title: '销售数量'}
                ,{field: 'salesPrice', title: '销售价格'}
                ,{field: 'makerProduct', title: '商品',templet: function (d) {
                        for(var p in dataProuct){
                            if(dataProuct[p].makerProductId == d.makerProduct){
                                return dataProuct[p].makerProduct
                            }
                        }
                        return ""
                    }, sort:true}
                ,{field: 'productPrice', title: '商品价格'}
                ,{field: 'bonus1', title: '一级奖金'}
                ,{field: 'bonus2', title: '二级奖金'}
                ,{field: 'status', title: '状态',hide:true}
                ,{field: 'createOperator', title: '创建人',hide:true}
                ,{field: 'createTime', title: '创建时间',hide:true}
                ,{field: 'modifyOperator', title: '修改人',hide:true}
                ,{field: 'dataChangeLastTime', title: '更新时间',hide:true}
                ,{fixed: 'right',title: '操作', width: 230, align: 'center',toolbar: '#barDemo'}
            ]]
            ,id: 'makerMemberReload'
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
        table.on('tool(makerMember)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                showMakerMember(data);
                // layer.msg('ID：'+ data.membershipLevelId + ' 的查看操作');
            } else if(obj.event === 'del'){
                layer.confirm('真的删除ID为'+data.makerMemberLevelId+'的用户会员么？', function(index){
                    deleteMakerMember(data);
                    obj.del();
                });
            }else if(obj.event === 'edit'){
                editMakerMember(data);
                // layer.alert('编辑行：<br>'+ JSON.stringify(data))
            }else if(obj.event === 'makerUser'){
                showMakerUser(data);
            }
        });
        table.on('tool(makerUser)', function(obj){
            var data = obj.data;
            if(obj.event === 'detailMakerUser'){
                detailMakerUser(data);
                // layer.msg('ID：'+ data.membershipLevelId + ' 的查看操作');
            } else if(obj.event === 'showMakerUserOrder'){
                showMakerUserOrder(data);
            }
        });


        var $ = layui.$, active = {
            getCheckData: function(){ //获取选中数据
                var checkStatus = table.checkStatus('member')
                    ,data = checkStatus.data;
                layer.alert(JSON.stringify(data));
            }
            ,getCheckLength: function(){ //获取选中数目
                var checkStatus = table.checkStatus('member')
                    ,data = checkStatus.data;
                layer.msg('选中了：'+ data.length + ' 个');
            }
            ,isAll: function(){ //验证是否全选
                var checkStatus = table.checkStatus('member');
                layer.msg(checkStatus.isAll ? '全选': '未全选')
            }
            ,addMakerMember: function (){  //添加等级
                var a1 = layer.open({
                    type: 1,
                    title: '添加创客等级',
                    content: $('#editForm'),
                    data: {
                        table:table
                    },
                    closeBtn: 1,
                    btn: ['提交', '取消'],
                    yes: function(index,layero){
                        var url = systemHost+"/manage/maker/member/insertMakerMember";
                        //下拉框
                        var makerType = layero.find("select[name='makerType']");
                        makerType = makerType.find("option:selected").val();
                        var makerProduct = layero.find("select[name='makerProduct']");
                        makerProduct = makerProduct.find("option:selected").val();
                        var params={
                            makerMemberLevel: layero.find("input[name='makerMemberLevel']").val(),
                            makerType: makerType,
                            levelUpdatePrice: layero.find("input[name='levelUpdatePrice']").val(),
                            salesNumber: layero.find("input[name='salesNumber']").val(),
                            salesPrice: layero.find("input[name='salesPrice']").val(),
                            makerProduct: makerProduct,
                            productPrice: layero.find("input[name='productPrice']").val(),
                            bonus1: layero.find("input[name='bonus1']").val(),
                            bonus2: layero.find("input[name='bonus2']").val(),
                            createOperator: "${currentUser.trueName!}",
                            modifyOperator: "${currentUser.trueName!}"
                        };
                        $.post(url,params,function (res) {
                            if(res.responseStatusType.message=="Success"){
                                layer.open({
                                    title: '添加'
                                    ,content: '添加成功！'
                                    ,btn: ["关闭"]
                                    ,yes: function (index) {
                                        layer.close(index); //如果设定了yes回调，需进行手工关闭
                                        layer.close(a1);
                                    }
                                });
                                //重新加载表格
                                table.reload("makerMemberReload");
                            }else{
                                layer.open({
                                    title: '添加'
                                    ,content: '添加失败！'
                                    ,btn: ["关闭"]
                                });
                            }
                        })
                        // layer.close(); //如果设定了yes回调，需进行手工关闭
                    },
                    btn2: function(index){
                        layer.close(index);
                    },
                    success: function(layero){
                        //编辑则隐藏创建人和编辑人
                        layero.find("input[name='createOperator']").parent().parent().hide();
                        layero.find("input[name='modifyOperator']").parent().parent().hide();
                    },
                    area:['600px', '500px']
                    ,end:function(){
                        window.location.reload();
                    }
                });
            }
            ,search: function (){
                var makerType = $(".demoTable select[name='makerTypeSearch'] option:selected").val(),
                makerProduct = $(".demoTable select[name='makerProductSearch'] option:selected").val();
                table.reload('makerMemberReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        makerType:  makerType,
                        makerProduct: makerProduct
                    }
                }, 'data');
            }
        };

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        form.on('select(makerType)',function (obj) {
            var makerType = obj.value;    //option的值
            loadProduct(makerType);
            $("#editForm select[name='makerProduct']").html("<option value=''>请选择</option>");
            for(var p in dataProuct){
                var option = "<option value='" + dataProuct[p].makerProductId + "'>" + dataProuct[p].makerProduct + "</option>";
                $("#editForm select[name='makerProduct']").append(option);
            }
            form.render("select","editForm");
        });

        form.on('select(makerProduct)',function (obj) {
            var productId = obj.value;    //option的值
            var productPrice = 0.00;
            for(var p in dataProuct){
                if(dataProuct[p].makerProductId == productId){
                    productPrice = dataProuct[p].retailPrice
                }
            }
            $("#editForm input[name='productPrice']").html(productPrice);
        });

    });

    function showMakerUser(data){
        //创客产品
        var makerType = data.makerType;    //option的值
        loadProduct(makerType);
        var s1 = layer.open({
            type: 1,
            title: '等级会员',
            content: $('#makerUserForm'),
            success: function (layero, index) {
                table.render({
                    elem: '#makerUser'
                    , url: systemHost + "/manage/maker/user/selectMakerUserByCondition"     // selectAllMemberList(状态为0的也查询)
                    , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    , page: true          //显示分页默认不显示
                    , method: 'post'
                    , request: {
                        pageName: 'pageNum', //页码的参数名称，默认：page
                        limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    }
                    , where: {
                        makerMemberLevel: data.makerMemberLevelId
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
                        {type: 'checkbox', fixed: 'left', width: 40,hide:true}
                        , {field: 'makerUserId', title: '序号', width: 60/*, sort: true*/, fixed: 'left'}
                        , {field: 'name', title: '用户', sort: true}
                        , {field: 'mobile', title: '电话号'}
                        , {field: 'makerProduct', title: '创客商品',templet: function (d) {
                                var makerProduct = "";
                                for(var i in dataProuct){
                                    if(dataProuct[i].makerProductId == d.makerProduct){
                                        makerProduct = dataProuct[i].makerProduct;
                                    }
                                }
                                return makerProduct;
                            }}
                        , {field: 'makerMemberLevel', title: '等级',templet: function (d) {
                                var makerMemberLevelName = "";
                                for(var i in dataMakerMember){
                                    if(dataMakerMember[i].makerMemberLevelId == d.makerMemberLevel){
                                        makerMemberLevelName = dataMakerMember[i].makerMemberLevel;
                                    }
                                }
                                return makerMemberLevelName;
                            }}
                        , {field: 'parentId', title: '上级', sort: true,templet: function (d) {
                                var dataUserName = loadMakerUser(null,d.parentId);
                                var  userName = "";
                                if(dataUserName!=null && typeof(dataUserName)!="undefined" &&
                                dataUserName != [] && dataUserName.length !=0){
                                    userName = dataUserName[0].name;
                                }
                                return userName;
                            }}
                        , {field: 'sumNum', title: '总数', sort: true}
                        , {field: 'totalAmount', title: '总价', sort: true}
                        , {field: 'num', title: '剩余数量',hide: true}
                        , {field: 'amount', title: '已提现',hide: true}
                        , {field: 'drawmoney', title: '可提现',hide: true}
                        , {field: 'status', title: '状态', hide: true}
                        , {field: 'createOperator', title: '创建人', hide: true}
                        , {field: 'createTime', title: '创建时间', hide: true}
                        , {field: 'modifyOperator', title: '修改人', hide: true}
                        , {field: 'dataChangeLastTime', title: '更新时间', hide: true}
                        , {fixed: 'right', title: '操作', width: 120, align: 'center', toolbar: '#userDemo'}
                    ]]
                });
            },
            area:['800px', '600px']
        });

        /*$("#makerUser").html("<tr><th>Id</th><th>用户名</th><th>电话号</th><th>创客商品</th><th>会员等级</th><th>上级</th><th>操作</th></tr>");
        if(dataMakerUser==null || dataMakerUser==[] || dataMakerUser.length==0){
            $("#makerUser").append("<tr>此等级暂时没有会员</tr>")
        }

        for(var p in dataMakerUser){
            var makerMemberLevelName = "";
            for(var i in dataMakerMember){
                if(dataMakerMember[i].makerMemberLevelId == dataMakerUser[p].makerMemberLevel){
                    makerMemberLevelName = dataMakerMember[i].makerMemberLevel;
                }
            }
            var makerProduct = "";
            for(var i in dataProuct){
                if(dataProuct[i].makerProductId == dataMakerUser[p].makerProduct){
                    makerProduct = dataProuct[i].makerProduct;
                }
            }
            var dataUserName = loadMakerUser(null,dataMakerUser[p].parentId),userName = dataUserName[0].name;
            var tr = "<tr><td>"+dataMakerUser[p].makerUserId+"</td><td>"+dataMakerUser[p].name+"</td><td>"+dataMakerUser[p].mobile+"</td>" +
                "<td>"+makerProduct+"</td><td>"+makerMemberLevelName+"</td><td>"+ userName +"</td>" +
                "<td><div>" +
                // "<button  class='userOpt' onclick='detailMakerUser("+dataMakerUser[p]+")'>查看创客会员</button >" +
                "<button  class='userOpt' onclick='showMakerUserOrder("+dataMakerUser[p].makerUserId+")'>创客会员订单</button >" +
                "</div></td></tr>";
            $("#makerUser").append(tr);
        }*/
    }
    //查看创客会员
    // function detailMakerUser(data){
    //
    // }
    //创客会员订单
    function showMakerUserOrder(data){
        //创客产品
        loadProductById(data.productCode);
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
                        , {field: 'makerOrderId', title: '序号', width: 60, fixed: 'left'}
                        , {field: 'purchaserName', title: '用户', sort: true}
                        , {field: 'mobile', title: '电话号'}
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
    function loadMakerUser(makerMemberLevelId,parentId) {
        var url = systemHost+"/manage/maker/user/selectMakerUserByCondition",
            param = {
                makerMemberLevel: makerMemberLevelId,
                makerUserId: parentId
            },
            dataMakerUser = [];
        $.ajax({
            url: url,
            method: "POST",
            data: param,
            async: false,
            success:function (res) {
                if(res.responseStatusType.message=="Success"){
                    dataMakerUser = res.result.list;
                }
            }
        });
        return dataMakerUser;
    }
    function loadMakerMember(){
        dataMakerMember = []
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
        dataOrderStatus = []
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

    function showMakerMember(data){
        var a2 = layer.open({
            type: 1,
            title: '创客等级',
            content: $('#editForm'),
            closeBtn: 1,
            btn: ['确定'],
            yes: function(index,layero){
                layer.close(index);
            },
            success: function(layero,index){
                //回显
                var makerType = layero.find("select[name='makerType']");
                makerType.find("option[value='"+data.makerType+"']").attr("selected",true);
                // var makerProduct = layero.find("select[name='makerProduct']");
                // makerProduct.find("option[value='"+data.makerProduct+"']").attr("selected",true);
                loadProduct(data.makerType);
                $("#editForm select[name='makerProduct']").html("<option value=''>请选择</option>");
                for(var p in dataProuct){
                    var option = "<option value='" + dataProuct[p].makerProductId + "'>" + dataProuct[p].makerProduct + "</option>";
                    if( data.makerProduct == dataProuct[p].makerProductId ){
                        option = "<option value='" + dataProuct[p].makerProductId + "' selected='true'>" + dataProuct[p].makerProduct + "</option>";
                    }
                    $("#editForm select[name='makerProduct']").append(option);
                }
                form.render("select","editForm");
                layero.find("input[name='makerMemberLevel']").val(data.makerMemberLevel);
                layero.find("input[name='levelUpdatePrice']").val(data.levelUpdatePrice);
                layero.find("input[name='salesNumber']").val(data.salesNumber);
                layero.find("input[name='salesPrice']").val(data.salesPrice);
                layero.find("input[name='productPrice']").val(data.productPrice);
                layero.find("input[name='bonus1']").val(data.bonus1);
                layero.find("input[name='bonus2']").val(data.bonus2);
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

    function editMakerMember(data){
        var a3 = layer.open({
            type: 1,
            title: '创客等级',
            content: $('#editForm'),
            closeBtn: 1,
            btn: ['提交', '取消'],
            yes: function(index,layero){
                var url = systemHost+"/manage/maker/member/updateMakerMember";
                var makerType = layero.find("select[name='makerType']");
                makerType = makerType.find("option:selected").val();
                var makerProduct = layero.find("select[name='makerProduct']");
                makerProduct = makerProduct.find("option:selected").val();
                var params={
                    makerMemberLevelId: data.makerMemberLevelId,
                    makerMemberLevel: layero.find("input[name='makerMemberLevel']").val(),
                    makerType: makerType,
                    levelUpdatePrice: layero.find("input[name='levelUpdatePrice']").val(),
                    salesNumber: layero.find("input[name='salesNumber']").val(),
                    salesPrice: layero.find("input[name='salesPrice']").val(),
                    makerProduct: makerProduct,
                    productPrice: layero.find("input[name='productPrice']").val(),
                    bonus1: layero.find("input[name='bonus1']").val(),
                    bonus2: layero.find("input[name='bonus2']").val(),
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
                        //重新加载tree
                        table.reload("makerMemberReload");
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
                var makerType = layero.find("select[name='makerType']");
                makerType.find("option[value='"+data.makerType+"']").attr("selected",true);
                // var makerProduct = layero.find("select[name='makerProduct']");
                // makerProduct.find("option[value='"+data.makerProduct+"']").attr("selected",true);
                loadProduct(data.makerType);
                $("#editForm select[name='makerProduct']").html("<option value=''>请选择</option>");
                for(var p in dataProuct){
                    var option = "<option value='" + dataProuct[p].makerProductId + "'>" + dataProuct[p].makerProduct + "</option>";
                    if( data.makerProduct == dataProuct[p].makerProductId ){
                        option = "<option value='" + dataProuct[p].makerProductId + "' selected='true'>" + dataProuct[p].makerProduct + "</option>";
                    }
                    $("#editForm select[name='makerProduct']").append(option);
                }
                form.render("select","editForm");
                layero.find("input[name='makerMemberLevel']").val(data.makerMemberLevel);
                layero.find("input[name='levelUpdatePrice']").val(data.levelUpdatePrice);
                layero.find("input[name='salesNumber']").val(data.salesNumber);
                layero.find("input[name='salesPrice']").val(data.salesPrice);
                layero.find("input[name='productPrice']").val(data.productPrice);
                layero.find("input[name='bonus1']").val(data.bonus1);
                layero.find("input[name='bonus2']").val(data.bonus2);
                layero.find("input[name='status']").val(data.status);
                layero.find("input[name='createOperator']").val(data.createOperator);
                layero.find("input[name='createTime']").val(data.createTime);
                layero.find("input[name='modifyOperator']").val(data.modifyOperator);
                layero.find("input[name='dataChangeLastTime']").val(data.dataChangeLastTime);
                layero.find("input[name='createOperator']").parent().parent().hide();
                layero.find("input[name='modifyOperator']").parent().parent().hide();
            },
            area:['600px', '500px']
        });
    }

    function deleteMakerMember(data) {
        //删除数据库数据
        var url = systemHost+"/manage/maker/member/deleteMakerMember";
        var params={
            makerMemberLevelId: data.makerMemberLevelId,
            modifyOperator: "${currentUser.trueName!}"
        };
        $.post(url,params,function (res) {
            if(res.responseStatusType.message=="Success"){
                layer.open({
                    title: '删除'
                    ,content: '删除成功！'
                    ,btn: ["关闭"]
                    ,yes: function(index){
                        layer.close(index);
                    }
                });
                //重新加载表格
                table.reload("makerMemberReload");
            }else{
                layer.open({
                    title: '删除'
                    ,content: '删除失败！'
                    ,btn: ["关闭"]
                });
            }
        })
    }

    function showSelect() {
        $(".demoTable select[name='makerTypeSearch']").html("<option value=''>请选择</option>");
        $(".demoTable select[name='makerProductSearch']").html("<option value=''>请选择</option>");
        $("#editForm select[name='makerType']").html("<option value=''>请选择</option>");
        // $("#editForm select[name='makerProduct']").html("<option value=''>请选择</option>");
        for (var p in dataMakerType) {
            var option = "<option value='" + dataMakerType[p].parameterId + "'>" + dataMakerType[p].parameterName + "</option>";
            $(".demoTable select[name='makerTypeSearch']").append(option);
            $("#editForm select[name='makerType']").append(option);
        }
        for (var p in dataProuct) {
            var option = "<option value='" + dataProuct[p].makerProductId + "'>" + dataProuct[p].makerProduct + "</option>";
            $(".demoTable select[name='makerProductSearch']").append(option);
            // $("#editForm select[name='makerProduct']").append(option);
        }
        form.render("select","demoTable");
        form.render("select","editForm");
    }
    function loadMakerType(){
        dataMakerType = []
        $.ajax({
            url: systemHost+"/manage/system/selectParameterList",
            data:{parameterTypeId:10},
            async:false,
            method: "POST",
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    dataMakerType = res.result.list;
                }
            }
        })
    }
    function loadProduct(makerType){
        dataProuct = [];
        $.ajax({
            url: systemHost+"/manage/maker/product/selectMakerProductByCondition",
            async:false,
            data:{makerType:makerType},
            method: "POST",
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    dataProuct = res.result.list;
                }
            }
        })
    }
    function loadProductById(productCode){
        dataProuct = [];
        $.ajax({
            url: systemHost+"/manage/maker/product/selectMakerProductByCondition",
            async:false,
            data:{productCode:productCode},
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