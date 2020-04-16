<#--pos端会员管理-->
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
    <#include "../baseFtl/verify.ftl" />

    <style>
        /* 1).隐藏按钮css ,图片用webpack做了压缩,做了加密*/
        .resetLabel {
            width: 56px;
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

                <label class="layui-form-label resetLabel">是否丢失</label>
                <div class="layui-input-inline" style="width: 100px">
                    <select id="isLost" name="isLost" lay-filter="isLost">
                        <option value="0" selected="selected">请选择</option>
                        <option value="1" >否</option>
                        <option value="2" >是</option>
                    </select>
                </div>

                <label class="layui-form-label resetLabel">新老会员</label>
                <div class="layui-input-inline" style="width: 100px">
                    <select id="newOldStatus" name="newOldStatus" lay-filter="newOldStatus">
                        <option value="0" selected="selected">请选择</option>
                        <option value="1" >新用户</option>
                        <option value="2" >老用户</option>
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
            <#--<div class="layui-inline">-->
                <#--<div class="layui-btn-group demoTable">-->
                    <#--<button class="layui-btn" id="add">增加</button>-->
                <#--</div>-->
            <#--</div>-->
        </div>
    </div>
    <table id="user" lay-filter="demo"></table>
</div>


<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail" id="detail">查看</a>
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="checkEvaluatingDetailed">查看测评信息</a>
    <#--<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="recharge">充值</a>-->
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="findAccountInfo">查询账户信息</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>

</script>

<#--查看表单-->
    <form class="layui-form layui-form-pane layui-personal" id="showForm" action="" lay-filter="exampleShow" method="post" hidden="true">
        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <span name="sex"></span>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">身份证号</label>
            <span name="idCard"></span>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">电话</label>
            <span name="mobile"></span>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">所属门店</label>
            <span name="store"></span>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">会员卡号</label>
            <span name="memberNum"></span>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">微信openId</label>
            <span name="wxOpenId"></span>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">会员标签</label>
            <span name="lable"></span>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">上次到店时间</label>
            <span name="lastArriveDate"></span>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">到店消费次数</label>
            <span name="arriveTimes"></span>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">总消费</label>
            <span name="totalConsumption"></span>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">进店渠道</label>
            <span name="enterChannel"></span>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">会员来源</label>
            <span name="memberAddType"></span>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">创建时间</label>
            <span name="createTime"></span>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">备注</label>
            <span name="remark"></span>
        </div>

    </form>
<#--修改表单-->
    <form class="layui-form layui-form-pane layui-personal" id="editForm" action="" lay-filter="exampleEdit" method="post" hidden="true">

        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input type="radio" name="sex" value="1" title="男" checked="">
                <input type="radio" name="sex" value="0" title="女">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">电话</label>
            <div class="layui-input-block">
                <input type="text" name="mobile" lay-verify="required" autocomplete="off" placeholder="请输入电话"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-block">
                <input type="text" name="name" lay-verify="required" autocomplete="off" placeholder="请输入姓名"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">身份证号码</label>
            <div class="layui-input-block">
                <input type="text" name="idCard" lay-verify="required" autocomplete="off" placeholder="请输入身份证号码"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">备注</label>
            <div class="layui-input-block">
                <input type="text" name="remark" lay-verify="required" autocomplete="off" placeholder="请输入备注"
                       class="layui-input">
            </div>
        </div>
    </form>
<#--账户信息表单-->
    <form class="layui-form layui-form-pane layui-personal" id="accountInfoForm" action="" lay-filter="exampleAccount" method="post" hidden="true">
        <table id="accountTable" lay-filter="accountTable"></table>
    </form>
<#-- 选择测评时间-->
    <form class="layui-form layui-form-pane layui-personal" id="chooseEvaluatingDateForm" action="" lay-filter="exampleChooseEvaluatingDate"
          method="post"
          hidden="true">
        <div class="layui-inline">
            <label class="layui-form-label">日期时间范围</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="dateTimeScope" placeholder=" - ">
            </div>
        </div>
    </form>
<#--查看测评结果-->
    <form class="layui-form layui-form-pane layui-personal" id="showEvaluatingForm" action="" lay-filter="exampleShow" method="post" hidden="true">
        <table id="showEvaluatingTable" lay-filter="demo"></table>
    </form>


<#-- 充值的表单-->
<form class="layui-form layui-form-pane layui-personal" id="rechargeForm" action="" lay-filter="example" method="post" hidden="true">

    <div class="layui-form-item">
        <label class="layui-form-label">账户类型</label>
        <div class="layui-input-block" style="width:150px;">
            <select name="accountType" id="accountType" lay-filter="accountType" lay-verify="required">
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">充值金额</label>
        <div class="layui-input-block">
            <input type="text" lay-verify="required" name="rechargeValue" lay-verify="rechargeValue" autocomplete="off"
                   placeholder="请输入充值金额"
                   class="layui-input" style="width:150px;">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">收款人</label>
        <div class="layui-input-block">
            <input type="text" lay-verify="required" name="payee" lay-verify="rechargeValue" autocomplete="off"
                   placeholder="请输入收款人姓名"
                   class="layui-input" style="width:150px;">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">员工</label>
        <div class="layui-input-block" style="width:150px;">
            <select name="beauticianId" id="beauticianId" lay-filter="beauticianId" lay-verify="required">
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">是否向上级提成</label>
        <div class="layui-input-block">
            <input type="checkbox" checked="" name="ifdeposit" lay-skin="switch" lay-filter="switchTest"
                   lay-text="ON|OFF">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">是否返利</label>
        <div class="layui-input-block">
            <input type="checkbox" checked="" name="isintegral" lay-skin="switch" lay-filter="switchTest"
                   lay-text="ON|OFF">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">支付类型</label>
        <div class="layui-input-block" style="width:150px;">
            <select name="paytype_s" id="paytype_s" lay-filter="paytype_s" lay-verify="required">
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">支付状态</label>
        <div class="layui-input-block" style="width:150px;">
            <select name="paystatus_s" id="paystatus_s" lay-filter="paystatus_s" lay-verify="required">
                <option value="1" selected='true'>已支付</option>
                <option value="0">待支付</option>
            </select>
        </div>
    </div>


    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">审核理由</label>
        <div class="layui-input-block">
            <textarea id="reviewReason" placeholder="请输入内容" class="layui-textarea"
                      style="width: 150px;height: 40px;"></textarea>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="addeditsubmitfilterRecharge">立即提交</button>
            <button id="resetAddRecharge" type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    //列表显示-会员信息
    var list = loadFindStoreName();
    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#user'
            , url: accountHost + "/manage/memberUser/listByPage"
            , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , page: true          //显示分页默认不显示
            , method: 'post'
            , id: "userReload"
            , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                return {
                    "code": 0, //解析接口状态
                    "msg": "", //解析提示文本
                    "count": res.result == null ? 0 : res.result.total, //解析数据长度
                    "data": res.result == null ? 0 : res.result.list //解析数据列表
                };
            }
            , request: {
                pageName: 'pageNum', //页码的参数名称，默认：page
                limitName: 'pageSize' //每页数据量的参数名，默认：limit
            }
            , where: {
                storeId: "${currentUser.storeId!}",
            }
            , cols: [[
                {type: 'checkbox', fixed: 'left', width: 40}
                , {
                    field: 'storeId', title: '门店名称', templet: function (d) {
                       var storeName = null;
                        for (var p in list) {
                            if (d.storeId == list[p].storeId) {
                                storeName = list[p].name;
                            }
                        }
                        if (storeName==null){
                            return "<span id='storeName'style='color:red'>" + "此会员对应门店已经被删除" + "</span>"
                        }  else{
                            return "<span id='storeName'>" + storeName + "</span>"
                        }
                    }, unresize: true
                }
                , {field: 'memberNum', title: '会员号'}
                , {
                    field: 'sex', title: '性别', templet: function (d) {
                        for (var p in list) {
                            if (d.sex == 0) {
                                return "<span id='sex'>" + "女" + "</span>"
                            } else {
                                return "<span id='sex'>" + "男" + "</span>"
                            }
                        }
                    }, unresize: true
                }
                , {
                    field: 'newOldStatus', title: '新老会员', templet: function (d) {
                        for (var p in list) {
                            if (d.newOldStatus == 1) {
                                return "<span id='sex'>" + "新用户" + "</span>"
                            } else {
                                return "<span id='sex'>" + "老用户" + "</span>"
                            }
                        }
                    }, unresize: true
                }
                , {
                    field: 'isLost', title: '是否丢失', templet: function (d) {
                        for (var p in list) {
                            if (d.isLost == 1) {
                                return "<span id='sex'>" + "否" + "</span>"
                            } else {
                                return "<span id='sex'>" + "是" + "</span>"
                            }
                        }
                    }, unresize: true
                }
                , {field: 'mobile', title: '电话'}
                , {field: 'name', title: '姓名'}
                , {fixed: 'right', title: '操作', align: 'center', toolbar: '#barDemo', width: 300}
            ]]
            , done: function (res, curr, count) {


            }
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
        table.on('checkbox(demo)', function (obj) {
            console.log(obj)
        });
        //监听工具条
        var data = null;

        table.on('tool(demo)', function (obj) {
            data = obj.data;
            if (obj.event === 'detail') {
                //加载店铺信息
                layerShow(data, table, $)
            } else if (obj.event === 'edit') {
                layerShowAndEdit(form, data, table, $);
            }  else if (obj.event === 'findAccountInfo') {
                findAccountInfo(form, data, table, $);
            } else if (obj.event === 'recharge') {
                //充值按钮事件
                loadPayType();
                loadAccountType();
                loadBeautician(data);
                //给表单添加store value
                $("#rechargeForm").attr("data-storeId", data.storeId);
                var cardNum = data.memberNum;
                var name = data.name;
                var membermobile = data.mobile;
                var a1 = layer.open({
                    type: 1,
                    title: '充值管理',
                    content: $('#rechargeForm'),
                    area: ['300px', '600px'],
                    success: function (layero) {
                        $("#resetAddRecharge").click();//重置表单
                        //监听添加提交-充值记录
                        form.on('submit(addeditsubmitfilterRecharge)', function () {
                            var url = walletHost + "/manage/wallet/insertStoreRechargeAuditRecord";
                            var cardNumber = cardNum;
                            var amount = $("input[name='rechargeValue']").val();
                            var payee = $("input[name='payee']").val();
                            var remarks = $("#reviewReason").val();
                            var accountTypeId = $("#accountType").find("option:selected").val();
                            var payStatus = $("#paystatus_s").find("option:selected").val();
                            var beauticianId = $("#beauticianId").find("option:selected").val()
                            if (accountTypeId == 0) {
                                layer.msg("请选择账户类型")
                                return
                            }
                            var payType = $("#paytype_s").find("option:selected").val();
                            if (payType == 0) {
                                layer.msg("请选择支付方式")
                                return
                            }
                            if ($("#beauticianId").find("option:selected").val() == 0) {
                                layer.msg("请选择员工")
                                return
                            }
                            var linkName = name;
                            var mobile = membermobile;
                            var ifdeposit = $("input[name='ifdeposit']").is(":checked") == true ? 1 : 0;
                            var isintegral = $("input[name='isintegral']").is(":checked") == true ? 1 : 0;
                            var storeId = $("#rechargeForm").attr("data-storeId")
                            var data = {
                                "accountTypeId": accountTypeId,
                                "storeId": storeId,
                                "cardNumber": cardNumber,
                                "amount": amount,
                                "payType": payType,
                                "beauticianId": beauticianId,
                                "name": linkName,
                                "mobile": mobile,
                                "isRoyalty": ifdeposit,
                                "isintegral": isintegral,
                                "rechargeChannel": 3,
                                "payStatus": payStatus,
                                "payee": payee,
                                "isAbatementLadderDetailed": 1,
                                "remarks": remarks
                            };
                            $.ajax({
                                url: url,
                                data: data,
                                async: false,
                                type: "POST",
                                success: function (res) {
                                    if (res.responseStatusType.message === "Success") {
                                        console.log(res)
                                        layer.msg("提交充值申请成功")
                                        layer.close(a1);
                                    } else {
                                        layer.msg(res.responseStatusType.error.errorMsg)
                                        return;
                                    }
                                }
                            });
                            return false;
                        });
                    }

                });
            } else if (obj.event === 'checkEvaluatingDetailed') {
                //页面弹框
                var a2 = layer.open({
                    type: 1,
                    title: '时间范围选择',
                    content: $('#chooseEvaluatingDateForm'),
                    area: ['346px', '164px'],
                    closeBtn: 1,
                    btn: ['关闭'],
                    btn2: function () {
                        layer.close(a2);
                    },
                    success: function (layero) {
                        $("#chooseEvaluatingDateForm").attr("data-memberNum", data.memberNum)
                        layui.use('laydate', function () {
                            var laydate = layui.laydate;
                            //日期时间范围
                            laydate.render({
                                elem: '#dateTimeScope'
                                , type: 'datetime'
                                , range: true
                                , done: function (value, date) {
                                    var url = dataHost + "/statistic/statisticEvaluating";
                                    var data = {
                                        userId: $("#chooseEvaluatingDateForm").attr("data-memberNum"),
                                        startTime: value.split(" - ")[0].replace(/^\s+|\s+$/g, ""),
                                        endTime: value.split(" - ")[1].replace(/^\s+|\s+$/g, "")
                                    };
                                    $.post(url, data, function (result) {
                                        if (result.responseStatusType.message == "Success") {
                                            var a3 = layer.open({
                                                type: 1,
                                                title: '测评结果',
                                                content: $('#showEvaluatingForm'),
                                                area: ['828px', '250px'],
                                                closeBtn: 1,
                                                btn: ['关闭'],
                                                btn2: function () {
                                                    layer.close(a3);
                                                },
                                                success: function (layero) {
                                                    console.log(result)
                                                    layui.use('table', function () {
                                                        var table = layui.table;

                                                        //展示已知数据
                                                        table.render({
                                                            elem: '#showEvaluatingTable'
                                                            , cols: [[ //标题栏
                                                                {
                                                                    field: 'evaluatingID',
                                                                    title: '测评id',
                                                                    width: 80,
                                                                    sort: true
                                                                }
                                                                , {field: 'evaluatingLevelName', title: '测评等级'}
                                                                , {field: 'evaluatingAmount', title: '消费金额'}
                                                                , {field: 'userId', title: '会员编号'}
                                                                , {field: 'evaluatingName', title: '测评名称'}
                                                                , {field: 'evaluatingDateStart', title: '开始时间'}
                                                                , {field: 'evaluatingDateEnd', title: '结束时间'}
                                                            ]]
                                                            , data: result.result
                                                            // ,skin: 'line' //表格风格
                                                            , even: true
                                                            , page: true //是否显示分页
                                                            , limits: [5, 7, 10]
                                                            , limit: 5 //每页默认显示的数量
                                                        });
                                                    });
                                                }
                                            });
                                        } else {

                                        }
                                    })

                                }
                            });
                        });


                    }
                });
            }


        });

        var $ = layui.$, active = {
            search: function () {
                var keyWordName = $(".demoTable input[name='keyWordName']").val();
                var keyWordPhone = $(".demoTable input[name='keyWordPhone']").val();
                var storeId = $("select[name='stores'] option:selected").val() == 0 ? "${currentUser.storeId!}" : $("select[name='stores'] option:selected").val();
                var isLost = $("select[name='isLost'] option:selected").val();
                var newOldStatus = $("select[name='newOldStatus'] option:selected").val();
                table.render({
                    elem: '#user'
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
                        storeId: storeId,
                        isLost: isLost,
                        newOldStatus: newOldStatus
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
                                var storeName = null;
                                for (var p in list) {
                                    if (d.storeId == list[p].storeId) {
                                        storeName = list[p].name;
                                    }
                                }
                                if (storeName==null){
                                    return "<span id='storeName'style='color:red'>" + "此会员对应门店已经被删除" + "</span>"
                                }  else{
                                    return "<span id='storeName'>" + storeName + "</span>"
                                }
                            }, unresize: true
                        }
                        , {field: 'memberNum', title: '会员号'}
                        , {
                            field: 'sex', title: '性别', templet: function (d) {
                                for (var p in list) {
                                    if (d.sex == 0) {
                                        return "<span id='sex'>" + "女" + "</span>"
                                    } else {
                                        return "<span id='sex'>" + "男" + "</span>"
                                    }
                                }
                            }, unresize: true
                        }
                        , {
                            field: 'newOldStatus', title: '新老会员', templet: function (d) {
                                for (var p in list) {
                                    if (d.newOldStatus == 1) {
                                        return "<span id='sex'>" + "新用户" + "</span>"
                                    } else {
                                        return "<span id='sex'>" + "老用户" + "</span>"
                                    }
                                }
                            }, unresize: true
                        }
                        , {
                            field: 'isLost', title: '是否丢失', templet: function (d) {
                                for (var p in list) {
                                    if (d.isLost == 1) {
                                        return "<span id='sex'>" + "否" + "</span>"
                                    } else {
                                        return "<span id='sex'>" + "是" + "</span>"
                                    }
                                }
                            }, unresize: true
                        }
                        , {field: 'mobile', title: '电话'}
                        , {field: 'name', title: '姓名'}
                        , {fixed: 'right', title: '操作', align: 'center', toolbar: '#barDemo', width: 300}
                    ]]
                });
            }
        };

        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

    });


    //修改按钮事件
    function layerShowAndEdit(form, data, table, $) {
        //页面弹框
        var a1 = layer.open({
            type: 1,
            title: '会员修改',
            content: $('#editForm'),
            area: ['900px'],
            closeBtn: 1,
            btn: ['提交', '取消'],
            yes: function (index, layero) {
                var url = accountHost + "/manage/memberUser/updateStoreMember";
                var params = {
                    id: data.id,
                    mobile: layero.find("input[name='mobile']").val(),
                    name: layero.find("input[name='name']").val(),
                    idCard: layero.find("input[name='idCard']").val(),
                    remark: layero.find("input[name='remark']").val(),
                    sex: layero.find("input[name='sex']:checked").val(),
                    modifyOperator: "${currentUser.trueName!}"
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
                        table.reload("userReload");
                    } else {
                        layer.msg(res.responseStatusType.error.errorMsg, {
                            time: 20000, //20s后自动关闭
                            btn: ['明白了']
                        });
                    }
                })
            },
            btn2: function () {
                layer.close(a1);
            },
            success: function (layero) {
                //表单赋值
                form.val('exampleEdit', {
                    "sex": data.sex
                    , "mobile": data.mobile
                    , "name": data.name
                    , "idCard": data.idCard
                    , "remark": data.remark
                });
                layui.form.render();
            }, end: function () {
                window.location.reload();
            }

        });
    }




    //查看账户信息
    function findAccountInfo(form, data, table, $) {
        //页面弹框
        var a1 = layer.open({
            type: 1,
            title: '账户信息',
            content: $('#accountInfoForm'),
            area: ['878px', '356px'],
            closeBtn: 1,
            btn: ['关闭'],
            btn2: function () {
                layer.close(a1);
            },
            success: function (layero) {
                table.render({
                    elem: '#accountTable'
                    , url: accountHost + "/manage/memberUser/listMemberAccount"
                    , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    , page: true          //显示分页默认不显示
                    , method: 'post'
                    , request: {
                        pageName: 'pageNum', //页码的参数名称，默认：page
                        limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    }
                    , where: {
                        memberNum: data.memberNum
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
                        , {field: 'accountType', title: '账户名称'}
                        , {field: 'amount', title: '余额'}
                    ]]
                });
                layui.form.render();
            }, end: function () {
                /*window.location.reload();*/
            }

        });
    }

    //查看按钮事件
    function layerShow(data, table, $) {
        //页面弹框
        var a2 = layer.open({
            type: 1,
            title: '用户详情',
            content: $('#showForm'),
            area: ['900px', '500px'],
            scrollbar: true,
            closeBtn: 1,
            btn: ['关闭'],
            btn2: function () {
                layer.close(a2);
            },
            success: function (layero) {
                layero.find("span[name='sex']").text(data.sex);
                if (data.sex == 1) {
                    sex = "男"
                } else {
                    sex = "女"
                }
                layero.find("span[name='sex']").text(sex);
                layero.find("span[name='mobile']").text(data.mobile);
                layero.find("span[name='idCard']").text(data.idCard);
                layero.find("span[name='name']").text(data.name);
                layero.find("span[name='memberNum']").text(data.memberNum);
                layero.find("span[name='wxOpenId']").text(data.wxOpenId);
                layero.find("span[name='lable']").text(data.lableId);
                layero.find("span[name='lastArriveDate']").text(data.lastArriveDate);
                layero.find("span[name='arriveTimes']").text(data.arriveTimes);
                layero.find("span[name='totalConsumption']").text(data.totalConsumption);

                layero.find("span[name='remark']").text(data.remark);
                layero.find("span[name='createTime']").text(data.createTime);
                var listStore = loadFindStoreName();
                for (var p in listStore) {
                    if (listStore[p].storeId === data.storeId) {
                        storeName = listStore[p].name
                    }
                }
                layero.find("span[name='store']").text(storeName);
                layero.find("span[name='enterChannel']").text(data.enterChannelName);
                layero.find("span[name='memberAddType']").text(data.memberAddTypeName);
                layui.form.render();
            }, end: function () {
                /* window.location.reload();*/
            }

        });
    }


    //加载支付方式信息
    function loadPayType() {
        var url = payHost + "/manage/payment/selectPayTypeList";
        var data = {};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("paytype_s"); //server为select定义的name
                server.innerHTML = "<option value='0' selected='true'>请选择</option>";
                for (var p in list) {
                    var option = document.createElement("option");  // 创建添加option属性
                    option.setAttribute("value", list[p].payTypeId); // 给option的value添加值
                    option.innerText = list[p].payTypeName;     // 打印option对应的纯文本
                    server.appendChild(option);           //给select添加option子标签
                }
                layui.form.render();
            } else {

            }
        })
    }

    //加载账户类型-充值
    function loadAccountType() {
        var url = walletHost + "/manage/wallet/selectWalletAccountList";
        var data = {};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("accountType"); //server为select定义的name
                server.innerHTML = "<option value='0' selected='true'>请选择</option>";
                for (var p in list) {
                    var option = document.createElement("option");  // 创建添加option属性
                    option.setAttribute("value", list[p].accountTypeId); // 给option的value添加值
                    option.innerText = list[p].accountType;     // 打印option对应的纯文本
                    server.appendChild(option);           //给select添加option子标签
                }
                layui.form.render();
            } else {

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


    //加载员工信息-充值
    function loadBeautician(datas) {
        var url = storeHost + "/manage/beautician/selectBeauticianListNoPage";
        var data = {"companyId": datas.storeId,"companyType": "3"};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("beauticianId"); //server为select定义的name
                server.innerHTML = "<option value='0' selected='true'>请选择</option>";
                for (var p in list) {
                    var option = document.createElement("option");  // 创建添加option属性
                    option.setAttribute("value", list[p].beauticianId); // 给option的value添加值
                    option.innerText = list[p].name;     // 打印option对应的纯文本
                    server.appendChild(option);           //给select添加option子标签
                }
            } else {

            }
        })
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