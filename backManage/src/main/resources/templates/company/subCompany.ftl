<#--子公司后台管理-->
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
</head>
<style>
    .layui-form-select dl dd {
        cursor: pointer;
        width: 270px;
    }

    label.xrequired:before {
        content: '* ';
        color: red;
    }

</style>
<body>


<div class="layui-fluid">
    <div class="demoTable layui-form">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">公司名称</label>
                <div class="layui-input-inline">
                    <input class="layui-input" type="text" name="keyWordName" autocomplete="off" placeholder="输入公司名称">
                </div>
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
    <table id="subCompany" lay-filter="demo"></table>
</div>



<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="selectStores">查看门店</a>
   <#-- <a class="layui-btn layui-btn-xs" lay-event="insertStock">生成仓库</a>-->
    <#--<a class="layui-btn layui-btn-xs" lay-event="insertHeSuanFanWei">生成核算范围</a>-->
    <#--<a class="layui-btn layui-btn-xs" lay-event="insertZhangBu">生成账簿</a>-->
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<#--修改表单-->
<div id="editeditformdivid" hidden="" class="layui-fluid" style="margin: 15px;">
    <form class="layui-form layui-form-pane layui-personal" id="editForm" action="" lay-filter="example" method="post">
        <div class="layui-form-item" hidden="hidden">
            <label class="layui-form-label">子公司id</label>
            <div class="layui-input-block">
                <input type="text" name="subsidiaryId" lay-verify="required" autocomplete="off" placeholder="请输入姓名"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label xrequired">名称</label>
            <div class="layui-input-block">
                <input type="text" name="subsidiaryName" lay-verify="required" autocomplete="off" placeholder="请输入名称"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">简称</label>
            <div class="layui-input-block">
                <input type="text" name="abbreviation" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入简称"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">曾用名</label>
            <div class="layui-input-block">
                <input type="text" name="formerName" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入曾用名"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">英文名</label>
            <div class="layui-input-block">
                <input type="text" name="englishName" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入英文名"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item" id="companyDivEdit">
            <label class="layui-form-label">当前总公司</label>
            <div class="layui-input-block">
                <span id="companyNameEdit" name="companyNameEdit"></span>
            </div>
        </div>


        <div class="layui-form-item" id="companySelectDivEdit">
            <label class="layui-form-label xrequired">总公司</label>
            <div class="layui-input-inline" style="width:270px;">
                <select class="parentCompany" name="parentCompanyEdit" id="parentCompanyEdit" lay-filter="paytype_s"
                        lay-verify="required">
                </select>
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">法人</label>
            <div class="layui-input-block">
                <input type="text" name="corporate" <#--lay-verify="required"--> autocomplete="off" placeholder="请输入法人"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label xrequired">选择地区</label>
            <div class="layui-input-block">
                <div class="layui-inline">
                    <select name="provinceId" id="provinceEdit" lay-filter="province" class="province">
                    </select>
                </div>
                <div class="layui-inline">
                    <select name="cityId" class="city" lay-filter="city">
                    </select>
                </div>
                <div class="layui-inline" id="countyEdit">
                    <select name="countyId" class="county" lay-filter="county">
                    </select>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label xrequired">公司所在地址</label>
            <div class="layui-input-block">
                <input type="text" name="companyDetailedAddress" lay-verify="required" autocomplete="off"
                       placeholder="请输入详细地址"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label xrequired">联系电话</label>
            <div class="layui-input-block" style="width:370px;">
                <input type="text" name="phoneNumber" lay-verify="required" autocomplete="off" placeholder="请输入联系电话"
                       class="layui-input"><span style="color: red;">电话格式:例 028-38221918 手机格式：例 18284521115</span>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">公司网址</label>
            <div class="layui-input-block">
                <input type="text" name="companyWebSite" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入公司网址"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">经营范围</label>
            <div class="layui-input-block">
                <input type="text" name="businessScope" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入经营范围"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">注册资本</label>
            <div class="layui-input-block">
                <input type="text" name="registeredCapital" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入注册资本"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">经营状态</label>
            <div class="layui-input-block">
                <input type="text" name="businessStatus" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入经营状态"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">成立日期</label>
            <div class="layui-input-block">
                <input type="text" name="registerDate" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入成立日期"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">信用代码</label>
            <div class="layui-input-block">
                <input type="text" name="creditCode" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入信用代码"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">纳税人识别号</label>
            <div class="layui-input-block">
                <input type="text" name="registrationNumber" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入纳税人识别号"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">注册号</label>
            <div class="layui-input-block">
                <input type="text" name="registrID" <#--lay-verify="required"--> autocomplete="off" placeholder="请输入注册号"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">组织机构代码</label>
            <div class="layui-input-block">
                <input type="text" name="organizationCode" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入组织机构代码"
                       class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">公司类型</label>
            <div class="layui-input-block">
                <input type="text" name="companyType" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入公司类型"
                       class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">行业</label>
            <div class="layui-input-block">
                <input type="text" name="industry" <#--lay-verify="required"--> autocomplete="off" placeholder="请输入行业"
                       class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">核准日期</label>
            <div class="layui-input-block">
                <input type="text" name="approvedDate" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入核准日期"
                       class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">登记机关</label>
            <div class="layui-input-block">
                <input type="text" name="registrationAuthority" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入登记机关"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">人员规模</label>
            <div class="layui-input-block">
                <input type="text" name="staffNumber" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入人员规模"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">营业期限</label>
            <div class="layui-input-block">
                <input type="text" name="termOperation" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入营业期限"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">备注</label>
            <div class="layui-input-block">
                <input type="text" name="remark" <#--lay-verify="required"--> autocomplete="off" placeholder="请输入备注"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="editeditsubmitfilter">立即提交</button>
            </div>
        </div>
    </form>
