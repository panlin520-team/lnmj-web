<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="cn">
<head>
    <meta charset="utf-8">
    <title>商品</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${basePath!}/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${basePath!}/css/index.css" media="all"/>
    <script src="${basePath!}/js/jquery.min.js" type="text/javascript"></script>
    <script src="${basePath!}/layui/layui.js" charset="utf-8"></script>
    <script src="${basePath!}/js/host.js" type="text/javascript"></script>
    <script type="text/javascript" src="${basePath!}/assets/city-picker.data.js"></script>
    <script type="text/javascript" src="${basePath!}/assets/province.js"></script>

    <#include "../../baseFtl/pageAuth.ftl" />

    <style>
        .resetLabel {
            width: 78px;
        }

        label.xrequired:before {
            content: '* ';
            color: red;
        }

    </style>
</head>
<body>

<#--添加商品时类型弹窗-->
<div id="productType" hidden="" class="layui-fluid layui-form-pane layui-personal" style="margin: 15px;">
    <form class="layui-form" action="" id="productType" lay-filter="productType">
        <div class="layui-form-item">
            <label class="layui-form-label">请选择商品类型</label>
            <div class="layui-input-block">
                <input type="radio" name="productType" value="1" title="产品" checked="" lay-filter="productType">
                <input type="radio" name="productType" value="2" title="服务" lay-filter="productType">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="productTypeConfir">确认</button>
            </div>
        </div>

    </form>
</div>

<#--导出Excel商品时类型弹窗-->
<div id="excelImportType" hidden="" class="layui-fluid layui-form-pane layui-personal" style="margin: 15px;">
    <form class="layui-form" action="" id="excelImportType" lay-filter="excelImportType">
        <div class="layui-form-item">
            <label class="layui-form-label">导出商品类型</label>
            <div class="layui-input-block">
                <input type="radio" name="excelImportType" value="1" title="产品" checked="" lay-filter="excelImportType">
                <input type="radio" name="excelImportType" value="2" title="服务" lay-filter="excelImportType">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="excelImportConfir">确认</button>
            </div>
        </div>

    </form>
</div>

<#--表格以及表格上门的按钮-->
<div class="layui-fluid">
    <div>
        <fieldset class="layui-elem-field layui-field-title layui-form" style="margin-top: 20px;">
            <legend>搜索</legend>
            <div class="layui-form-item">
                <div class="layui-inline">
                <#--商品种类-->
                    <select name="productType" id="productTypeSelect" lay-filter="productType">
                        <option value="1">产品</option>
                        <option value="2">服务</option>
                    </select>
                </div>

                <div class="layui-inline">
                <#--商品状态-->
                    <div class="layui-input-inline">
                        <select name="productStatus" id="productStatus" lay-filter="productStatus">
                            <option value="1">已上线</option>
                            <option value="2">已下线</option>
                        <#--<option value="0">已删除</option>-->
                        </select>
                    </div>

                    <div class="layui-inline">
                    <#--关键字文本框-->
                        <input type="text" autocomplete="off" class="layui-input" placeholder="请输入关键字查询"
                               id="keyWord">
                    </div>

                    <div class="layui-inline">
                    <#--搜索按钮-->
                        <button class="layui-btn" id="search"><i class="layui-icon layui-icon-search"></i></button>
                    </div>

                <#--添加商品-->
                    <div class="layui-inline">
                        <button class="layui-btn" id="addProduct">添加</button>
                    </div>

                <#--导出到Excel-->
                    <div class="layui-inline">
                    <#--<a class="layui-btn layui-btn-xstree" id="export">导出excel</a>-->
                        <button class="layui-btn" id="export">导出excel</button>
                    </div>

                <#--查看商品库-->
                <#--    <div class="layui-inline" style="display: none" id="showProductPoolButton">
                        <a class="layui-btn layui-btn-xstree" id="checkProductPool">查看总公司产品池</a>
                    </div>-->
                </div>
        </fieldset>
    </div>
<#--表格显示商品数据-->
    <table id="product" lay-filter="product"></table>


</div>

<#--查看总公司产品池表格-->
<form class="layui-form" id="productPoolForm" action="" lay-filter="exampleProductPool" method="post"
      hidden="true">
    <div class="demoTable layui-form">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label resetLabel" style="width: 98px">请选择商品类型</label>
                <div class="layui-input-inline">
                    <select name="productType" id="productTypeEnum" lay-filter="productTypeEnum">
                    </select>
                </div>
                <div class="layui-input-inline">
                    <a type="button" class="layui-btn" data-type="getCheckData" id="tiqu">提取选中商品</a>
                </div>
                <div class="layui-input-inline">
                    <input type="text" autocomplete="off" class="layui-input" placeholder="请输入关键字查询" id="word">
                </div>
                <div class="layui-inline">
                    <button class="layui-btn" data-type="search" type="button" id="searchword"><i
                            class="layui-icon layui-icon-search"></i></button>
                </div>
            </div>
        </div>
        <table id="productPoolTable" lay-filter="productPoolTable"></table>
    </div>
</form>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="allocation">批量分配</button>
        <button class="layui-btn layui-btn-sm" lay-event="cancelAllocation">批量取消分配</button>
    </div>
</script>
<script type="text/html" id="toolbarDemo2">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="allocation2" id="allocation2">批量分配</button>
        <button class="layui-btn layui-btn-sm" lay-event="cancelAllocation2" id="cancelAllocation2">批量取消分配
        </button>
    </div>
