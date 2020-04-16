<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>数据导入</title>
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

        label.xrequired:before {
            content: '* ';
            color: red;
        }
    </style>
</head>
<body>

<#--业绩表格-->
<div class="layui-fluid">
    <div class="demoTable layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label" style="width: 154px;">请选择要导入数据的类型</label>
            <div class="layui-input-inline">
                <select name="type" id="type" lay-filter="type">
                    <option>请选择</option>
                    <option value="1">物料-产品</option>
                    <option value="2">物料-服务</option>
                    <option value="3">供应商</option>
                    <option value="4">会员</option>
                </select>
            </div>
            <div class="layui-inline">
                <div class="layui-btn-group demoTable">
                    <button type="button" class="layui-btn" id="backups">选择文件</button>
                    <button type="button" class="layui-btn" id="upfile"><i class="layui-icon"></i>导入</button>
                </div>
                <span class="layui-inline layui-upload-choose" id="filenameShow"></span>
            </div>
        </div>
    </div>
</div>
<#--<div class="layui-progress layui-progress-big" lay-showpercent="true" lay-filter="demo">-->
    <#--<div class="layui-progress-bar layui-bg-red" lay-percent="0%"></div>-->
<#--</div>-->


<script>

    layui.use(['table', 'layer', 'jquery', 'form', 'upload'], function () {
        var upload = layui.upload;
        var form = layui.form;
        var typeNum;
        var typeValue;
        var num;
        var param;

        form.on('select(type)', function (data, typeNum) {
            upfile(upload, param)
            if (data.value === "1") {
                num = "1";
                param = dataHost + "/backups/backupsProduct";
                upfile(upload, param)
            } else if (data.value === "2") {
                num = "2";
                param = dataHost + "/backups/backupsServiceProduct";
                upfile(upload, param)
            } else if (data.value === "3") {
                num = "3";
                param = dataHost + "/backups/backupsSupplier";
                upfile(upload, param)
            } else if (data.value === "4") {
                num = "4";
                param = dataHost + "/backups/backupsMember";
                upfile(upload, param)
            }
        });

        //导入按钮点击事件
        $("#backups").click(function () {
            typeValue = $("#type option:selected").val();//jq 获取下拉框的值
            if (typeValue == '请选择') {
                layer.msg("请选择要导入的数据类型");
                return false;
            }
        });
    });

    function upfile(upload, param) {
        var indexload;
        upload.render({
            elem: '#backups' //绑定元素
            , url: param
            , accept: 'file' //普通文件
            , auto: false //选择文件后不自动上传
            , bindAction: '#upfile' //指向一个按钮触发上传
            , choose: function (obj) {
                obj.preview(function (index, file, result) {
                    $("#filenameShow").html(file.name);
                    // console.log(index); //得到文件索引
                    // console.log(file); //得到文件对象
                    // console.log(result); //得到文件base64编码，比如图片
                });
            },
            before:function (obj) {
                indexload = layer.load(2);
            },
            done: function (res) {
                if (res.responseStatusType.message == "Success") {
                    layer.open({
                        title: '操作成功'
                        , content: "导入成功"
                        , btn: ["关闭"],
                        yes: function (index) {
                            layer.close(index); //如果设定了yes回调，需进行手工关闭
                            layer.close(indexload); //如果设定了yes回调，需进行手工关闭
                        }
                    });
                } else {
                    layer.msg("导入数据失败！");
                    layer.close(indexload);
                    return;
                }
                //上传完毕回调
            }
            , error: function () {
                //请求异常回调
            }
        });
    }

</script>


</body>
</html>