</div>
<#--添加表单-->
<div id="addeditformdivid" hidden="" class="layui-fluid" style="margin: 15px;">
    <form class="layui-form layui-form-pane layui-personal" action="" id="addeditformid">
        <div class="layui-form-item">
            <label class="layui-form-label xrequired">名称</label>
            <div class="layui-input-block">
                <input type="text" name="subsidiaryName" lay-verify="required" autocomplete="off"
                       placeholder="请输入名称"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">简称</label>
            <div class="layui-input-block">
                <input type="text" name="abbreviation" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入简称"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">曾用名</label>
            <div class="layui-input-block">
                <input type="text" name="formerName" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入曾用名"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">英文名</label>
            <div class="layui-input-block">
                <input type="text" name="englishName" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入英文名"
                       class="layui-input">
            </div>
        </div>


        <div class="layui-form-item" id="companyDiv">
            <label class="layui-form-label">当前总公司</label>
            <div class="layui-input-block">
                <span id="companyName" name="companyName"></span>
            </div>
        </div>

        <div class="layui-form-item" id="companySelectDiv">
            <label class="layui-form-label xrequired">总公司</label>
            <div class="layui-input-inline" style="width:270px;">
                <select name="parentCompany" id="parentCompanyAdd" lay-filter="paytype_s"
                        lay-verify="required">
                </select>
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">法人</label>
            <div class="layui-input-block">
                <input type="text" name="corporate" <#--lay-verify="required"--> autocomplete="off" placeholder="请输入法人"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label xrequired">K3编号</label>
            <div class="layui-input-block">
                <input type="text" name="k3Number" lay-verify="required" autocomplete="off"
                       placeholder="请输入公司英文名"
                       class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label xrequired">选择地区</label>
            <div class="layui-input-block">
                <div class="layui-inline">
                    <select name="provinceId" id="provinceAdd" class="province" lay-filter="province">
                    </select>
                </div>
                <div class="layui-inline">
                    <select name="cityId" class="city" lay-filter="city">
                    </select>
                </div>
                <div class="layui-inline" id="countyAdd">
                    <select name="countyId" class="county" lay-filter="county">
                    </select>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label xrequired">公司所在地址</label>
            <div class="layui-input-block">
                <input type="text" name="companyDetailedAddress" lay-verify="required" autocomplete="off"
                       placeholder="请输入详细地址"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label xrequired">联系电话</label>
            <div class="layui-input-block" style="width:370px;">
                <input type="text" name="phoneNumber" lay-verify="required" autocomplete="off" placeholder="请输入联系电话"
                       class="layui-input"><span style="color: red;">电话格式:例 028-38221918 手机格式：例 18284521115</span>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">公司网址</label>
            <div class="layui-input-block">
                <input type="text" name="companyWebSite" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入公司网址"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">经营范围</label>
            <div class="layui-input-block">
                <input type="text" name="businessScope" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入经营范围"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">注册资本</label>
            <div class="layui-input-block">
                <input type="text" name="registeredCapital" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入注册资本"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">经营状态</label>
            <div class="layui-input-block">
                <input type="text" name="businessStatus" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入经营状态"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">成立日期</label>
            <div class="layui-input-block">
                <input type="text" name="registerDate" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入成立日期"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">信用代码</label>
            <div class="layui-input-block">
                <input type="text" name="creditCode" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入信用代码"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">纳税人识别号</label>
            <div class="layui-input-block">
                <input type="text" name="registrationNumber" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入纳税人识别号"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">注册号</label>
            <div class="layui-input-block">
                <input type="text" name="registrID" <#--lay-verify="required"--> autocomplete="off" placeholder="请输入注册号"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">组织机构代码</label>
            <div class="layui-input-block">
                <input type="text" name="organizationCode" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入组织机构代码"
                       class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">公司类型</label>
            <div class="layui-input-block">
                <input type="text" name="companyType" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入公司类型"
                       class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">行业</label>
            <div class="layui-input-block">
                <input type="text" name="industry" <#--lay-verify="required"--> autocomplete="off" placeholder="请输入行业"
                       class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">核准日期</label>
            <div class="layui-input-block">
                <input type="text" name="approvedDate" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入核准日期"
                       class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">登记机关</label>
            <div class="layui-input-block">
                <input type="text" name="registrationAuthority" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入登记机关"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">人员规模</label>
            <div class="layui-input-block">
                <input type="text" name="staffNumber" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入人员规模"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">营业期限</label>
            <div class="layui-input-block">
                <input type="text" name="termOperation" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入营业期限"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">备注</label>
            <div class="layui-input-block">
                <input type="text" name="remark" <#--lay-verify="required"--> autocomplete="off" placeholder="请输入备注"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="addeditsubmitfilter">立即提交</button>
                <button id="reset" type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

