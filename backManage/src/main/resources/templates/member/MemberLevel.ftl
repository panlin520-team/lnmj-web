<#--商城会员管理-->
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>用户会员等级管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${basePath!}/layui/css/layui.css"  media="all">
    <link rel="stylesheet" href="${basePath!}/css/index.css" media="all"/>
    <script src="${basePath!}/js/jquery.min.js" type="text/javascript"></script>
    <script src="${basePath!}/layui/layui.js" charset="utf-8"></script>
    <script src="${basePath!}/js/host.js" type="text/javascript"></script>
    <#include "../baseFtl/pageAuth.ftl" />
    <#include "../baseFtl/number.ftl" />
    <style>
        .resetLabel {
            width: 42px;
        }
        label.xrequired:before {
            content: '* ';
            color: red;
        }
    </style>
</head>
<body>
<div class="layui-fluid">
    <div class="demoTable layui-form" style="margin-top: 15px">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label resetLabel">关键词</label>
                <div class="layui-input-inline">
                    <input class="layui-input" type="text" name="keyWord" autocomplete="off" placeholder="输入关键词">
                </div>
            </div>
            <div class="layui-inline">
                <button class="layui-btn" data-type="search" ><i class="layui-icon layui-icon-search"></i></button>
            </div>
            <div class="layui-inline">
                <div class="layui-btn-group demoTable">
                    <button class="layui-btn" data-type="addMemberView">添加会员等级</button>
                    <#--<button class="layui-btn" data-type="getCheckData" >获取选中行数据</button>-->
                    <#--<button class="layui-btn" data-type="getCheckLength">获取选中数目</button>-->
                    <#--<button class="layui-btn" data-type="isAll">验证是否全选</button>-->
                </div>
            </div>
        </div>

    </div>
    <#--表格:显示会员等级数据-->
    <table id="member" lay-filter="demo"></table>
</div>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="showUser">会员</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script type="text/html" id="userBarDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="showLevel">升级记录</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="changeLevel">改变等级</a>
</script>

<#--点击编辑后的表单-->
<form id="editForm" class="layui-form editForm layui-form-pane layui-personal" action="" lay-filter="example" method="post" hidden="true">
    <div class="layui-form-item" hidden="hidden">
        <label class="layui-form-label">ID</label>
        <div class="layui-input-block">
            <input type="text" name="membershipLevelId" lay-verify="required" autocomplete="off" placeholder="请输入会员等级ID" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired">名称</label>
        <div class="layui-input-block">
            <input type="text" name="membershipLevelName" lay-verify="required" autocomplete="off" placeholder="请输入会员等级名称" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired">是否自动升级</label>
        <div class="layui-input-block">
            <select name="autoUpgrade" lay-filter="autoUpgrade" lay-verify="required">
                <option value="false">否</option>
                <option value="true">是</option>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label xrequired">是否股东等级</label>
        <div class="layui-input-block">
            <select name="isDivision" lay-filter="isDivision" lay-verify="required">
                <option value="false">否</option>
                <option value="true">是</option>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">是否默认等级</label>
        <div class="layui-input-block">
            <select name="isDefault" lay-filter="isDefault" lay-verify="required">
                <option value="false">否</option>
                <option value="true">是</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired">等级累计储值</label>
        <div class="layui-input-block">
            <input type="text" name="standardAmount" lay-verify="required" autocomplete="off" placeholder="例如:10000.00" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired">等级单次储值</label>
        <div class="layui-input-block">
            <input type="text" name="bestieIntroduceAmount" lay-verify="required" autocomplete="off" placeholder="例如:10000.00" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired">消费标准</label>
        <div class="layui-input-block">
            <input type="text" name="upgradeStandardAmount" lay-verify="required" autocomplete="off" placeholder="例如:1000.00" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired">拓客标准</label>
        <div class="layui-input-block">
            <input type="text" name="upgradeStandardFans" lay-verify="required" autocomplete="off" placeholder="例如:100" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired">会员升级方式</label>
        <div class="layui-input-block" id="upgradingWays">
        </div>
        <#--<div class="layui-input-block">-->
            <#---->
            <#--<select name="upgradingWays" lay-filter="upgradingWays" lay-verify="required" >-->
                <#--<option value="">请选择</option>-->
            <#--</select>-->
        <#--</div>-->
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired">等级折扣(%)</label>
        <div class="layui-input-block">
            <input type="text" name="membershipDiscount" lay-verify="required" autocomplete="off" placeholder="例如:100" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label ">差价分配(%)</label>
        <div class="layui-input-block">
            <input type="text" name="priceDifferenceAllot" lay-verify="required" autocomplete="off" placeholder="例如:15" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label ">奖金分配(%)</label>
        <div class="layui-input-block">
            <input type="text" name="bonusAllot" lay-verify="required" autocomplete="off" placeholder="例如:18" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label ">护理差价分配(%)</label>
        <div class="layui-input-block">
            <input type="text" name="nursingDifferenceAllot" lay-verify="required" autocomplete="off" placeholder="例如:42" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label ">护理奖金分配(%)</label>
        <div class="layui-input-block">
            <input type="text" name="nursingBonusAllot" lay-verify="required" autocomplete="off" placeholder="例如:80" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label ">首次充值奖金</label>
        <div class="layui-input-block">
            <input type="text" name="firstRechargeBonus" lay-verify="required" autocomplete="off" placeholder="例如:20" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired">等级使用范围</label>
        <div class="layui-input-block" id="scopeOfUse">
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
<#--表格：显示等级会员-->
<form class="layui-form layui-form-pane layui-personal" id="userForm" action="" lay-filter="userForm" method="post" hidden="true">
    <table id="userTable" class="userTable" lay-filter="userTable" hidden="true"></table>
