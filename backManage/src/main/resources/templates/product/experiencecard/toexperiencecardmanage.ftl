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
    <#include "../../baseFtl/pageAuth.ftl" />
    <style>
        #qrcodeTable table {
            display: inline-block;
        }

        #productTable thead tr {
            border-bottom: 5px solid black !important;
        }

        .resetLabel {
            width: 70px;
        }

        label.xrequired:before {
            content: '* ';
            color: red;
        }

        .layui-layedit {
            width: 595px;
            height: 223px;
        }
    </style>
</head>
<body>
<script type="text/javascript" src="${basePath!}/js/jquery.qrcode.min.js"></script>
<script type="text/javascript" src="${basePath!}/js/qrcode.js"></script>
 

<div class="layui-fluid">
    <div class="demoTable layui-form">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label resetLabel">体验卡名称</label>
                <div class="layui-input-inline">
                    <input class="layui-input" type="text" name="keyWordCardName" autocomplete="off"
                           placeholder="输入体验卡名称">
                </div>
                <label class="layui-form-label">体验卡编号</label>
                <div class="layui-input-inline">
                    <input class="layui-input" type="text" name="keyWordCarNum" autocomplete="off"
                           placeholder="输入体验卡编号">
                </div>
            </div>

            <div class="layui-inline">
                <button class="layui-btn" data-type="search"><i class="layui-icon layui-icon-search"></i></button>
            </div>
            <div class="layui-inline">
                <div class="layui-btn-group demoTable">
                    <button class="layui-btn" data-type="add">添加</button>
                </div>
            </div>
        </div>
    </div>
    <table id="experiencecard" lay-filter="demo"></table>
</div>
<#--点击体验卡单行后的表单-修改-->
    <form class="layui-form layui-form-pane layui-personal" id="editForm" action="" lay-filter="editExample"
          method="post" hidden="true">
        <button id="addExpCardProductForEdit" type="button" class="layui-btn">添加体验卡项目</button>
        <table id="experiencecardProduct" lay-filter="demoExpProduct"></table>
    </form>

<#--点击体验卡单行后的表单-查看-->
    <form class="layui-form layui-form-pane layui-personal" id="showForm" action="" lay-filter="showExample"
          method="post" hidden="true">
        <table id="experiencecardProductShow" lay-filter="demoExpProductShow"></table>
    </form>

<#--查看体验卡分配表单-->
    <form class="layui-form layui-form-pane layui-personal" id="allotExpForm" action="" lay-filter="exampleAllot"
          method="post" hidden="true">
        <div class="layui-btn-group demoTable">
            <a type="button" class="layui-btn" data-type="getCheckData">分配选中门店</a>
        </div>
        <table id="allotExpTable" lay-filter="allotExpTable"></table>
    </form>

<#--↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓add↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓-->
    <div id="addExpCard" hidden="" class="layui-fluid" style="margin: 15px;">
        <form class="layui-form layui-form-pane layui-personal" action="" id="addeditformid">
            <div class="layui-form-item">
                <div class="layui-form-item">
                    <label class="layui-form-label xrequired">体验卡名称</label>
                    <div class="layui-input-block">
                        <input type="text" name="cardName" lay-verify="required" autocomplete="off"
                               placeholder="请输入体验卡名称"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label xrequired">体验卡售价</label>
                    <div class="layui-input-block">
                        <input type="text" name="account" lay-verify="required" autocomplete="off"
                               placeholder="请输入体验卡售价"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">所属限购</label>
                    <div class="layui-input-block" style="width:150px;">
                        <select name="subordBuyLimitId" id="subordBuyLimitId" lay-filter="subordBuyLimitId"
                                lay-verify="required">
                        </select>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">行业</label>
                    <div class="layui-input-block" style="width:150px;">
                        <select name="achievementIndustryID" id="achievementIndustryID"
                                lay-filter="achievementIndustryID"
                                <#--lay-verify="required-->">
                        </select>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">所属业绩</label>
                    <div class="layui-input-inline" style="width:150px;">
                        <select name="achievementPostId" id="achievementPostId" lay-filter="achievementPostId"
                                <#--lay-verify="required"-->>
                        </select>
                    </div>
                    <span style="color: red">注：如果不选择体验卡业绩，默认采用充值业绩统计</span>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">销量</label>
                    <div class="layui-input-block">
                        <input type="text" name="salesVolume" autocomplete="off"
                               placeholder="请输入体验卡销量"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label xrequired">库存数量</label>
                    <div class="layui-input-block">
                        <input type="text" name="stockNum" lay-verify="required" autocomplete="off"
                               placeholder="请输入体验卡库存数量"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label xrequired">售卖截至日期</label>
                    <div class="layui-input-inline">
                        <input type="text" class="layui-input" lay-verify="required" name="purchaseDeadline" id="purchaseDeadline" placeholder="yyyy-MM-dd">
                    </div>
                </div>


                <div class="layui-upload">
                    <button type="button" class="layui-btn" id="test1">选择体验卡图片</button>
                    <button type="button" class="layui-btn" id="startUpAdd">开始上传</button>
                    <div class="layui-upload-list">
                        <img class="layui-upload-img" id="demo1" style="width:100px;height: 100px">
                        <p id="demoText"></p>
                    </div>
                </div>
            </div>


            <div class="layui-form-item">
                <label class="layui-form-label">简介</label>
                <div class="layui-input-block">
                    <textarea name="moreContent" id="contentAdd" style="display: none;"></textarea>
                </div>
            </div>



            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit="" lay-filter="addExpCardSubmitfilter">立即添加体验卡</button>
                    <button id="resetExpCard" type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
<#--↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑add↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑-->