<#--查看表单-->
<form class="layui-form layui-form-pane layui-personal" id="showForm" action="" lay-filter="exampleShow"
      method="post" hidden="true">
    <div class="layui-form-item">
        <label class="layui-form-label">公司名</label>
        <span name="subsidiaryName"></span>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">公司简称</label>
        <span name="abbreviation"></span>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">曾用名</label>
        <span name="formerName"></span>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">总公司</label>
        <span name="parentCompany"></span>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">英文名</label>
        <span name="englishName"></span>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">法人</label>
        <span name="corporate"></span>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">选择地区</label>
        <div class="layui-input-block">
            <div class="layui-inline">
                <select name="province" class="province" lay-filter="province">
                </select>
            </div>
            <div class="layui-inline">
                <select name="city" class="city" lay-filter="city">
                </select>
            </div>
            <div class="layui-inline">
                <select name="county" class="county" lay-filter="county">
                </select>
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">详细地址</label>
        <span name="companyDetailedAddress"></span>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">联系电话</label>
        <span name="phoneNumber"></span>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">公司网址</label>
        <span name="companyWebSite"></span>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">经营范围</label>
        <span name="businessScope"></span>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">注册资本</label>
        <span name="registeredCapital"></span>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">经营状态</label>
        <span name="businessStatus"></span>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">成立日期</label>
        <span name="registerDate"></span>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">信用代码</label>
        <span name="creditCode"></span>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">纳税人识别号</label>
        <span name="registrationNumber"></span>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">注册号</label>
        <span name="registrID"></span>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">组织机构代码</label>
        <span name="organizationCode"></span>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">公司类型</label>
        <span name="companyType"></span>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">行业</label>
        <span name="industry"></span>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">核准日期</label>
        <span name="approvedDate"></span>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">登记机关</label>
        <span name="registrationAuthority"></span>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">人员规模</label>
        <span name="staffNumber"></span>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">营业期限</label>
        <span name="termOperation"></span>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">备注</label>
        <span name="remark"></span>
    </div>
</form>

<#--查看门店表单-->
<form class="layui-form layui-form-pane layui-personal" id="showStoresForm" action="" lay-filter="example" method="post"
      hidden="true">
    <table id="showStoresTable" lay-filter="demo"></table>
</form>

