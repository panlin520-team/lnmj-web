<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>业绩管理</title>
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
        .resetLabel {
            width: 104px;
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
            <#--                <label class="layui-form-label">请选择门店</label>
                            <div class="layui-input-inline">
                                <select name="stores" id="stores" lay-filter="stores">
                                </select>
                            </div>-->


            <label class="layui-form-label resetLabel">所属业绩分类</label>
            <div class="layui-input-inline" style="width:150px;">
                <select name="achievementIDSearch" id="achievementIDSearch" lay-filter="achievementIDSearch"
                        lay-verify="required">
                </select>
            </div>


            <div class="layui-inline">
                <button class="layui-btn" data-type="search"><i class="layui-icon layui-icon-search"></i></button>
            </div>
            <div class="layui-inline">
                <div class="layui-btn-group demoTable">
                    <button class="layui-btn" id="add">增加</button>
                </div>
            </div>
        </div>
    </div>
    <table id="achievementPostTable" lay-filter="demoPost"></table>
</div>


<#--业绩职位添加表单-->
<div id="addAchiPostForm" hidden="" class="layui-fluid" style="margin: 15px;">
    <form class="layui-form layui-form-pane layui-personal" action="" id="addeditformidPost" lay-filter="addAchPost">
        <div class="layui-form-item">
            <label class="layui-form-label xrequired">业绩名称</label>
            <div class="layui-input-block" style="width:360px;">
                <input type="text" name="achievementPostName" <#--lay-verify="required"--> autocomplete="off"
                       placeholder=""
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">所属行业</label>
            <div class="layui-input-inline">
                <input name="achievementIndustryIDAddShow" id="achievementIndustryIDAddShow" readonly="readonly"
                       type="text"
                       autocomplete="off" placeholder="请输入行业" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;"
                        <#-- lay-verify="required"-->>
                <input name="achievementIndustryID" id="achievementIndustryIDAdd" hidden="true" type="text">
                <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachAchievementIndustryIDAdd"><i
                            class="layui-icon layui-icon-search"></i></button>

            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label xrequired">所属业绩分类</label>
            <div class="layui-input-inline">
                <input name="achievementIDAddShow" id="achievementIDAddShow" readonly="readonly"
                       type="text"
                       autocomplete="off" placeholder="请输入业绩分类" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;"
                         lay-verify="required">
                <input name="achievementID" id="achievementIDAdd" hidden="true" type="text">
                <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachAchievementIDAdd"><i
                            class="layui-icon layui-icon-search"></i></button>

            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">职位分类</label>
            <div class="layui-input-inline">
                <input name="achievementPostCategoryIDAddShow" id="achievementPostCategoryIDAddShow" readonly="readonly"
                       type="text"
                       autocomplete="off" placeholder="请输入职位分类" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;"
                       <#--lay-verify="required"-->>
                <input name="achievementPostCategoryID" id="achievementPostCategoryIDAdd" hidden="true" type="text">
                <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachAchievementPostCategoryIDAdd"><i
                            class="layui-icon layui-icon-search"></i></button>

            </div>
        </div>





        <div class="layui-form-item">
            <label class="layui-form-label xrequired">统计方式</label>
            <div class="layui-input-block" style="width:150px;">
                <select name="achievementMethods" id="achievementMethods" lay-filter="achievementMethods"
                        lay-verify="required">
                </select>
            </div>
        </div>

        <div class="layui-form-item" style="display:none;" name="singlePrizediv">
            <label class="layui-form-label xrequired">单个奖金</label>
            <div class="layui-input-block" style="width:150px;">
                <input type="text" name="singlePrize" <#--lay-verify="required"--> autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item" style="display:none;" name="zhongyejiRatiodiv">
            <label class="layui-form-label xrequired">总业绩提成比例</label>
            <div class="layui-input-block" style="width:194px;display: flex;">
                <input type="text" name="zhongyejiRatio" <#--lay-verify="required"--> autocomplete="off" placeholder=""
                       class="layui-input">
                <span style="margin: 10px 0 0 5px;">（%）</span>
            </div>
        </div>
        <#--
                <div class="layui-form-item" style="display: flex; width: 400px;" name="achievementIntervaldiv">
                    <label class="layui-form-label" style="width: 157px;">储值业绩有效期(天)</label>
                    <div class="layui-input-block" style="width:100%; margin-left: 158px;">
                        <input type="text" name="achievementInterval" &lt;#&ndash;lay-verify="required"&ndash;&gt; autocomplete="off"
                               placeholder=""
                               class="layui-input" style="width: 131px">
                    </div>
                </div>-->




        <div class="layui-form-item">
            <label class="layui-form-label">所属门店</label>
            <div class="layui-input-inline">
                <input name="achievementStoreIdAddShow" id="achievementStoreIdAddShow" readonly="readonly"
                       type="text"
                       autocomplete="off" placeholder="请输入所属门店" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;"
                        <#--lay-verify="required"-->>
                <input name="achievementStoreId" id="achievementStoreIdAdd" hidden="true" type="text">
                <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachAchievementStoreIdAdd"><i
                            class="layui-icon layui-icon-search"></i></button>

            </div>
        </div>



        <div class="layui-form-item">
            <label class="layui-form-label xrequired">业绩统计方式</label>
            <div class="layui-input-block" style="width:150px;">
                <select name="achievementStore" id="achievementStore" lay-filter="achievementStore"
                        lay-verify="required">
                    <option value="0">个人业绩</option>
                    <option value="1">全店业绩</option>
                    <option value="2">分组业绩</option>
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label xrequired">员工类型</label>
            <div class="layui-input-block" style="width:150px;">
                <select name="isBasicSalary" id="isBasicSalaryAdd" lay-filter="isBasicSalary" lay-verify="required">
                    <option value="0">无底薪</option>
                    <option value="1" selected>有底薪</option>
                </select>
            </div>
        </div>


        <div class="layui-form-item" id="isPartTime" hidden="true">
            <label class="layui-form-label">是否兼职业绩</label>
            <div class="layui-input-block">
                <input type="radio" name="isPartTime" lay-filter="isPartTime" value="0" title="否" checked="">
                <input type="radio" name="isPartTime" lay-filter="isPartTime" value="1" title="是">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="addeditsubmitfilterPost">立即提交</button>
                <button id="resetPost" name="resetName" type="reset" class="layui-btn layui-btn-primary"
                        style="display:inline;">重置
                </button>
            </div>
        </div>
    </form>
</div>

<#--业绩职位修改表单-->
<div id="editAchiPostForm" hidden="" class="layui-fluid" style="margin: 15px;">
    <form class="layui-form layui-form-pane layui-personal" action="" id="editeditformidPost" lay-filter="editAchPost">
        <div class="layui-form-item" hidden="hidden">
            <label class="layui-form-label xrequired">id</label>
            <div class="layui-input-block" style="width:150px;">
                <input type="text" name="id" autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label xrequired">业绩名称</label>
            <div class="layui-input-block" style="width:360px;">
                <input type="text" name="achievementPostName" <#--lay-verify="required"--> autocomplete="off"
                       placeholder=""
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">所属行业</label>
            <div class="layui-input-inline">
                <input name="achievementIndustryIDEditShow" id="achievementIndustryIDEditShow" readonly="readonly"
                       type="text"
                       autocomplete="off" placeholder="请输入行业" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;"
                        <#-- lay-verify="required"-->>
                <input name="achievementIndustryID" id="achievementIndustryIDEdit" hidden="true" type="text">
                <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachAchievementIndustryIDEdit"><i
                            class="layui-icon layui-icon-search"></i></button>

            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label xrequired">所属业绩分类</label>
            <div class="layui-input-inline">
                <input name="achievementIDEditShow" id="achievementIDEditShow" readonly="readonly"
                       type="text"
                       autocomplete="off" placeholder="请输入业绩分类" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;"
                         lay-verify="required">
                <input name="achievementID" id="achievementIDEdit" hidden="true" type="text">
                <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachAchievementIDEdit"><i
                            class="layui-icon layui-icon-search"></i></button>

            </div>
        </div>



        <div class="layui-form-item">
            <label class="layui-form-label">职位分类</label>
            <div class="layui-input-inline">
                <input name="achievementPostCategoryIDEditShow" id="achievementPostCategoryIDEditShow" readonly="readonly"
                       type="text"
                       autocomplete="off" placeholder="请输入职位分类" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;"
                        <#--lay-verify="required"-->>
                <input name="achievementPostCategoryID" id="achievementPostCategoryIDEdit" hidden="true" type="text">
                <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachAchievementPostCategoryIDEdit"><i
                            class="layui-icon layui-icon-search"></i></button>

            </div>
        </div>



        <div class="layui-form-item">
            <label class="layui-form-label">所属门店</label>
            <div class="layui-input-inline">
                <input name="achievementStoreIdEditShow" id="achievementStoreIdEditShow" readonly="readonly"
                       type="text"
                       autocomplete="off" placeholder="请输入所属门店" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;"
                        <#--lay-verify="required"-->>
                <input name="achievementStoreId" id="achievementStoreIdEdit" hidden="true" type="text">
                <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachAchievementStoreIdEdit"><i
                            class="layui-icon layui-icon-search"></i></button>

            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label xrequired">统计方式</label>
            <div class="layui-input-block" style="width:150px;">
                <select name="achievementMethods" id="achievementMethodsEdit" lay-filter="achievementMethodsEdit"
                        lay-verify="required">
                </select>
            </div>
        </div>

        <div class="layui-form-item" style="display:none;" name="singlePrizediv">
            <label class="layui-form-label xrequired">单个奖金</label>
            <div class="layui-input-block" style="width:150px;">
                <input type="text" name="singlePrize" <#--lay-verify="required"--> autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item" style="display:none;" name="zhongyejiRatiodiv">
            <label class="layui-form-label xrequired">总业绩提成比例</label>
            <div class="layui-input-block" style="width:194px;display: flex;">
                <input type="text" name="zhongyejiRatio" <#--lay-verify="required"--> autocomplete="off" placeholder=""
                       class="layui-input">
                <span style="margin: 10px 0 0 5px;">（%）</span>
            </div>
        </div>

        <#--  <div class="layui-form-item">
              <label class="layui-form-label" style="width: 157px;">储值业绩有效期(天)</label>
              <div class="layui-input-block" style="width:150px;margin-left: 158px;">
                  <input type="text" name="achievementInterval" &lt;#&ndash;lay-verify="required"&ndash;&gt; autocomplete="off"
                         placeholder=""
                         class="layui-input" style="width: 132px">
              </div>
          </div>-->


        <div class="layui-form-item">
            <label class="layui-form-label xrequired">业绩统计方式</label>
            <div class="layui-input-block" style="width:150px;">
                <select name="achievementStore" id="achievementStore" lay-filter="achievementStore"
                        lay-verify="required">
                    <option value="0">个人业绩</option>
                    <option value="1">全店业绩</option>
                    <option value="2">分组业绩</option>
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label xrequired">员工类型</label>
            <div class="layui-input-block" style="width:150px;">
                <select name="isBasicSalary" id="isBasicSalaryEditEdit" lay-filter="isBasicSalaryEdit" lay-verify="required">
                    <option value="0">无底薪</option>
                    <option value="1">有底薪</option>
                </select>
            </div>
        </div>

        <div class="layui-form-item" id="isPartTimeEdit">
            <label class="layui-form-label">是否兼职业绩</label>
            <div class="layui-input-block">
                <input type="radio" name="isPartTime" lay-filter="isPartTimeEdit" value="0" title="否" checked="">
                <input type="radio" name="isPartTime" lay-filter="isPartTimeEdit" value="1" title="是">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="editeditsubmitfilterPost">修改提交</button>
            </div>
        </div>
    </form>
</div>
<#include "../../baseFtl/loadLinkData.ftl" />

<script type="text/html" id="barDemoPost">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="edit">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script>
    //列表显示
    var addForm = null;
    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#achievementPostTable'
            , url: dataHost + "/performance/selectPerformancePostList"
            , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , page: true          //显示分页默认不显示
            , method: 'post'
            , id: "listStoreAchievementPostTable"
            , request: {
                pageName: 'pageNum', //页码的参数名称，默认：page
                limitName: 'pageSize' //每页数据量的参数名，默认：limit
            }
            , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                return {
                    "code": 0, //解析接口状态
                    "msg": "", //解析提示文本
                    "count": res.result == null ? 0 : res.result.total, //解析数据长度
                    "data": res.result == null ? 0 : res.result.list //解析数据列表
                };
            }
            , where: {}
            , cols: [[
                {type: 'checkbox', fixed: 'left', width: 40}
                , {field: 'achievementPostName', title: '业绩名称'}
                , {field: 'achievementCategoryName', title: '业绩分类'}
                , {
                    field: 'achievementPostCategoryName', title: '职位分类', templet: function (d) {
                        var achievementPostCategoryName = ""
                        if (d.achievementPostCategoryName == null) {
                            achievementPostCategoryName = "所有职位";
                        } else {
                            achievementPostCategoryName = d.achievementPostCategoryName;
                        }

                        return achievementPostCategoryName;
                    }, sort: false
                }
                , {field: 'achievementMethodsName', title: '提成方式'}
                /* , {field: 'achievementInterval', title: '储值业绩有效期（天）'}*/
                , {field: 'achievementStoreName', title: '业绩统计方式'}
                , {
                    field: 'isBasicSalary', title: '是否计算底薪', templet: function (d) {
                        var isbasi = ""
                        if (d.isBasicSalary == 1) {
                            isbasi = "是";
                        } else {
                            isbasi = "否";
                        }

                        return isbasi;
                    }, sort: true
                }
                , {fixed: 'right', title: '操作', align: 'center', toolbar: '#barDemoPost'}

            ]]
        });

        //监听单元格编辑
        var table = layui.table;
    });

    //增删改查操作实现
    layui.use(['table', 'layer', 'jquery', 'form'], function () {
        var table = layui.table,
            layer = layui.layer,
            $ = layui.jquery,
            form = layui.form;


        loadAchievementMethods(form);
        loadIndustryPerformanceSearch(form)
        loadAchievementMethodsEdit(form);
       /* loadSubCompanyStore(form);*/


        /*------行业关联数据查看-添加------*/
        $("#" + "serachAchievementIndustryIDAdd").click(function () {
            var url = storeHost + "/manage/industry/selectList";
            var param = {};
            loadLinkData(layer, layui, url, "industryID", "industryName", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "achievementIndustryIDAddShow").val(data.industryName);
                $("#" + "achievementIndustryIDAdd").val(data.industryID);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {industryNameKeyword: wordSearch}
                layui.use('table', function () {
                    var table = layui.table;
                    table.reload('showLinDataTableRelod', {
                        page: {
                            curr: 1 //重新从第 1 页开始
                        }
                        , where: searchJsonName
                    }, 'data');
                });
            })
            //刷新
            $("#refreshLinkData").click(function () {
                $(".layui-laypage-btn").click();
            })
        });

        /*------行业关联数据查看-修改------*/
        $("#" + "serachAchievementIndustryIDEdit").click(function () {
            var url = storeHost + "/manage/industry/selectList";
            var param = {};
            loadLinkData(layer, layui, url, "industryID", "industryName", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "achievementIndustryIDEditShow").val(data.industryName);
                $("#" + "achievementIndustryIDEdit").val(data.industryID);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {industryNameKeyword: wordSearch}
                layui.use('table', function () {
                    var table = layui.table;
                    table.reload('showLinDataTableRelod', {
                        page: {
                            curr: 1 //重新从第 1 页开始
                        }
                        , where: searchJsonName
                    }, 'data');
                });
            })
            //刷新
            $("#refreshLinkData").click(function () {
                $(".layui-laypage-btn").click();
            })
        });

        /*------所属业绩分类关联数据查看-添加------*/
        $("#" + "serachAchievementIDAdd").click(function () {
            var url = dataHost + "/performance/selectPerformanceList";
            var industryIdAdd = $("input[id='achievementIndustryIDAdd']").val();
            if(industryIdAdd==""||industryIdAdd==null){
                layer.msg("请先选择所属行业")
                return
            }
            var param = {achievementIndustryID:industryIdAdd};
            loadLinkData(layer, layui, url, "achievementID", "achievementName", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "achievementIDAddShow").val(data.achievementName);
                $("#" + "achievementIDAdd").val(data.achievementID);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {keyWordAchievementName: wordSearch,achievementIndustryID:industryIdAdd}
                layui.use('table', function () {
                    var table = layui.table;
                    table.reload('showLinDataTableRelod', {
                        page: {
                            curr: 1 //重新从第 1 页开始
                        }
                        , where: searchJsonName
                    }, 'data');
                });
            })
            //刷新
            $("#refreshLinkData").click(function () {
                $(".layui-laypage-btn").click();
            })
        });

        /*------所属业绩分类关联数据查看-修改------*/
        $("#" + "serachAchievementIDEdit").click(function () {
            var url = dataHost + "/performance/selectPerformanceList";
            var industryIdAdd = $("input[id='achievementIndustryIDEdit']").val();
            if(industryIdAdd==""||industryIdAdd==null){
                layer.msg("请先选择所属行业")
                return
            }
            var param = {achievementIndustryID:industryIdAdd};
            loadLinkData(layer, layui, url, "achievementID", "achievementName", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "achievementIDEditShow").val(data.achievementName);
                $("#" + "achievementIDEdit").val(data.achievementID);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {keyWordAchievementName: wordSearch,achievementIndustryID:industryIdAdd}
                layui.use('table', function () {
                    var table = layui.table;
                    table.reload('showLinDataTableRelod', {
                        page: {
                            curr: 1 //重新从第 1 页开始
                        }
                        , where: searchJsonName
                    }, 'data');
                });
            })
            //刷新
            $("#refreshLinkData").click(function () {
                $(".layui-laypage-btn").click();
            })
        });


        /*------所属门店关联数据查看-添加------*/
        $("#" + "serachAchievementStoreIdAdd").click(function () {
            var url = storeHost + "/manage/store/selectStoreList";
            var industryIdAdd = $("input[id='achievementIndustryIDAdd']").val();
            if(industryIdAdd==""||industryIdAdd==null){
                layer.msg("请先选择所属行业")
                return
            }
            var param = {companyId:"${currentUser.companyId!}",companyType:"${currentUser.companyType!}",industryID:industryIdAdd};
            loadLinkData(layer, layui, url, "storeId", "name", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "achievementStoreIdAddShow").val(data.name);
                $("#" + "achievementStoreIdAdd").val(data.storeId);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {keyWordName: wordSearch,companyId:"${currentUser.companyId!}",companyType:"${currentUser.companyType!}",industryID:industryIdAdd}
                layui.use('table', function () {
                    var table = layui.table;
                    table.reload('showLinDataTableRelod', {
                        page: {
                            curr: 1 //重新从第 1 页开始
                        }
                        , where: searchJsonName
                    }, 'data');
                });
            })
            //刷新
            $("#refreshLinkData").click(function () {
                $(".layui-laypage-btn").click();
            })
        });

        /*------所属门店关联数据查看-修改------*/
        $("#" + "serachAchievementStoreIdEdit").click(function () {
            var url = storeHost + "/manage/store/selectStoreList";
            var industryIdAdd = $("input[id='achievementIndustryIDEdit']").val();
            if(industryIdAdd==""||industryIdAdd==null){
                layer.msg("请先选择所属行业")
                return
            }
            var param = {companyId:"${currentUser.companyId!}",companyType:"${currentUser.companyType!}",industryID:industryIdAdd};
            loadLinkData(layer, layui, url, "storeId", "name", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "achievementStoreIdEditShow").val(data.name);
                $("#" + "achievementStoreIdEdit").val(data.storeId);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {keyWordName: wordSearch,companyId:"${currentUser.companyId!}",companyType:"${currentUser.companyType!}",industryID:industryIdAdd};
                layui.use('table', function () {
                    var table = layui.table;
                    table.reload('showLinDataTableRelod', {
                        page: {
                            curr: 1 //重新从第 1 页开始
                        }
                        , where: searchJsonName
                    }, 'data');
                });
            })
            //刷新
            $("#refreshLinkData").click(function () {
                $(".layui-laypage-btn").click();
            })
        });


        /*------所属职位分类关联数据查看-添加------*/
        $("#" + "serachAchievementPostCategoryIDAdd").click(function () {
            var url = storeHost + "/manage/beautician/selectPostCategoryList";
            var industryIdAdd = $("input[id='achievementIndustryIDAdd']").val();
            if(industryIdAdd==""||industryIdAdd==null){
                layer.msg("请先选择所属行业")
                return
            }
            var param = {postIndustryIDSearch:industryIdAdd};
            loadLinkData(layer, layui, url, "postCategoryId", "name", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "achievementPostCategoryIDAddShow").val(data.name);
                $("#" + "achievementPostCategoryIDAdd").val(data.postCategoryId);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {postCategoryNameKeyword: wordSearch,postIndustryIDSearch:industryIdAdd}
                layui.use('table', function () {
                    var table = layui.table;
                    table.reload('showLinDataTableRelod', {
                        page: {
                            curr: 1 //重新从第 1 页开始
                        }
                        , where: searchJsonName
                    }, 'data');
                });
            })
            //刷新
            $("#refreshLinkData").click(function () {
                $(".layui-laypage-btn").click();
            })
        });

        /*------所属职位分类关联数据查看-修改------*/
        $("#" + "serachAchievementPostCategoryIDEdit").click(function () {
            var url = storeHost + "/manage/beautician/selectPostCategoryList";
            var industryIdAdd = $("input[id='achievementIndustryIDEdit']").val();
            if(industryIdAdd==""||industryIdAdd==null){
                layer.msg("请先选择所属行业")
                return
            }
            var param = {postIndustryIDSearch:industryIdAdd};
            loadLinkData(layer, layui, url, "postCategoryId", "name", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "achievementPostCategoryIDEditShow").val(data.name);
                $("#" + "achievementPostCategoryIDEdit").val(data.postCategoryId);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {postCategoryNameKeyword: wordSearch,postIndustryIDSearch:industryIdAdd}
                layui.use('table', function () {
                    var table = layui.table;
                    table.reload('showLinDataTableRelod', {
                        page: {
                            curr: 1 //重新从第 1 页开始
                        }
                        , where: searchJsonName
                    }, 'data');
                });
            })
            //刷新
            $("#refreshLinkData").click(function () {
                $(".layui-laypage-btn").click();
            })
        });


        form.on('select(isBasicSalary)', function(data){
            if(data.value==0){
                //不计算底薪的时候才显示是否为兼职业绩
                $("#isPartTime").attr("hidden",false);
            }else{
                $("#isPartTime").attr("hidden",true);
            }
        });


        form.on('select(isBasicSalaryEdit)', function(data){
            if(data.value==0){
                $("#isPartTimeEdit").attr("hidden",false);
            }else{
                $("#isPartTimeEdit").attr("hidden",true);
            }
        });



        //监听选择业绩提成方式
        form.on('select(achievementMethods)', function (data) {
            if (data.value === "1") {//单个提成
                $("div[name='singlePrizediv']").attr("style", "display:block;");
                $("div[name='zhongyejiRatiodiv']").attr("style", "display:none;");
                $("input[name='singlePrize']").attr("lay-verify", "required");
                $("input[name='zhongyejiRatio']").attr("lay-verify", "");
            } else if (data.value === "2") {//总业绩提成
                $("div[name='singlePrizediv']").attr("style", "display:none;");
                $("div[name='zhongyejiRatiodiv']").attr("style", "display:block;");
                $("input[name='singlePrize']").attr("lay-verify", "");
                $("input[name='zhongyejiRatio']").attr("lay-verify", "required");
            } else {
                $("div[name='singlePrizediv']").attr("style", "display:none;");
                $("div[name='zhongyejiRatiodiv']").attr("style", "display:none;");
                $("input[name='singlePrize']").attr("lay-verify", "");
                $("input[name='zhongyejiRatio']").attr("lay-verify", "");
            }

        });

        //监听选择业绩提成方式
        form.on('select(achievementMethodsEdit)', function (data) {
            if (data.value === "1") {//单个提成
                $("div[name='singlePrizediv']").attr("style", "display:block;");
                $("div[name='zhongyejiRatiodiv']").attr("style", "display:none;");
                $("input[name='singlePrize']").attr("lay-verify", "required");
                $("input[name='zhongyejiRatio']").attr("lay-verify", "");
            } else if (data.value === "2") {//总业绩提成
                $("div[name='singlePrizediv']").attr("style", "display:none;");
                $("div[name='zhongyejiRatiodiv']").attr("style", "display:block;");
                $("input[name='singlePrize']").attr("lay-verify", "");
                $("input[name='zhongyejiRatio']").attr("lay-verify", "required");
            } else {
                $("div[name='singlePrizediv']").attr("style", "display:none;");
                $("div[name='zhongyejiRatiodiv']").attr("style", "display:none;");
                $("input[name='singlePrize']").attr("lay-verify", "");
                $("input[name='zhongyejiRatio']").attr("lay-verify", "");
            }

        });

        //监听表格复选框选择
        table.on('checkbox(demo)', function (obj) {
        });


        //监听工具条
        table.on('tool(demoPost)', function (obj) {
            var data = obj.data;
            if (obj.event === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    layerPostDelete(data, table, $);
                    obj.del();
                    layer.close(index);
                });
            } else if (obj.event === "edit") {
                edit(data, table, $, form);
            }

        });


        //监听添加提交-业绩职位
        form.on('submit(addeditsubmitfilterPost)', function () {
            //为了防止form中的id值被重置后置空,将编辑的id存放在label中
            $("#editid").val($("#editlabelid").html());
            $("#editlabelid").html("");
            //添加业绩职位
            var ladderAchievementPostID = null
            $.ajax({
                type: "POST",
                url: dataHost + "/performance/insertPerformancePost",
                data: $('#addeditformidPost').serialize() + "&createOperator=" + "${currentUser.trueName!}",
                async: false,
                error: function (request) {
                    layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
                },
                success: function (data) {
                    if (data.responseStatusType.message == 'Success') {
                        ladderAchievementPostID = data.result


                        //同时添加阶梯
                        var ladderName = null
                        if ($("select[name='achievementMethods'] option:selected").val() === "1") {
                            ladderName = "总个数固定提成"
                        } else if ($("select[name='achievementMethods'] option:selected").val() === "2") {
                            ladderName = "总业绩固定提成"
                        }

                        var params = {
                            ladderAchievementPostID: ladderAchievementPostID,
                            ladderName: ladderName,
                            ladderLower: 0,
                            ladderProportion: $("input[name='zhongyejiRatio']").val(),
                            ladderBonus: $("input[name='singlePrize']").val(),
                            createOperator: "${currentUser.trueName!}"
                        };

                        if ($("select[name='achievementMethods'] option:selected").val() == 1 || $("select[name='achievementMethods'] option:selected").val() == 2) {
                            $.ajax({
                                type: "POST",
                                url: dataHost + "/performance/insertLadder",
                                data: params,
                                async: false,
                                error: function (request) {
                                    layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
                                },
                                success: function (data) {
                                    if (data.responseStatusType.message == 'Success') {
                                        layer.alert("业绩阶梯已生成成功");
                                    } else {
                                        layer.alert(data.responseStatusType.error.errorMsg);
                                    }
                                }
                            });
                        }

                        //重新加载表格
                        layer.msg("添加成功");
                        layer.close(addForm);
                        //重新加载表格
                        table.reload('listStoreAchievementPostTable', {
                            page: {
                                curr: 1 //重新从第 1 页开始
                            }
                        }, 'data');
                        $("#reset").click();//重置表单
                    } else {
                        layer.alert(data.responseStatusType.error.errorMsg);
                    }
                }
            });



            return false;
        });

        //监听修改提交-业绩职位
        form.on('submit(editeditsubmitfilterPost)', function () {

            $.ajax({
                type: "POST",
                url: dataHost + "/performance/updatePerformancePost",
                data: $('#editeditformidPost').serialize() + "&modifyOperator=" + "${currentUser.trueName!}" + "&achievementID=" + $("#addBranchAchievement").attr("data-ladderAchievementID"),
                async: false,
                error: function (request) {
                    layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
                },
                success: function (data) {
                    if (data.responseStatusType.message == 'Success') {
                        //重新加载表格
                        layer.msg("修改成功");
                        layer.close(addForm);
                        //重新加载表格
                        table.reload('listStoreAchievementPostTable', {
                            page: {
                                curr: 1 //重新从第 1 页开始
                            }
                        }, 'data');
                        $("#reset").click();//重置表单
                    } else {
                        layer.alert(data.responseStatusType.error.errorMsg);
                    }
                }
            });
            return false;
        });


        var $ = layui.$, active = {
            search: function () {
                var achievementID = $("select[name='achievementIDSearch'] option:selected").val();
                table.render({
                    elem: '#achievementPostTable'
                    , url: dataHost + "/performance/selectPerformancePostList"
                    , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    , page: true          //显示分页默认不显示
                    , method: 'post'
                    , id: "listStoreAchievementPostTable"
                    , request: {
                        pageName: 'pageNum', //页码的参数名称，默认：page
                        limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    }
                    , where: {
                        achievementID: achievementID
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
                        , {field: 'achievementPostName', title: '业绩名称'}
                        , {field: 'achievementCategoryName', title: '业绩分类'}
                        , {
                            field: 'achievementPostCategoryName', title: '职位分类', templet: function (d) {
                                var achievementPostCategoryName = ""
                                if (d.achievementPostCategoryName == null) {
                                    achievementPostCategoryName = "所有职位";
                                } else {
                                    achievementPostCategoryName = d.achievementPostCategoryName;
                                }

                                return achievementPostCategoryName;
                            }, sort: false
                        }
                        , {field: 'achievementMethodsName', title: '提成方式'}
                        /* , {field: 'achievementInterval', title: '储值业绩有效期（天）'}*/
                        , {field: 'achievementStoreName', title: '是否为个人业绩'}
                        , {
                            field: 'isBasicSalary', title: '是否计算底薪', templet: function (d) {
                                var isbasi = ""
                                if (d.isBasicSalary == 1) {
                                    isbasi = "是";
                                } else {
                                    isbasi = "否";
                                }

                                return isbasi;
                            }, sort: true
                        }
                        , {fixed: 'right', title: '操作', align: 'center', toolbar: '#barDemoPost'}

                    ]]
                });
            }
        };

        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });


    });


    //添加按钮点击事件
    $("#add").click(function () {
        $("#isPartTime").attr("hidden",true);
        $("#resetPost").click();//重置表单(新建时在进入表单前要重置一下表单的内容，不然表单打开后会显示上一次的表单的内容。这里调用表单中重置按钮的点击方法来重置)
        addForm = layer.open({//开启表单弹层
            area: '60%',
            type: 1,
            id: "addAchiPostFormReload",
            title: '新建业绩',
            content: $('#addAchiPostForm'), //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
            success: function () {

            }

        });
    });


    //删除业绩职务按钮事件
    function layerPostDelete(data, table, $) {
        //删除数据库数据
        var url = dataHost + "/performance/deletePerformancePostByID";
        var data = {
            "performanceId": data.achievementID,
            "performancePostId": data.id,
            "modifyOperator": "${currentUser.trueName!}"
        };
        $.post(url, data, function (res) {
            if (res.responseStatusType.message == "Success") {
                layer.open({
                    title: '删除'
                    , content: '删除成功！'
                });
                //重新加载表格
                table.reload("listStoreAchievementPostTable");
            } else {
                layer.open({
                    title: '删除'
                    , content: '删除失败！'
                });
            }
        })
    }

    //修改业绩职位
    function edit(data, table, $, form) {
        $("#isPartTimeEdit").attr("hidden",true);
        //页面弹框
        addForm = layer.open({
            type: 1,
            title: '编辑业绩职位',
            content: $('#editAchiPostForm'),
            closeBtn: 1,
            area: ['600px', '500px'],
            success: function (layero) {
                $("input[name='singlePrize']").attr("lay-verify", "");
                $("input[name='zhongyejiRatio']").attr("lay-verify", "");
                $("button[name='resetName']").attr("style", "display: none;");
                var param = {};
                if (data.achievementMethods === 1) {
                    $("div[name='singlePrizediv']").attr("style", "display:block;");
                    $("div[name='zhongyejiRatiodiv']").attr("style", "display:none;");
                    param = {
                        "id": data.id
                        , "achievementPostCategoryIDEditShow": data.achievementPostCategoryName
                        , "achievementPostCategoryID": data.achievementPostCategoryID


                        , "achievementMethods": data.achievementMethods
                        , "achievementInterval": data.achievementInterval
                        , "achievementStore": data.achievementStore


                        , "achievementStoreIdEditShow": data.achievementStoreIdName
                        , "achievementStoreId": data.achievementStoreId



                        , "isBasicSalary": data.isBasicSalary
                        , "singlePrize": data.ladderValue
                        , "achievementPostName": data.achievementPostName


                        , "achievementIDEditShow": data.achievementCategoryName
                        , "achievementID": data.achievementID
                    }
                } else if (data.achievementMethods === 2) {
                    $("div[name='singlePrizediv']").attr("style", "display:none;");
                    $("div[name='zhongyejiRatiodiv']").attr("style", "display:block;");
                    param = {
                        "id": data.id
                        , "achievementPostCategoryIDEditShow": data.achievementPostCategoryName
                        , "achievementPostCategoryID": data.achievementPostCategoryID

                        , "achievementMethods": data.achievementMethods
                        , "achievementInterval": data.achievementInterval
                        , "achievementStore": data.achievementStore

                        , "achievementStoreIdEditShow": data.achievementStoreIdName
                        , "achievementStoreId": data.achievementStoreId

                        , "isBasicSalary": data.isBasicSalary
                        , "zhongyejiRatio": data.ladderValue * 100
                        , "achievementPostName": data.achievementPostName

                        , "achievementIDEditShow": data.achievementCategoryName
                        , "achievementID": data.achievementID
                    }
                } else {
                    $("div[name='singlePrizediv']").attr("style", "display:none;");
                    $("div[name='zhongyejiRatiodiv']").attr("style", "display:none;");
                    param = {
                        "id": data.id
                        , "achievementPostCategoryIDEditShow": data.achievementPostCategoryName
                        , "achievementPostCategoryID": data.achievementPostCategoryID

                        , "achievementMethods": data.achievementMethods
                        , "achievementInterval": data.achievementInterval
                        , "achievementStore": data.achievementStore

                        , "achievementStoreIdEditShow": data.achievementStoreIdName
                        , "achievementStoreId": data.achievementStoreId

                        , "isBasicSalary": data.isBasicSalary
                        , "achievementPostName": data.achievementPostName


                        , "achievementIDEditShow": data.achievementCategoryName
                        , "achievementID": data.achievementID
                    }
                }

                if (data.isBasicSalary==0){
                    $("#isPartTimeEdit").attr("hidden",false);
                }
                form.val('editAchPost', param);
                form.render();
            }
        });
    }



    //加载行业下面的业绩分类-搜索
    function loadIndustryPerformanceSearch(form) {
        var url = storeHost + "/manage/industry/selectListIndustryNoPage";
        var data = {};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("achievementIDSearch"); //server为select定义的id
                server.innerHTML = "<option value='0' selected='selected'>直接选择或搜索选择</option>";
                for (var p in list) {
                    var optgroup = document.createElement("optgroup");  // 创建添加optgroup属性
                    optgroup.setAttribute("label", list[p].industryName); // 给optgroup的label添加值
                    optgroup.setAttribute("value", list[p].industryID); // 给optgroup的label添加值
                    var performanceVOList = list[p].performanceList;
                    for (var n in performanceVOList) {
                        var option = document.createElement("option");  // 创建添加option属性
                        option.setAttribute("value", performanceVOList[n].achievementID); // 给option的value添加值
                        option.innerText = performanceVOList[n].achievementName;     // 打印option对应的纯文本
                        optgroup.appendChild(option)
                    }
                    server.appendChild(optgroup);           //给select添加option子标签
                }
                form.render();
            } else {

            }
        })
    }

    //加载业绩提成方式
    function loadAchievementMethods(form) {
        var url = dataHost + "/performance/listAchievementMethods";
        var data = {};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("achievementMethods"); //server为select定义的id
                server.innerHTML = "<option value='' selected='selected'>请选择</option>";
                for (var p in list) {
                    var option = document.createElement("option");  // 创建添加option属性
                    option.setAttribute("value", p); // 给option的value添加值
                    option.innerText = list[p];     // 打印option对应的纯文本
                    server.appendChild(option);           //给select添加option子标签
                }
                form.render();
            } else {

            }
        })
    }

    //加载业绩提成方式
    function loadAchievementMethodsEdit(form) {
        var url = dataHost + "/performance/listAchievementMethods";
        var data = {};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("achievementMethodsEdit"); //server为select定义的id
                server.innerHTML = "<option value='' selected='selected'>请选择</option>";
                for (var p in list) {
                    var option = document.createElement("option");  // 创建添加option属性
                    option.setAttribute("value", p); // 给option的value添加值
                    option.innerText = list[p];     // 打印option对应的纯文本
                    server.appendChild(option);           //给select添加option子标签
                }
                form.render();
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

    //加载默认业绩有效期
    function loadDefault() {
        var url = systemHost + "/manage/system/selectParameterByWhere";
        var data = {parameterName: "业绩默认有效期"};
        var resultValue = null;
        $.ajax({
            url: url,
            type: "post",
            data: data,
            async: false,
            success: function (result) {
                if (result.responseStatusType.message == "Success") {
                    resultValue = result.result[0].parameterValue;    //返回的数据

                } else {
                }
            }
        });
        return resultValue
    }


</script>


</body>
</html>