<div id="editExpCard" hidden="" class="layui-fluid" style="margin: 15px;">
    <form class="layui-form layui-form-pane layui-personal" action="" id="editformid" lay-filter="exampleEdit">
        <div class="layui-form-item">

            <div class="layui-form-item" hidden="hidden">
                <label class="layui-form-label xrequired">体验卡id</label>
                <div class="layui-input-block">
                    <input type="text" name="cardId" <#--lay-verify="required"--> autocomplete="off"
                           placeholder="请输入体验卡id"
                           class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label xrequired">体验卡名称</label>
                <div class="layui-input-block">
                    <input type="text" name="cardNameEdit" lay-verify="required" autocomplete="off"
                           placeholder="请输入体验卡名称"
                           class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label xrequired">体验卡售价</label>
                <div class="layui-input-block">
                    <input type="text" name="accountEdit" lay-verify="required" autocomplete="off"
                           placeholder="请输入体验卡售价"
                           class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">所属限购</label>
                <div class="layui-input-block" style="width:150px;">
                    <select name="subordBuyLimitIdEdit" id="subordBuyLimitIdEdit" lay-filter="subordBuyLimitId"
                            lay-verify="required">
                    </select>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">行业</label>
                <div class="layui-input-block" style="width:150px;">
                    <select name="achievementIndustryID" id="achievementIndustryIDEdit"
                            lay-filter="achievementIndustryIDEdit"
                            <#--lay-verify="required"-->>
                    </select>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">所属业绩</label>
                <div class="layui-input-inline" style="width:150px;">
                    <select name="achievementPostIdEdit" id="achievementPostIdEdit" lay-filter="achievementPostId"
                            <#--lay-verify="required"-->>
                    </select>
                </div>
                <span style="color: red">注：如果不选择体验卡业绩，默认采用充值业绩统计</span>
            </div>



            <div class="layui-form-item">
                <label class="layui-form-label">销量</label>
                <div class="layui-input-block">
                    <input type="text" name="salesVolumeEdit" autocomplete="off"
                           placeholder="请输入体验卡销量"
                           class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label xrequired">库存数量</label>
                <div class="layui-input-block">
                    <input type="text" name="stockNumEdit" lay-verify="required" autocomplete="off"
                           placeholder="请输入体验卡库存数量"
                           class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label xrequired">售卖截至日期</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" lay-verify="required" name="purchaseDeadlineEdit" id="purchaseDeadlineEdit" placeholder="yyyy-MM-dd">
                </div>
            </div>

            <div class="layui-upload">
                <button type="button" class="layui-btn" id="test1Edit">选择体验卡图片</button>
                <button type="button" class="layui-btn" id="startUpAddEdit">开始上传</button>
                <div class="layui-upload-list">
                    <img class="layui-upload-img" id="demoEdit" style="width:100px;height: 100px">
                    <p id="demoTextEdit"></p>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">简介</label>
                <div class="layui-input-block">
                    <textarea name="moreContent" id="contentEdit" style="display: none;"></textarea>
                </div>
            </div>

        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="editExpCardSubmitfilter">立即修改体验卡</button>
            </div>
        </div>
    </form>
</div>
<#--点击体验卡项目单行后的表单-->
    <form class="layui-form layui-form-pane layui-personal" id="editFormProduct" action="" lay-filter="exampleProduct"
          method="post" hidden="true">
        <div class="layui-form-item">
            <label class="layui-form-label">使用总数</label>
            <div class="layui-input-block">
                <input type="text" name="useTotalTimes" autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">使用期限</label>
            <div class="layui-input-inline">
                <input name="useLimit" type="text" class="layui-input" id="useLimit" placeholder=" - ">
            </div>
        </div>


        <table class="layui-hide" id="product" lay-filter="product"></table>
    </form>

<#--添加体验卡项目表单-->
<form class="layui-form layui-form-pane layui-personal" id="addFormProduct" action="" lay-filter="exampleAddProduct"
      method="post" hidden="true"
      style="width: 700px;margin: 5px auto;">
    <div class="layui-form-item">
        <label class="layui-form-label xrequired">使用总数</label>
        <div class="layui-input-block">
            <input type="text" name="useTotalTimesAdd" autocomplete="off" placeholder="请输入使用次数"
                   class="layui-input" lay-verify="required">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label xrequired">使用期限</label>
        <div class="layui-input-block">
            <input name="useLimitAdd" type="text" class="layui-input" id="useLimitAdd" placeholder="请输入使用期限"
                   lay-verify="required">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">链接</label>
        <div class="layui-input-block">
            <input type="text" name="link" autocomplete="off" placeholder="请输入链接"
                   class="layui-input">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">转发标题</label>
        <div class="layui-input-block">
            <input type="text" name="forwardTitle" autocomplete="off" placeholder="请输入转发标题"
                   class="layui-input">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">转发描述</label>
        <div class="layui-input-block">
            <input type="text" name="forwardDescribe" autocomplete="off" placeholder="请输入转发描述"
                   class="layui-input">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">LOGO图片</label>
        <div class="layui-input-block">
            <input type="text" name="logoImge" autocomplete="off" placeholder="请输入LOGO图片"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="button" class="layui-btn layui-btn-danger" id="showOrHideProject"><i class="layui-icon"></i>点击显示或隐藏项目
            </button>
        </div>
    </div>

    <div id="addProductDiv" hidden="hidden">
        <label class="layui-form-label">商品名称</label>
        <div class="layui-input-inline">
            <input class="layui-input" type="text" name="keyWordProductName" autocomplete="off" placeholder="输入商品名称">
        </div>

        <div class="layui-inline">
            <button class="layui-btn" data-type="search" type="button" id="submitSearchButton"><i
                        class="layui-icon layui-icon-search"></i></button>
        </div>


        <table class="layui-hide" id="addProduct" lay-filter="addProduct"></table>
    </div>


    <div class="layui-form-item">
        <div class="layui-input-block">
            <#--<button class="layui-btn" lay-submit lay-filter="addProductSubmitfilter">立即添加项目</button>-->
            <button class="layui-btn" lay-submit="" lay-filter="addProductSubmitfilter" id="addProductButton">立即添加项目
            </button>
            <button id="resetProduct" type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>

</form>


<script type="text/html" id="barDemoForExperiencecard">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="editInfo">修改信息</a>
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="edit">修改项目</a>
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="allot">分配</a>
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="del">删除</a>
</script>


<script type="text/html" id="barDemoForProduct">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="productDetail">查看商品详情</a>
</script>

<script type="text/html" id="barDemoExperiencecardDetail">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="del">删除</a>
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="edit">修改</a>
</script>