<script>
    //列表显示
    var openId = null;
    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#subCompany'
            , url: storeHost + "/manage/company/selectSubsidiaryList"
            , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , page: true          //显示分页默认不显示
            , method: 'post'
            , id: "subCompanyReload"
            , loading: true
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
            , cols: [[
                {type: 'checkbox', fixed: 'left', width: 40}
                , {field: 'subsidiaryName', title: '子公司名称', fixed: 'left'}
                , {field: 'phoneNumber', title: '联系电话'}
                , {fixed: 'right', title: '操作', align: 'center', toolbar: '#barDemo'}
            ]]
        });
    });

    //增删改查操作实现
    layui.use(['table', 'layer', 'jquery', 'form', 'element'], function () {
        var table = layui.table,
                layer = layui.layer,
                $ = layui.jquery,
                form = layui.form,
                element = layui.element;
        loadCompanyEdit(form);
        loadCompanyAdd(form);
        //监听表格复选框选择
        table.on('checkbox(demo)', function (obj) {
            console.log(obj)
        });
        /*  form.on('select(provinceAdd)', function (data) {
              if (data.value != "110000" && data.value != "120000" && data.value != "310000" && data.value != "500000") {
                  $("#countyAdd").attr("style","display:none;");
              }else{
                  $("#countyAdd").attr("style","display:block;");
              }
              console.log(data);
          });*/
        //监听工具条
        var data = null;
        table.on('tool(demo)', function (obj) {
            data = obj.data;
            if (obj.event === 'detail') {
                //查询赋值
                query(form, data);
                /*监听省select*/
                form.on('select(province)', function (data) {
                    cityChange(form, data.value, "", "")
                });
                /*监听市select*/
                form.on('select(city)', function (data) {
                    countyChange(form, data.value, "")
                });
                layerShow(data, table, $)
            } else if (obj.event === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    layerDelete(data, table, $);
                    obj.del();
                    layer.close(index);
                });
            } else if (obj.event === 'edit') {
                //查询赋值
                query(form, data);
                /*监听省select*/
                form.on('select(province)', function (data) {
                    if (data.value != "110000" && data.value != "120000" && data.value != "310000" && data.value != "500000") {
                        $("#countyEdit").attr("style", "display:none;");
                    } else {
                        $("#countyEdit").attr("style", "display:block;");
                    }
                    cityChange(form, data.value, "", "")
                });
                /*监听市select*/
                form.on('select(city)', function (data) {
                    countyChange(form, data.value, "")
                });
                layerShowAndEdit(data, table, $);
            } else if (obj.event === 'selectStores') {
                showStores(form, layer, data, table, $);
            } else if (obj.event === 'insertStock') {
                //查询此总公司是否有管理员
                layer.confirm('是否要生成仓库', function (index) {
                    insertStock(data, table, $);
                    layer.close(index);
                });
            }else if (obj.event === 'insertHeSuanFanWei') {
                //查询此总公司是否有管理员
                layer.confirm('是否要生成核算范围', function (index) {
                    insertHeSuanFanWei(data, table, $);
                    layer.close(index);
                });
            }else if (obj.event === 'insertZhangBu') {
                //查询此总公司是否有管理员
                layer.confirm('是否要生成账簿', function (index) {
                    insertZhangBu(data, table, $);
                    layer.close(index);
                });
            }


        });

        var $ = layui.$, active = {
            search: function () {
                var keyWordName = $(".demoTable input[name='keyWordName']").val();
                table.render({
                    elem: '#subCompany'
                    , url: storeHost + "/manage/company/selectSubsidiaryList"
                    , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    , page: true          //显示分页默认不显示
                    , method: 'post'
                    , request: {
                        pageName: 'pageNum', //页码的参数名称，默认：page
                        limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    }
                    , where: {
                        keyWordName: keyWordName
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
                        , {field: 'subsidiaryName', title: '子公司名称', fixed: 'left'}
                        , {field: 'phoneNumber', title: '联系电话'}
                        , {fixed: 'right', title: '操作', align: 'center', toolbar: '#barDemo'}
                    ]]
                });
            }
        };

        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        //监听添加提交-添加子公司
        form.on('submit(addeditsubmitfilter)', function () {
            //为了防止form中的id值被重置后置空,将编辑的id存放在label中
            $("#editid").val($("#editlabelid").html());
            $("#editlabelid").html("");
            var index = null

            $.ajax({
                type: "POST",
                url: storeHost + "/manage/company/insertSubsidiary",
                data: $('#addeditformid').serialize() + "&createOperator=" + "${currentUser.trueName!}",
                async: true,
                beforeSend: function () {
                     index = layer.load(3, {
                        shade: [0.9,'#fff'] //0.1透明度的白色背景
                    });
                },
                error: function (request) {
                    layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
                    layer.close(index);    //返回数据关闭loading
                },
                success: function (data) {
                    layer.close(index);    //返回数据关闭loading
                    if (data.responseStatusType.message == 'Failure') {
                        layer.alert(data.responseStatusType.error.errorMsg);
                        layer.close(index);    //返回数据关闭loading
                    }
                    if (data.responseStatusType.message == 'Success') {
                        layer.open({
                            title: '添加'
                            , content: '添加成功！' + data.result
                            , btn: ["关闭"]
                            , btn2: function (index) {
                                layer.close(index);
                            }, end: function () {
                                table.reload("subCompanyReload");
                                layer.close(openId);
                            }
                        });
                        //重新加载表格
                        layui.form.render();
                    }
                }
            });
            return false;
        });

        //监听修改提交-修改子公司
        form.on('submit(editeditsubmitfilter)', function () {
            $.ajax({
                type: "POST",
                url: storeHost + "/manage/company/updateSubsidiaryByID",
                data: $('#editForm').serialize() + "&modifyOperator=" + "${currentUser.trueName!}",
                async: false,
                error: function (request) {
                    layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
                },
                success: function (data) {
                    if (data.responseStatusType.message == 'Failure') {
                        layer.alert(data.responseStatusType.error.errorMsg);
                    }
                    if (data.responseStatusType.message == 'Success') {
                        layer.open({
                            title: '修改'
                            , content: '修改成功！' + data.result
                            , btn: ["关闭"]
                            , btn2: function (index) {
                                layer.close(index);
                            }, end: function () {
                                table.reload("subCompanyReload");
                                layer.close(openId);
                            }
                        });
                        //重新加载表格
                        layui.form.render();
                    }
                }
            });
            return false;
        });
    });

    //删除子公司按钮事件
    function layerDelete(data, table, $) {
        //删除数据库数据
        var url = storeHost + "/manage/company/deleteSubsidiaryByID";
        var data = {
            subsidiaryId: data.subsidiaryId,
            modifyOperator: "${currentUser.trueName!}"
        };
        $.post(url, data, function (res) {
            if (res.responseStatusType.message == "Success") {
                layer.open({
                    title: '删除'
                    , content: '删除成功！'
                });
                //同时删除仓库
                delStock(data.subsidiaryId, 2);
                //重新加载表格
                table.reload("subCompanyReload");
            } else {
                layer.open({
                    title: '删除'
                    , content: '删除失败！'
                });
            }
        })
    }

    //修改子公司按钮事件
    function layerShowAndEdit(data, table, $) {
        //页面弹框
        openId = layer.open({
            type: 1,
            title: '修改子公司',
            content: $('#editeditformdivid'),
            area: ['900px', '500px'],
            closeBtn: 1,
            scrollbar: true,
            /*btn: ['提交', '取消'],*/
            yes: function (index, layero) {

            },
            btn2: function () {
                layer.close(a1);
            },
            success: function (layero) {
                if ("${currentUser.companyType!}" === "1") {//总公司添加
                    $("#companySelectDivEdit").css("display", "none");
                    $("#companyDivEdit").css("display", "block");
                    $("#companyNameEdit").html("${currentUser.companyName!}");
                    $("#parentCompanyEdit").removeAttr("lay-verify")
                } else if ("${currentUser.companyType!}" === "0") {//系统管理添加
                    $("#companySelectDivEdit").css("display", "block");
                    $("#companyDivEdit").css("display", "none");
                    $("#parentCompanyEdit").attr("lay-verify", "required")
                }


                if ($("#provinceEdit").val() != "110000" && $("#provinceEdit").val() != "120000" && $("#provinceEdit").val() != "310000" && $("#provinceEdit").val() != "500000") {
                    $("#countyEdit").attr("style", "display:none;");
                } else {
                    $("#countyEdit").attr("style", "display:block;");
                }
                layero.find("input[name='subsidiaryId']").val(data.subsidiaryId);
                layero.find("input[name='subsidiaryName']").val(data.subsidiaryName);
                layero.find("input[name='abbreviation']").val(data.abbreviation);
                layero.find("input[name='formerName']").val(data.formerName);
                layero.find("input[name='englishName']").val(data.englishName);
                layero.find("input[name='parentCompanyEdit']").val(data.parentCompany);
                layero.find("input[name='corporate']").val(data.corporate);
                layero.find("input[name='companyDetailedAddress']").val(data.companyDetailedAddress);
                layero.find("input[name='phoneNumber']").val(data.phoneNumber);
                layero.find("input[name='companyWebSite']").val(data.companyWebSite);
                layero.find("input[name='businessScope']").val(data.businessScope);
                layero.find("input[name='registeredCapital']").val(data.registeredCapital);
                layero.find("input[name='businessStatus']").val(data.businessStatus);
                layero.find("input[name='registerDate']").val(data.registerDate);
                layero.find("input[name='creditCode']").val(data.creditCode);
                layero.find("input[name='registrationNumber']").val(data.registrationNumber);
                layero.find("input[name='registrID']").val(data.registrID);
                layero.find("input[name='organizationCode']").val(data.organizationCode);
                layero.find("input[name='companyType']").val(data.companyType);
                layero.find("input[name='industry']").val(data.industry);
                layero.find("input[name='approvedDate']").val(data.approvedDate);
                layero.find("input[name='registrationAuthority']").val(data.registrationAuthority);
                layero.find("input[name='staffNumber']").val(data.staffNumber);
                layero.find("input[name='termOperation']").val(data.termOperation);
                layero.find("input[name='remark']").val(data.remark);
                layui.form.val('example', {
                    "parentCompanyEdit": data.parentCompany
                });
                layui.form.render();
            }, end: function () {
                window.location.reload();
            }

        });
    }

    //查看子公司按钮事件
    function layerShow(data, table, $) {
        //页面弹框
        var a2 = layer.open({
            type: 1,
            title: '子公司详情',
            content: $('#showForm'),
            area: ['900px', '500px'],
            scrollbar: true,
            closeBtn: 1,
            btn: ['关闭'],
            btn2: function () {
                layer.close(a2);
            },
            success: function (layero) {
                layero.find("span[name='subsidiaryId']").text(data.subsidiaryId);
                layero.find("span[name='subsidiaryName']").text(data.subsidiaryName);
                layero.find("span[name='abbreviation']").text(data.abbreviation);
                layero.find("span[name='formerName']").text(data.formerName);
                layero.find("span[name='englishName']").text(data.englishName);
                layero.find("span[name='parentCompany']").text(data.parentCompanyName);
                layero.find("span[name='corporate']").text(data.corporate);
                layero.find("span[name='companyDetailedAddress']").text(data.companyDetailedAddress);
                layero.find("span[name='phoneNumber']").text(data.phoneNumber);
                layero.find("span[name='companyWebSite']").text(data.companyWebSite);
                layero.find("span[name='businessScope']").text(data.businessScope);
                layero.find("span[name='registeredCapital']").text(data.registeredCapital);
                layero.find("span[name='businessStatus']").text(data.businessStatus);
                layero.find("span[name='registerDate']").text(data.registerDate);
                layero.find("span[name='creditCode']").text(data.creditCode);
                layero.find("span[name='registrationNumber']").text(data.registrationNumber);
                layero.find("span[name='registrID']").text(data.registrID);
                layero.find("span[name='organizationCode']").text(data.organizationCode);
                layero.find("span[name='companyType']").text(data.companyType);
                layero.find("span[name='industry']").text(data.industry);
                layero.find("span[name='approvedDate']").text(data.approvedDate);
                layero.find("span[name='registrationAuthority']").text(data.registrationAuthority);
                layero.find("span[name='staffNumber']").text(data.staffNumber);
                layero.find("span[name='termOperation']").text(data.termOperation);
                layero.find("span[name='remark']").text(data.remark);
                layui.form.render();
            }, end: function () {
                window.location.reload();
            }

        });
    }

    //添加按钮点击事件
    $("#add").click(function () {
        $("#reset").click();//重置表单(新建时在进入表单前要重置一下表单的内容，不然表单打开后会显示上一次的表单的内容。这里调用表单中重置按钮的点击方法来重置)
        openId = layer.open({//开启表单弹层
            // // skin: 'layui-layer-molv',
            area: '60%',
            type: 1,
            title: '新建子公司',
            content: $('#addeditformdivid'), //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
            success: function () {
                if("${currentUser.companyType!}"==1){
                    //如果当前是总公司创建
                    $("#parentCompanyAdd").val("${currentUser.companyId!}")
                }
                if ("${currentUser.companyType!}" === "1") {//总公司添加
                    $("#companySelectDiv").css("display", "none");
                    $("#companyDiv").css("display", "block");
                    $("#companyName").html("${currentUser.companyName!}");
                    $("#parentCompanyAdd").removeAttr("lay-verify")
                } else if ("${currentUser.companyType!}" === "0") {//系统管理添加
                    $("#companySelectDiv").css("display", "block");
                    $("#companyDiv").css("display", "none");
                    $("#parentCompanyAdd").attr("lay-verify", "required")
                }


                var form = layui.form;
                var data = {"provinceId": "110000", "cityId": "110100", "countyId": "110101"}//默认北京

                if ($("#provinceAdd").val() != "110000" && $("#provinceAdd").val() != "120000" && $("#provinceAdd").val() != "310000" && $("#provinceAdd").val() != "500000") {
                    $("#countyAdd").attr("style", "display:none;");
                } else {
                    $("#countyAdd").attr("style", "display:block;");
                }


                //查询赋值
                query(form, data);
                /*监听省select*/
                form.on('select(province)', function (data) {
                    if (data.value != "110000" && data.value != "120000" && data.value != "310000" && data.value != "500000") {
                        $("#countyAdd").attr("style", "display:none;");
                    } else {
                        $("#countyAdd").attr("style", "display:block;");
                    }
                    cityChange(form, data.value, "", "")
                });
                /*监听市select*/
                form.on('select(city)', function (data) {
                    countyChange(form, data.value, "")
                });
            }

        });
    });


    //加载总公司信息-修改
    function loadCompanyEdit(form) {
        //加载店铺列表信息
        var url = storeHost + "/manage/company/selectCompanyListNoPage";
        var data = {};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("parentCompanyEdit"); //server为select定义的id
                server.innerHTML = "<option value='' selected='selected'>请选择</option>";
                for (var p in list) {
                    var option = document.createElement("option");  // 创建添加option属性
                    option.setAttribute("value", list[p].companyId); // 给option的value添加值
                    option.innerText = list[p].companyName;     // 打印option对应的纯文本
                    server.appendChild(option);           //给select添加option子标签
                }
                form.render();
            } else {

            }
        })
    }


    //加载总公司信息-添加
    function loadCompanyAdd(form) {
        //加载店铺列表信息
        var url = storeHost + "/manage/company/selectCompanyListNoPage";
        var data = {};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("parentCompanyAdd"); //server为select定义的id
                server.innerHTML = "<option value='' selected='selected'>请选择</option>";
                for (var p in list) {
                    var option = document.createElement("option");  // 创建添加option属性
                    option.setAttribute("value", list[p].companyId); // 给option的value添加值
                    option.innerText = list[p].companyName;     // 打印option对应的纯文本
                    server.appendChild(option);           //给select添加option子标签
                }
                form.render();
            } else {

            }
        })
    }

    //加载子公司下的门店信息
    function showStores(form, layer, data, table, $) {
        var a1 = layer.open({
            type: 1,
            title: '查看下属门店',
            content: $('#showStoresForm'),
            area: ['900px', '270px'],
            closeBtn: 1,
            scrollbar: true,
            btn: ['关闭'],
            btn2: function () {
                layer.close(a1);
            },
            success: function (layero) {
                layui.use('table', function () {
                    var table = layui.table;
                    table.render({
                        elem: '#showStoresTable'
                        , url: storeHost + "/manage/store/selectStoreListBySubCompany"
                        , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                        , page: true          //显示分页默认不显示
                        , method: 'post'
                        , id: "showStoresTableReload"
                        , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                            return {
                                "code": 0, //解析接口状态
                                "msg": "", //解析提示文本
                                "count": res.result == null ? 0 : res.result.total, //解析数据长度
                                "data": res.result == null ? 0 : res.result.list //解析数据列表
                            };
                        }
                        , where: {
                            subsidiaryId: data.subsidiaryId
                        }
                        , cols: [[
                            {type: 'checkbox', fixed: 'left', width: 40}
                            , {field: 'storeId', title: '门店id', fixed: 'left'}
                            , {field: 'name', title: '门店名称'}
                            , {field: 'code', title: '门店编号'}
                            , {field: 'phoneNumber', title: '门店联系电话'}
                        ]]
                    });
                });
                form.render();
            }
        });
    }

    //删除仓库
    function delStock(companyId, companyType) {
        //加载店铺列表信息
        var url = productHost + "/stock/delStockById";
        var data = {"companyId": companyId, "companyType": companyType};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var a1 = layer.open({
                    title: '删除',
                    content: "门店删除成功-仓库删除成功",
                    btn: ["确定", "关闭"],
                    yes: function (index) {
                        layer.close(index); //如果设定了yes回调，需进行手工关闭
                    },
                    btn2: function (index) {
                    }, end: function () {
                        layer.close(a1);
                    }
                });
            } else {

            }
        })
    }

    //生成仓库
    function insertStock(data, table, $) {
        var url = productHost + "/stock/addStock";
        var data = {
            companyId: data.subsidiaryId,
            companyType: 2,
            company: data.subsidiaryName,
            k3Number:data.k3Number,
            createOperator: "${currentUser.trueName!}"
        };
        var index = null
        $.ajax({
            type: "POST",
            url : url,
            data: data,
            async: true,
            beforeSend: function () {
                index = layer.load(3, {
                    shade: [0.9,'#fff'] //0.1透明度的白色背景
                });
            },
            error: function (request) {
                layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
                layer.close(index);    //返回数据关闭loading
            },
            success: function (data) {
                layer.close(index);    //返回数据关闭loading
                if (data.responseStatusType.message == 'Failure') {
                    layer.alert(data.responseStatusType.error.errorMsg);
                    layer.close(index);    //返回数据关闭loading
                }
                if (data.responseStatusType.message == 'Success') {
                    layer.open({
                        title: '添加'
                        , content: data.result
                        , btn: ["关闭"]
                        , btn2: function (index) {
                            layer.close(index);
                        }, end: function () {
                            table.reload("companyReload");
                            layer.close(openId);
                        }
                    });
                    //重新加载表格
                    layui.form.render();
                }
            }
        });
    }

    //生成核算范围
    function insertHeSuanFanWei(data, table, $) {
        var url = storeHost + "/manage/company/insertHeSuanFanWei";
        var data = {
            parentCompany: data.parentCompany,
            subsidiaryName: data.subsidiaryName,
            subsidiaryId: data.subsidiaryId,
            k3Number: data.k3Number
        };
        var index = null
        $.ajax({
            type: "POST",
            url : url,
            data: data,
            async: true,
            beforeSend: function () {
                index = layer.load(3, {
                    shade: [0.9,'#fff'] //0.1透明度的白色背景
                });
            },
            error: function (request) {
                layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
            },
            success: function (data) {
                layer.close(index);    //返回数据关闭loading
                if (data.responseStatusType.message == 'Failure') {
                    layer.alert(data.responseStatusType.error.errorMsg);
                }
                if (data.responseStatusType.message == 'Success') {
                    layer.open({
                        title: '生成核算范围'
                        , content: data.result
                        , btn: ["关闭"]
                        , btn2: function (index) {
                            layer.close(index);
                        }, end: function () {
                            table.reload("companyReload");
                            layer.close(openId);
                        }
                    });
                    //重新加载表格
                    layui.form.render();
                }
            }
        });
    }

    //生成账簿
    function insertZhangBu(data, table, $) {
        var url = storeHost + "/manage/company/insertZhangBu";
        var data = {
            companyId: data.subsidiaryId,
            companyType: "2"
        };
        var index = null
        $.ajax({
            type: "POST",
            url : url,
            data: data,
            async: true,
            beforeSend: function () {
                index = layer.load(3, {
                    shade: [0.9,'#fff'] //0.1透明度的白色背景
                });
            },
            error: function (request) {
                layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
                layer.close(index);    //返回数据关闭loading
            },
            success: function (data) {
                layer.close(index);    //返回数据关闭loading
                if (data.responseStatusType.message == 'Failure') {
                    layer.alert(data.responseStatusType.error.errorMsg);
                    layer.close(index);    //返回数据关闭loading
                }
                if (data.responseStatusType.message == 'Success') {
                    layer.open({
                        title: '生成核算范围'
                        , content: data.result
                        , btn: ["关闭"]
                        , btn2: function (index) {
                            layer.close(index);
                        }, end: function () {
                            table.reload("companyReload");
                            layer.close(openId);
                        }
                    });
                    //重新加载表格
                    layui.form.render();
                }
            }
        });
    }


</script>


</body>
</html>