</form>
<#--表格：显示会员等级更新记录-->
<form class="layui-form layui-form-pane layui-personal" id="userMemberForm" action="" lay-filter="userMemberForm" method="post" hidden="true">
    <table id="userMemberTable" class="userMemberTable" lay-filter="userMemberTable" hidden="true"></table>
</form>
<#--点击改变等级后的表单-->
<form id="changeLevel" class="layui-form changeLevel layui-form-pane layui-personal" action="" lay-filter="changeLevel" hidden="true">
    <div class="layui-form-item">
        <label class="layui-form-label xrequired">会员等级</label>
        <div class="layui-input-block">
            <select name="membershipLevel" lay-filter="membershipLevel" lay-verify="required">
                <option value="">请选择</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">操作描述</label>
        <div class="layui-input-block">
            <input type="text" name="operateDesc" lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
        </div>
    </div>
</form>


<script>
    //数据显示,分页实现
    var table,dataErp,dataUpWay,dataScope,laydate;
    layui.use(['table','laydate'], function(){
        table = layui.table;
        laydate = layui.laydate;
        dataErp = loadEnumData("ErpNameEnum");
        dataUpWay = loadEnumData("UpgradingWaysEnum");
        // dataScope = loadEnumData("ScopeOfUseEnum");
        loadScope();
        showSelect();

        table.render({
            elem: '#member'
            ,url: accountHost+"/manage/member/selectAllNormalMemberList"     // selectAllMemberList(状态为0的也查询)
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
                ,{field: 'membershipLevelId', title: '序号', width:80, sort: true, fixed: 'left'}
                ,{field: 'membershipLevelName', title: '名称'}
                ,{field: 'autoUpgrade', title: '是否自动升级',templet: function (d) {
                        if(d.autoUpgrade){
                            return "是"
                        }else{
                            return "否"
                        }
                    }}
                ,{field: 'standardAmount', title: '等级累计储值'}
                ,{field: 'bestieIntroduceAmount', title: '等级单次储值'}
                ,{field: 'upgradeStandardAmount', title: '消费升级标准'}
                ,{field: 'upgradeStandardFans', title: '拓客升级标准'}
                ,{field: 'upgradingWays', title: '升级模式',templet: function (d) {
                    var upgradingWays = d.upgradingWays.split(","),up = "";
                    for (var i in upgradingWays) {
                        for(var p in dataUpWay){
                            if(p==upgradingWays[i]){
                                up = up+dataUpWay[p]+" ";
                            }
                        }
                    }
                    return up;
                  }}
                ,{field: 'membershipDiscount', title: '等级折扣',templet: function (d) {
                    return accMul(d.membershipDiscount,100);
                  }}
                ,{field: 'priceDifferenceAllot', title: '差价分配',hide:true}
                ,{field: 'bonusAllot', title: '奖金分配',hide:true}
                ,{field: 'nursingDifferenceAllot', title: '护理差价分配',hide:true}
                ,{field: 'nursingBonusAllot', title: '护理奖金分配',hide:true}
                ,{field: 'firstRechargeBonus', title: '首次充值奖金',hide:true}
                ,{field: 'scopeOfUse', title: '使用范围',templet: function (d) {
                        var scopeOfUse = d.scopeOfUse.split(","),scope = "";
                        for (var i in scopeOfUse) {
                            for(var p in dataScope){
                                if(scopeOfUse[i]==dataScope[p].industryID){
                                    scope = scope+dataScope[p].industryName+" ";
                                }
                            }
                        }
                        return scope;
                    }}
                ,{field: 'status', title: '状态',hide:true}
                ,{field: 'createOperator', title: '创建人',hide:true}
                ,{field: 'createTime', title: '创建时间',hide:true}
                ,{field: 'modifyOperator', title: '修改人',hide:true}
                ,{field: 'dataChangeLastTime', title: '更新时间',hide:true}
                ,{fixed: 'right',title: '操作', width: 230, align: 'center',toolbar: '#barDemo'}
            ]]
        });
    });
    //增删改查操作实现
    layui.use(['table','layer'], function(){
        var table = layui.table,
            layer=layui.layer;
        //监听表格复选框选择
        table.on('checkbox(demo)', function(obj){
        });
        //监听工具条
        table.on('tool(demo)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                layerShowAndEdit(obj,table);
                // layer.msg('ID：'+ data.membershipLevelId + ' 的查看操作');
            } else if(obj.event === 'del'){
                layer.confirm('真的删除ID为'+data.membershipLevelId+'的用户会员么？', function(index){
                    layerDelete(data,table);
                    obj.del();
                });
            }else if(obj.event === 'edit'){
                layerShowAndEdit(obj,table);
                // layer.alert('编辑行：<br>'+ JSON.stringify(data))
            }else if(obj.event === 'showUser'){
                showUser(obj,table);
            }
        });
        //用户表监听
        table.on('tool(userTable)', function(obj){
            var memberNum = obj.data.memberNum;
            if(obj.event === 'showLevel'){
                showLevel(memberNum);
                // layer.msg('ID：'+ data.membershipLevelId + ' 的查看操作');
            } else if(obj.event === 'changeLevel'){
                changeLevel(memberNum);
                // layer.alert('编辑行：<br>'+ JSON.stringify(data))
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
            ,addMemberView: function (){  //添加会员
                var a1 = layer.open({
                    type: 1,
                    title: '添加会员',
                    content: $('#editForm'),
                    data: {
                        table:table
                    },
                    closeBtn: 1,
                    btn: ['提交', '取消'],
                    yes: function(index,layero){
                        var scope = [];
                        //遍历每个被选中的复选框
                        $("#scopeOfUse input[type='checkbox']:checked").each(function (index, e) {
                            // var value = $(this).val();
                            var value = this.value;
                            var title = this.title;
                            scope.push( Number(value));
                        });
                        scope = JSON.stringify(scope).replace("[","").replace("]","");
                        var upgradingWays = [];
                        $("#upgradingWays input[type='checkbox']:checked").each(function (index, e) {
                            // var value = $(this).val();
                            var value = this.value;
                            var title = this.title;
                            upgradingWays.push( Number(value));
                        });
                        upgradingWays = JSON.stringify(upgradingWays).replace("[","").replace("]","");
                        var url = accountHost+"/manage/member/insertMemberShipLevel";
                        //下拉框
                        var autoUpgrade = layero.find("select[name='autoUpgrade']");
                        autoUpgrade = autoUpgrade.find("option:selected").val();
                        var isDivision = layero.find("select[name='isDivision']");
                        isDivision = isDivision.find("option:selected").val();
                        var isDefault = layero.find("select[name='isDefault']");
                        isDefault = isDefault.find("option:selected").val();
                        var membershipDiscount = layero.find("input[name='membershipDiscount']").val();
                        membershipDiscount = accDiv(membershipDiscount,100);
                        var params={
                            membershipLevelName: layero.find("input[name='membershipLevelName']").val(),
                            autoUpgrade: autoUpgrade,
                            standardAmount: layero.find("input[name='standardAmount']").val(),
                            upgradeStandardAmount: layero.find("input[name='upgradeStandardAmount']").val(),
                            upgradeStandardFans: layero.find("input[name='upgradeStandardFans']").val(),
                            upgradingWays: upgradingWays,
                            membershipDiscount: membershipDiscount,
                            priceDifferenceAllot: layero.find("input[name='priceDifferenceAllot']").val(),
                            bonusAllot: layero.find("input[name='bonusAllot']").val(),
                            nursingDifferenceAllot: layero.find("input[name='nursingDifferenceAllot']").val(),
                            nursingBonusAllot: layero.find("input[name='nursingBonusAllot']").val(),
                            firstRechargeBonus: layero.find("input[name='firstRechargeBonus']").val(),
                            // guestAccount: layero.find("input[name='guestAccount']").val(),
                            // sharedAccount: layero.find("input[name='sharedAccount']").val(),
                            bestieIntroduceAmount: layero.find("input[name='bestieIntroduceAmount']").val(),
                            scopeOfUse: scope,
                            isDivision: isDivision,
                            isDefault: isDefault,
                            createOperator: "${currentUser.trueName!}"
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
                                table.reload("member");
                            }else{
                                layer.open({
                                    title: '添加'
                                    ,content: '添加失败！'+ res.responseStatusType.error.errorMsg
                                    ,btn: ["关闭"]
                                });
                            }
                        })
                        // layer.close(); //如果设定了yes回调，需进行手工关闭
                    },
                    btn2: function(){
                        layer.closeAll();
                    },
                    success: function(layero){
                        //编辑则隐藏创建人和编辑人
                        layero.find("input[name='createOperator']").parent().parent().hide();
                        layero.find("input[name='modifyOperator']").parent().parent().hide();
                    },
                    area:['600px', '500px'],
                    end:function(){
                        window.location.reload();
                    }
                });
            }
            ,search: function (){
                var keyWord = $(".demoTable input[name='keyWord']").val();
                table.render({
                    elem: '#member'
                    ,url: accountHost+"/manage/member/selectMemberShipLevelListByKeyWord"
                    ,cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    ,page:true          //显示分页默认不显示
                    ,method: 'post'
                    ,request: {
                        pageName: 'pageNum', //页码的参数名称，默认：page
                        limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    }
                    ,where: {
                        keyWord: keyWord
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
                        ,{field: 'membershipLevelId', title: '序号', width:80, sort: true, fixed: 'left'}
                        ,{field: 'membershipLevelName', title: '名称'}
                        ,{field: 'autoUpgrade', title: '是否自动升级',templet: function (d) {
                                if(d.autoUpgrade){
                                    return "是"
                                }else{
                                    return "否"
                                }
                            }}
                        ,{field: 'standardAmount', title: '等级累计储值'}
                        ,{field: 'bestieIntroduceAmount', title: '等级单次储值'}
                        ,{field: 'upgradeStandardAmount', title: '消费升级标准'}
                        ,{field: 'upgradeStandardFans', title: '拓客升级标准'}
                        ,{field: 'upgradingWays', title: '升级模式',templet: function (d) {
                                var upgradingWays = d.upgradingWays.split(","),up = "";
                                for (var i in upgradingWays) {
                                    for(var p in dataUpWay){
                                        if(p==upgradingWays[i]){
                                            up = up+dataUpWay[p]+" ";
                                        }
                                    }
                                }
                                return up;
                            }}
                        ,{field: 'membershipDiscount', title: '等级折扣',templet: function (d) {
                                return accMul(d.membershipDiscount,100);
                            }}
                        ,{field: 'priceDifferenceAllot', title: '差价分配',hide:true}
                        ,{field: 'bonusAllot', title: '奖金分配',hide:true}
                        ,{field: 'nursingDifferenceAllot', title: '护理差价分配',hide:true}
                        ,{field: 'nursingBonusAllot', title: '护理奖金分配',hide:true}
                        ,{field: 'firstRechargeBonus', title: '首次充值奖金',hide:true}
                        ,{field: 'scopeOfUse', title: '使用范围',templet: function (d) {
                                var scopeOfUse = d.scopeOfUse.split(","),scope = "";
                                for (var i in scopeOfUse) {
                                    for(var p in dataScope){
                                        if(scopeOfUse[i]==dataScope[p].industryID){
                                            scope = scope+dataScope[p].industryName+" ";
                                        }
                                    }
                                }
                                return scope;
                            }}
                        ,{field: 'status', title: '状态',hide:true}
                        ,{field: 'createOperator', title: '创建人',hide:true}
                        ,{field: 'createTime', title: '创建时间',hide:true}
                        ,{field: 'modifyOperator', title: '修改人',hide:true}
                        ,{field: 'dataChangeLastTime', title: '更新时间',hide:true}
                        ,{fixed: 'right',title: '操作', width: 230, align: 'center',toolbar: '#barDemo'}
                    ]]
                });
            }
        };

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    });
    function showUser(obj,table) {
        loadMembershiplevelrecordsType();
        loadMemberlevel();
        var s1 = layer.open({
            type: 1,
            title: '等级会员',
            content: $('#userForm'),
            success: function (layero, index) {
                table.render({
                    elem: '#userTable'
                    ,url: accountHost+"/manage/member/selectUserByMember"
                    ,cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    ,page:true          //显示分页默认不显示
                    ,method: 'post'
                    ,request: {
                        pageName: 'pageNum', //页码的参数名称，默认：page
                        limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    }
                    ,where: {
                        membershipLevelId:obj.data.membershipLevelId
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
                        {type: 'checkbox', fixed: 'left',width:40,hide:true}
                        ,{field: 'memberNum', title: '会员编号',sort: true, fixed: 'left'}
                        ,{field: 'name', title: '用户姓名'}
                        ,{field: 'membershipLevelName', title: '会员等级', sort:true, templet: function (d) {
                                var membershipLevelName = d.membershipLevelName;
                                if(membershipLevelName == null || membershipLevelName == ""){
                                    for(var i in dataMember){
                                        if(dataMember[i].membershipLevelId == d.membershipLevelId){
                                            membershipLevelName = dataMember[i].membershipLevelName;
                                        }
                                    }
                                }
                                return membershipLevelName
                            }}
                        ,{fixed: 'right',title: '操作', width: 200, align: 'center',toolbar: '#userBarDemo'}
                    ]]
                    , id: 'userReload'
                });
            },
            cancel: function(){
                layer.close(s1);
            },
            area:['800px', '600px']
        });
    }
    function showLevel(memberNum) {
        var s2 = layer.open({
            type: 1,
            title: '会员等级变更详情',
            content: $('#userMemberForm'),
            success: function (layero, index) {
                table.render({
                    elem: '#userMemberTable'
                    ,url: accountHost+"/manage/member/selectMemberShipLevelUpgradeList"
                    ,cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    ,page:true          //显示分页默认不显示
                    ,method: 'post'
                    ,request: {
                        pageName: 'pageNum', //页码的参数名称，默认：page
                        limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    }
                    ,where: {
                        memberNum:memberNum
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
                        {type: 'checkbox', fixed: 'left',width:40,hide:true}
                        ,{field: 'membershiplevelrecordsId', title: '序号', width:70, sort: true, fixed: 'left'}
                        ,{field: 'membershiplevelrecordsType', title: '升级类型', sort:true,templet: function (d) {
                                var membershiplevelrecordsType = "";
                                for(var i in dataType){
                                    if(i == d.membershiplevelrecordsType){
                                        membershiplevelrecordsType = dataType[i];
                                    }
                                }
                            return membershiplevelrecordsType
                        }}
                        ,{field: 'name', title: '用户',width:60}
                        ,{field: 'afterMembershipLevelId', title: '等级', sort:true,templet: function (d) {
                                var afterMembershipLevel = "";
                                for(var i in dataMember){
                                    if(dataMember[i].membershipLevelId == d.afterMembershipLevelId){
                                        afterMembershipLevel = dataMember[i].membershipLevelName;
                                    }
                                }
                                return afterMembershipLevel
                            }}
                        ,{field: 'laterMembershipLevelId', title: '升级等级', sort:true,templet: function (d) {
                                var laterMembershipLevel = "";
                                for(var i in dataMember){
                                    if(dataMember[i].membershipLevelId == d.laterMembershipLevelId){
                                        laterMembershipLevel = dataMember[i].membershipLevelName;
                                    }
                                }
                                return laterMembershipLevel
                            }}
                        ,{field: 'operateDesc', title: '操作描述', sort:true}
                        ,{field: 'createOperator', title: '操作人'}
                    ]]
                    , id: 'userReload'
                });
            },
            cancel: function(){
                layer.close(s2);
            },
            area:['700px', '500px']
        });
    }
    function changeLevel(memberNum){
        var c1 = layer.open({
            type: 1,
            title: '会员等级变更',
            content: $('#changeLevel'),
            closeBtn: 1,
            btn: ['提交', '取消'],
            yes: function(index,layero){
                //修改了会员等级，提交到数据库
                var url = accountHost+"/manage/member/updateWalletAccountMemberShipLevelById";
                //下拉框
                var membershipLevelId = layero.find("select[name='membershipLevel']");
                membershipLevelId = membershipLevelId.find("option:selected").val();
                var params={
                    memberNum: memberNum,
                    membershipLevelId: membershipLevelId,
                    operateDesc: layero.find("input[name='operateDesc']").val(),
                    modifyOperator: "${currentUser.trueName!}"
                };
                $.post(url,params,function (res) {
                    if(res.responseStatusType.message=="Success"){
                        layer.open({
                            title: '修改'
                            ,content: '修改成功！'
                            ,btn: ["关闭"]
                            ,yes: function (index) {
                                layer.close(index); //如果设定了yes回调，需进行手工关闭
                                layer.close(c1);
                            }
                        });
                        //重新加载表格
                        table.reload("user");
                    }else{
                        layer.open({
                            title: '修改'
                            ,content: '修改失败！'+res.responseStatusType.error.errorMsg
                            ,btn: ["关闭"]
                        });
                    }
                })
            },
            btn2: function(){
                layer.closeAll();
            },
            success: function(layero){
                $("#changeLevel select[name='membershipLevel']").html("<option value=''>请选择</option>");
                for (var p in dataMember) {
                    var option = "<option value='"+ dataMember[p].membershipLevelId +"'>"+ dataMember[p].membershipLevelName +"</option>";
                    $("select[name='membershipLevel']").append(option);
                }
               layui.form.render("select","changeLevel");
            },
            area:['600px', '500px']
        });
    }
    var dataType = null;
    var dataMember = null;
    function loadMembershiplevelrecordsType() {
        var url = accountHost+"/manage/member/selectAllErpName",
            param = {
                name: "MemberLevelTypeEnum"
            };
        $.ajax({
            url: url,
            data: param,
            method: "POST",
            async: false,
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    var data = res.result;
                    dataType = data;
                    $("select[name='membershiplevelrecordsType']").html("<option value=''>请选择</option>");
                    for (var p in data) {
                        var option = "<option value='" + p + "'>" + data[p] + "</option>";
                        $("select[name='membershiplevelrecordsType']").append(option);
                    }
                    layui.form.render("select","demoTable");
                }
            }
        });
    }
    function loadMemberlevel() {
        var url = accountHost+"/manage/member/selectAllNormalMemberList";
        $.ajax({
            url: url,
            method: "POST",
            async: false,
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    dataMember = res.result.list;
                }
            }
        });
    }

    function layerShowAndEdit(obj,table){
        var data = obj.data;
        //页面弹框
       var a2 = layer.open({
            type: 1,
            title: '等级详情',
            content: $('#editForm'),
            data:{
                table:table
            },
            closeBtn: 1,
            btn: ['提交', '取消'],
            yes: function(index,layero){
                var scope = [];
                //遍历每个被选中的复选框
                $("#scopeOfUse input[type='checkbox']:checked").each(function (index, e) {
                    // var value = $(this).val();
                    var value = this.value;
                    var title = this.title;
                    scope.push( Number(value));
                });
                scope = JSON.stringify(scope).replace("[","").replace("]","");
                var upgradingWays = [];
                $("#upgradingWays input[type='checkbox']:checked").each(function (index, e) {
                    // var value = $(this).val();
                    var value = this.value;
                    var title = this.title;
                    upgradingWays.push( Number(value));
                });
                upgradingWays = JSON.stringify(upgradingWays).replace("[","").replace("]","");
                //修改了会员信息，提交到数据库
                var url = accountHost+"/manage/member/updateMemberShipLevelById";
                //下拉框
                var autoUpgrade = layero.find("select[name='autoUpgrade']");
                autoUpgrade = autoUpgrade.find("option:selected").val();
                var isDivision = layero.find("select[name='isDivision']");
                isDivision = isDivision.find("option:selected").val();
                var isDefault = layero.find("select[name='isDefault']");
                isDefault = isDefault.find("option:selected").val();
                var membershipDiscount = layero.find("input[name='membershipDiscount']").val();
                membershipDiscount = accDiv(membershipDiscount,100);
                var params={
                    membershipLevelId: layero.find("input[name='membershipLevelId']").val(),
                    membershipLevelName: layero.find("input[name='membershipLevelName']").val(),
                    autoUpgrade: autoUpgrade,
                    standardAmount: layero.find("input[name='standardAmount']").val(),
                    upgradeStandardAmount: layero.find("input[name='upgradeStandardAmount']").val(),
                    upgradeStandardFans: layero.find("input[name='upgradeStandardFans']").val(),
                    upgradingWays: upgradingWays,
                    membershipDiscount: membershipDiscount,
                    priceDifferenceAllot: layero.find("input[name='priceDifferenceAllot']").val(),
                    bonusAllot: layero.find("input[name='bonusAllot']").val(),
                    nursingDifferenceAllot: layero.find("input[name='nursingDifferenceAllot']").val(),
                    nursingBonusAllot: layero.find("input[name='nursingBonusAllot']").val(),
                    firstRechargeBonus: layero.find("input[name='firstRechargeBonus']").val(),
                    // guestAccount: layero.find("input[name='guestAccount']").val(),
                    // sharedAccount: layero.find("input[name='sharedAccount']").val(),
                    bestieIntroduceAmount: layero.find("input[name='bestieIntroduceAmount']").val(),
                    scopeOfUse: scope,
                    isDivision: isDivision,
                    isDefault: isDefault,
                    modifyOperator: "${currentUser.trueName!}"
                };
                $.post(url,params,function (res) {
                    if(res.responseStatusType.message=="Success"){
                        layer.open({
                            title: '修改'
                            ,content: '修改成功！'
                            ,btn: ["关闭"]
                            ,yes: function (index) {
                                layer.close(index); //如果设定了yes回调，需进行手工关闭
                                layer.close(a2);
                            }
                        });
                        //重新加载表格
                        table.reload("member");
                    }else{
                        layer.open({
                            title: '修改'
                            ,content: '修改失败！'+res.responseStatusType.error.errorMsg
                            ,btn: ["关闭"]
                        });
                    }
                })
                // layer.close(index); //如果设定了yes回调，需进行手工关闭
            },
            btn2: function(){
                layer.closeAll();
            },
            success: function(layero){
                var scopeOfUse = data.scopeOfUse.split(","),scope = {};
                for (var i in scopeOfUse) {
                    for(var p in dataScope){
                        if(scopeOfUse[i]==dataScope[p].industryID){
                            scope["scopeOfUse["+scopeOfUse[i]+"]"] = true;
                        }
                    }
                }
                layui.form.val('example', scope);
                var upgradingWays = data.upgradingWays.split(","),up = {};
                for (var i in upgradingWays) {
                    for(var p in dataUpWay){
                        if(upgradingWays[i]==p){
                            up["upgradingWays["+upgradingWays[i]+"]"] = true;
                        }
                    }
                }
                layui.form.val('example', up);
                //下拉框
                var autoUpgrade = layero.find("select[name='autoUpgrade']");
                autoUpgrade.find("option[value='"+data.autoUpgrade+"']").attr("selected",true);
                var isDivision = layero.find("select[name='isDivision']");
                isDivision.find("option[value='"+data.isDivision+"']").attr("selected",true);
                var isDefault = layero.find("select[name='isDefault']");
                isDefault.find("option[value='"+data.isDefault+"']").attr("selected",true);
                layero.find("input[name='membershipLevelId']").val(data.membershipLevelId);
                layero.find("input[name='membershipLevelName']").val(data.membershipLevelName);
                layero.find("input[name='standardAmount']").val(data.standardAmount);
                layero.find("input[name='upgradeStandardAmount']").val(data.upgradeStandardAmount);
                layero.find("input[name='upgradeStandardFans']").val(data.upgradeStandardFans);
                layero.find("input[name='membershipDiscount']").val(accMul(data.membershipDiscount,100));
                layero.find("input[name='priceDifferenceAllot']").val(data.priceDifferenceAllot);
                layero.find("input[name='bonusAllot']").val(data.bonusAllot);
                layero.find("input[name='nursingDifferenceAllot']").val(data.nursingDifferenceAllot);
                layero.find("input[name='nursingBonusAllot']").val(data.nursingBonusAllot);
                layero.find("input[name='firstRechargeBonus']").val(data.firstRechargeBonus);
                // layero.find("input[name='guestAccount']").val(data.guestAccount);
                // layero.find("input[name='sharedAccount']").val(data.sharedAccount);
                layero.find("input[name='bestieIntroduceAmount']").val(data.bestieIntroduceAmount);
                layero.find("input[name='status']").val(data.status);
                layero.find("input[name='createOperator']").val(data.createOperator);
                layero.find("input[name='createTime']").val(data.createTime);
                layero.find("input[name='modifyOperator']").val(data.modifyOperator);
                layero.find("input[name='dataChangeLastTime']").val(data.dataChangeLastTime);
                if(obj.event === 'edit'){   //编辑则隐藏创建人和编辑人
                    layero.find("input[name='createOperator']").parent().parent().hide();
                    layero.find("input[name='modifyOperator']").parent().parent().hide();
                }
                layui.form.render();
            },
            area:['600px', '500px'],
            end:function(){
                window.location.reload();
            }
        });
        //自定义验证规则,
        /*form.verify({
            title: function(value){
                if(value.length < 5){
                    return '标题至少得5个字符啊';
                }
            }
            ,pass: [
                /^[\S]{6,12}$/
                ,'密码必须6到12位，且不能出现空格'
            ]
            ,content: function(value){
                layedit.sync(editIndex);
            }
        });*/

    }
    //删除会员等级
    function layerDelete(data,table) {
        //删除数据库数据
        var url = accountHost+"/manage/member/deleteMemberShipLevelById";
        var params={
            membershipLevelId: data.membershipLevelId,
            modifyOperator: "${currentUser.trueName!}"
        };
        $.post(url,params,function (res) {
            if(res.responseStatusType.message=="Success"){
                layer.open({
                    title: '删除'
                    ,content: '删除成功！'
                    ,btn: ["关闭"]
                });
                //重新加载表格
                table.reload("member");
            }else{
                layer.open({
                    title: '删除'
                    ,content: '删除失败！'+res.responseStatusType.error.errorMsg
                    ,btn: ["关闭"]
                });
            }
        })
    }
    //加载枚举
    function loadEnumData(name){
        var url = accountHost+"/manage/member/selectAllErpName",
            param = {
                name: name
            },data = [];
        $.ajax({
            url: url,
            data: param,
            method: "POST",
            async: false,
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                     data = res.result;
                }
            }
        });
        return data;
    }
    //加载适用范围（行业）
    function loadScope() {
        $.ajax({
            url: storeHost+"/manage/industry/selectListIndustryNoPage",
            // data: param,
            method: "POST",
            async: false,
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    dataScope = res.result;
                }
            }
        });
    }
    // 初始化下拉框
    function showSelect() {
        /* 回显 */
        // $("select[name='erpName']").html("<option value=''>请选择</option>");
        // for (var p in dataErp) {
        //     var option = "<option value='" + dataErp[p] + "'>" + dataErp[p] + "</option>";
        //     $("select[name='erpName']").append(option);
        // }
        // $("select[name='upgradingWays']").html("<option value=''>请选择</option>");
        // for (var p in dataUpWay) {
        //     var option = "<option value='" + p + "'>" + dataUpWay[p] + "</option>";
        //     $("select[name='upgradingWays']").append(option);
        // }
        $("#upgradingWays").empty();
        for (var p in dataUpWay) {
            var input = "<div class='layui-input-inline' style='width:115px;'>" +
                "<input type='checkbox' name='upgradingWays[" + p + "]' value='" + p + "" +
                "' lay-filter='upgradingWays' ay-skin='primary' title='" + dataUpWay[p] + "'></div>";
            $("#upgradingWays").append(input);
        }

        $("#scopeOfUse").empty();
        for (var p in dataScope) {
            var input = "<div class='layui-input-inline' style='width:90px;'>" +
                "<input type='checkbox' name='scopeOfUse[" + dataScope[p].industryID + "]' value='" + dataScope[p].industryID + "" +
                "' lay-filter='scopeOfUse' ay-skin='primary' title='" + dataScope[p].industryName + "'></div>";
            $("#scopeOfUse").append(input);
        }
        layui.form.render();
    }
</script>

</body>
</html>