<script>
    //列表显示--体验卡
    var resultImgUrlAdd = "";
    var resultImgUrlEdit = "";
    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#experiencecard'
            , url: storeHost + "/manage/experienceCard/selectExperienceCardList"
            , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , page: true          //显示分页默认不显示
            , method: 'post'
            , id: "experiencecardReload"
            , request: {
                pageName: 'pageNum', //页码的参数名称，默认：page
                limitName: 'pageSize' //每页数据量的参数名，默认：limit
            }
            , where: {}
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
                , {
                    field: 'logoImage', title: '体验卡图片', width: 150, templet: function (d) {
                        return d.logoImage == "" || d.logoImage == null ? "<div><img src='/noImg.png' style='width:60px;height: 60px'></div>" : "<div><img src=" + d.logoImage + " style='width:60px;height: 60px'></div>"
                    }
                }
                , {field: 'account', edit: 'text', title: '体验卡售价'}
                , {field: 'cardNum', title: '体验卡编号'}
                , {field: 'cardName', edit: 'text', title: '体验卡名称'}
                , {fixed: 'right', title: '操作', width: 500, align: 'center', toolbar: '#barDemoForExperiencecard'}
            ]]
        })
    });

    var kindlist = loadKind();
    //增删改查操作实现
    var checkedProduct = null
    var checkedProductAdd = null
    var productList = new Array()
    var addopen = null;
    var expCardAddForm = null;
    var expCardEditForm = null;
    var nowED = null;
    layui.use(['table', 'layer', 'jquery', 'form', 'layedit'], function () {
        var table = layui.table,
            layer = layui.layer,
            $ = layui.jquery,
            form = layui.form,
            layedit = layui.layedit,
            ptool = {
                tool: [
                    'strong' //加粗
                    , 'italic' //斜体
                    , 'underline' //下划线
                    , 'del' //删除线
                    , '|' //分割线
                    , 'left' //左对齐
                    , 'center' //居中对齐
                    , 'right' //右对齐
                    , 'link' //超链接
                    , 'unlink' //清除链接
                    , 'face' //表情
                    , 'image' //插入图片
                    , 'help' //帮助
                ],
                width: 595,
                height: 223
            };
        //建立编辑器
        layedit.build('contentAdd', ptool);
        layedit.build('contentEdit', ptool);
        loadSubordBuyLimit(form);
        loadSubordBuyLimitEdit(form)
        loadAchievementIndustry(form);
        loadAchievementIndustryEdit(form);
        loadAchievementEdit(form, null);
        loadAchievement(form, null);
        form.on('select(achievementIndustryID)', function (data) {
            $("#achievementPostId").empty();
            loadAchievement(form, data.value);
        });

        form.on('select(achievementIndustryIDEdit)', function (data) {
            $("#achievementPostIdEdit").empty();
            loadAchievementEdit(form, data.value);
        });

        $("#submitSearchButton").click(function () {
            var keyWordProductName = $("input[name='keyWordProductName']").val();
            table.reload('addProduct', {
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                , where: {
                    keyWordProductName: keyWordProductName
                }
            }, 'data');
        });


        //监听表格单选选择-修改
        table.on('radio(product)', function (obj) {
            checkedProduct = null
            checkedProduct = obj.data
        });
        //监听表格单选选择-添加
        table.on('radio(addProduct)', function (obj) {
            checkedProductAdd = null
            checkedProductAdd = obj.data
        });
        //监听表格复选框选择
        table.on('checkbox(demo)', function (obj) {
        });

        //监听工具条-体验卡列表
        var data = null;
        table.on('tool(demo)', function (obj) {
            data = obj.data;
            if (obj.event === 'detail') {
                experienceCardShow(data, table, $)
            } else if (obj.event === 'edit') {
                layerShowAndEdit(data, table, $)
            } else if (obj.event === 'del') {
                layerDelete(data, table, $)
            } else if (obj.event === 'allot') {
                //商品分配
                allotExp(data, table, form, $);
            } else if (obj.event === 'editInfo') {
                editInfo(form, data, table, $, ptool, layedit)
            }
        });

        //监听工具条-商品列表
        table.on('tool(demoExpProduct)', function (obj) {
            var data = obj.data;
            if (obj.event === 'edit') {
                layerShowAndEditProduct(form, data, table, $)
            } else if (obj.event === 'del') {
                layerDeleteProduct(data, table, $)
            }
        });


        var expCardAddTable = null;

        var $ = layui.$, active = {
            search: function () {
                var keyWordCardName = $(".demoTable input[name='keyWordCardName']").val();
                var keyWordCarNum = $(".demoTable input[name='keyWordCarNum']").val();
                table.render({
                    elem: '#experiencecard'
                    , url: storeHost + "/manage/experienceCard/selectExperienceCardList"
                    , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    , page: true          //显示分页默认不显示
                    , method: 'post'
                    , id: "experiencecardReload"
                    , request: {
                        pageName: 'pageNum', //页码的参数名称，默认：page
                        limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    }
                    , where: {
                        keyWordCardName: keyWordCardName,
                        keyWordCarNum: keyWordCarNum
                    }
                    , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                        return {
                            "code": 0, //解析接口状态
                            "msg": "", //解析提示文本
                            "count": res.result == null ? 0 : res.result.total, //解析数据长度
                            "data": res.result == null ? 0 : res.result.list //解析数据列表
                        };
                    },
                    cols: [[
                        {type: 'checkbox', fixed: 'left', width: 60}
                        , {field: 'cardId', width: 40, title: 'id'}
                        , {
                            field: 'logoImage', title: '体验卡图片', width: 150, templet: function (d) {
                                return d.logoImage == "" || d.logoImage == null ? "<div><img src='/noImg.png' style='width:60px;height: 60px'></div>" : "<div><img src=" + d.logoImage + " style='width:60px;height: 60px'></div>"
                            }
                        }
                        , {field: 'account', edit: 'text', title: '体验卡售价'}
                        , {field: 'cardNum', title: '体验卡编号'}
                        , {field: 'cardName', edit: 'text', title: '体验卡名称'}
                        , {
                            fixed: 'right',
                            title: '操作',
                            width: 170,
                            align: 'center',
                            toolbar: '#barDemoForExperiencecard'
                        }
                    ]]
                });
            }
            , add: function () {
                $("#resetExpCard").click();//重置表单
                //页面弹框
                expCardAddForm = layer.open({
                    type: 1,
                    title: '添加体验卡',
                    content: $('#addExpCard'),
                    scrollbar: true,
                    id: "expCardAddForm",
                    area: ['878px', '356px'],
                    yes: function () {
                    },
                    btn2: function () {
                        $("input[name='cardName']").val("")
                        productList = new Array()
                    },
                    success: function (layero) {
                        nowED = layedit.build('contentAdd', ptool);
                        var table = layui.table;
                        //展示已知数据
                        expCardAddTable = table.render({
                            elem: '#showProductTable'
                            , id: "showProductTableReload"
                            , data: productList
                            , cols: [[ //标题栏
                                {field: 'productCode', title: '商品编号', width: 80, sort: true}
                                , {field: 'productKind', title: '商品分类', width: 120}
                                , {field: 'productName', title: '商品名称', minWidth: 150}
                                , {field: 'useLimit', title: '使用期限', minWidth: 160}
                                , {field: 'useTotalTimes', title: '使用总次数', width: 80}
                            ]]
                            , done: function (res, curr, count) {
                                console.log(productList)
                            }

                        });
                    }
                });
            }
        };
        //添加体验卡项目按钮事件
        $("#addExpCardProduct").click(function () {
            $("#resetProduct").click();//重置表单
            $("input[name='useLimitAdd']").val("")
            $("input[name='useTotalTimesAdd']").val("")
            //页面弹框
            addopen = layer.open({
                type: 1,
                title: '添加体验卡项目',
                content: $('#addFormProduct'),
                scrollbar: true,
                area: ['731px', '461px'],
                closeBtn: 1,
                yes: function (index, layero) {
                },
                btn2: function () {
                },
                success: function (layero) {
                    $("#showEfficientDate").attr("hidden", true)
                    $("#showEfficientCondition").attr("hidden", true)
                    $("#addProductButton").attr("data-edit", 0)
                    table.render({
                        elem: '#addProduct'
                        , hide: true
                        , url: productHost + "/manage/product/selectProductList"
                        , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                        , page: true          //显示分页默认不显示
                        , method: 'post'
                        , toolbar: '#toolbarDemoProduct'
                        , request: {
                            pageName: 'pageNum', //页码的参数名称，默认：page
                            limitName: 'pageSize' //每页数据量的参数名，默认：limit
                        }
                        , where: {
                            /* "type": 2,*/
                            "status": 1,
                            "productStatus": 1,
                            "companyId": "${currentUser.companyId!}",
                            "companyType": "${currentUser.companyType!}",
                            "isHoutai": 1
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
                            {type: 'radio', width: 80}
                            , {field: 'productCode', title: '商品编号'}
                            , {field: 'productName', title: '商品名称'}
                            , {field: 'retailPrice', title: '商品价格'}

                        ]]
                        , done: function (res, curr, count) {

                        }
                    })
                }
            });

        });

        //添加体验卡项目按钮事件-修改中
        $("#addExpCardProductForEdit").click(function () {
            $("#resetProduct").click();//重置表单
            $("input[name='useLimitAdd']").val("")
            $("input[name='useTotalTimesAdd']").val("")
            //页面弹框
            addopen = layer.open({
                type: 1,
                title: '添加体验卡项目',
                content: $('#addFormProduct'),
                scrollbar: true,
                area: ['731px', '461px'],
                closeBtn: 1,
                yes: function (index, layero) {
                },
                btn2: function () {
                },
                success: function (layero) {
                    $("#showEfficientDate").attr("hidden", false)
                    $("#showEfficientCondition").attr("hidden", false)
                    $("#addProductButton").attr("data-edit", 1)
                    $("#addProductButton").attr("data-exp", data.cardNum)
                    table.render({
                        elem: '#addProduct'
                        , hide: true
                        , url: productHost + "/manage/product/selectProductList"
                        , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                        , page: true          //显示分页默认不显示
                        , method: 'post'
                        , toolbar: '#toolbarDemoProduct'
                        , request: {
                            pageName: 'pageNum', //页码的参数名称，默认：page
                            limitName: 'pageSize' //每页数据量的参数名，默认：limit
                        }
                        , where: {
                            /*"type": 2,*/
                            "status": 1,
                            "productStatus": 1,
                            "companyId": "${currentUser.companyId!}",
                            "companyType": "${currentUser.companyType!}",
                            "isHoutai": 1
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
                            {type: 'radio', width: 80}
                            , {field: 'productCode', title: '商品编号'}
                            , {field: 'productName', title: '商品名称'}
                            , {field: 'retailPrice', title: '商品价格'}
                        ]]
                        , done: function (res, curr, count) {

                        }
                    })
                }
            });

        });


        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        //监听添加提交-项目
        form.on('submit(addProductSubmitfilter)', function () {
            if (checkedProductAdd == null) {
                alert("请选择体验卡项目");
                return
            }
            if ($("input[name='useLimitAdd']").val() == "") {
                alert("使用期限不能为空")
                return
            }
            if ($("input[name='useTotalTimesAdd']").val() == "") {
                alert("使用次数不能为空")
                return
            }

            var params = {
                "carNum": $("#addProductButton").attr("data-exp"),
                "useLimit": $("input[name='useLimitAdd']").val(),
                "useTotalTimes": $("input[name='useTotalTimesAdd']").val(),
                "link": $("input[name='link']").val(),
                "totalSales": $("input[name='totalSales']").val(),
                "totalCommission": $("input[name='totalCommission']").val(),
                "forwardTitle": $("input[name='forwardTitle']").val(),
                "forwardDescribe": $("input[name='forwardDescribe']").val(),
                "logoImge": $("input[name='logoImge']").val(),
                "productCode": checkedProductAdd.productCode,
                "productKind": checkedProductAdd.productKind,
                "productName": checkedProductAdd.productName
            };
            productList = new Array();
            productList.push(params);
            if ($("#addProductButton").attr("data-edit") == 0) {
                //执行重载
                table.reload('showProductTableReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    , data: productList
                });
                layer.close(layer.index);
                return false;
            } else if ($("#addProductButton").attr("data-edit") == 1) {
                //给已经存在的体验卡添加项目
                var url = storeHost + "/manage/experienceCard/addExpCard";
                var data = {
                    "productArray": JSON.stringify(productList),
                    "createOperator": "${currentUser.trueName!}"
                };
                $.post(url, data, function (res) {
                    if (res.responseStatusType.message == "Success") {
                        uploadExpCardProduct($("#editForm").attr("data-cardId"));
                        layer.open({
                            title: '添加项目'
                            , content: '添加项目成功！'
                            , btn: ["确定", "关闭"]
                            , yes: function (index) {
                                layer.close(index); //如果设定了yes回调，需进行手工关闭
                                layer.close(addopen);
                            }
                        });
                        //重新加载表格
                        table.reload("productReload");
                    } else {
                        layer.msg(res.responseStatusType.error.errorMsg, {
                            time: 20000, //20s后自动关闭
                            btn: ['明白了']
                        });
                    }
                })
                productList = new Array();
                return false;
            }
        });

        //监听添加提交-体验卡
        form.on('submit(addExpCardSubmitfilter)', function () {
            var moreContent = layedit.getContent(nowED);
            if ($("input[name='cardName']").val() == "") {
                alert("体验卡名称不能为空")
                return
            }
            if ($("input[name='account']").val() == "") {
                alert("体验卡售价不能为空")
                return
            }
           /* if (productList.length == 0) {
                alert("体验卡项目不能为空")
                return
            }*/

            var url = storeHost + "/manage/experienceCard/addExpCard";
            var data = {
                cardName: $("input[name='cardName']").val(),
                account: $("input[name='account']").val(),
                subordBuyLimitId: $("#subordBuyLimitId option:selected").val(),
                achievementPostId: $("#achievementPostId option:selected").val(),
                logoImage: resultImgUrlAdd,
                productArray: JSON.stringify(productList),
                moreContent: moreContent,
                purchaseDeadline: $("input[name='purchaseDeadline']").val(),
                stockNum: $("input[name='stockNum']").val(),
                salesVolume: $("input[name='salesVolume']").val(),
                createOperator: "${currentUser.trueName!}"
            };


            if (resultImgUrlAdd == "") {
                //如果没有上传
                var imgOpen = layer.open({
                    skin: 'layui-layer-molv',
                    type: 1,
                    area: "10%",
                    content: "您还未上次头像图片，要继续添加吗？",
                    shadeClose: true,
                    btn: ['继续', '取消'],
                    yes: function (index) {
                        $.ajax({
                            type: "POST",
                            url: url,
                            data: data,
                            async: false,
                            error: function (request) {
                                layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
                            },
                            success: function (data) {
                                if (data.responseStatusType.message === "Success") {
                                    layer.open({
                                        title: '添加体验卡'
                                        , content: '添加成功！'
                                        , btn: ["确定", "关闭"]
                                        , yes: function (index) {
                                            layer.close(index); //如果设定了yes回调，需进行手工关闭
                                            layer.close(expCardAddForm)
                                            layer.close(imgOpen)
                                        }
                                    });
                                    //重新加载表格
                                    table.reload("experiencecardReload");
                                } else {
                                    layer.msg(data.responseStatusType.error.errorMsg, {
                                        time: 20000, //20s后自动关闭
                                        btn: ['明白了']
                                    });
                                }
                            }
                        });
                    },
                    btn2: function (index) {
                        layer.close(index); //如果设定了yes回调，需进行手工关闭
                    }
                });
            } else {
                $.ajax({
                    type: "POST",
                    url: url,
                    data: data,
                    async: false,
                    error: function (request) {
                        layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
                    },
                    success: function (data) {
                        if (data.responseStatusType.message === "Success") {
                            layer.open({
                                title: '添加体验卡'
                                , content: '添加成功！'
                                , btn: ["确定", "关闭"]
                                , yes: function (index) {
                                    layer.close(index); //如果设定了yes回调，需进行手工关闭
                                    layer.close(expCardAddForm)
                                }
                            });
                            //重新加载表格
                            table.reload("experiencecardReload");
                        } else {
                            layer.msg(data.responseStatusType.error.errorMsg, {
                                time: 20000, //20s后自动关闭
                                btn: ['明白了']
                            });
                        }
                    }
                });
            }

            productList = new Array()
            return false;
        });


        //监听修改提交-体验卡
        form.on('submit(editExpCardSubmitfilter)', function () {
            var moreContent = layedit.getContent(nowED);
            var url = storeHost + "/manage/experienceCard/updateExpCardById";
            var data = {};
            if (resultImgUrlEdit === "") {
                data = {
                    cardId: $("input[name='cardId']").val(),
                    cardName: $("input[name='cardNameEdit']").val(),
                    account: $("input[name='accountEdit']").val(),
                    moreContent: moreContent,
                    subordBuyLimitId: $("#subordBuyLimitIdEdit option:selected").val(),
                    achievementPostId: $("#achievementPostIdEdit option:selected").val(),
                    purchaseDeadline: $("input[name='purchaseDeadlineEdit']").val(),
                    stockNum: $("input[name='stockNumEdit']").val(),
                    salesVolume: $("input[name='salesVolumeEdit']").val(),
                    createOperator: "${currentUser.trueName!}"
                };
            } else {
                data = {
                    cardId: $("input[name='cardId']").val(),
                    cardName: $("input[name='cardNameEdit']").val(),
                    account: $("input[name='accountEdit']").val(),
                    moreContent: moreContent,
                    logoImage: resultImgUrlEdit,
                    subordBuyLimitId: $("#subordBuyLimitIdEdit option:selected").val(),
                    achievementPostId: $("#achievementPostIdEdit option:selected").val(),
                    purchaseDeadline: $("input[name='purchaseDeadlineEdit']").val(),
                    stockNum: $("input[name='stockNumEdit']").val(),
                    salesVolume: $("input[name='salesVolumeEdit']").val(),
                    createOperator: "${currentUser.trueName!}"
                };
            }


            $.ajax({
                type: "POST",
                url: url,
                data: data,
                async: false,
                error: function (request) {
                    layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
                },
                success: function (data) {
                    if (data.responseStatusType.message === "Success") {
                        layer.open({
                            title: '修改体验卡'
                            , content: '修改成功！'
                            , btn: ["确定", "关闭"]
                            , yes: function (index) {
                                layer.close(index); //如果设定了yes回调，需进行手工关闭
                                layer.close(expCardEditForm)
                            }
                        });
                        //重新加载表格
                        table.reload("experiencecardReload");
                        uploadExpCardProduct($("input[name='cardId']").val())
                    } else {
                        layer.msg(data.responseStatusType.error.errorMsg, {
                            time: 20000, //20s后自动关闭
                            btn: ['明白了']
                        });
                    }
                }
            });
            return false;
        });
    })


    //删除体验卡按钮事件
    function layerDelete(data, table, $) {
        //删除数据库数据
        var url = storeHost + "/manage/experienceCard/deleteExpCardByCarNum";
        var data = {
            "cardNum": data.cardNum
        };
        $.post(url, data, function (res) {
            if (res.responseStatusType.message == "Success") {
                layer.open({
                    title: '删除'
                    , content: '删除成功！'
                });
                //重新加载表格
                table.reload("experiencecardReload");
            } else {
                layer.open({
                    title: '删除'
                    , content: '删除失败！'
                });
            }
        })
    }

    //删除体验卡项目按钮事件
    function layerDeleteProduct(data, table, $) {
        //删除数据库数据
        var url = storeHost + "/manage/experienceCard/deleteExpCardProductById";
        var data = {
            cardProductId: data.cardProductId
        };
        $.post(url, data, function (res) {
            if (res.responseStatusType.message == "Success") {
                uploadExpCardProduct($("#editForm").attr("data-cardId"))
                layer.open({
                    title: '删除'
                    , content: '删除成功！'
                });
                //重新加载表格
                table.reload("productReload");
            } else {
                layer.open({
                    title: '删除'
                    , content: '删除失败！'
                });
            }
        })
    }

    //修改体验卡项目按钮事件
    function layerShowAndEdit(data, table, $) {
        //页面弹框
        layer.open({
            type: 1,
            title: '修改体验卡项目',
            content: $('#editForm'),
            scrollbar: true,
            area: ['878px', '356px'],
            closeBtn: 1,
            btn: ['关闭'],
            btn2: function () {

            },
            success: function (layero) {
                $("#editForm").attr("data-cardId",data.cardId);
                table.render({
                    elem: '#experiencecardProduct'
                    , url: storeHost + "/manage/experienceCard/selectExpCardProductListByCarNum"
                    , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    , page: false          //显示分页默认不显示
                    , method: 'post'
                    , id: "productReload"
                    , request: {
                        pageName: 'pageNum', //页码的参数名称，默认：page
                        limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    }
                    , where: {
                        cardNum: data.cardNum
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
                        {field: 'cardNum', title: '体验卡编号'}
                        , {field: 'productCode', title: '商品编号'}
                        , {field: 'productName', title: '商品名称'}
                        , {field: 'useLimit', title: '使用期限'}
                        , {field: 'outStockPrice', title: '出库价（元）'}
                        , {field: 'useTotalTimes', title: '总使用数'}
                        , {
                            fixed: 'right',
                            title: '操作',
                            width: 170,
                            align: 'center',
                            toolbar: '#barDemoExperiencecardDetail'
                        }
                    ]]
                });
                layui.form.render();
            }
        });
    }

    //修改体验卡信息按钮事件
    function editInfo(form, data, table, $, ptool, layedit) {
        //页面弹框
        expCardEditForm = layer.open({
            type: 1,
            title: '修改体验卡信息',
            content: $('#editExpCard'),
            scrollbar: true,
            area: ['878px', '356px'],
            closeBtn: 1,
            btn: ['关闭'],
            btn2: function () {

            },
            success: function (layero) {
                var index = layedit.build('contentEdit', ptool);
                nowED = index;
                form.val('exampleEdit', {
                    "cardId": data.cardId
                    , "cardNameEdit": data.cardName
                    , "accountEdit": data.account
                    , "subordBuyLimitIdEdit": data.subordBuyLimitId
                    , "achievementPostIdEdit": data.achievementPostId
                    , "stockNumEdit": data.stockNum
                    , "salesVolumeEdit": data.salesVolume
                    , "purchaseDeadlineEdit": data.purchaseDeadline
                });
                $('#demoEdit').attr('src', data.logoImage);
                layedit.setContent(index, data.moreContent);

            }

        });
    }


    //修改体验卡项目按钮事件
    function layerShowAndEditProduct(form, data, table, $) {
        //页面弹框
        var updatapen = layer.open({
            type: 1,
            title: '修改体验卡项目',
            content: $('#editFormProduct'),
            scrollbar: true,
            area: ['878px', '356px'],
            closeBtn: 1,
            btn: ['提交', '关闭'],
            yes: function (index, layero) {
                if (layero.find("input[name='useLimit']").val() == "") {
                    alert("使用期限不能为空")
                    return
                }
                if (layero.find("input[name='useTotalTimes']").val() == "") {
                    alert("使用次数不能为空")
                    return
                }
                var url = storeHost + "/manage/experienceCard/updateExpCardProductById";
                var params = {
                    "useLimit": layero.find("input[name='useLimit']").val(),
                    "useTotalTimes": layero.find("input[name='useTotalTimes']").val(),
                    "cardProductId": data.cardProductId,
                    "productCode": checkedProduct == null ? null : checkedProduct.productCode,
                    "productKind": checkedProduct == null ? null : checkedProduct.productKind,
                    "productName": checkedProduct == null ? null : checkedProduct.productName,
                    "modifyOperator": "${currentUser.trueName!}"
                };
                $.post(url, params, function (res) {
                    if (res.responseStatusType.message == "Success") {
                        uploadExpCardProduct($("#editForm").attr("data-cardId"))
                        layer.open({
                            title: '修改'
                            , content: '修改成功！'
                            , btn: ["关闭"]
                            , yes: function (index) {
                                layer.close(index); //如果设定了yes回调，需进行手工关闭
                                layer.close(updatapen); //如果设定了yes回调，需进行手工关闭
                                table.reload("productReload");
                            }
                        });
                        //重新加载表格
                        layui.form.render();
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
                var table = layui.table;
                table = $.extend(table, {config: {checkName: 'isChecked'}});
                table.render({
                    elem: '#product'
                    , url: productHost + "/manage/product/selectProductList"
                    , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    , page: true          //显示分页默认不显示
                    , method: 'post'
                    , toolbar: '#toolbarDemoProduct'
                    , request: {
                        pageName: 'pageNum', //页码的参数名称，默认：page
                        limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    }
                    , where: {
                        "checkedProductCode": data.productCode,
                        /*"type": 2,*/
                        "status": 1,
                        "productStatus": 1,
                        "companyId": "${currentUser.companyId!}",
                        "companyType": "${currentUser.companyType!}",
                        "isHoutai": 1
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
                        {type: 'radio', width: 80}
                        , {field: 'productCode', title: '商品编号'}
                        , {field: 'productName', title: '商品名称'}
                        , {field: 'retailPrice', title: '商品价格'}
                        , {field: 'isChecked', title: '是否选择'}
                        , {fixed: 'right', title: '操作', width: 170, align: 'center', toolbar: '#barDemoForProduct'}
                    ]]
                    , done: function (res, curr, count) {

                    }
                })

                //表单初始赋值
                form.val('exampleProduct', {
                    "useTotalTimes": data.useTotalTimes,
                    "useLimit": data.useLimit//营业时间-赋值
                })


                layui.form.render();
            }
        });


    }

    //查看体验卡按钮事件
    function experienceCardShow(data, table, $) {
        //页面弹框
        layer.open({
            type: 1,
            title: '体验卡详情',
            content: $('#showForm'),
            scrollbar: true,
            area: ['878px', '356px'],
            closeBtn: 1,
            btn: ['关闭'],
            btn2: function () {
            },
            success: function (layero) {
                table.render({
                    elem: '#experiencecardProductShow'
                    , url: storeHost + "/manage/experienceCard/selectExpCardProductListByCarNum"
                    , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    , page: false          //显示分页默认不显示
                    , method: 'post'
                    , request: {
                        pageName: 'pageNum', //页码的参数名称，默认：page
                        limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    }
                    , where: {
                        cardNum: data.cardNum
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
                        , {field: 'cardNum', title: '体验卡编号'}
                        , {field: 'productCode', title: '商品编号'}
                        , {field: 'productKind', title: '商品类型'}
                        , {field: 'productName', title: '商品名称'}
                        , {field: 'useLimit', title: '使用期限'}
                        , {field: 'useTotalTimes', title: '总使用数'}
                    ]]
                });
                layui.form.render();
            }
        });
    }


    //加载种类列表
    function loadKind() {
        var url = productHost + "/productKind/selectProductKindList";
        var data = {};
        var resultList = new Array();
        $.ajax({
            url: url,
            type: "post",
            data: data,
            async: false,
            success: function (result) {
                if (result.responseStatusType.message == "Success") {
                    resultList = result.result.list;    //返回的数据
                } else {
                }
            }
        });
        return resultList
    }


    //加载限购列表-添加
    function loadSubordBuyLimit(form) {
        //加载店铺列表信息
        var url = storeHost + "/manage/subordBuyLimit/selectSubordBuyLimitList";
        var data = {"productType": 4};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result.list;    //返回的数据
                var server = document.getElementById("subordBuyLimitId"); //server为select定义的id
                server.innerHTML = "<option value='0' selected='selected'>请选择</option>";
                for (var p in list) {
                    var option = document.createElement("option");  // 创建添加option属性
                    option.setAttribute("value", list[p].subordBuyLimitId); // 给option的value添加值
                    option.innerText = list[p].subordBuyLimitName;     // 打印option对应的纯文本
                    server.appendChild(option);           //给select添加option子标签
                }
                form.render();
            } else {

            }
        })
    }

    //加载限购列表-修改
    function loadSubordBuyLimitEdit(form) {
        //加载店铺列表信息
        var url = storeHost + "/manage/subordBuyLimit/selectSubordBuyLimitList";
        var data = {"productType": 4};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result.list;    //返回的数据
                var server = document.getElementById("subordBuyLimitIdEdit"); //server为select定义的id
                server.innerHTML = "<option value='0' selected='selected'>请选择</option>";
                for (var p in list) {
                    var option = document.createElement("option");  // 创建添加option属性
                    option.setAttribute("value", list[p].subordBuyLimitId); // 给option的value添加值
                    option.innerText = list[p].subordBuyLimitName;     // 打印option对应的纯文本
                    server.appendChild(option);           //给select添加option子标签
                }
                form.render();
            } else {

            }
        })
    }
