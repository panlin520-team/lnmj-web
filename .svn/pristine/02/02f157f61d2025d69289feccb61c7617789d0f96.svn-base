<head title="修改密码">
    <base id="base" href="${basePath!}/">
    <link href="${basePath!}/layui/css/layui.css" type="text/css" media="screen" rel="stylesheet"/>
    <script src="${basePath!}/layui/layui.js" type="text/javascript"></script>
    <script src="${basePath!}/js/host.js" type="text/javascript"></script>
    <#include "../baseFtl/pageAuth.ftl" />
</head>
<body>

<div id="test7" class="demo-tree"></div>

<div style="width: 700px;float: left;">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
        <legend>选择参数类型</legend>
    </fieldset>
    <div id="test9" class="demo-tree demo-tree-box" style="width: 700px;padding-left: 20px;"></div>
</div>
<div style="width: 700px;float: left;">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
        <legend>配置系统参数</legend>
    </fieldset>
    <div class="show_config" style="width: 700px;float: left;margin-left: 20px;margin-top: 40px;"></div>
</div>

<script>
    layui.use(['tree', 'util', 'form'], function () {
        var tree = layui.tree
            , layer = layui.layer
            , $ = layui.$
            , form = layui.form
        //监听表单提交事件
        form.on('submit(submitButton)', function (data) {
            var parameterArray = new Array();
            $(".parameter").each(function (index, element) {
                var parameterObj = {
                    "parameterId": $(this).attr("data-id"),
                    "parameterValue": $(this).val(),
                    "modifyOperator": "${currentUser.trueName!}"
                }
                parameterArray.push(parameterObj)
            });
            console.log(JSON.stringify(parameterArray))
            var url = systemHost + "/manage/system/updateParameter";
            var params = {
                "parameterArray": JSON.stringify(parameterArray)
            };
            $.post(url, params, function (res) {
                if (res.responseStatusType.message == "Success") {
                    layer.open({
                        title: '修改'
                        , content: '修改成功！'
                        , btn: ["关闭"],
                        yes: function (index) {
                            layer.close(index); //如果设定了yes回调，需进行手工关闭
                        }
                    });
                } else {
                    layer.msg(res.responseStatusType.error.errorMsg, {
                        time: 20000, //20s后自动关闭
                        btn: ['明白了']
                    });
                }
            })
        });

        //获取参数类型数据
        var data = getConfigData($)
            //模拟数据1
            , data1 = data
        //开启节点操作图标
        tree.render({
            elem: '#test9'
            , data: data1
            /* , edit: ['add', 'update', 'del'] //操作节点的图标*/
            , click: function (obj) {
                $(".show_config").html("")
                /* layer.msg(JSON.stringify(obj.data));*/
                //根据类型搜索具体配置
                var url = systemHost + "/manage/system/selectParameterList";
                var data = {"parameterTypeId": obj.data.id};
                $.post(url, data, function (result) {
                    if (result.responseStatusType.message == "Success") {
                        //动态添加div列表
                        var dataList = result.result.list;
                        for (var p in dataList) {
                            $(".show_config").append("  <div class=\"layui-form-item\">\n" +
                                "        <div class=\"layui-input-block\">" + dataList[p].parameterName + "</div>\n" +
                                "        <div class=\"layui-input-block\">\n" +
                                "            <input type=\"text\" name=\"parameter\" lay-verify=\"required\" data-id=\"" + dataList[p].parameterId + "\" value=\"" + dataList[p].parameterValue + "\" autocomplete=\"off\" placeholder=\"请输入" + dataList[p].parameterName + "\"\n" +
                                "                   class=\"layui-input parameter\">\n" +
                                "        </div>\n" +
                                "    </div>")
                        }
                        $(".show_config").append("        <div class=\"layui-form-item\">\n" +
                            "                            <div class=\"layui-input-block\">\n" +
                            "                            <button class=\"layui-btn\" lay-submit lay-filter=\"submitButton\">立即提交</button>\n" +
                            "                            <button type=\"reset\" class=\"layui-btn layui-btn-primary\">重置</button>\n" +
                            "                            </div>\n" +
                            "                            </div>")

                    } else {
                        $(".show_config").text(result.responseStatusType.error.errorMsg)
                    }
                })


            }
        });

    });

    function getConfigData($) {
        //根据订单号查询订单详情
        var url = systemHost + "/manage/system/selectParameterTypeList",
            orderDetail = null,
            params = {};
        $.ajax({
            url: url,
            data: params,
            async: false,
            type: "POST",
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    orderDetail = res.result.list;
                    for (var i in orderDetail) {
                        for (var j in orderDetail[i]) {
                            if (j == 'parameterType') {
                                orderDetail[i]['title'] = orderDetail[i][j]//修改属性名为“title”
                                delete orderDetail[i]['parameterType']//删除“parameterType”
                            }
                            if (j == 'parameterTypeId') {
                                orderDetail[i]['id'] = orderDetail[i][j]//修改属性名为“title”
                                delete orderDetail[i]['parameterTypeId']//删除“parameterTypeId”
                            }
                        }
                    }
                } else {
                    alert(res.responseStatusType.error.errorMsg)
                }
            }
        });
        return orderDetail;
    }


</script>


<body>