</script>
<#----------------------------商品表格里每条数据的操作---------------------------->
<script type="text/html" id="barDemo">
    {{# if (${currentUser.companyType!} == 1){ }}
    <button class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</button>
    <button class="layui-btn layui-btn-xs" lay-event="edit">编辑</button>
    <button class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</button>
    <button class="layui-btn layui-btn-xs down" id="down" lay-event="putDown">下架</button>
    {{# } else if(${currentUser.companyType!} == 2){ }}
    <button class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</button>
    <#-- <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>-->
    <button class="layui-btn layui-btn-xs down" id="down" lay-event="putDown">下架</button>
    {{# } }}  
</script>

<script type="text/html" id="barDemoDown">
    {{# if (${currentUser.companyType!} == 1){ }}
    <button class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</button>
    <button class="layui-btn layui-btn-xs" lay-event="edit">编辑</button>
    <button class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</button>
    <button type="button" class="layui-btn layui-btn-xs on" id="up" lay-event="putOn">上架</button>
    {{# } else if(${currentUser.companyType!} == 2){ }}
    <button class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</button>
    <#-- <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>-->
    <button type="button" class="layui-btn layui-btn-xs on" id="up" lay-event="putOn">上架</button>
    {{# } }}  
</script>

<#--商品表单-->
<form id="productForm" class="layui-form layui-form-pane layui-personal" action="" lay-filter="productForm"
      method="post"
      hidden="true">
    <div class="layui-form-item" id="productCode">
        <div class="layui-inline">
            <label class="layui-form-label">商品编码</label>
            <div class="layui-input-block">
                <input type="text" name="productCode" autocomplete="off" placeholder="请输入商品编码"
                       class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label xrequired">商品名称</label>
            <div class="layui-input-block">
                <input type="text" name="productName" lay-verify="required" autocomplete="off" placeholder="请输入商品名称"
                       class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商品所属</label>
        <div class="layui-block">
            <input type="radio" name="productSubordinate" value="0" title="自营" checked="" lay-filter="kucun">
            <input type="radio" name="productSubordinate" id="sanfang" value="1" lay-filter="kucun" title="第三方">
        </div>
    </div>
    <div class="layui-form-item" hidden="hidden" id="kucun">
        <label class="layui-form-label">商品库存</label>
        <div class="layui-input-inline">
            <input type="text" name="stockQuantity" autocomplete="off" placeholder="请输入库存" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label xrequired">所属行业</label>
        <div class="layui-input-inline">
            <input name="industryIdShow" id="industryIdAddShow" readonly="readonly" type="text"
                   autocomplete="off" placeholder="请输入行业" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;" lay-verify="required">
            <input name="industryId" id="industryIdAdd" hidden="true" type="text">
            <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachIndustryId"><i
                    class="layui-icon layui-icon-search"></i></button>

        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">所属大类</label>
        <div class="layui-input-inline">
            <input name="CommodityTypeIDAddShow" id="CommodityTypeIDAddShow" readonly="readonly" type="text"
                   autocomplete="off"
                   placeholder="请输入大类" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;">
            <input  name="CommodityTypeID" id="CommodityTypeIDAdd" hidden="true" type="text">
            <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachCommodityTypeID"><i
                    class="layui-icon layui-icon-search"></i></button>

        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">所属小类</label>
        <div class="layui-input-inline">
            <input name="subClassIDAddShow" id="subClassIDAddShow" readonly="readonly" type="text"
                   autocomplete="off"
                   placeholder="请输入大类" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;">
            <input name="subClassID" id="subClassIDAdd" hidden="true" type="text">
            <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachSubClassID"><i
                    class="layui-icon layui-icon-search"></i></button>

        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">所属业绩分类</label>
        <div class="layui-input-inline">
            <input name="achievementIdAddShow" id="achievementIdAddShow" readonly="readonly" type="text"
                   autocomplete="off"
                   placeholder="请输入业绩分类" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;">
            <input name="achievementId" id="achievementIdAdd" hidden="true" type="text">
            <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachAchievementId"><i
                    class="layui-icon layui-icon-search"></i></button>

        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">所属业绩</label>
        <div class="layui-input-inline">
            <input name="achievementPostIdAddShow" id="achievementPostIdAddShow" readonly="readonly" type="text" name="title"
                   lay-verify="title" autocomplete="off"
                   placeholder="请输入业绩" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;">
            <input name="achievementPostId" id="achievementPostIdAdd" hidden="true" type="text">
            <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachAchievementPostId"><i
                    class="layui-icon layui-icon-search"></i></button>

        </div>
    </div>

    <div class="layui-form-item" hidden="true">
        <label class="layui-form-label" style="padding-left: 7px;padding-right: 22px;">禁止购买</label>
        <div class="layui-input-block barredBuying">
        </div>
    </div>
    <div class="layui-form-item">
    <#--style="padding-left: 14px;height: 39px;width: 111px;padding-right: 9px;padding-bottom: 0px;"-->
        <label class="layui-form-label">禁止支付方式</label>
        <div class="layui-input-block barredPayMethod">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">选择地区</label>
        <div class="layui-input-block">
            <div class="layui-input-inline">
                <select name="provinceId" class="province" lay-filter="province">
                </select>
            </div>
            <div class="layui-input-inline">
                <select name="cityId" class="city" lay-filter="city">
                </select>
            </div>
            <div class="layui-input-inline">
                <select name="countyId" class="county" lay-filter="county">
                </select>
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">商品种类</label>
        <div class="layui-input-inline">
            <input name="productKindAddShow" id="productKindAddShow" disabled="disabled" type="text"
                   autocomplete="off"
                   placeholder="请输入种类" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;">
            <input name="productKind" id="productKindAdd" hidden="true" type="text">
            <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachProductKind"><i
                    class="layui-icon layui-icon-search"></i></button>

        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">商品功效</label>
        <div class="layui-input-inline">
            <input name="productEffectAddShow" id="productEffectAddShow" readonly="readonly" type="text"
                   autocomplete="off"
                   placeholder="请输入功效" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;">
            <input name="productEffect" id="productEffectAdd" hidden="true" type="text">
            <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachProductEffect"><i
                    class="layui-icon layui-icon-search"></i></button>

        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">商品品牌</label>
        <div class="layui-input-inline">
            <input name="productBrandAddShow" id="productBrandAddShow" readonly="readonly" type="text"
                   autocomplete="off"
                   placeholder="请输入品牌" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;">
            <input name="productBrand" id="productBrandAdd" hidden="true" type="text">
            <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachProductBrand"><i
                    class="layui-icon layui-icon-search"></i></button>

        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">商品品类</label>
        <div class="layui-input-inline">
            <input name="productCategoryAddShow" id="productCategoryAddShow" readonly="readonly" type="text"
                   autocomplete="off"
                   placeholder="请输入品类" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;">
            <input name="productCategory" id="productCategoryAdd" hidden="true" type="text">
            <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachProductCategory"><i
                    class="layui-icon layui-icon-search"></i></button>

        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">商品规格</label>
        <div class="layui-input-inline">
            <input type="text" name="productSpecification" lay-verify="pass" placeholder="请输入商品规格"
                   autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商品图片</label>
        <div class="layui-input-block">
            <button type="button" class="layui-btn" id="addproductImage">
                <i class="layui-icon">&#xe67c;</i>请选择图片
            </button>
            <button type="button" class="layui-btn up" id="startUpAdd">上传商品和活动图片</button>
            <div class="layui-upload-list" id="addImage">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商品活动图片</label>
        <div class="layui-input-block">
            <button type="button" class="layui-btn" id="addproductactivityImages">
                <i class="layui-icon">&#xe67c;</i>请选择图片
            </button>
            <div class="layui-upload-list" id="addImages">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired">商品原价</label>
        <div class="layui-input-inline">
            <input type="text" name="productOriginalPrice" lay-verify="required" placeholder="请输入商品原价"
                   autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired">零售价</label>
        <div class="layui-input-inline">
            <input type="text" name="retailPrice" placeholder="请输入零售价" autocomplete="off" lay-verify="required"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">活动零售价</label>
        <div class="layui-input-inline">
            <input type="text" name="activityRetailPrice" placeholder="请输入零售价" autocomplete="off"
                   class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">是否打折</label>
        <div class="layui-block">
            <input type="radio" name="isDiscount" value="0" title="是" checked="">
            <input type="radio" name="isDiscount" value="1" title="否">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">净含量</label>
        <div class="layui-input-inline">
            <input type="text" name="netContent" placeholder="请输入净含量" autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商品销量</label>
        <div class="layui-input-inline">
            <input type="text" name="productSales" placeholder="请输入商品销量" autocomplete="off"
                   class="layui-input">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label xrequired">单位</label>
        <div class="layui-input-inline">
            <input name="unitIdAddShow" id="unitIdAddShow" readonly="readonly" type="text"
                   autocomplete="off"
                   placeholder="请输入单位" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;" lay-verify="required">
            <input name="unitId" id="unitIdAdd" hidden="true" type="text">
            <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachUnitId"><i
                    class="layui-icon layui-icon-search"></i></button>

        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">入库价</label>
        <div class="layui-input-inline">
            <input type="text" name="instoragePrice" autocomplete="off" class="layui-input instoragePrice">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">出库价</label>
        <div class="layui-input-inline">
            <input type="text" name="outstoragePrice" autocomplete="off" class="layui-input outstoragePrice">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired">出库毛利润(%)</label>
        <div class="layui-input-inline"><#-- style="display:flex";width: 221px;-->
            <input type="text" id="outstorageProfit" name="outstorageProfit" autocomplete="off"
                   class="layui-input outstorageProfit"
                   lay-verify="required">
        </div>
        <div style="line-height: 38px">
            <span style="color: red;">毛利润格式(直接写百分数,系统自动加上了%)：例 30</span>
        </div>
    </div>
    <div class="layui-form-item createOperator">
        <label class="layui-form-label">创建人</label>
        <div class="layui-input-inline">
            <input type="text" autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item modifyOperator">
        <label class="layui-form-label">修改人</label>
        <div class="layui-input-inline">
            <input type="text" autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">更多内容</label>
        <div class="layui-input-block">
            <textarea name="moreContent" id="content" style="display: none;"></textarea>
        </div>
    </div>
    <div class="layui-form-item" hidden="hidden">
        <div class="layui-input-block">
            <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
            <button type="button" class="layui-btn layui-btn-normal" id="getValue">取值</button>
        </div>
    </div>
</form>
<#--服务表单-->
<form id="serviceForm" class="layui-form layui-form-pane layui-personal" action="" lay-filter="serviceForm"
      method="post" hidden="true">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label xrequired">服务商品名称</label>
            <div class="layui-input-block">
                <input type="text" name="productName" lay-verify="required" autocomplete="off"
                       placeholder="请输入商品名称" class="layui-input">
            </div>
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label xrequired">所属行业</label>
        <div class="layui-input-inline">
            <input name="industryIdServiceShow" id="industryIdAddServiceShow" readonly="readonly" type="text"
                   autocomplete="off" placeholder="请输入行业" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;" lay-verify="required">
            <input name="industryId" id="industryIdAddService" hidden="true" type="text">
            <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachIndustryIdService"><i
                    class="layui-icon layui-icon-search"></i></button>

        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">所属大类</label>
        <div class="layui-input-inline">
            <input name="CommodityTypeIDAddServiceShow" id="CommodityTypeIDAddServiceShow" readonly="readonly" type="text"
                   autocomplete="off" placeholder="请输入大类" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;">
            <input name="CommodityTypeID" id="CommodityTypeIDAddService" hidden="true" type="text">
            <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachCommodityTypeIDService"><i
                    class="layui-icon layui-icon-search"></i></button>

        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">所属小类</label>
        <div class="layui-input-inline">
            <input name="subClassIDAddServiceShow" id="subClassIDAddServiceShow" readonly="readonly" type="text"
                   autocomplete="off"
                   placeholder="请输入大类" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;">
            <input name="subClassID" id="subClassIDAddService" hidden="true" type="text">
            <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachSubClassIDService"><i
                    class="layui-icon layui-icon-search"></i></button>

        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">商品图片</label>
        <div class="layui-input-block">
            <button type="button" class="layui-btn" id="addserviceImage">
                <i class="layui-icon">&#xe67c;</i>请选择图片
            </button>
            <button type="button" class="layui-btn up" id="startUpAdd">上传商品和活动图片</button>
            <div class="layui-upload-list" id="addImage_service">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商品活动图片</label>
        <div class="layui-input-block">
            <button type="button" class="layui-btn" id="addserviceactivityImages">
                <i class="layui-icon">&#xe67c;</i>请选择图片
            </button>
            <div class="layui-upload-list" id="addImages_service">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired">商品原价</label>
        <div class="layui-input-inline">
            <input type="text" name="productOriginalPrice" lay-verify="number" placeholder="请输入商品原价"
                   autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired">零售价</label>
        <div class="layui-input-inline">
            <input type="text" name="retailPrice" placeholder="请输入零售价" autocomplete="off" lay-verify="number"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">活动零售价</label>
        <div class="layui-input-inline">
            <input type="text" name="activityRetailPrice" placeholder="请输入零售价" autocomplete="off"
                   class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">是否打折</label>
        <div class="layui-block">
            <input type="radio" name="isDiscount" value="0" title="是" checked="">
            <input type="radio" name="isDiscount" value="1" title="否">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商品销量</label>
        <div class="layui-input-inline">
            <input type="text" name="productSales" placeholder="请输入商品销量"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label xrequired">单位</label>
        <div class="layui-input-inline">
            <input name="unitIdAddServiceShow" id="unitIdAddServiceShow" readonly="readonly" type="text"
                   autocomplete="off"
                   placeholder="请输入单位" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;" lay-verify="required">
            <input name="unitId" id="unitIdAddService" hidden="true" type="text">
            <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachUnitIdService"><i
                    class="layui-icon layui-icon-search"></i></button>

        </div>
    </div>
<#--<div class="layui-form-item">-->
<#--<label class="layui-form-label">商品详情</label>-->
<#--<div class="layui-input-inline">-->
<#--<input type="text" name="productDetails" placeholder="请输入商品详情"-->
<#--autocomplete="off" class="layui-input">-->
<#--</div>-->
<#--</div>-->
    <div class="layui-form-item" hidden="true">
        <label class="layui-form-label">入库价</label>
        <div class="layui-input-inline">
            <input type="text" name="instoragePrice" id="instoragePrice_service" autocomplete="off"
                   class="layui-input instoragePrice">
        </div>
    </div>
    <div class="layui-form-item" hidden="true">
        <label class="layui-form-label">出库价</label>
        <div class="layui-input-inline">
            <input type="text" name="outstoragePrice" id="outstoragePrice_service" autocomplete="off"
                   class="layui-input outstoragePrice">
        </div>
    </div>
    <div class="layui-form-item" hidden="true">
        <label class="layui-form-label xrequired">出库毛利润(%)</label>
        <div class="layui-input-inline"><#--style="display: flex;width: 215px;"-->
            <input type="text" name="outstorageProfit" id="outstorageProfit_service" autocomplete="off"
                   class="layui-input outstorageProfit">
        <#--<span style="margin-top: 12px;margin-left: 5px;font-size: 18px">%</span>-->
        </div>
        <div style="line-height: 38px">
            <span style="color: red;">毛利润格式(直接写百分数,系统自动加上了%)：例 30</span>
        </div>
    </div>

    <div class="layui-form-item createOperator">
        <label class="layui-form-label">创建人</label>
        <div class="layui-input-inline">
            <input type="text" autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item modifyOperator">
        <label class="layui-form-label">修改人</label>
        <div class="layui-input-inline">
            <input type="text" autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">更多内容</label>
        <div class="layui-input-inline" style="width: 590px;">
        <#--<textarea name="moreContent" id="" placeholder="请输入内容" class="layui-textarea"></textarea>-->
            <textarea name="moreContent" id="content_s" style="display: none;"></textarea>
        </div>
    </div>
</form>

<#--物料分配中选择分配组织类型-->
<div id="chooseCompanyType" hidden="" class="layui-fluid layui-form-pane layui-personal" style="margin: 15px;">
    <form class="layui-form" action="" id="chooseCompanyTypeformid" lay-filter="exampleEdit">
        <div class="layui-form-item">
            <label class="layui-form-label">选择公司类型</label>
            <div class="layui-input-block">
                <input type="radio" name="companyType" value="1" title="子公司" checked="" lay-filter="userType"
                       id="zhi">
                <input type="radio" name="companyType" value="2" title="分公司" lay-filter="userType" id="fen">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="chooseCompanyTypeConfir">确认</button>
            </div>
        </div>

    </form>
</div>
<#--查看公司表格-->
<form class="layui-form" id="companyForm" action="" lay-filter="exampleCompany" method="post" hidden="true">
    <div class="demoTable layui-form">
        <div class="layui-form-item">
            <div class="layui-inline">
                <div class="layui-input-inline">
                    <input type="text" autocomplete="off" class="layui-input" placeholder="请输入关键字查询" id="word">
                </div>
                <div class="layui-inline">
                    <button class="layui-btn" data-type="search" type="button" id="searchwordcompany"><i
                            class="layui-icon layui-icon-search"></i></button>
                </div>
            </div>
        </div>
        <table id="companyTable" lay-filter="companyTable"></table>
    </div>
</form>
         <#include "../../baseFtl/loadLinkData.ftl" />


<#------------------------------定义的方法----------------------------------->
<script>

    //导出
    function exportAll(type) {
        var url = productHost + "/manage/product/exportProduct?type=" + type;
        var $eleForm = $("<form method='post'></form>");
        $eleForm.attr("action", url);
        $eleForm.attr("type", type);
        $(document.body).append($eleForm);
        //提交表单，实现下载
        $eleForm.submit();
    }

    //查看产品池表格
    function showProductPool(form, table, $) {
        loadProductType(form);
        //页面弹框
        var a2 = layer.open({
            type: 1,
            title: '产品池',
            content: $('#productPoolForm'),
            area: ['904px', '500px'],
            id: "productPoolReload",
            closeBtn: 1,
            btn: ['关闭'],
            btn2: function () {
                layer.close(a2)
            },
            success: function (layero) {
                layui.use('table', function () {
                    var table = layui.table;
                    table = $.extend(table, {config: {checkName: 'isChecked'}});
                    table.render({
                        elem: '#productPoolTable'
                        , url: productHost + "/manage/product/selectProductListNoPage"
                        , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
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
                                "count": res.result == null ? 0 : res.result.total, //解析数据长度
                                "data": res.result == null ? 0 : res.result //解析数据列表
                            };
                        }
                        , where: {
                            companyId: "${currentUser.companyId!}",
                            companyType: "${currentUser.companyType!}",
                            type: 1,
                            status: 1,
                            productStatus: 1
                        }
                        , cols: [[
                            {
                                type: 'checkbox', fixed: 'left', width: 40, templet: function () {
                                    $(".layui-unselect layui-form-checkbox");
                                }
                            }
                            , {field: 'productCode', title: '商品编号', fixed: 'left'}
                            , {field: 'industryName', title: '行业', fixed: 'left'}
                            , {field: 'productName', title: '商品名称', fixed: 'left'}
                        ]]
                        , done: function (res, curr, count) {
                            var nowData = res.data;
                            if (nowData != null) {
                                for (var i = 0; i < nowData.length; i++) {
                                    //判断渲染选中产品
                                    if (nowData[i].LAY_CHECKED == "true") {
                                        //找到对应数据改变勾选样式，呈现出选中效果
                                        // var index = res.data[i]['LAY_TABLE_INDEX'];
                                        $('.layui-table-fixed-l tr[data-index=' + i + '] input[type="checkbox"]').prop('checked', true);
                                        $('.layui-table-fixed-l tr[data-index=' + i + '] input[type="checkbox"]').next().addClass('layui-form-checked');
                                    }
                                }
                            }
                        }
                    });
                })
            }
        });
    }

    //添加产品
    function addProduct(layer, form, upload, table, productType, layedit, ptool) {
        var nowED;
        var a1 = layer.open({
            type: 1
            , content: $('#productForm')
            , title: '添加产品'
            , area: ['auto', '500px']
            , btn: ['提交', '取消']
            , success: function (layero) {
                $("#productKindAdd").val(0);
                $("#productEffectAdd").val(0);
                $("#productBrandAdd").val(0);
                $("#productCategoryAdd").val(0);
                nowED = layedit.build('content', ptool);
                /*--------------------校验方法添加（追加class，filter属性）-------------*/
                layero.addClass('layui-form');
                layero.find('.layui-layer-btn0').attr('lay-filter', 'formVerify').attr('lay-submit', '');
                form.render();
                //省市级赋值
                var data = {"provinceId": "110000", "cityId": "110100", "countyId": "110101"}//默认北京
                query(form, data);
                /*监听省select*/
                form.on('select(province)', function (data) {
                    cityChange(form, data.value, "", "")
                });
                /*监听市select*/
                form.on('select(city)', function (data) {
                    countyChange(form, data.value, "");
                });

                //每次打开弹窗清空入库出库出库利润的值
                inprice = $(".instoragePrice").val("");
                outprice = $(".outstoragePrice").val("");
                maolirun = $("#outstorageProfit").val("");
                inprice_s = $("#instoragePrice_service").val("");
                outprice_s = $("#outstoragePrice_service").val("");
                maolirun_service = $("#outstorageProfit_service").val("");
                price = 0;

                inprice = $(".instoragePrice").val("");
                outprice = $(".outstoragePrice").val("");
                maolirun = $("#outstorageProfit").val("");
                inprice_s = $("#instoragePrice_service").val("");
                outprice_s = $("#outstoragePrice_service").val("");
                maolirun_service = $("#outstorageProfit_service").val("");
            }
            , yes: function (index, layero) {
                //获取富文本的内容
                var moreContent = layedit.getContent(nowED);
                $("#content").val(moreContent);
                // var html;
                // $("input[name='moreContent']").val(html);
                // var param = $("#productForm").serializeObject();
            <#--var param = $('#productForm').serialize()+"&imageList="+imageIdMap.image+"&activityImageList="+imageIdMap.actimage+"&createOperator=" + "${currentUser.trueName!}";-->
                //因为原表单存在创建者字段 所以提交的时候就从缓存中获取然后赋给这个input 不然会多一个逗号
                form.on('submit(formVerify)', function (data) {
                    var url = productHost + "/manage/product/insertProduct";
                    //点击提交后显示加载层
                    var loadindex = layer.load(2); //数字代表风格
                    var param;
                    if (productFiles.length > 0 && activityProductFiles.length > 0) {
                        layer.msg("请先上传图片！");
                        return false;
                    } else if (typeof imageIdMap != 'undefined') {
                        // param = $('#productForm').serialize() + "&imageList=" + imageIdMap.image + "&activityImageList=" + imageIdMap.actimage;
                        param = $('#productForm').serialize() + "&imageList=" + imageIdMap.image + "&activityImageList=" + imageIdMap.actimage + "&createOperator=" + "${currentUser.trueName!}" + "&companyType=" + "${currentUser.companyType!}" + "&companyId=" + "${currentUser.companyId!}";
                    } else {
                        param = $('#productForm').serialize() + "&createOperator=" + "${currentUser.trueName!}" + "&companyType=" + "${currentUser.companyType!}" + "&companyId=" + "${currentUser.companyId!}";
                    }
                    $.post(url, param, function (res) {
                        if (res.responseStatusType.message == "Success") {
                            layer.msg(res.result);
                            layer.close(index);
                            //提交成功后关闭加载层
                            layer.close(loadindex);
                            //重新加载表格
                            table.reload('productReload', {
                                page: {
                                    curr: 1 //重新从第 1 页开始
                                }
                                , where: {
                                    type: 1,
                                    status: 1
                                }
                            }, 'data');
                        } else {
                            layer.msg(res.responseStatusType.error.errorMsg, {
                                time: 20000, //20s后自动关闭
                                btn: ['明白了']
                            });
                        }
                    });
                    return false;
                });
            }
            , end: function () {
                $("input[name='barredBuying']").each(function () {
                    $(this).prop('checked', false)
                });
                $("input[name='barredPayMethod']").each(function () {
                    $(this).prop('checked', false)
                });
            }
        });
    }

    //添加服务
    function addService(layer, form, upload, table, productType, layedit, ptool) {
        var nowED;
        layer.open({
            type: 1
            , content: $('#serviceForm')
            , title: '添加服务'
            , area: ['760px', '500px']
            , btn: ['提交', '取消']
            , success: function (layero) {
                nowED = layedit.build('content_s', ptool);
                // 校验方法添加（追加class，filter属性）
                // layedit.build('content_s',ptool)
                layedit.getContent(nowED);
                layero.addClass('layui-form');
                layero.find('.layui-layer-btn0').attr('lay-filter', 'formVerify').attr('lay-submit', '');
                form.render();
                //省市级赋值
                var data = {"provinceId": "110000", "cityId": "110100", "countyId": "110101"}//默认北京
                query(form, data);
                /*监听省select*/
                form.on('select(province)', function (data) {
                    cityChange(form, data.value, "", "")
                });
                /*监听市select*/
                form.on('select(city)', function (data) {
                    countyChange(form, data.value, "")
                });

                //每次打开弹窗清空入库出库出库利润的值
                inprice = $(".instoragePrice").val("");
                outprice = $(".outstoragePrice").val("");
                maolirun = $("#outstorageProfit").val("");
                inprice_s = $("#instoragePrice_service").val("");
                outprice_s = $("#outstoragePrice_service").val("");
                maolirun_service = $("#outstorageProfit_service").val("");
                price = 0;

                inprice = $(".instoragePrice").val("");
                outprice = $(".outstoragePrice").val("");
                maolirun = $("#outstorageProfit").val("");
                inprice_s = $("#instoragePrice_service").val("");
                outprice_s = $("#outstoragePrice_service").val("");
                maolirun_service = $("#outstorageProfit_service").val("");
            }
            , yes: function (index, layero) {
                var moreContent = layedit.getContent(nowED);
                $("#content_s").val(moreContent);
                var param;
                if (productFiles.length > 0 && activityProductFiles.length > 0) {
                    layer.msg("请先上传图片！");
                    return false;
                } else if (typeof imageIdMap != 'undefined') {
                    // param = $('#productForm').serialize() + "&imageList=" + imageIdMap.image + "&activityImageList=" + imageIdMap.actimage;
                    param = $('#serviceForm').serialize() + "&imageList=" + imageIdMap.image + "&activityImageList=" + imageIdMap.actimage + "&createOperator=" + "${currentUser.trueName!}" + "&companyType=" + "${currentUser.companyType!}" + "&companyId=" + "${currentUser.companyId!}";
                } else {
                    param = $('#serviceForm').serialize() + "&createOperator=" + "${currentUser.trueName!}" + "&companyType=" + "${currentUser.companyType!}" + "&companyId=" + "${currentUser.companyId!}";
                }

                form.on('submit(formVerify)', function (data) {
                    var url = productHost + "/manage/product/insertServiceProduct";
                    //点击提交后显示加载层
                    var loadindex = layer.load(2); //数字代表风格
                    $.post(url, param, function (res) {
                        if (res.responseStatusType.message == "Success") {
                            layer.msg(res.result);
                            layer.close(index);
                            //提交成功后关闭加载层
                            layer.close(loadindex);
                            //重新加载表格
                            table.reload('productReload', {
                                page: {
                                    curr: 1 //重新从第 1 页开始
                                }
                                , where: {
                                    type: 2,
                                    status: 1
                                }
                            }, 'data');
                        } else {
                            layer.msg(res.responseStatusType.error.errorMsg, {
                                time: 20000, //20s后自动关闭
                                btn: ['明白了']
                            });
                        }
                    })
                    return false;
                })

            }
            , end: function () {
                $("input[name='barredBuying']").each(function () {
                    $(this).prop('checked', false)
                });
                $("input[name='barredPayMethod']").each(function () {
                    $(this).prop('checked', false)
                });
                layui.form.render();
            }
        });
    }



    //加载禁止购买的会员等级
    function loadMemberList() {
        // $("#detailForm")[0].reset();
        var url = accountHost + "/manage/member/selectAllNormalMemberListNoPage";
        $.post(url, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result.list;    //返回的数据
                for (var p in list) {
                    var input = "<input type='checkbox' name='barredBuying' value='" + list[p].membershipLevelId + "'  title='" + list[p].membershipLevelName + "'>";
                    $(".barredBuying").append(input);
                }
                layui.form.render();
            }
        })
    }

    //加载禁止支付的支付方式
    function loadPayMethodList(subClassId, industry) {
        var param;
        var url = payHost + "/manage/payment/selectPayTypeListBySubClass";
        if (typeof (subClassId) == 'undefined') {
            param = {
                subclass: null,
                industry: null
            };
        } else {
            param = {
                subclass: subClassId,
                industry: industry
            };
        }
        $.post(url, param, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                // if (list.length == 0) {
                //     $(".barredPayMethod").empty();
                //     var input = "<input disabled='' type='checkbox' name='barredPayMethod' title='该小类没有对应支付类型'>";
                //     $(".barredPayMethod").append(input);
                // } else {
                $(".barredPayMethod").empty();
                for (var p in list) {
                    var input = "<input type='checkbox' name='barredPayMethod' value='" + list[p].payTypeId + "' title='" + list[p].payTypeName + "'>";
                    $(".barredPayMethod").append(input);
                }
                layui.form.render();
            }
        })
    }


    //加载总公司
    function loadConpany() {
        var url = storeHost + "/manage/company/selectCompanyList";
        $.post(url, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result.list;    //返回的数据
                $("select[name='companyId']").append("<option value='0' checked>请选择</option>");
                for (var p in list) {
                    var input = "<option value='" + list[p].companyId + "'>" + list[p].companyName + "</option>";
                    $("select[name='companyId']").append(input);
                }
                layui.form.render();
            }
        })
    }

    //加载子公司
    function loadSubsidiary() {
        var url = storeHost + "/manage/company/selectSubsidiaryList";
        var param = {"companyId": "${currentUser.companyId!}"}
        $.post(url, param, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result.list;    //返回的数据
                $("select[name='subsidiaryId']").append("<option value='0' checked>请选择</option>");
                for (var p in list) {
                    var input = "<option value='" + list[p].subsidiaryId + "'>" + list[p].subsidiaryName + "</option>";
                    $("select[name='subsidiaryId']").append(input);
                    var subsidiaryinput = "<input type='checkbox' name='subsidiary' value='" + list[p].subsidiaryId + "' title='" + list[p].subsidiaryName + "'>";
                    $(".subsidiarys").append(subsidiaryinput);
                }
                layui.form.render();
            }
        })
    }

    function prodcutInfo(form, data, name, opera, formName, table, productType, layedit, typename, ptool) {
        var productCode = data.productCode;
        //打开商品弹窗
        if (opera == "detail") {
            if (typename == "product") {
                var a = layer.open({
                    type: 1,
                    title: '商品详情',
                    content: $(name),
                    area: ['auto', '650px'],
                    closeBtn: 1,
                    btn: ['取消'],
                    btn1: function () {
                        layer.close(a);
                    },
                    success: function (layero) {
                        var index = layedit.build('content', ptool);
                        //富文本赋值
                        layedit.setContent(index, data.moreContent);
                        // var now = layedit.build('content',ptool);
                        // layedit.setContent(now,data.moreContent);
                        //省市级赋值
                        query(form, data);
                        //监听省select
                        form.on('select(province)', function (data) {
                            cityChange(form, data.value, "", "")
                        });
                        //监听市select
                        form.on('select(city)', function (data) {
                            countyChange(form, data.value, "")
                        });
                        form.val(formName, {
                            "productName": data.productName,
                            "productName": data.productName,
                            "stockQuantity": data.stockQuantity,
                            "productCode": data.productCode,
                            "isDiscount": data.isDiscount,

                            "industryIdShow": data.productIndustryName,
                            "industryId": data.industryId,

                            "CommodityTypeIDAddShow": data.productCommoditytypeName,
                            "CommodityTypeID": data.commodityTypeID,

                            "subClassIDAddShow": data.productSubclassName,
                            "subClassID": data.subClassID,

                            "achievementPostIdAddShow": data.productPerformancePostName,
                            "achievementPostId": data.achievementPostId,

                            "productKindAddShow": data.productKindName,
                            "productKind": data.productKind,

                            "productEffectAddShow": data.productEffectName,
                            "productEffect": data.productEffect,

                            "productBrandAddShow": data.productBrandName,
                            "productBrand": data.productBrand,

                            "productCategoryAddShow": data.productCategoryName,
                            "productCategory": data.productCategory,

                            "productSpecification": data.productSpecification,
                            "productOriginalPrice": data.productOriginalPrice,
                            "retailPrice": data.retailPrice,
                            "activityRetailPrice": data.activityRetailPrice,
                            "stockDiscount": data.stockDiscount,
                            "netContent": data.netContent,
                            "productSales": data.productSales,
                            "productDetails": data.productDetails,
                            // "moreContent": data.moreContent,
                            "instoragePrice": data.instoragePrice,
                            "outstoragePrice": data.outstoragePrice,
                            "outstorageProfit": data.outstorageProfit,

                            "unitIdAddShow": data.productUnitName,
                            "unitId": data.unitId,

                            "companyId": data.companyId
                        });

                        //如果是第三方产品显示第三方库存
                        if (data.productSubordinate == "1") {
                            $("#kucun").removeAttr("hidden");
                        }

                        if (data.createOperator != "" && data.createOperator != null) {
                            //给创建者修改中赋值
                            $(".createOperator").find("input").val(data.createOperator);
                            $(".modifyOperator").find("input").val(data.modifyOperator);
                        }

                        if (data.barredBuying != "" && data.barredBuying != null) {
                            /*处理显示禁止购买复选框*/
                            loadCheckBox(data.barredBuying, "barredBuying");
                        }

                        if (data.barredPayMethod != "" && data.barredPayMethod != null) {
                            /*处理显示禁止支付方式复选框*/
                            loadCheckBox(data.barredPayMethod, "barredPayMethod");
                        }

                        if (data.subsidiaryId != "" && data.subsidiaryId != null) {
                            /*处理显示选中的子公司复选框*/
                            loadCheckBox(data.subsidiaryId, "subsidiary");
                        }

                        if (data.productSubordinate != "" && data.productSubordinate != null) {
                            /*处理商品所属*/
                            loadCheckBox(data.productSubordinate, "productSubordinate")
                        }
                    },
                    end: function () {
                        $("input[name='barredBuying']").each(function () {
                            $(this).prop('checked', false)
                        });
                        $("input[name='barredPayMethod']").each(function () {
                            $(this).prop('checked', false)
                        });
                        layui.form.render();
                    }
                });
            } else {
                var a = layer.open({
                    type: 1,
                    title: '商品详情',
                    content: $(name),
                    area: ['auto', '650px'],
                    closeBtn: 1,
                    btn: ['取消'],
                    btn1: function () {
                        layer.close(a);
                    },
                    success: function (layero) {
                        var index = layedit.build("content_s", ptool);
                        //富文本赋值
                        layedit.setContent(index, data.moreContent);
                        //省市级赋值
                        query(form, data);
                        //监听省select
                        form.on('select(province)', function (data) {
                            cityChange(form, data.value, "", "")
                        });
                        //监听市select
                        form.on('select(city)', function (data) {
                            countyChange(form, data.value, "")
                        });
                        form.val(formName, {
                            "productName": data.productName,
                            "productCode": data.productCode,
                            "bonus": data.bonus,
                            "isDiscount": data.isDiscount,

                            "industryIdServiceShow": data.productIndustryName,
                            "industryId": data.industryId,

                            "CommodityTypeIDAddServiceShow": data.productCommoditytypeName,
                            "CommodityTypeID": data.commodityTypeID,

                            "subClassIDAddServiceShow": data.productSubclassName,
                            "subClassID": data.subClassID,

                            "productKindAddServiceShow": data.productKindName,
                            "productKind": data.productKind,

                            "productEffectAddServiceShow": data.productEffectName,
                            "productEffect": data.productEffect,

                            "productBrandAddServiceShow": data.productBrandName,
                            "productBrand": data.productBrand,

                            "productCategoryAddServiceShow": data.productCategoryName,
                            "productCategory": data.productCategory,


                            "productSpecification": data.productSpecification,
                            "productOriginalPrice": data.productOriginalPrice,
                            "retailPrice": data.retailPrice,
                            "activityRetailPrice": data.activityRetailPrice,
                            "stockDiscount": data.stockDiscount,
                            "netContent": data.netContent,
                            "productSales": data.productSales,
                            "productDetails": data.productDetails,
                            // "moreContent": data.moreContent,
                            "instoragePrice": data.instoragePrice,
                            "outstoragePrice": data.outstoragePrice,
                            "outstorageProfit": data.outstorageProfit,
                            "unitIdAddServiceShow": data.productUnitName,
                            "unitId": data.unitId,
                            "companyId": data.companyId
                        });

                        if (data.createOperator != "" && data.createOperator != null) {
                            //给创建者修改中赋值
                            $(".createOperator").find("input").val(data.createOperator);
                            $(".modifyOperator").find("input").val(data.modifyOperator);
                        }

                        if (data.barredBuying != "" && data.barredBuying != null) {
                            /*处理显示禁止购买复选框*/
                            loadCheckBox(data.barredBuying, "barredBuying");
                        }

                        if (data.barredPayMethod != "" && data.barredPayMethod != null) {
                            /*处理显示禁止支付方式复选框*/
                            loadCheckBox(data.barredPayMethod, "barredPayMethod");
                        }

                        if (data.subsidiaryId != "" && data.subsidiaryId != null) {
                            /*处理显示选中的子公司复选框*/
                            loadCheckBox(data.subsidiaryId, "subsidiary");
                        }

                        if (data.productSubordinate != "" && data.productSubordinate != null) {
                            /*处理商品所属*/
                            loadCheckBox(data.productSubordinate, "productSubordinate")
                        }
                    },
                    end: function () {
                        $("input[name='barredBuying']").each(function () {
                            $(this).prop('checked', false)
                        });
                        $("input[name='barredPayMethod']").each(function () {
                            $(this).prop('checked', false)
                        });
                        layui.form.render();
                    }
                });
            }
        } else if (opera == "edit") {
            var nowED;
            if (typename == "product") {
                var a = layer.open({
                    type: 1,
                    title: '商品编辑',
                    content: $(name),
                    area: ['auto', '650px'],
                    closeBtn: 1,
                    btn: ['提交', '取消'],
                    btn1: function () {
                        layer.close(a);
                    },
                    success: function (layero) {
                        $("#productKindAdd").val(0);
                        $("#productEffectAdd").val(0);
                        $("#productBrandAdd").val(0);
                        $("#productCategoryAdd").val(0);
                        var index = layedit.build("content", ptool);
                        nowED = index;
                        //富文本赋值
                        layedit.setContent(index, data.moreContent);
                        $("input[name='productCode']").attr("disabled", "disabled")
                        /*--------------------校验方法添加（追加class，filter属性）-------------*/
                        layero.addClass('layui-form');
                        layero.find('.layui-layer-btn0').attr('lay-filter', 'formVerify').attr('lay-submit', '');
                        form.render();

                        //如果是第三方产品显示第三方库存
                        if (data.productSubordinate == "1") {
                            $("#kucun").removeAttr("hidden");
                        }
                        //省市级赋值
                        query(form, data);
                        //监听省select
                        form.on('select(province)', function (data) {
                            cityChange(form, data.value, "", "")
                        });
                        //监听市select
                        form.on('select(city)', function (data) {
                            countyChange(form, data.value, "")
                        });
                        form.val(formName, {
                            "productName": data.productName,
                            "productName": data.productName,
                            "stockQuantity": data.stockQuantity,
                            "productCode": data.productCode,
                            "isDiscount": data.isDiscount,

                            "industryIdShow": data.productIndustryName,
                            "industryId": data.industryId,

                            "CommodityTypeIDAddShow": data.productCommoditytypeName,
                            "CommodityTypeID": data.commodityTypeID,

                            "subClassIDAddShow": data.productSubclassName,
                            "subClassID": data.subClassID,

                            "achievementPostIdAddShow": data.productPerformancePostName,
                            "achievementPostId": data.achievementPostId,

                            "productKindAddShow": data.productKindName,
                            "productKind": data.productKind,

                            "productEffectAddShow": data.productEffectName,
                            "productEffect": data.productEffect,

                            "productBrandAddShow": data.productBrandName,
                            "productBrand": data.productBrand,

                            "productCategoryAddShow": data.productCategoryName,
                            "productCategory": data.productCategory,

                            "productSpecification": data.productSpecification,
                            "productOriginalPrice": data.productOriginalPrice,
                            "retailPrice": data.retailPrice,
                            "activityRetailPrice": data.activityRetailPrice,
                            "stockDiscount": data.stockDiscount,
                            "netContent": data.netContent,
                            "productSales": data.productSales,
                            "productDetails": data.productDetails,
                            // "moreContent": data.moreContent,
                            "instoragePrice": data.instoragePrice,
                            "outstoragePrice": data.outstoragePrice,
                            "outstorageProfit": data.outstorageProfit,

                            "unitIdAddShow": data.productUnitName,
                            "unitId": data.unitId,

                            "companyId": data.companyId,
                            "createOperator": data.createOperator,
                            "modifyOperator": data.modifyOperator
                        });

                        if (data.barredBuying != "" && data.barredBuying != null) {
                            /*处理显示禁止购买复选框*/
                            loadCheckBox(data.barredBuying, "barredBuying");
                        }

                        if (data.barredPayMethod != "" && data.barredPayMethod != null) {
                            /*处理显示禁止支付方式复选框*/
                            loadCheckBox(data.barredPayMethod, "barredPayMethod");
                        }

                        if (data.subsidiaryId != "" && data.subsidiaryId != null) {
                            /*处理显示选中的子公司复选框*/
                            loadCheckBox(data.subsidiaryId, "subsidiary");
                        }

                        if (data.productSubordinate != "" && data.productSubordinate != null) {
                            /*处理商品所属*/
                            loadCheckBox(data.productSubordinate, "productSubordinate")
                        }
                    },
                    yes: function (index, layero) {
                        //获取富文本的内容
                        var moreContent = layedit.getContent(nowED);
                        $("#content").val(moreContent);
                        var loadindex = layer.load(2);
                        var url;
                        if (name == "#productForm") {
                            url = productHost + "/manage/product/updateProduct";
                        } else {
                            url = productHost + "/manage/product/updateServiceProduct";
                        }
                        form.on('submit(formVerify)', function (data) {
                            var param;
                            if (productFiles.length > 0 && activityProductFiles.length > 0) {
                                layer.msg("请先上传图片！");
                                return false;
                            } else if (typeof imageIdMap != 'undefined') {
                                param = $(name).serialize() + "&productCode=" + productCode + "&imageList=" + imageIdMap.image + "&activityImageList=" + imageIdMap.actimage + "&modifyOperator=" + "${currentUser.trueName!}";
                            } else {
                                param = $(name).serialize() + "&productCode=" + productCode + "&modifyOperator=" + "${currentUser.trueName!}";
                            }
                            $.post(url, param, function (res) {
                                if (res.responseStatusType.message == "Success") {
                                    layer.close(loadindex);
                                    layer.open({
                                        title: '修改'
                                        , content: '修改成功！'
                                        , btn: ["关闭"]
                                        , yes: function (index) {
                                            layer.closeAll()
                                        }
                                    });
                                    //重新加载表格
                                    table.reload('productReload', {
                                        page: {
                                            curr: 1 //重新从第 1 页开始
                                        }
                                        , where: {
                                            type: productType,
                                            status: 1
                                        }
                                    }, 'data');
                                } else {
                                    layer.close(loadindex);
                                    layer.msg(res.responseStatusType.error.errorMsg, {
                                        time: 20000, //20s后自动关闭
                                        btn: ['明白了']
                                    });
                                }
                            });
                            return false;
                        });
                    },
                    end: function () {
                        $("input[name='barredBuying']").each(function () {
                            $(this).prop('checked', false)
                        });
                        $("input[name='barredPayMethod']").each(function () {
                            $(this).prop('checked', false)
                        });
                        $("#kucun").attr("hidden", "hidden");
                        layui.form.render();
                    }
                });
            } else {
                var a = layer.open({
                    type: 1,
                    title: '商品编辑',
                    content: $(name),
                    area: ['auto', '650px'],
                    closeBtn: 1,
                    btn: ['提交', '取消'],
                    btn1: function () {
                        layer.close(a);
                    },
                    success: function (layero) {
                        //富文本赋值
                        var index = layedit.build("content_s", ptool);
                        nowED = index;
                        layedit.setContent(index, data.moreContent);
                        $("input[name='productCode']").attr("disabled", "disabled")
                        /*--------------------校验方法添加（追加class，filter属性）-------------*/
                        layero.addClass('layui-form');
                        layero.find('.layui-layer-btn0').attr('lay-filter', 'formVerify').attr('lay-submit', '');
                        form.render();
                        //省市级赋值
                        query(form, data);
                        //监听省select
                        form.on('select(province)', function (data) {
                            cityChange(form, data.value, "", "")
                        });
                        //监听市select
                        form.on('select(city)', function (data) {
                            countyChange(form, data.value, "")
                        });

                        form.val(formName, {
                            "productName": data.productName,
                            "productCode": data.productCode,
                            "bonus": data.bonus,
                            "isDiscount": data.isDiscount,

                            "industryIdServiceShow": data.productIndustryName,
                            "industryId": data.industryId,

                            "CommodityTypeIDAddServiceShow": data.productCommoditytypeName,
                            "CommodityTypeID": data.commodityTypeID,

                            "subClassIDAddServiceShow": data.productSubclassName,
                            "subClassID": data.subClassID,

                            "productKindAddServiceShow": data.productKindName,
                            "productKind": data.productKind,

                            "productEffectAddServiceShow": data.productEffectName,
                            "productEffect": data.productEffect,

                            "productBrandAddServiceShow": data.productBrandName,
                            "productBrand": data.productBrand,

                            "productCategoryAddServiceShow": data.productCategoryName,
                            "productCategory": data.productCategory,


                            "productSpecification": data.productSpecification,
                            "productOriginalPrice": data.productOriginalPrice,
                            "retailPrice": data.retailPrice,
                            "activityRetailPrice": data.activityRetailPrice,
                            "stockDiscount": data.stockDiscount,
                            "netContent": data.netContent,
                            "productSales": data.productSales,
                            "productDetails": data.productDetails,
                            // "moreContent": data.moreContent,
                            "instoragePrice": data.instoragePrice,
                            "outstoragePrice": data.outstoragePrice,
                            "outstorageProfit": data.outstorageProfit,
                            "unitIdAddServiceShow": data.productUnitName,
                            "unitId": data.unitId,
                            "companyId": data.companyId,
                            "createOperator": data.createOperator,
                            "modifyOperator": data.modifyOperator
                        });

                        if (data.barredBuying != "" && data.barredBuying != null) {
                            /*处理显示禁止购买复选框*/
                            loadCheckBox(data.barredBuying, "barredBuying");
                        }

                        if (data.barredPayMethod != "" && data.barredPayMethod != null) {
                            /*处理显示禁止支付方式复选框*/
                            loadCheckBox(data.barredPayMethod, "barredPayMethod");
                        }

                        if (data.subsidiaryId != "" && data.subsidiaryId != null) {
                            /*处理显示选中的子公司复选框*/
                            loadCheckBox(data.subsidiaryId, "subsidiary");
                        }

                        if (data.productSubordinate != "" && data.productSubordinate != null) {
                            /*处理商品所属*/
                            loadCheckBox(data.productSubordinate, "productSubordinate")
                        }
                    },
                    yes: function (index, layero) {
                        var moreContent = layedit.getContent(nowED);
                        $("#content_s").val(moreContent);
                        var url;
                        if (name == "#productForm") {
                            url = productHost + "/manage/product/updateProduct";
                        } else {
                            url = productHost + "/manage/product/updateServiceProduct";
                        }
                        form.on('submit(formVerify)', function (data) {
                            var param;
                            if (productFiles.length > 0 && activityProductFiles.length > 0) {
                                layer.msg("请先上传图片！");
                                return false;
                            } else if (typeof imageIdMap != 'undefined') {
                                param = $(name).serialize() + "&productCode=" + productCode + "&imageList=" + imageIdMap.image + "&activityImageList=" + imageIdMap.actimage + "&modifyOperator=" + "${currentUser.trueName!}";
                            } else {
                                param = $(name).serialize() + "&productCode=" + productCode + "&modifyOperator=" + "${currentUser.trueName!}";
                            }
                            $.post(url, param, function (res) {
                                if (res.responseStatusType.message == "Success") {
                                    layer.open({
                                        title: '修改'
                                        , content: '修改成功！'
                                        , btn: ["关闭"]
                                        , yes: function (index) {
                                            layer.closeAll()
                                        }
                                    });
                                    //重新加载表格
                                    table.reload('productReload', {
                                        page: {
                                            curr: 1 //重新从第 1 页开始
                                        }
                                        , where: {
                                            type: productType,
                                            status: 1
                                        }
                                    }, 'data');
                                } else {
                                    layer.msg(res.responseStatusType.error.errorMsg, {
                                        time: 20000, //20s后自动关闭
                                        btn: ['明白了']
                                    });
                                }
                            });
                            return false;
                        });
                    },
                    end: function () {
                        $("input[name='barredBuying']").each(function () {
                            $(this).prop('checked', false)
                        });
                        $("input[name='barredPayMethod']").each(function () {
                            $(this).prop('checked', false)
                        });
                        layui.form.render();
                    }
                });
            }
        }
    }

    //查看信息加载已选复选框
    function loadCheckBox(object, name) {
        var newCheckBox = [];
        newCheckBox = object.split(",");
        for (var j = 0; j < newCheckBox.length; j++) {
            var OldCheckBox = $("input[name=" + name + "]");
            for (var i = 0; i < OldCheckBox.length; i++) {
                if (name == "POSType") {
                    if (OldCheckBox[i].title == newCheckBox[j]) {
                        $(OldCheckBox[i]).prop('checked', true);
                    }
                }
                if (OldCheckBox[i].value == newCheckBox[j]) {
                    $(OldCheckBox[i]).prop('checked', true);
                }
            }
        }
    };

    //删除商品
    function layerDelete(data, table, $, productType) {
        //获取商品类型下拉框的值
        var productType = $('#productTypeSelect option:selected').val();//jq 获取下拉框的值
        var url = productHost + "/manage/product/deleteProduct";
        if (productType == "1") {
            //删产品
            productType = 1
        } else if (productType == "2") {
            productType = 2
        }
        var params = {
            productCode: data.productCode,
            modifyOperator: "${currentUser.trueName!}",
            type: productType
        }
        $.post(url, params, function (result) {
            if (result.responseStatusType.message == "Success") {
                layer.open({
                    title: '删除'
                    , content: '删除成功！'
                    , btn: ["关闭"]
                });
                //重新加载表格
                table.reload('productReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    , where: {
                        type: productType,
                        status: 1
                    }
                }, 'data');
            } else {
                layer.msg("删除失败！");
            }
        })
    }


    //获取表单参数
    $.fn.serializeObject = function () {
        var ct = this.serializeArray();
        var obj = {};
        $.each(ct, function () {
            if (obj[this.name] !== undefined) {
                if (!obj[this.name].push) {
                    obj[this.name] = [obj[this.name]];
                }
                obj[this.name].push(this.value || "");
            } else {
                obj[this.name] = this.value || "";
            }
        });
        obj["createOperator"] = "${currentUser.trueName!}";
        obj["modifyOperator"] = "${currentUser.trueName!}";
        return obj;
    };

    //加载商品类别
    function loadProductType(form) {
        var url = productHost + "/manage/product/selectProductTypeEnum";
        var data = {};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("productTypeEnum"); //server为select定义的id
                server.innerHTML = "";
                for (var p in list) {
                    var option = document.createElement("option");  // 创建添加option属性
                    option.setAttribute("value", p); // 给option的value添加值
                    option.innerText = list[p];     // 打印option对应的纯文本
                    if (p === "1" || p === "2") {
                        server.appendChild(option);           //给select添加option子标签
                    }
                }
                form.render();
            } else {

            }
        })
    }

    //加载单位
    function loadUnit(form) {
        var url = productHost + "/unit/selectUnitListNoPage";
        $.post(url, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                for (var p in list) {
                    var option = "<option value='" + list[p].unitId + "'>" + list[p].unitName + "</option>";
                    $("select[name='unitId']").append(option);
                }
                form.render();
            }
        })
    }


    //公司选项
    function openCompanySelect(data, table, type) {
        layerid = layer.open({//开启表单弹层
            // skin: 'layui-layer-molv',
            area: '60%',
            type: 1,
            title: '选择公司类型',
            content: $('#chooseCompanyType'), //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
            success: function (layero) {
                $("#chooseCompanyType").attr("data-productArrayStr", JSON.stringify(data))
                $("#chooseCompanyType").attr("data-type", type)
                if ("${currentUser.companyType!}" === "2") {
                    //如果是子公司，只显示分公司选项
                    $('#zhi').attr("disabled", "disabled");
                }
            }
        });
    }


    //批量分配物料-子公司
    function batchAllocationZhi(dataProductArrayStr, dataCompanyArrayStr, layer, table) {
        var dataProductArrayStr1 = [];
        var dataCompanyArrayStr1 = [];
        for (var i = 0; i < $.parseJSON(dataProductArrayStr).length; i++) {
            var a = {
                "productCode": $.parseJSON(dataProductArrayStr)[i].productCode,
                "productName": $.parseJSON(dataProductArrayStr)[i].productName,
                "productK3Id": $.parseJSON(dataProductArrayStr)[i].k3Id
            };
            dataProductArrayStr1.push(a);
        }
        for (var i = 0; i < dataCompanyArrayStr.length; i++) {
            var b = {
                "orgId": dataCompanyArrayStr[i].orgId,
                "orgK3Number": dataCompanyArrayStr[i].orgK3Number,
                "orgName": dataCompanyArrayStr[i].orgName,
                "k3Id": dataCompanyArrayStr[i].k3Id
            };
            dataCompanyArrayStr1.push(b);
        }
        var url = productHost + "/manage/product/batchAllocationSubCompany";
        var data = {
            productArrayStr: JSON.stringify(dataProductArrayStr1),
            subcompanyIdArrayStr: JSON.stringify(dataCompanyArrayStr1),
            companyId: "${currentUser.companyId!}",
            companyType: "${currentUser.companyType!}"
        };

        //分配请求
        $.ajax({
            url: url,
            data: data,
            async: false,
            type: "POST",
            success: function (res) {
                if (res.responseStatusType.message === "Success") {
                    layer.open({
                        title: '操作成功'
                        , content: res.result
                        , btn: ["关闭"],
                        yes: function (index) {
                            layer.close(index); //如果设定了yes回调，需进行手工关闭
                            layer.closeAll();
                        }
                    });
                    //重新加载表格
                    table.reload("companyTableRelod");
                } else {
                    alert(res.responseStatusType.error.errorMsg)
                    return;
                }
            }
        });
    }


    //批量分配物料-分公司
    function batchAllocationFen(dataProductArrayStr, dataCompanyArrayStr, layer, table) {
        var dataProductArrayStr1 = [];
        var dataCompanyArrayStr1 = [];
        for (var i = 0; i < $.parseJSON(dataProductArrayStr).length; i++) {
            var a = {
                "productCode": $.parseJSON(dataProductArrayStr)[i].productCode,
                "productName": $.parseJSON(dataProductArrayStr)[i].productName,
                "productK3Id": $.parseJSON(dataProductArrayStr)[i].k3Id
            }
            dataProductArrayStr1.push(a);
        }
        for (var i = 0; i < dataCompanyArrayStr.length; i++) {
            var b = {
                "orgId": dataCompanyArrayStr[i].orgId,
                "orgK3Number": dataCompanyArrayStr[i].orgK3Number,
                "orgName": dataCompanyArrayStr[i].orgName,
                "k3Id": dataCompanyArrayStr[i].k3Id
            }
            dataCompanyArrayStr1.push(b);
        }
        var url = productHost + "/manage/product/batchAllocationStore";
        var data = {
            productArrayStr: JSON.stringify(dataProductArrayStr1),
            storeIdArrayStr: JSON.stringify(dataCompanyArrayStr1),
            companyId: "${currentUser.companyId!}",
            companyType: "${currentUser.companyType!}"
        };

        //分配请求
        $.ajax({
            url: url,
            data: data,
            async: false,
            type: "POST",
            success: function (res) {
                if (res.responseStatusType.message === "Success") {
                    layer.open({
                        title: '操作成功'
                        , content: res.result
                        , btn: ["关闭"],
                        yes: function (index) {
                            layer.close(index); //如果设定了yes回调，需进行手工关闭
                            layer.closeAll();
                        }
                    });
                    //重新加载表格
                    table.reload("companyTableRelod");
                } else {
                    alert(res.responseStatusType.error.errorMsg)
                    return;
                }
            }
        });
    }

    //批量取消分配物料-子公司
    function batchCancelAllocationZhi(dataProductArrayStr, dataCompanyArrayStr, layer, table) {
        var dataProductArrayStr1 = [];
        var dataCompanyArrayStr1 = [];
        for (var i = 0; i < $.parseJSON(dataProductArrayStr).length; i++) {
            var a = {
                "productCode": $.parseJSON(dataProductArrayStr)[i].productCode,
                "productName": $.parseJSON(dataProductArrayStr)[i].productName,
                "productK3Id": $.parseJSON(dataProductArrayStr)[i].k3Id
            }
            dataProductArrayStr1.push(a);
        }
        for (var i = 0; i < dataCompanyArrayStr.length; i++) {
            var b = {
                "orgId": dataCompanyArrayStr[i].orgId,
                "orgK3Number": dataCompanyArrayStr[i].orgK3Number,
                "orgName": dataCompanyArrayStr[i].orgName,
                "k3Id": dataCompanyArrayStr[i].k3Id
            };
            dataCompanyArrayStr1.push(b);
        }
        var url = productHost + "/manage/product/batchCancelAllocationSubCompany";
        var data = {
            productArrayStr: JSON.stringify(dataProductArrayStr1),
            subcompanyIdArrayStr: JSON.stringify(dataCompanyArrayStr1),
            companyId: "${currentUser.companyId!}",
            companyType: "${currentUser.companyType!}"
        };

        //分配请求
        $.ajax({
            url: url,
            data: data,
            async: false,
            type: "POST",
            success: function (res) {
                if (res.responseStatusType.message === "Success") {
                    layer.open({
                        title: '操作成功'
                        , content: res.result
                        , btn: ["关闭"],
                        yes: function (index) {
                            layer.close(index); //如果设定了yes回调，需进行手工关闭
                            layer.closeAll();
                        }
                    });
                    //重新加载表格
                    table.reload("companyTableRelod");
                } else {
                    alert(res.responseStatusType.error.errorMsg)
                    return;
                }
            }
        });
    }


    //批量取消分配物料-分公司
    function batchCancelAllocationFen(dataProductArrayStr, dataCompanyArrayStr, layer, table) {
        var dataProductArrayStr1 = [];
        var dataCompanyArrayStr1 = [];
        for (var i = 0; i < $.parseJSON(dataProductArrayStr).length; i++) {
            var a = {
                "productCode": $.parseJSON(dataProductArrayStr)[i].productCode,
                "productName": $.parseJSON(dataProductArrayStr)[i].productName,
                "productK3Id": $.parseJSON(dataProductArrayStr)[i].k3Id
            }
            dataProductArrayStr1.push(a);
        }
        for (var i = 0; i < dataCompanyArrayStr.length; i++) {
            var b = {
                "orgId": dataCompanyArrayStr[i].orgId,
                "orgK3Number": dataCompanyArrayStr[i].orgK3Number,
                "orgName": dataCompanyArrayStr[i].orgName,
                "k3Id": dataCompanyArrayStr[i].k3Id
            }
            dataCompanyArrayStr1.push(b);
        }
        var url = productHost + "/manage/product/batchCancelAllocationStore";
        var data = {
            productArrayStr: JSON.stringify(dataProductArrayStr1),
            storeIdArrayStr: JSON.stringify(dataCompanyArrayStr1),
            companyId: "${currentUser.companyId!}",
            companyType: "${currentUser.companyType!}"
        };

        //分配请求
        $.ajax({
            url: url,
            data: data,
            async: false,
            type: "POST",
            success: function (res) {
                if (res.responseStatusType.message === "Success") {
                    layer.open({
                        title: '操作成功'
                        , content: res.result
                        , btn: ["关闭"],
                        yes: function (index) {
                            layer.close(index); //如果设定了yes回调，需进行手工关闭
                            layer.closeAll();
                        }
                    });
                    //重新加载表格
                    table.reload("companyTableRelod");
                } else {
                    alert(res.responseStatusType.error.errorMsg)
                    return;
                }
            }
        });
    }