</script>


<script>
    //关于时间范围的js
    layui.use('laydate', function () {
        var laydate = layui.laydate;
        //日期范围
        laydate.render({
            elem: '#useLimit'
            , range: true
        });
        laydate.render({
            elem: '#useLimitAdd'
            , range: true
        });
        //常规用法
        /*  laydate.render({
              elem: '#efficientDate'
          });*/
    });
    //监听单元格编辑
    layui.use('table', function () {
        var table = layui.table;
        table.on('edit(demo)', function (obj) {
            var value = obj.value //得到修改后的值
                , data = obj.data //得到所在行所有键值
                , field = obj.field; //得到字段
            var paramsValue = null;
            if (field == "cardName") {
                paramsValue = {
                    cardId: data.cardId,
                    cardName: value,
                    modifyOperator: "${currentUser.trueName!}"
                };
            } else if (field == "account") {
                paramsValue = {
                    cardId: data.cardId,
                    account: value,
                    modifyOperator: "${currentUser.trueName!}"
                };
            }
            layer.msg('[ID: ' + data.postId + '] ' + field + ' 字段更改为：' + value, {
                time: 20000, //20s后自动关闭
                btn: ['确认修改', '取消'],
                yes: function (index, layero) {
                    var url = storeHost + "/manage/experienceCard/updateExpCardById";
                    var params = paramsValue;
                    $.post(url, params, function (res) {
                        if (res.responseStatusType.message == "Success") {
                            layer.msg("修改成功")
                            if (field == "account"){
                                uploadExpCardProduct(data.cardId)
                            }
                            table.reload("experiencecardReload");
                        } else {
                            layer.msg(res.responseStatusType.error.errorMsg, {
                                time: 20000, //20s后自动关闭
                                btn: ['明白了']
                            });
                        }
                    });


                },
                btn2: function () {
                    table.reload("experiencecardReload");
                }
            });
        });
    });


    //加载职位业绩-添加
    function loadAchievement(form, achievementIndustryID) {
        var arr = [];
        var param = {storeId: JSON.stringify(arr), achievementType: 6, achievementIndustryID: achievementIndustryID};
        $.ajax({
            url: dataHost + "/performance/selectPerformanceList",
            data: param,
            method: "POST",
            async: false,
            success: function (res) {
                var serverAchievementSearch = document.getElementById("achievementPostId");
                if (res.responseStatusType.message == "Success") {
                    var dataAchievement = res.result.list;
                    serverAchievementSearch.innerHTML = "<option value='' selected='selected'>请选择</option>";
                    for (var p in dataAchievement) {
                        var optgroup = document.createElement("optgroup");  // 创建添加optgroup属性
                        optgroup.setAttribute("label", dataAchievement[p].achievementName); // 给optgroup的label添加值
                        optgroup.setAttribute("value", dataAchievement[p].achievementID); // 给option的value添加值
                        var performancePostList = dataAchievement[p].performancePostList;
                        for (var n in performancePostList) {
                            var option = document.createElement("option");  // 创建添加option属性
                            option.setAttribute("value", performancePostList[n].id); // 给option的value添加值
                            option.innerText = performancePostList[n].achievementPostName;
                            optgroup.appendChild(option)

                        }
                        serverAchievementSearch.appendChild(optgroup);           //给select添加option子标签
                    }
                }
                form.render()
            }
        })
    };

    //加载职位业绩-修改
    function loadAchievementEdit(form, achievementIndustryID) {
        var arr = [];
        var param = {storeId: JSON.stringify(arr), achievementType: 6, achievementIndustryID: achievementIndustryID};
        $.ajax({
            url: dataHost + "/performance/selectPerformanceList",
            data: param,
            method: "POST",
            async: false,
            success: function (res) {
                var serverAchievementSearch = document.getElementById("achievementPostIdEdit");
                if (res.responseStatusType.message == "Success") {
                    var dataAchievement = res.result.list;
                    serverAchievementSearch.innerHTML = "<option value='' selected='selected'>请选择</option>";
                    for (var p in dataAchievement) {
                        var optgroup = document.createElement("optgroup");  // 创建添加optgroup属性
                        optgroup.setAttribute("label", dataAchievement[p].achievementName); // 给optgroup的label添加值
                        optgroup.setAttribute("value", dataAchievement[p].achievementID); // 给option的value添加值
                        var performancePostList = dataAchievement[p].performancePostList;
                        for (var n in performancePostList) {
                            var option = document.createElement("option");  // 创建添加option属性
                            option.setAttribute("value", performancePostList[n].id); // 给option的value添加值
                            option.innerText = performancePostList[n].achievementPostName;
                            optgroup.appendChild(option)
                            serverAchievementSearch.appendChild(option);
                        }
                        /*serverAchievementSearch.appendChild(option);*/           //给select添加option子标签
                    }
                }
                form.render()
            }
        })
    };


    function allotExp(data, table, form, $) {
        // 页面弹框
        var a = layer.open({
            type: 1,
            title: '体验卡分配',
            content: $('#allotExpForm'),
            area: ['554px', '270px'],
            closeBtn: 1,
            btn: ['取消'],
            btn1: function () {
                layer.close(a);
            },
            success: function (layero) {
                var paramJson = {};
                if ("${currentUser.companyType!}" == 1) {
                    //如果是总公司
                    paramJson = {"companyId": "${currentUser.companyId!}", "experienceCardNum": data.cardNum}
                } else if ("${currentUser.companyType!}" == 2) {
                    //如果是子公司
                    paramJson = {"subCompanyId": "${currentUser.companyId!}", "experienceCardNum": data.cardNum}
                }

                $("#allotExpForm").attr("data-cardId", data.cardId)
                layui.use('table', function () {
                    var table = layui.table;
                    table = $.extend(table, {config: {checkName: 'isChecked'}});
                    table.render({
                        elem: '#allotExpTable'
                        , url: storeHost + "/manage/store/selectStoreListNoPage"
                        , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                        , page: true          //显示分页默认不显示
                        , method: 'post'
                        , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                            return {
                                "code": 0, //解析接口状态
                                "msg": "", //解析提示文本
                                "count": res.result == null ? 0 : res.result.total, //解析数据长度
                                "data": res.result == null ? 0 : res.result //解析数据列表
                            };
                        }
                        , where: paramJson
                        , cols: [[
                            {type: 'checkbox', fixed: 'left', width: 40}
                            , {field: 'storeId', title: '门店id', fixed: 'left'}
                            , {field: 'name', title: ' 门店名称', fixed: 'left'}
                        ]]
                        , done: function () {

                        }
                    });
                });
            },
            end: function () {

            }
        });
    };

    //给显示或隐藏项目按钮添加事件
    $("#showOrHideProject").click(function () {
        $("#addProductDiv").slideToggle();
    });


    layui.use('table', function () {
        var table = layui.table;
        var $ = layui.$, active = {
            getCheckData: function () { //获取选中数据
                var checkStatus = table.checkStatus('allotExpTable')
                    , data = checkStatus.data;
                var storeId = [];
                $.each(data, function (n, value) {
                    storeId.push(value.storeId);
                });
                //修改商品的所属门店信息
                var url = storeHost + "/manage/experienceCard/updateExpCardById";
                var params = {
                    storeId: JSON.stringify(storeId),
                    cardId: $("#allotExpForm").attr("data-cardId"),
                    modifyOperator: "${currentUser.trueName!}"
                };
                $.post(url, params, function (res) {
                    if (res.responseStatusType.message == "Success") {
                        layer.open({
                            title: '分配'
                            , content: '分配成功！'
                            , btn: ["关闭"]
                            , yes: function (index) {
                                layer.close(index); //如果设定了yes回调，需进行手工关闭
                            }
                        });
                        //重新加载表格
                        layui.table.reload("experiencecardReload");
                    } else {
                        layer.open({
                            title: '分配'
                            , content: '分配失败！'
                            , btn: ["关闭"]
                        });
                    }
                })


            }
        };


        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
        return
    });


    layui.use('upload', function () {
        var $ = layui.jquery
            , upload = layui.upload;

        //普通图片上传--添加
        var uploadInst1 = upload.render({
            elem: '#test1'
            , url: storeHost + "/manage/experienceCard/uploadBeauticianImg"
            , auto: false
            , bindAction: '#startUpAdd'
            , choose: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#demo1').attr('src', result); //图片链接（base64）
                });
            }
            , done: function (res) {
                //如果上传失败
                if (res.code > 0) {
                    return layer.msg('上传失败');
                }
                //上传成功
                resultImgUrlAdd = "http://" + res.result.imageUrl
                console.log(resultImgUrlAdd)
                layer.msg('上传成功');
            }
            , error: function () {
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function () {
                    uploadInst1.upload();
                });
            }
        });


        //普通图片上传--修改
        var uploadInst2 = upload.render({
            elem: '#test1Edit'
            , url: storeHost + "/manage/beautician/uploadBeauticianImg"
            , auto: false
            , bindAction: '#startUpAddEdit'
            , choose: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#demoEdit').attr('src', result); //图片链接（base64）
                });
            }
            , done: function (res) {
                //如果上传失败
                if (res.code > 0) {
                    return layer.msg('上传失败');
                }
                //上传成功
                resultImgUrlEdit = "http://" + res.result.imageUrl
                layer.msg('上传成功');
            }
            , error: function () {
                //演示失败状态，并实现重传
                var demoText2 = $('#demoTextEdit');
                demoText2.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText2.find('.demo-reload').on('click', function () {
                    uploadInst2.upload();
                });
            }
        });
    });

    //加载行业信息-添加
    function loadAchievementIndustry(form) {
        var url = storeHost + "/manage/industry/selectListIndustryNoPage";
        var data = {};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("achievementIndustryID"); //server为select定义的id
                server.innerHTML = "<option value='' selected='selected'>请选择</option>";
                for (var p in list) {
                    var option = document.createElement("option");  // 创建添加option属性
                    option.setAttribute("value", list[p].industryID); // 给option的value添加值
                    option.innerText = list[p].industryName;     // 打印option对应的纯文本
                    server.appendChild(option);           //给select添加option子标签
                }
                form.render();
            } else {

            }
        })
    }

    //加载行业信息-修改
    function loadAchievementIndustryEdit(form) {
        var url = storeHost + "/manage/industry/selectListIndustryNoPage";
        var data = {};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("achievementIndustryIDEdit"); //server为select定义的id
                server.innerHTML = "<option value='' selected='selected'>请选择</option>";
                for (var p in list) {
                    var option = document.createElement("option");  // 创建添加option属性
                    option.setAttribute("value", list[p].industryID); // 给option的value添加值
                    option.innerText = list[p].industryName;     // 打印option对应的纯文本
                    server.appendChild(option);           //给select添加option子标签
                }
                form.render();
            } else {

            }
        })
    }


    //更新体验卡项目出库价
    function uploadExpCardProduct(cardId) {
        var url = storeHost + "/manage/experienceCard/updateAllExpCardProductOutStockPrice";
        var data = {"cardId":cardId};
        $.ajax({
            type: "POST",
            url: url,
            data: data,
            async: false,
            error: function (request) {
                layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
            },
            success: function (data) {
                if (data.responseStatusType.message == 'Failure') {
                }
                if (data.responseStatusType.message == 'Success') {
                }
            }
        });
    }

    layui.use('laydate', function(){
        var laydate = layui.laydate;
        //常规用法
        laydate.render({
            elem: '#purchaseDeadline'
        });

        //常规用法
        laydate.render({
            elem: '#purchaseDeadlineEdit'
        });
    });
</script>


</body>
</html>