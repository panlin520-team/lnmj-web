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
    <script src="${basePath!}/js/jquery.min.js" type="text/javascript"></script>
    <script src="${basePath!}/js/host.js" type="text/javascript"></script>
    <#include "../baseFtl/pageAuth.ftl" />
</head>
<body>

<div class="demoTable layui-form">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label" style="width: auto">请选择商品类型</label>
            <div class="layui-input-inline">
                <select>
                    <option>全部</option>
                    <option>已审核</option>
                    <option>未审核</option>
                </select>
            </div>
        <div class="layui-input-inline">
            <input type="text" class="layui-input" id="time" placeholder="请输入申请时间">
        </div>
        <div class="layui-inline">
            <label class="layui-form-label" style="width: 70px">请输入关键字</label>
            <div class="layui-input-inline">
                <input class="layui-input" type="text" name="keyWordPhone" autocomplete="off" placeholder="请输入关键字">
            </div>
        </div>
    </div>
</div>
</div>

<table id="detail" lay-filter="demo"></table>

    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="detail">收入明细</a>
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="examine">审核</a>
    </script>

    <#--是否打折自定义显示-->
    <script type="text/html" id="bonusType">
        {{#  if(d.bonusTypeId == 1){ }}
        消费提成
        {{#  }else if(d.bonusTypeId == 2){ }}
        充值提成
        {{#  }else if(d.bonusTypeId == 3){ }}
        门店服务提成
        {{#  }else if(d.bonusTypeId == 4){ }}
        美容师销售提成
        {{#  }else if(d.bonusTypeId == 5){ }}
        市场销售提成
        {{#  } }}
    </script>
<script type="text/html" id="bonusStatus">
    {{#  if(d.bonusStatus == 0){ }}
    审核中
    {{#  }else if(d.bonusStatus == 1){ }}
    已提现
    {{#  } }}
</script>

    <script>
        layui.use(['table','laydate'], function () {
            var table = layui.table;
            var laydate = layui.laydate;

            //日期时间选择器
            laydate.render({
                elem: '#time'
                ,type: 'datetime'
            });
            var cashRecordId = RequestParameter();
            table.render({
                elem: '#detail'
                , url: walletHost + "/manage/wallet/selectCashRecordDetailList?cashRecordId="+cashRecordId.cashRecordId
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
                        "data": res.result == null ? 0 : res.result //解析数据列表
                    };
                }
                , cols: [[
                    {type: 'checkbox', fixed: 'left'}
                    , {field: 'bonusTypeId', title: '提成种类', templet: '#bonusType'}
                    , {field: 'orderNumber', title: '订单号'}
                    , {field: 'orderTime', title: '下单时间'}
                    , {field: 'name', title: '姓名'}
                    , {field: 'membershipLevel', title: '会员等级'}
                    , {field: 'orderPrice', title: '订单价格'}
                    , {field: 'amount', title: '提成金额'}
                    , {field: 'bonusStatus', title: '提成状态', templet: '#bonusStatus'}
                ]]
            });
        });
        layui.use(['table', 'layer','jquery','form'], function () {
            var table = layui.table;
            var layer = layui.layer;
            var $ = layui.jquery;
            var form = layui.form;
            //监听表格复选框选择
            table.on('checkbox(demo)', function (obj) {
            });
            //监听工具条
            table.on('tool(demo)', function (obj) {
                var data = obj.data;
                  if (obj.event === 'detail') {
                      location.href = "/admin/detail?id="+data.orderNumber
                } else if (obj.event === 'examine') {
                      layer.confirm('确定审核吗？', function (index) {
                          examine(table,data);
                      });
                }
            });
            //button按钮绑定事件
            $("#addType").click(function () {
                $("#addForm")[0].reset();
                var a = layer.open({
                    type: 1
                    ,content: $('#addForm')
                    ,title: '添加'
                    ,btn: ['提交', '取消']
                    ,yes: function(index,layero){
                        var url = walletHost + "/manage/wallet/addWalletAccount";
                        var data = {
                            accountType: layero.find("input[name='accountType']").val(),
                            achievementProportion: layero.find("input[name='achievementProportion']").val(),
                            discount:$("input[name='discount']").is(":checked") == true?1:0
                        };
                        $.post(url, data, function (result) {
                            if (result.responseStatusType.message == "Success") {
                                // layer.msg("成功");
                                layer.open({
                                    title: '添加'
                                    , content: '添加成功！'
                                });
                                layer.close(a);
                                table.reload("accountType");
                            } else {
                                layer.msg("添加失败");
                            }
                        })
                    }
                });
            });

        });

        function editType(table,data,form) {
            var accountTypeId = data.accountTypeId
            var a = layer.open({
                type: 1
                ,content: $('#addForm')
                ,title: '添加'
                ,btn: ['提交', '取消']
                , success: function (layero) {
                    if(data.discount == 1) {
                        //开启打折
                        $("input[name='discount']").attr("checked","checked");
                        form.render();
                    }
                    else {
                        //未开启打折
                        $("input[name='discount']").next().removeClass("layui-form-onswitch");
                        $("input[name='discount']").next().children().get(0).innerHTML = "OFF";
                        console.log($("input[name='discount']").next().children().get(0).innerHTML);
                    }
                    layero.find("input[name='accountType']").val(data.accountType),
                    layero.find("input[name='achievementProportion']").val(data.achievementProportion)
                }
                ,yes: function(index,layero){
                    var url = walletHost + "/manage/wallet/updateWalletAccount";
                    var data = {
                        accountTypeId:accountTypeId,
                        accountType: layero.find("input[name='accountType']").val(),
                        achievementProportion: layero.find("input[name='achievementProportion']").val(),
                        discount:$("input[name='discount']").is(":checked") == true ? 1:0
                    };
                    $.post(url, data, function (result) {
                        if (result.responseStatusType.message == "Success") {
                            layer.open({
                                title: '修改'
                                , content: '修改成功！'
                                , yes: function () {
                                    layer.closeAll();
                                }
                            });
                            // layer.close(a);
                            table.reload("accountType");
                        } else {
                            layer.msg("失败");
                        }
                    })
                },
                end:function(){
                    window.location.reload();
                }
            });
        }
        function examine(table,data) {
            var url = walletHost + "/manage/wallet/examine";
            var data = {
                cashRecordId:data.cashRecordId
            };
            $.post(url, data, function (result) {
                if (result.responseStatusType.message == "Success") {
                    //重新加载表格
                    table.reload("detail");
                    layer.msg("成功");
                } else {
                    layer.msg("失败");
                }
            })
        }
        function RequestParameter(){
            var url = window.location.search; //获取url中"?"符后的字串
            var theRequest = new Object();
            if (url.indexOf("?") != -1) {
                var str = url.substr(1);
                var strs = str.split("&");
                for(var i = 0; i < strs.length; i ++) {
                    theRequest[strs[i].split("=")[0]]=(strs[i].split("=")[1]);
                }
            }
            return theRequest
        };
    </script>
</body>
</html>