</script>

<script>

    //存放图片和活动图片id的集合
    var imageIdMap;
    //存放图片
    var productFiles = [];
    //存放活动图片
    var activityProductFiles = [];
    //缓存的用户
    var user = "${currentUser.trueName!}";
    //当前弹层id;这个id可以定义多个，主要的目的是为了在回调函数关闭弹层时使用的
    var layerid;



    <#--页面初始化加载数据-->
    layui.use(['table', 'layer', 'jquery', 'form', 'laydate', 'upload', 'layedit'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        var upload = layui.upload;
        var ptool = {
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
            ]
        };
        var layedit = layui.layedit;


        /*------行业关联数据查看-添加/修改------*/
        $("#" + "serachIndustryId").click(function () {
            var url = storeHost + "/manage/industry/selectList";
            var param = {};
            loadLinkData(layer, layui, url, "industryID", "industryName", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "industryIdAddShow").val(data.industryName);
                $("#" + "industryIdAdd").val(data.industryID);
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
        /*------行业关联数据查看-添加/修改--服务----*/
        $("#" + "serachIndustryIdService").click(function () {
            var url = storeHost + "/manage/industry/selectList";
            var param = {};
            loadLinkData(layer, layui, url, "industryID", "industryName", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "industryIdAddServiceShow").val(data.industryName);
                $("#" + "industryIdAddService").val(data.industryID);
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

        /*------大类关联数据查看-添加/修改------*/
        $("#" + "serachCommodityTypeID").click(function () {
            var url = dataHost + "/commodityType/selectCommodityTypeList";
            var industryIdAdd = $("input[id='industryIdAdd']").val();
            if(industryIdAdd==""||industryIdAdd==null){
                layer.msg("请先选择所属行业")
                return
            }
            var param = {commodityTypeIndustryID: industryIdAdd};
            loadLinkData(layer, layui, url, "commodityTypeID", "commodityTypeName", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "CommodityTypeIDAddShow").val(data.commodityTypeName);
                $("#" + "CommodityTypeIDAdd").val(data.commodityTypeID);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var industryIdAdd = $("input[id='industryIdAdd']").val();
                var searchJsonName = {searchWord: wordSearch,commodityTypeIndustryID:industryIdAdd};
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
        /*------大类关联数据查看-添加/修改--服务----*/
        $("#" + "serachCommodityTypeIDService").click(function () {
            var url = dataHost + "/commodityType/selectCommodityTypeList";
            var industryIdAdd = $("input[id='industryIdAddService']").val();
            if(industryIdAdd==""||industryIdAdd==null){
                layer.msg("请先选择所属行业")
                return
            }
            var param = {commodityTypeIndustryID: industryIdAdd};
            loadLinkData(layer, layui, url, "commodityTypeID", "commodityTypeName", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "CommodityTypeIDAddServiceShow").val(data.commodityTypeName);
                $("#" + "CommodityTypeIDAddService").val(data.commodityTypeID);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var industryIdAdd = $("input[id='industryIdAdd']").val();
                var searchJsonName = {searchWord: wordSearch,commodityTypeIndustryID:industryIdAdd};
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

        /*------小类关联数据查看-添加/修改------*/
        $("#" + "serachSubClassID").click(function () {
            var url = dataHost + "/commodityType/selectSubclassList";
            var commodityTypeID = $("input[id='CommodityTypeIDAdd']").val();
            if(commodityTypeID==""||commodityTypeID==null){
                layer.msg("请先选择所属大类")
                return
            }
            var param = {commodityTypeID: commodityTypeID};
            loadLinkData(layer, layui, url, "subclassID", "subclassName", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "subClassIDAddShow").val(data.subclassName);
                $("#" + "subClassIDAdd").val(data.subclassID);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var commodityTypeID = $("input[id='CommodityTypeIDAdd']").val();
                var searchJsonName = {searchWord: wordSearch, commodityTypeID: commodityTypeID}
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
        /*------小类关联数据查看-添加/修改--服务----*/
        $("#" + "serachSubClassIDService").click(function () {
            var url = dataHost + "/commodityType/selectSubclassList";
            var commodityTypeID = $("input[id='CommodityTypeIDAddService']").val();
            if(commodityTypeID==""||commodityTypeID==null){
                layer.msg("请先选择所属大类")
                return
            }
            var param = {commodityTypeID: commodityTypeID};
            loadLinkData(layer, layui, url, "subclassID", "subclassName", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "subClassIDAddServiceShow").val(data.subclassName);
                $("#" + "subClassIDAddService").val(data.subclassID);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var commodityTypeID = $("input[id='CommodityTypeIDAdd']").val();
                var searchJsonName = {searchWord: wordSearch, commodityTypeID: commodityTypeID}
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

        /*------业绩分类关联数据查看-添加/修改------*/
        $("#" + "serachAchievementId").click(function () {
            var url = dataHost + "/performance/selectPerformanceList";
            var industryIdAdd = $("input[id='industryIdAdd']").val();
            if(industryIdAdd==""||industryIdAdd==null){
                layer.msg("请先选择所属行业")
                return
            }
            var param = {achievementIndustryID: industryIdAdd};
            loadLinkData(layer, layui, url, "achievementID", "achievementName", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "achievementIdAddShow").val(data.achievementName);
                $("#" + "achievementIdAdd").val(data.achievementID);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var industryIdAdd = $("input[id='industryIdAdd']").val();
                var searchJsonName = {keyWordAchievementName: wordSearch,achievementIndustryID:industryIdAdd};
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
        /*------业绩关联数据查看-添加/修改------*/
        $("#" + "serachAchievementPostId").click(function () {
            var url = dataHost + "/performance/selectPerformancePostList";
            var achievementIdAdd = $("input[id='achievementIdAdd']").val();
            if(achievementIdAdd==""||achievementIdAdd==null){
                layer.msg("请先选择所属业绩分类")
                return
            }
            var param = {achievementID: achievementIdAdd};
            loadLinkData(layer, layui, url, "id", "achievementPostName", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "achievementPostIdAddShow").val(data.achievementPostName);
                $("#" + "achievementPostIdAdd").val(data.id);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var achievementIdAdd = $("input[id='achievementIdAdd']").val();
                var searchJsonName = {keyWord: wordSearch,achievementID:achievementIdAdd};
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
        /*------种类关联数据查看-添加/修改------*/
        $("#" + "serachProductKind").click(function () {
            var url = productHost + "/productKind/selectProductKindList";
            var param = {};
            loadLinkData(layer, layui, url, "productKindId", "productTypeName", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "productKindAddShow").val(data.productTypeName);
                $("#" + "productKindAdd").val(data.productKindId);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {keyWord: wordSearch};
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
        /*------品牌关联数据查看-添加/修改------*/
        $("#" + "serachProductBrand").click(function () {
            var url = productHost + "/productBrand/selectProductBrandList";
            var param = {};
            loadLinkData(layer, layui, url, "productTypeId", "productTypeName", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "productBrandAddShow").val(data.productTypeName);
                $("#" + "productBrandAdd").val(data.productTypeId);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {keyWord: wordSearch};
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
        /*------品类关联数据查看-添加/修改------*/
        $("#" + "serachProductCategory").click(function () {
            var url = productHost + "/productCategory/selectProductCategoryList";
            var param = {};
            loadLinkData(layer, layui, url, "productTypeId", "productTypeName", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "productCategoryAddShow").val(data.productTypeName);
                $("#" + "productCategoryAdd").val(data.productTypeId);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {keyWord: wordSearch};
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
        /*------功效关联数据查看-添加/修改------*/
        $("#" + "serachProductEffect").click(function () {
            var url = productHost + "/productEffect/selectProductEffectList";
            var param = {};
            loadLinkData(layer, layui, url, "productTypeId", "productTypeName", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "productEffectAddShow").val(data.productTypeName);
                $("#" + "productEffectAdd").val(data.productTypeId);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {keyWord: wordSearch};
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



        /*------单位关联数据查看-添加/修改------*/
        $("#" + "serachUnitId").click(function () {
            var url = productHost + "/unit/selectUnitList";
            var param = {};
            loadLinkData(layer, layui, url, "unitId", "unitName", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "unitIdAddShow").val(data.unitName);
                $("#" + "unitIdAdd").val(data.unitId);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {keyWord: wordSearch};
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
        /*------单位关联数据查看-添加/修改--服务----*/
        $("#" + "serachUnitIdService").click(function () {
            var url = productHost + "/unit/selectUnitList";
            var param = {};
            loadLinkData(layer, layui, url, "unitId", "unitName", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "unitIdAddServiceShow").val(data.unitName);
                $("#" + "unitIdAddService").val(data.unitId);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {keyWord: wordSearch};
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
123


        //监听确认-打开公司列表
        form.on('submit(chooseCompanyTypeConfir)', function (data) {
            var url = null;
            var subCompanyOrStore = null;
            if ($('input[name="companyType"]:checked').val() === "1") {
                // 如果是子公司
                url = storeHost + "/manage/company/selectSubsidiaryList";
                subCompanyOrStore = 1;
            } else if ($('input[name="companyType"]:checked').val() === "2") {
                //如果是分公司
                url = storeHost + "/manage/store/selectStoreList";
                subCompanyOrStore = 2;
            }
            var a3 = layer.open({
                type: 1,
                title: '公司列表',
                content: $('#companyForm'),
                area: ['904px', '500px'],
                id: "companyFormReload",
                closeBtn: 1,
                btn: ['关闭'],
                btn2: function () {
                    layer.close(a3)
                },
                success: function (layero) {
                    layui.use('table', function () {
                        var table = layui.table;
                        table.render({
                            elem: '#companyTable'
                            , url: url
                            , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                            , page: true          //显示分页默认不显示
                            , method: 'post'
                            , id: "companyTableRelod"
                            , toolbar: '#toolbarDemo2'
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
                            , where: {
                                companyId: "${currentUser.companyId!}",
                                companyType: "${currentUser.companyType!}"
                            }
                            , cols: [[
                                {type: 'checkbox', fixed: 'left', width: 40}
                                , {field: 'orgId', title: '组织Id', fixed: 'left'}
                                , {field: 'orgK3Number', title: '组织k3编号', fixed: 'left'}
                                , {field: 'orgName', title: '组织名称', fixed: 'left'}
                            ]]
                            , done: function (res, curr, count) {
                                if ($("#chooseCompanyType").attr("data-type") == "1") {
                                    $("#allocation2").attr("style", "display:block;"); //显示
                                    $("#cancelAllocation2").attr("style", "display:none;");  //隐藏
                                } else {
                                    $("#cancelAllocation2").attr("style", "display:block;"); //显示
                                    $("#allocation2").attr("style", "display:none;");  //隐藏
                                }
                            }
                        });
                        //头工具栏事件-批量分配
                        table.on('toolbar(companyTable)', function (obj) {
                            var checkStatus = table.checkStatus(obj.config.id);
                            switch (obj.event) {
                                case 'allocation2':
                                    var data = checkStatus.data;
                                    if (data.length === 0) {
                                        alert("请选中充值项");
                                        break;
                                    }
                                    if (subCompanyOrStore == 1) {
                                        batchAllocationZhi($("#chooseCompanyType").attr("data-productArrayStr"), data, layer, table);
                                    } else if (subCompanyOrStore == 2) {
                                        batchAllocationFen($("#chooseCompanyType").attr("data-productArrayStr"), data, layer, table);
                                    }

                                    break;
                                case 'cancelAllocation2':
                                    var data = checkStatus.data;
                                    if (data.length === 0) {
                                        alert("请选中充值项");
                                        return;
                                        break;
                                    }
                                    if (subCompanyOrStore == 1) {
                                        batchCancelAllocationZhi($("#chooseCompanyType").attr("data-productArrayStr"), data, layer, table);
                                    } else if (subCompanyOrStore == 2) {
                                        batchCancelAllocationFen($("#chooseCompanyType").attr("data-productArrayStr"), data, layer, table);
                                    }
                                    break;
                            }
                            return;
                        });

                    })
                }
            });
            return false
        });

        //判断产品池按钮是否显示
        if ("${currentUser.companyType!}" === "2") {
            //如果是子公司 则显示
            $("#showProductPoolButton").removeAttr("style")
        }

        //富文本的图片上传
        layedit.set({
            uploadImage: {
                url: productHost + "/manage/product/uploadFuwenbenPic" //接口url
                , type: 'POST' //默认post
            }
        });
        //建立产品编辑器
        var product = layedit.build('content', ptool);
        //建立服务编辑器
        var service = layedit.build('content_s', ptool);

        // -------------------页面一加载查询所用商品------------------

        reload(table, 1, 1, null);


        //------------------商品图片回显
        upload.render({
            elem: '#addproductImage'
            , exts: 'jpg|jpeg|png|bmp|GIF|JPG|PNG|JPEG'  //common设定
            , size: 60000    //限制文件大小，单位 KB
            , auto: false
            , multiple: true
            , choose: function (obj) {
                //将图片回显到img标签
                var htmls1 = $("#addImage");
                $(htmls1).empty();
                obj.preview(function (index, file, result) {
                    $(htmls1).append("<img class='layui-upload-img' style='width:100px;height:100px' src='" + result + "' />");
                    productFiles.push(file);
                });
                return productFiles;
            }
        });
        //------------------商品活动图片回显
        upload.render({
            elem: '#addproductactivityImages'
            , exts: 'jpg|jpeg|png|bmp|GIF|JPG|PNG|JPEG'  //common设定
            , size: 60000    //限制文件大小，单位 KB
            , auto: false
            , multiple: true
            , choose: function (obj) {
                //将图片回显到img标签
                var htmls1 = $("#addImages");
                $(htmls1).empty();
                obj.preview(function (index, file, result) {
                    $(htmls1).append("<img class='layui-upload-img' style='width:100px;height:100px' src='" + result + "' />");
                    activityProductFiles.push(file);
                });
                return activityProductFiles;
            }
        });

        //------------------服务图片回显
        upload.render({
            elem: '#addserviceImage'
            , exts: 'jpg|jpeg|png|bmp|GIF|JPG|PNG|JPEG'  //common设定
            , size: 60000    //限制文件大小，单位 KB
            , auto: false
            , multiple: true
            , choose: function (obj) {
                //将图片回显到img标签
                var htmls1 = $("#addImage_service");
                $(htmls1).empty();
                obj.preview(function (index, file, result) {
                    $(htmls1).append("<img class='layui-upload-img' style='width:100px;height:100px' src='" + result + "' />");
                    productFiles.push(file);
                });
                return productFiles;
            }
        });
        //------------------服务活动图片回显
        upload.render({
            elem: '#addserviceactivityImages'
            , exts: 'jpg|jpeg|png|bmp|GIF|JPG|PNG|JPEG'  //common设定
            , size: 60000    //限制文件大小，单位 KB
            , auto: false
            , multiple: true
            , choose: function (obj) {
                //将图片回显到img标签
                var htmls1 = $("#addImages_service");
                $(htmls1).empty();
                obj.preview(function (index, file, result) {
                    $(htmls1).append("<img class='layui-upload-img' style='width:100px;height:100px' src='" + result + "' />");
                    activityProductFiles.push(file);
                });
                return activityProductFiles;
            }
        });

        //----------------------搜索点击事件--------------------------
        $(document).on('click', '#search', function () {
            var productType = $('#productTypeSelect option:selected').val();//jq 获取下拉框的值
            var productStatus = $('#productStatus option:selected').val();
            var keyWord = $("#keyWord").val();
            reload(table, productType, productStatus, keyWord);
        });


        /*-----------------------------添加点击事件---------------------------*/
        $("#addProduct").click(function () {
            layerid = layer.open({//开启表单弹层
                area: '60%',
                type: 1,
                title: '选择商品类型',
                content: $('#productType') //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
            });
        });

        //监听确认-打开对应的添加商品类型弹窗
        form.on('submit(productTypeConfir)', function (data) {
            if ($('input[name="productType"]:checked').val() == "1") {
                layer.close(layerid);
                //添加商品
                document.getElementById("productForm").reset();
                $("#addImage").empty();
                $("#addImages").empty();
                $("#productCode").attr("hidden", "hidden");
                $(".createOperator").attr("hidden", "hidden");
                $(".modifyOperator").attr("hidden", "hidden");
                //从新加载所有支付方式
                loadPayMethodList();
                var active = {
                    content: function () {
                        alert(layedit.getContent(index)); //获取编辑器内容
                    }
                    , text: function () {
                        alert(layedit.getText(index)); //获取编辑器纯文本内容
                    }
                    , selection: function () {
                        alert(layedit.getSelection(index));
                    }
                };
                $("#achievementID").empty();
                $("select[name='CommodityTypeID']").empty();
                $("select[name='subClassID']").empty();
                // $("#subClassID_p").empty();
                addProduct(layer, form, upload, table, productType, layedit, ptool);

            } else if ($('input[name="productType"]:checked').val() == "2") {
                layer.close(layerid);
                //添加服务
                document.getElementById("serviceForm").reset();
                $("#addImage_service").empty();
                $("#addImages_service").empty();
                $("#productCode").attr("hidden", "hidden");
                $(".createOperator").attr("hidden", "hidden");
                $(".modifyOperator").attr("hidden", "hidden");
                $("#CommodityTypeID").empty();
                $("#subClassID").empty();
                addService(layer, form, upload, table, productType, layedit, ptool);
            }
            return false;//防止表单提交后跳转
        });


        /*-----------------------------导出点击事件---------------------------*/
        $("#export").click(function () {
            layerid = layer.open({//开启表单弹层
                area: '60%',
                type: 1,
                title: '选择管理员类型',
                content: $('#excelImportType') //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
            });
        });

        //监听确认-打开对应的导出商品类型弹窗
        form.on('submit(excelImportConfir)', function (data) {

            if ($('input[name="excelImportType"]:checked').val() == "1") {
                layer.close(layerid);
                //导出产品
                exportAll(1)
            } else if ($('input[name="excelImportType"]:checked').val() == "2") {
                layer.close(layerid);
                //导出服务产品
                exportAll(2)
            }
            return false;//防止表单提交后跳转
        });


        //----------------------导出点击事件-------------------------
        // $(document).on('click', '#export', function () {
        //     var productType = $('#productType option:selected').val();//jq 获取下拉框的值
        //     exportAll(productType)
        // });

        //----------------------查看总公司产品池按钮事件-------------------------
        $(document).on('click', '#checkProductPool', function () {
            form.on('select(productTypeEnum)', function (data) {
                var productType = data.value;
                table.reload('productPoolTable', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    , where: {
                        type: productType,
                        status: 1
                    }
                }, 'data');
            });
            showProductPool(form, table, $)
        });


        //----------------------商品图片开始上传点击事件
        $(document).on('click', '.up', function () {
            if (productFiles != undefined && activityProductFiles != undefined) {
                var productType = $('#productType option:selected').val();//jq 获取下拉框的值
                var params = new FormData();
                productFiles.forEach(function (file) {
                    params.append("productFiles", file);
                })
                activityProductFiles.forEach(function (file) {
                    params.append("activityProductFiles", file);
                })
                params.append("type", productType);
                var url = productHost + "/manage/product/uploadPic";
                $.ajax({
                    url: url
                    , type: "POST"
                    , data: params
                    , dataType: "json"   //服务器传回的数据类型
                    , processData: false
                    , contentType: false
                    , success: function (res) {
                        if (res.responseStatusType.message == "Success") {
                            layer.msg("上传成功！");
                            imageIdMap = res.result;
                            productFiles = []
                            activityProductFiles = []
                        } else {
                            layer.msg("上传失败！");
                        }
                    }
                });
            }
        });

        /*---------------------监听工具条--------------------------*/
        table.on('tool(product)', function (obj) {

            var data = obj.data;
            if (obj.event === 'detail') {
                //清空表单
                document.getElementById("productForm").reset();
                document.getElementById("serviceForm").reset();
                var productType = $('#productTypeSelect option:selected').val();//jq 获取下拉框的值
                if (productType == "1") {
                    prodcutInfo(form, data, "#productForm", "detail", "productForm", table, productType, layedit, "product", ptool);
                } else {
                    prodcutInfo(form, data, "#serviceForm", "detail", "serviceForm", table, productType, layedit, "service", ptool);
                }
            } else if (obj.event === 'edit') {
                //清空表单
                document.getElementById("productForm").reset();
                document.getElementById("serviceForm").reset();
                $(".createOperator").attr("hidden", "hidden");
                $(".modifyOperator").attr("hidden", "hidden");
                var productType = $('#productTypeSelect option:selected').val();//jq 获取下拉框的值
                if (productType == "1") {
                    prodcutInfo(form, data, "#productForm", "edit", "productForm", table, productType, layedit, "product", ptool);
                } else {
                    prodcutInfo(form, data, "#serviceForm", "edit", "serviceForm", table, productType, layedit, "service", ptool);
                }
            } else if (obj.event === 'del') {
                var productType = $('#productTypeSelect option:selected').val();//jq 获取下拉框的值
                if (productType == "1") {
                    layer.confirm('确定删除吗？', function (index) {
                        layerDelete(data, table, $, productType);
                        obj.del();
                    });
                } else {
                    layer.confirm('确定删除吗？', function (index) {
                        layerDelete(data, table, $, productType);
                        obj.del();
                    });
                }
            } else if (obj.event === 'putOn') {
                var productType = $('#productTypeSelect option:selected').val();//jq 获取下拉框的值
                var url = productHost + "/manage/product/onOffSale";
                var params = {
                    productStatus: 1,
                    productCode: data.productCode,
                    companyType: "${currentUser.companyType!}",
                    companyId: "${currentUser.companyId!}",
                    modifyOperator: "${currentUser.trueName!}",
                    type: productType
                };
                $.post(url, params, function (result) {
                    if (result.responseStatusType.message == "Success") {
                        layer.open({
                            title: '上架'
                            , content: '上架成功！'
                            , btn: ["关闭"]
                        });
                        table.reload('productReload', {
                            page: {
                                curr: 1 //重新从第 1 页开始
                            }
                            , where: {
                                type: productType,
                                productStatus: 2,
                                status: 1
                            }
                        }, 'data');
                    }
                });
            } else if (obj.event === 'putDown') {
                var productType = $('#productTypeSelect option:selected').val();//jq 获取下拉框的值
                var url = productHost + "/manage/product/onOffSale";
                var params = {
                    productStatus: 2,
                    productCode: data.productCode,
                    companyType: "${currentUser.companyType!}",
                    companyId: "${currentUser.companyId!}",
                    modifyOperator: "${currentUser.trueName!}",
                    type: productType
                };
                $.post(url, params, function (result) {
                    if (result.responseStatusType.message == "Success") {
                        layer.open({
                            title: '下架'
                            , content: '下架成功！'
                            , btn: ["关闭"]
                        });
                        table.reload('productReload', {
                            page: {
                                curr: 1 //重新从第 1 页开始
                            }
                            , where: {
                                type: productType,
                                productStatus: 1,
                                status: 1
                            }
                        }, 'data');
                    }
                });
            }
        });

        /*--------------------------监听第三方产品需要弹出库存----------------------------*/
        form.on('radio(kucun)', function (data) {
            if (data.value == 1) {
                $("#kucun").removeAttr("hidden");
            }
            if (data.value == 0) {
                $("#kucun").prop("hidden", "hidden");
            }
            form.render();
        });

        /*--------------------------监听行业对应的大类然后对应小类----------------------------*/
        var industry;
        //根据行业查业绩
        form.on('select(IndustryId)', function (data) {
            var productType = $('#productType option:selected').val();//jq 获取下拉框的值
            $("#achievementID").empty();
            $("select[name='subClassID']").empty();
            loadPerformanceId(data);
            loadCommodityType(data, productType);
            industry = data.value;
        });

        //添加产品监听小类渲染对应的支付方式
        form.on('select(subClassID)', function (data) {
            loadPayMethodList(data.value, industry);
        });


        var productData;//产品首页的数据

        //--------------------封装过后的页面表单渲染方法
        function reload(table, productType, productStatus, keyWord) {
            loadMemberList();
            loadPayMethodList();
            /*  loadConpany();
              loadSubsidiary();*/
            var up = "";
            if (productStatus == 1) {//上架
                up = "#barDemo";
            } else if (productStatus == 2) {//下架
                up = "#barDemoDown"
            }

            table.render({
                elem: '#product'
                , url: productHost + "/manage/product/selectProductList"
                , method: 'post'
                , request: {
                    pageName: 'pageNum', //页码的参数名称，默认：page
                    limitName: 'pageSize' //每页数据量的参数名，默认：limit
                }
                , id: 'productReload'
                , loading: true
                , toolbar: '#toolbarDemo'
                , cols: [[
                    {type: 'checkbox', fixed: 'left', width: 40}
                    , {

                        field: 'imageUrl', title: '商品图片', width: 150, fixed: 'left', templet: function (d) {
                            if (productType == "1") {
                                return d.productImageList == "" || d.productImageList == null ? "<div><img src='/noImg.png' style='width:60px;height: 60px'></div>" : "<div><img src=http://" + d.productImageList[0].imageUrl + " style='width:60px;height: 60px'></div>";
                            } else {
                                return d.serviceProductImageList == "" || d.serviceProductImageList == null ? "<div><img src='/noImg.png' style='width:60px;height: 60px'></div>" : "<div><img src=http://" + d.serviceProductImageList[0].imageUrl + " style='width:60px;height: 60px'></div>";
                            }
                        }
                    }
                    , {field: 'productName', title: '商品名称', sort: true}
                    , {field: 'retailPrice', title: '价格', sort: true}
                    , {field: 'productSales', title: '销量', sort: true}
                    , {fixed: 'right', title: '操作', width: 255, align: 'center', toolbar: up}
                ]]
                , page: true
                , where: {
                    type: productType,
                    productStatus: productStatus === undefined ? "1" : productStatus,
                    keyWord: keyWord === undefined ? null : keyWord,
                    companyType: ${currentUser.companyType!},
                    companyId:${currentUser.companyId!},
                    status: 1,
                    isHoutai: 1
                <#--subsidiaryId: ${currentUser.companyType!} === 2 ? ${currentUser.companyId!} : null-->
                }
                , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                    if (res.result != null) {
                        productData = res.result.list;
                    }
                    return {
                        "code": 0, //解析接口状态
                        "msg": "", //解析提示文本
                        "count": res.result == null ? 0 : res.result.total, //解析数据长度
                        "data": res.result == null ? 0 : res.result.list//解析数据列表
                    };
                }
                , done: function (res) {   //返回数据执行回调函数


                }
            });

            //头工具栏事件-批量审核
            table.on('toolbar(product)', function (obj) {
                var checkStatus = table.checkStatus(obj.config.id);
                switch (obj.event) {
                    case 'allocation':
                        var data = checkStatus.data;
                        if (data.length === 0) {
                            layer.alert("请选中充值项");
                            break;
                        }
                        openCompanySelect(data, table, 1)
                        break;
                    case 'cancelAllocation':
                        var data = checkStatus.data;
                        if (data.length === 0) {
                            layer.alert("请选中充值项");
                            break;
                        }
                        openCompanySelect(data, table, 2)
                        break;
                }
                ;
            });


        }


    });

    /*----------------------自动计算出库利润---------------------------*/

    var inprice = "";
    var outprice = "";
    var maolirun = "";
    var inprice_s = "";
    var outprice_s = "";
    var maolirun_service = "";
    var price = 0;

    //出库价鼠标离开事件
    $(".outstoragePrice").blur(function () {
        //产品入库价
        inprice = $(".instoragePrice").val();
        //产品出库价
        outprice = $(".outstoragePrice").val();
        //产品出库毛利润
        maolirun = $("#outstorageProfit").val();

        //服务入库价
        inprice_s = $("#instoragePrice_service").val();
        //服务出库价
        outprice_s = $("#outstoragePrice_service").val();
        //服务出库毛利润
        maolirun_service = $("#outstorageProfit_service").val();

        //计算产品的毛利润
        if (inprice != "" && outprice != "") {
            price = (outprice - inprice) / outprice * 100;
            if (price < 0) {
                layer.msg("出库价格低于入库价格！");
            } else if (price > 0) {
                $("#outstorageProfit").val((price.toFixed(0)));
            }
        } else if (inprice_s != "" && outprice_s != "") {
            price = (outprice_s - inprice_s) / outprice_s * 100;
            if (price < 0) {
                layer.msg("出库价格低于入库价格！");
            } else if (price > 0) {
                $("#outstorageProfit_service").val((price.toFixed(0)));
            }
        } else if (inprice != "" && maolirun != "") {
            //如果产品入库价和毛利润不为空 就计算出库价格
            $(".outstoragePrice").val((inprice / (100 - maolirun) * 100).toFixed(0));
        } else if (inprice_s != "" && maolirun_service != "") {
            //服务入库价和毛利润不为空 就计算服务出库价格
            $("#outstoragePrice_service").val((inprice_s / (100 - maolirun_service) * 100).toFixed(0));
        } else if (inprice == "" && maolirun == "") {
            //服务入库价和毛利润不为空 就计算服务出库价格
            layer.msg("请检查入库价或者出库利润是否为空！");
        } else {
            layer.msg("请检查入库价或者出库价是否为空！");
        }
    });

    //出库毛利润鼠标离开事件
    $(".outstorageProfit").blur(function () {
        //产品入库价
        inprice = $(".instoragePrice").val();
        //产品出库价
        outprice = $(".outstoragePrice").val();
        //产品出库毛利润
        maolirun = $("#outstorageProfit").val();

        //服务入库价
        inprice_s = $("#instoragePrice_service").val();
        //服务出库价
        outprice_s = $("#outstoragePrice_service").val();
        //服务出库毛利润
        maolirun_service = $("#outstorageProfit_service").val();

        //售价*（1-毛利率）= 成本
        //售价 = 成本/(1-毛利润)

        //计算产品的售价
        if (inprice != "" && maolirun != "") {
            $(".outstoragePrice").val((inprice / (100 - maolirun) * 100).toFixed(0));
        } else if (outprice != "" && maolirun != "") {
            //已知出库价和毛利润计算产品的入库价
            $(".instoragePrice").val(((outprice * (100 - maolirun)) / 100).toFixed(0));
        } else if (maolirun_service == "" && outprice_s == "") {
            //已知服务出库价和毛利润计算产品的入库价
            $("#instoragePrice_service").val(((outprice_s * (100 - maolirun_service)) / 100).toFixed(0));

        } else if (inprice_s != "" && maolirun_service != "") {
            $("#outstoragePrice_service").val(((inprice_s / (100 - maolirun_service)) * 100).toFixed(0));
        } else if (inprice != "" && outprice != "") {
            //入库价和出库价不为空就计算毛利润
            price = (outprice - inprice) / outprice * 100;
            if (price < 0) {
                layer.msg("出库价格低于入库价格！");
            } else if (price > 0) {
                $("#outstorageProfit").val((price.toFixed(0)));
            }
        } else {
            layer.msg("请检查入库价格或者出库毛利润价格是否为空！");
        }
    });

    //产品池搜索
    $("#searchword").click(function () {
        var productTypeEnum = $("select[id='productTypeEnum']");
        productTypeEnum = productTypeEnum.find("option:selected").val();
        var keyWord = $("#word").val();
        layui.table.render({
            elem: '#productPoolTable'
            , url: productHost + "/manage/product/selectProductListNoPage"
            , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
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
                    "count": res.result == null ? 0 : res.result.total, //解析数据长度
                    "data": res.result == null ? 0 : res.result //解析数据列表
                };
            }
            , where: {
                companyId: "${currentUser.companyId!}",
                companyType: "${currentUser.companyType!}",
                type: 1,
                status: 1,
                keyWord: keyWord,
                productStatus: productTypeEnum
            }
            , cols: [[
                {
                    type: 'checkbox', fixed: 'left', width: 40, templet: function () {
                        $(".layui-unselect layui-form-checkbox")
                    }
                }
                , {field: 'productCode', title: '商品编号', fixed: 'left'}
                , {field: 'productName', title: '商品名称', fixed: 'left'}
            ]]
            , done: function () {

            }
        });
    });


    $("#tiqu").click(function () {
        var checkStatus = layui.table.checkStatus('productPoolTable')
                , data = checkStatus.data;
        var productCode = [];
        $.each(data, function (n, value) {
            productCode.push(value.productCode);
        });
        if (productCode.length == 0) {
            layer.open({
                title: '提示'
                , content: '请选择商品！'
                , btn: ["关闭"]
            });
            return;
        }
        //建立子公司和商品池商品的关系
        var type = $("select[id='productTypeEnum'] option:selected").val();
        var url = productHost + "/manage/product/addProductSubcompany";
        var params = {
            productCode: JSON.stringify(productCode),
            subCompanyId: "${currentUser.companyId!}",
            createOperator: "${currentUser.trueName!}",
            type: type
        };

        $.post(url, params, function (res) {
            if (res.responseStatusType.message == "Success") {
                if (res.result != null) {
                    layer.open({
                        title: '提取'
                        , content: '提取成功！但是以下商品已经存在无法提取:' + res.result
                        , btn: ["关闭"]
                        , yes: function (index) {
                            layer.close(index); //如果设定了yes回调，需进行手工关闭
                        }
                    });
                    //重新加载表格
                    layui.table.reload("productReload");
                } else {
                    layer.open({
                        title: '提取'
                        , content: '提取成功！'
                        , btn: ["关闭"]
                        , yes: function (index) {
                            layer.close(index); //如果设定了yes回调，需进行手工关闭
                        }
                    });
                    //重新加载表格
                    layui.table.reload("productReload");
                }
            } else {
                layer.open({
                    title: '提取'
                    , content: '提取失败！'
                    , btn: ["关闭"]
                });
            }
        })
    });


</script>

</form>
</body>
</html>