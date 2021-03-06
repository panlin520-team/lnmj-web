<#--商城会员记录管理-->
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>会员记录</title>
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
            width: 30px;
        }
    </style>
</head>
<body>

<div class="layui-fluid">
    <div class="demoTable layui-form" lay-filter="demoTable">
        <#-- benefactor nursingName storeName employeeCode presentationStatus -->
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label resetLabel">用户</label>
                <div class="layui-input-inline">
                    <input class="layui-input" type="text" name="userId" lay-filter="userId" autocomplete="off" placeholder="输入用户名">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">记录类型</label>
                <div class="layui-input-inline">
                    <select name="membershiplevelrecordsType" lay-filter="membershiplevelrecordsType" lay-verify="required">
                        <option value="">请选择</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <button class="layui-btn" data-type="search" ><i class="layui-icon layui-icon-search"></i></button>
            </div>
        </div>
    </div>
    <#--表格:显示会员修改记录-->
    <table id="memberRecord" lay-filter="demo"></table>
</div>





<script>
    //数据显示,分页实现
    layui.use('table', function(){
        var table = layui.table;

        //加载记录类型
        loadMembershiplevelrecordsType();
        table.render({
            elem: '#memberRecord'
            ,url: accountHost+"/manage/member/selectMemberShipLevelUpgradeList"
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
                {type: 'checkbox', fixed: 'left',width:40 ,hide:true}
                ,{field: 'membershiplevelrecordsId', title: '序号', width:70, sort: true, fixed: 'left'}
                ,{field: 'membershiplevelrecordsType', title: '会员升级类型',templet: function (d) {
                    for(var p in dataType){
                        if(p == d.membershiplevelrecordsType){
                            return dataType[p];
                        }
                    }
                    return "";
                } }
                ,{field: 'userId', title: '用户',sort:true ,hide:true}
                ,{field: 'name', title: '用户' ,width:75}
                ,{field: 'cardNumber', title: '会员卡号',sort:true}
                ,{field: 'membershipLevelNameAfter', title: '升级前会员等级'}
                ,{field: 'membershipLevelNameLater', title: '升级后会员等级'}
                ,{field: 'operateDesc', title: '操作描述',width:100}
                ,{field: 'amount', title: '金额',width:75}
                ,{field: 'totalAmount', title: '总金额',width:75}
                ,{field: 'status', title: '状态',hide:true}
                ,{field: 'createOperator', title: '创建人'}
                ,{field: 'createTime', title: '创建时间'}
            ]]
            ,id: 'memberRecordReload'
        });

        var $ = layui.$, active = {
            search: function () {
                var userId = $(".demoTable input[name='userId']").val(),
                    membershiplevelrecordsType = $(".demoTable select[name='membershiplevelrecordsType'] option:selected").val();
                table.reload('memberRecordReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        name:  userId,
                        membershiplevelrecordsType: membershiplevelrecordsType
                    }
                }, 'data');
            }
        };

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    });
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

</script>
</body>
</html>