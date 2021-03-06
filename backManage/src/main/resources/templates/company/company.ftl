<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>总公司管理</title>
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
        .layui-form-select dl dd {
            cursor: pointer;
            width: 270px;
        }

        label.xrequired:before {
            content: '* ';
            color: red;
        }
    </style>
</head>
<body>

<div class="layui-fluid">
    <div class="demoTable layui-form">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">公司名称</label>
                <div class="layui-input-inline">
                    <input class="layui-input" type="text" name="companyNameKeyword" autocomplete="off"
                           placeholder="请输入公司名称">
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
    <table id="company" lay-filter="demo"></table>
</div>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <#--<a class="layui-btn layui-btn-xs" lay-event="editDataCentre">修改数据中心</a>-->
    <#-- <a class="layui-btn layui-btn-xs" lay-event="insertZhangBu">生成账簿</a>-->
        <a class="layui-btn layui-btn-xs" lay-event="insertBankAccount">生成银行账号信息</a>
        <a class="layui-btn layui-btn-xs" lay-event="updateAdminPassword">修改管理员密码</a>
    <#--<a class="layui-btn layui-btn-xs" lay-event="insertStock">生成仓库</a>-->
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script type="text/html" id="dataCentreDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="confire" id="confire">确定</a>
</script>
<#--修改表单-->
<div class="layui-fluid" id="editDiv" hidden="" style="margin: 15px;">
    <form class="layui-form layui-form-pane layui-personal" id="editForm" action="" lay-filter="example" method="post">
        <div class="layui-form-item" hidden="false">
            <label class="layui-form-label">公司id</label>
            <div class="layui-input-block">
                <input type="text" name="companyId" <#--lay-verify="required"--> autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label xrequired">公司名称</label>
            <div class="layui-input-block">
                <input type="text" name="companyName" lay-verify="required" autocomplete="off" placeholder="请输入公司名称"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">公司简称</label>
            <div class="layui-input-block">
                <input type="text" name="abbreviation" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入公司简称"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">公司曾用名</label>
            <div class="layui-input-block">
                <input type="text" name="formerName" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入公司曾用名"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">公司英文名</label>
            <div class="layui-input-block">
                <input type="text" name="englishName" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入公司英文名"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">公司法人</label>
            <div class="layui-input-block">
                <input type="text" name="corporate" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入公司法人"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label xrequired">公司所在地</label>
            <div class="layui-input-block">
                <div class="layui-inline">
                    <select name="provinceId" class="province" id="provinceEdit" lay-filter="province">
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
            <label class="layui-form-label xrequired">详细地址</label>
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
                       placeholder="请输入公司经营范围"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">注册资本</label>
            <div class="layui-input-block">
                <input type="text" name="registeredCapital" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入公司注册资本"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">经营状态</label>
            <div class="layui-input-block">
                <input type="text" name="businessStatus" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入公司经营状态"
                       class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">成立日期</label>
            <div class="layui-input-block">
                <input name="registerDate" type="text" class="layui-input" id="registerDateEdit" placeholder=" - ">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">信用代码</label>
            <div class="layui-input-block">
                <input type="text" name="creditCode" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入公司信用代码"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">纳税人识别号</label>
            <div class="layui-input-block">
                <input type="text" name="registrationNumber" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入公司纳税人识别号"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">注册号</label>
            <div class="layui-input-block">
                <input type="text" name="registrID" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入公司注册号"
                       class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">组织机构代码</label>
            <div class="layui-input-block">
                <input type="text" name="organizationCode" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入公司组织机构代码"
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
                <input type="text" name="industry" <#--lay-verify="required"--> autocomplete="off" placeholder="请输入公司行业"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">核准日期</label>
            <div class="layui-input-block">
                <input name="approvedDate" type="text" class="layui-input" id="approvedDateEdit" placeholder=" - ">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">登记机关</label>
            <div class="layui-input-block">
                <input type="text" name="registrationAuthority" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入公司登记机关"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">人员规模</label>
            <div class="layui-input-block">
                <input type="text" name="staffNumber" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入公司人员规模"
                       class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">营业期限</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input" id="termOperationEdit" name="termOperation" placeholder=" - ">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">备注</label>
            <div class="layui-input-block">
                <input type="text" name="remark" <#--lay-verify="required"--> autocomplete="off" placeholder="请输入备注"
                       class="layui-input">
            </div>
        </div>


        <div class="layui-form-item" id="submit">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="editsubmitfilter">立即提交</button>
                <button id="reset" type="reset" class="layui-btn layui-btn-primary" style="display: none">重置</button>
            </div>
        </div>
    </form>
</div>
<#--添加表单-->
<div class="layui-fluid" id="addDiv" hidden="" style="margin: 15px;">
    <form class="layui-form layui-form-pane layui-personal" id="addForm" action="" lay-filter="example" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label xrequired">公司名称</label>
            <div class="layui-input-block">
                <input type="text" name="companyName" lay-verify="required" autocomplete="off" placeholder="请输入公司名称"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">公司简称</label>
            <div class="layui-input-block">
                <input type="text" name="abbreviation" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入公司简称"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">公司曾用名</label>
            <div class="layui-input-block">
                <input type="text" name="formerName" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入公司曾用名"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">公司英文名</label>
            <div class="layui-input-block">
                <input type="text" name="englishName" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入公司英文名"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">公司法人</label>
            <div class="layui-input-block">
                <input type="text" name="corporate" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入公司法人"
                       class="layui-input">
            </div>
        </div>

        <fieldset class="layui-elem-field">
            <legend>金蝶k3相关信息</legend>
            <div class="layui-field-box">
                <div class="layui-form-item">
                    <label class="layui-form-label xrequired">数据中心编号</label>
                    <div class="layui-input-block">
                        <input type="text" name="dataCentre" lay-verify="required" autocomplete="off"
                               placeholder="请输入数据中心编号"
                               class="layui-input">
                        <button type="button" class="layui-btn layui-btn-primary layui-btn-sm" id="selectDataCentre">
                            点击查询
                        </button>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label xrequired">数据库名称</label>
                    <div class="layui-input-block">
                        <input type="text" name="dataCentreName" lay-verify="required" autocomplete="off"
                               placeholder="请对应k3数据中心数据库名称"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label xrequired">K3编号</label>
                    <div class="layui-input-block">
                        <input type="text" name="k3Number" lay-verify="required" autocomplete="off"
                               placeholder="请对应k3系统中编号一致 默认为100"
                               class="layui-input">
                    </div>
                </div>


                <div class="layui-form-item">
                    <label class="layui-form-label xrequired">系统用户用户名</label>
                    <div class="layui-input-block">
                        <input type="text" name="dataCentreUserName" lay-verify="required" autocomplete="off"
                               placeholder="请输入数据中心用户名"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label xrequired">系统用户密码</label>
                    <div class="layui-input-block">
                        <input type="text" name="dataCentrePassword" lay-verify="required" autocomplete="off"
                               placeholder="请输入数据中心密码"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <button type="button" class="layui-btn layui-btn-primary layui-btn-sm" id="adminUserName">测试连接
                    </button>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label xrequired">业务用户用户名</label>
                    <div class="layui-input-block">
                        <input type="text" name="yewuDataCentreUserName" lay-verify="required" autocomplete="off"
                               placeholder="请输入业务用户用户名"
                               class="layui-input">
                    </div>
                </div>
            </div>
        </fieldset>

        <div class="layui-form-item">
            <label class="layui-form-label xrequired">公司所在地</label>
            <div class="layui-input-block">
                <div class="layui-inline">
                    <select name="provinceId" class="province" id="provinceAdd" lay-filter="province">
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
            <label class="layui-form-label xrequired">详细地址</label>
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
                       placeholder="请输入公司经营范围"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">注册资本</label>
            <div class="layui-input-block">
                <input type="text" name="registeredCapital" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入公司注册资本"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">经营状态</label>
            <div class="layui-input-block">
                <input type="text" name="businessStatus" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入公司经营状态"
                       class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">成立日期</label>
            <div class="layui-input-block">
                <input name="registerDate" type="text" class="layui-input" id="registerDateAdd" placeholder=" - ">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">信用代码</label>
            <div class="layui-input-block">
                <input type="text" name="creditCode" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入公司信用代码"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">纳税人识别号</label>
            <div class="layui-input-block">
                <input type="text" name="registrationNumber" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入公司纳税人识别号"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">注册号</label>
            <div class="layui-input-block">
                <input type="text" name="registrID" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入公司注册号"
                       class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">组织机构代码</label>
            <div class="layui-input-block">
                <input type="text" name="organizationCode" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入公司组织机构代码"
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
                <input type="text" name="industry" <#--lay-verify="required"--> autocomplete="off" placeholder="请输入公司行业"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">核准日期</label>
            <div class="layui-input-block">
                <input name="approvedDate" type="text" class="layui-input" id="approvedDateAdd" placeholder=" - ">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">登记机关</label>
            <div class="layui-input-block">
                <input type="text" name="registrationAuthority" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入公司登记机关"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">人员规模</label>
            <div class="layui-input-block">
                <input type="text" name="staffNumber" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入公司人员规模"
                       class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">营业期限</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input" id="termOperationAdd" name="termOperation" placeholder=" - ">
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
                <button class="layui-btn" lay-submit="" lay-filter="addsubmitfilter">立即提交</button>
                <button id="resetAddCompany" type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
<#--修改数据中心-->
<div class="layui-fluid" id="editDataCentreDiv" hidden="" style="margin: 15px;">
    <form class="layui-form layui-form-pane layui-personal" id="editDataCentreForm" action="" lay-filter="example"
          method="post">
        <div class="layui-form-item" hidden="false">
            <label class="layui-form-label">公司id</label>
            <div class="layui-input-block">
                <input type="text" name="companyId" <#--lay-verify="required"--> autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">数据中心编码</label>
            <div class="layui-input-block">
                <input type="text" name="dataCentre" autocomplete="off" placeholder="请输入公司数据中心编码"
                       class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="addsubmitfilterDateCentre">立即提交</button>
                <button id="reset" type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

    <div id="chooseAccountType" hidden="" class="layui-fluid layui-form-pane layui-personal" style="margin: 15px;">
        <form class="layui-form" action="" id="chooseAccountTypeformid" lay-filter="exampleEdit">
            <div class="layui-form-item">
                <label class="layui-form-label" style="width: 147px">选择银行账号类型</label>
                <div class="layui-input-block">
                    <input type="radio" name="accountType" value="1" title="银行账号" checked="" lay-filter="accountType">
                    <input type="radio" name="accountType" value="2" title="现金账号" lay-filter="accountType">
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit="" lay-filter="chooseAccountTypeConfir">确认</button>
                </div>
            </div>
        </form>
    </div>

<div id="passwordEditDiv" hidden="" class="layui-fluid layui-form-pane layui-personal" style="margin: 15px;">
    <form class="layui-form" action="" id="passwordEditForm" name="passwordEditForm"
          lay-filter="exampleEditPassword">
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-inline">
                <input type="text" name="userName" readonly lay-verify="required"
                       placeholder="请输入用户名" autocomplete="off" class="layui-input">
            </div>
        </div>
        <#--  <div class="layui-form-item">
              <label class="layui-form-label">旧密码</label>
              <div class="layui-input-inline">
                  <input type="password" name="oldPassword" required lay-verify="required" placeholder="请输入旧密码"
                         autocomplete="off" class="layui-input">
              </div>
              <div class="layui-form-mid layui-word-aux">旧密码</div>
          </div>-->
        <div class="layui-form-item">
            <label class="layui-form-label">新密码</label>
            <div class="layui-input-inline">
                <input type="password" name="password" required lay-verify="required" placeholder="请输入新密码"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">新密码</div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">再次输入新密码</label>
            <div class="layui-input-inline">
                <input type="password" name="passwordAgain" required lay-verify="required" placeholder="请再次输入新密码"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">再次输入新密码</div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="passwordSubmit">立即提交</button>
            </div>
        </div>
    </form>
</div>


    <div id="chooseDataCentre" hidden="" class="layui-fluid layui-form-pane layui-personal" style="margin: 15px;">
        <div class="demoTable layui-form">
            <table id="dataCentreTable" lay-filter="dataCentreTable"></table>
        </div>
    </div>

    <div id="addFormBankAccountDiv" hidden="" class="layui-fluid layui-form-pane layui-personal" style="margin: 15px;">
        <div class="demoTable layui-form">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">银行账号</label>
                    <div class="layui-input-inline">
                        <input class="layui-input" type="text" name="bankAccountNumber" autocomplete="off"
                               placeholder="请输入账号">
                    </div>
                </div>

                <div class="layui-inline">
                    <button class="layui-btn" data-type="searchBankAccount" id="searchBankAccount"><i
                                class="layui-icon layui-icon-search"></i></button>
                </div>

                <div class="layui-inline">
                    <div class="layui-btn-group demoTable">
                        <button class="layui-btn" id="addBankAccount">增加</button>
                    </div>
                </div>
            </div>
        </div>
        <table id="bankAccount" lay-filter="bankAccount"></table>
    </div>

<#--添加表单-银行账号-->
    <div class="layui-fluid" id="addBankAccountDiv" hidden="" style="margin: 15px;">
        <form class="layui-form layui-form-pane layui-personal" id="addBankAccountForm" action="" lay-filter="example"
              method="post">
            <div class="layui-form-item">
                <label class="layui-form-label xrequired">账户名称</label>
                <div class="layui-input-block">
                    <input type="text" name="accountNameBank" lay-verify="required" autocomplete="off"
                           placeholder="请输入账户名称"
                           class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label xrequired">账户账号</label>
                <div class="layui-input-block">
                    <input type="text" name="accountNumberBank" lay-verify="required" autocomplete="off"
                           placeholder="请输入账户账号"
                           class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label xrequired">请选择账号类型</label>
                <div class="layui-input-inline">
                    <select name="bankType" id="bankType" lay-verify="required" lay-filter="bankType">
                        <option value="WSYH_SYS01">网商银行</option>
                        <option value="WZYH_SYS01">微众银行</option>
                    </select>
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit="" lay-filter="addBankAccountSubmitfilter"
                            id="addBankAccountButton">立即添加
                    </button>
                    <button id="resetBankAccount" type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>

<#--添加表单-现金账号-->
    <div class="layui-fluid" id="addCashAccountDiv" hidden="" style="margin: 15px;">
        <form class="layui-form layui-form-pane layui-personal" id="addCashAccountForm" action="" lay-filter="example"
              method="post">
            <div class="layui-form-item">
                <label class="layui-form-label xrequired">账户名称</label>
                <div class="layui-input-block">
                    <input type="text" name="accountNameCash" lay-verify="required" autocomplete="off"
                           placeholder="请输入账户名称"
                           class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label xrequired">账户账号</label>
                <div class="layui-input-block">
                    <input type="text" name="accountNumberCash" lay-verify="required" autocomplete="off"
                           placeholder="请输入账户账号"
                           class="layui-input">
                </div>
            </div>


            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit="" lay-filter="addCashAccountSubmitfilter"
                            id="addCashAccountButton">立即添加
                    </button>
                    <button id="resetCashAccount" type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>


    <div id="chooseAdminType" hidden="" class="layui-fluid layui-form-pane layui-personal" style="margin: 15px;">
        <form class="layui-form" action="" id="chooseAdminTypeformid" lay-filter="exampleEdit">
            <div class="layui-form-item">
                <label class="layui-form-label" style="width: 147px">选择银行账号类型</label>
                <div class="layui-input-block">
                    <input type="radio" name="adminType" value="1" title="系统管理员" checked="" lay-filter="adminType">
                    <input type="radio" name="adminType" value="2" title="业务管理员" lay-filter="adminType">
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit="" lay-filter="chooseAdminTypeConfir">确认</button>
                </div>
            </div>
        </form>
    </div>




<#--银行现金账号分配中选择分配组织类型-->
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

<script type="text/html" id="barDemoBankAccountDetail">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="allocation">分配</a>
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="cancelAllocation">取消分配</a>
</script>
<script type="text/html" id="barDemoBankAccountDetail2">
    <a class="layui-btn layui-btn-sm layui-btn-normal" lay-event="allocation2" id="allocation2">分配</a>
    <a class="layui-btn layui-btn-sm layui-btn-normal" lay-event="cancelAllocation2" id="cancelAllocation2">取消分配</a>
</script>
<script>
    //列表显示
    var openId = null;
    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#company'
            , url: storeHost + "/manage/company/selectCompanyList"
            , id: "companyReload"
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
                    "data": res.result == null ? 0 : res.result.list //解析数据列表
                };
            }
            , cols: [[
                {type: 'checkbox', fixed: 'left', width: 40}
                , {field: 'companyName', title: '公司名称'}
                , {field: 'corporate', title: '法人'}
                , {fixed: 'right', title: '操作', align: 'center', toolbar: '#barDemo'}

            ]]
        });
    });


    layui.use(['table', 'layer', 'jquery', 'form'], function () {
        var table = layui.table,
            $ = layui.jquery,
            form = layui.form

        //搜索银行现金账号
        $("#searchBankAccount").click(function () {
            var bankAccountNumber = $("input[name='bankAccountNumber']").val();
            table.reload('bankAccountReload', {
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                , where: {
                    accountNumber: bankAccountNumber,
                    accountType: $('input[name="accountType"]:checked').val(),
                    companyId: $("#addFormBankAccountDiv").attr("data-companyId")
                }
            }, 'data');
        });


        //系统用户密码测试连接
        $("#adminUserName").click(function () {
            if ($("input[name='dataCentre']").val() === "") {
                layer.open({
                    title: '提示'
                    , content: "数据中心代码不能为空"
                    , btn: ["关闭"]
                    , btn2: function (index) {
                        layer.close(index);
                    }
                });
                return false
            }
            if ($("input[name='dataCentreUserName']").val() === "") {
                layer.open({
                    title: '提示'
                    , content: "系统管理员用户名不能为空"
                    , btn: ["关闭"]
                    , btn2: function (index) {
                        layer.close(index);
                    }
                });
                return false
            }
            if ($("input[name='dataCentrePassword']").val() === "") {
                layer.open({
                    title: '提示'
                    , content: "系统管理员密码不能为空"
                    , btn: ["关闭"]
                    , btn2: function (index) {
                        layer.close(index);
                    }
                });
                return false
            }

            var url = k3Host + "/k3cloud/login";
            var data = {
                acctID: $("input[name='dataCentre']").val(),
                userName: $("input[name='dataCentreUserName']").val(),
                password: $("input[name='dataCentrePassword']").val(),
                lcid: "2052"
            };
            var index = null;
            $.ajax({
                type: "POST",
                url: url,
                data: data,
                async: true,
                beforeSend: function () {
                    index = layer.load(3, {
                        shade: [0.9, '#fff'] //0.1透明度的白色背景
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
                        if (data.result.isSuccessByAPI == true) {
                            layer.open({
                                title: ''
                                , content: "测试成功"
                                , btn: ["关闭"]
                                , btn2: function (index) {
                                    layer.close(index);
                                }
                            });
                        } else {
                            layer.open({
                                title: ''
                                , content: data.result.message
                                , btn: ["关闭"]
                                , btn2: function (index) {
                                    layer.close(index);
                                }
                            });
                        }
                    }
                }
            });
        });


        //搜索公司
        $("#searchwordcompany").click(function () {
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
            var companyNameKeyWord = $("input[id='word']").val();
            table.reload('companyTableRelod', {
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                , where: {
                    keyWordName: companyNameKeyWord
                },
                url: url
            }, 'data');
        });


        //监听选择银行账号后的确认
        form.on('submit(chooseAccountTypeConfir)', function (data) {
            /*alert($('input[name="accountType"]:checked').val())*/
            layer.open({
                type: 1,
                title: '添加银行账号',
                content: $('#addFormBankAccountDiv'),
                scrollbar: true,
                area: ['878px', '356px'],
                closeBtn: 1,
                btn: ['关闭'],
                btn2: function () {

                },
                success: function (layero) {
                    table.render({
                        elem: '#bankAccount'
                        , url: storeHost + "/manage/company/selectBankAccountList"
                        , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                        , page: true          //显示分页默认不显示
                        , method: 'post'
                        , id: "bankAccountReload"
                        , request: {
                            pageName: 'pageNum', //页码的参数名称，默认：page
                            limitName: 'pageSize' //每页数据量的参数名，默认：limit
                        }
                        , where: {
                            accountType: $('input[name="accountType"]:checked').val(),
                            companyId: $("#addFormBankAccountDiv").attr("data-companyId")
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
                            {field: 'accountName', title: '账户名称'}
                            , {field: 'accountNumber', title: '账户账号'}
                            , {field: 'bankName', title: '银行名称'}
                            , {field: 'k3Id', title: 'k3Id'}
                            , {field: 'accountTypeName', title: '账户类型'}
                            , {
                                fixed: 'right',
                                title: '操作',
                                width: 170,
                                align: 'center',
                                toolbar: '#barDemoBankAccountDetail'
                            }
                        ]]
                    });
                    layui.form.render();
                }
            });
            return false;
        });

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
                            , toolbar: '#barDemoBankAccountDetail2'
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
                                companyId: $("#addFormBankAccountDiv").attr("data-companyId"),
                                companyType: "1"
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
                                        batchAllocationZhi($("#chooseCompanyType").attr("data-accountId"), data, layer, table);
                                    } else if (subCompanyOrStore == 2) {
                                        batchAllocationFen($("#chooseCompanyType").attr("data-accountId"), data, layer, table);
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
                                        batchCancelAllocationZhi($("#chooseCompanyType").attr("data-accountId"), data, layer, table);
                                    } else if (subCompanyOrStore == 2) {
                                        batchCancelAllocationFen($("#chooseCompanyType").attr("data-accountId"), data, layer, table);
                                    }
                                    break;
                            }
                            ;
                            return
                        });

                    })
                }
            });
            return false
        });

        //监听确认-打开修改密码
        form.on('submit(chooseAdminTypeConfir)', function (data) {
            var adminOrYewuAdmin = null;
            var adminUserName = null;
            if ($('input[name="adminType"]:checked').val() === "1") {
                // 如果是系统管理员
                adminOrYewuAdmin = 1;
                adminUserName = $("#chooseAdminType").attr("data-adminUser");
            } else if ($('input[name="adminType"]:checked').val() === "2") {
                //如果是业务管理员
                adminOrYewuAdmin = 2;
                adminUserName = $("#chooseAdminType").attr("data-yewuAdminUser");
            }
            $("#passwordEditDiv").attr("data-adminType",adminOrYewuAdmin);

            var a3 = layer.open({
                type: 1,
                title: '修改密码',
                content: $('#passwordEditDiv'),
                area: ['904px', '500px'],
                id: "passwordEditDivReload",
                closeBtn: 1,
                btn: ['关闭'],
                btn2: function () {
                    layer.close(a3)
                },
                success: function (layero) {

                    form.val('exampleEditPassword', {
                        "userName": adminUserName,
                        "password": "",
                        "passwordAgain": ""
                    })
                }
            });
            return false
        });

        //监听修改密码表单提交事件
        form.on('submit(passwordSubmit)', function (data) {
            var passwordAgain = $("input[name='passwordAgain']").val();
            var password = $("input[name='password']").val();
            if (passwordAgain != password) {
                layer.open({
                    content: "两次输入密码不一致，请重新输入！",
                    yes: function (index, layero) {
                        //do something
                        layer.close(index);
                    }
                });
                return false;
            } else {
                var companyId = $("#chooseAdminType").attr("data-companyId");
                var adminType = $("#passwordEditDiv").attr("data-adminType");
                $.ajax({
                    type: "POST",
                    url: storeHost + "/manage/company/updatePassword",
                    data: $("#passwordEditForm").serialize() + "&companyId=" + companyId+"&adminType=" + adminType,
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
                                title: '修改密码'
                                , content: '修改成功！'
                                , btn: ["关闭"]
                                , yes: function (index) {
                                    layer.closeAll();
                                }
                            });
                        }
                    }
                });

                return false;//防止表单提交
            }
        });
        //监听工具条
        table.on('tool(demo)', function (obj) {
            var data = obj.data;
            if (obj.event === 'detail') {
                $("#submit").attr("style", "display:none;");
                layerShow(form, data, table, $)
            } else if (obj.event === 'del') {
                //查询此总公司是否有管理员
                layer.confirm('真的删除行么', function (index) {
                    layerDelete(data, table, $);
                    obj.del();
                    layer.close(index);
                });
            } else if (obj.event === 'insertStock') {
                //查询此总公司是否有管理员
                layer.confirm('是否要生成仓库', function (index) {
                    insertStock(data, table, $);
                    layer.close(index);
                });
            } else if (obj.event === 'edit') {
                $("#submit").attr("style", "display:block;");
                query(form, data);
                /*监听省select*/
                form.on('select(provinceId)', function (data) {
                    cityChange(form, data.value, "", "")
                });
                form.on('select(province)', function (data) {
                    if (data.value != "110000" && data.value != "120000" && data.value != "310000" && data.value != "500000") {
                        $("#countyEdit").attr("style", "display:none;");
                    } else {
                        $("#countyEdit").attr("style", "display:block;");
                    }
                    cityChange(form, data.value, "", "")
                });
                /*监听市select*/
                form.on('select(cityId)', function (data) {
                    countyChange(form, data.value, "")
                });
                layerShow(form, data, table, $);
            } else if (obj.event === 'editDataCentre') {
                layerShowDataCentre(form, data, table, $);
            } else if (obj.event === 'insertZhangBu') {
                layer.confirm('是否要生成账簿', function (index) {
                    insertZhangBu(data, table, $);
                    layer.close(index);
                });
            } else if (obj.event === 'insertBankAccount') {
                insertBankAccount(data, table, $);
            } else if (obj.event === 'updateAdminPassword') {
                updateAdminPassword(data, table, $);
            }
        });


        //监听工具条-数据中心编码获取
        table.on('tool(dataCentreTable)', function (obj) {
            var data = obj.data;
            if (obj.event === 'confire') {
                $("input[name='dataCentre']").val(data.fdatacenterid);
                $("input[name='dataCentreName']").val(data.fdatabasename);
                selectFaRenOrgNumber(data, table, $);
                layer.close(openDataCentre); //如果设定了yes回调，需进行手工关闭
            }
        });

        var $ = layui.$, active = {
            search: function () {
                var companyNameKeyword = $(".demoTable input[name='companyNameKeyword']").val();
                table.render({
                    elem: '#company'
                    , url: storeHost + "/manage/company/selectCompanyList"
                    , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    , page: true          //显示分页默认不显示
                    , method: 'post'
                    , request: {
                        pageName: 'pageNum', //页码的参数名称，默认：page
                        limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    }
                    , where: {
                        companyNameKeyword: companyNameKeyword
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
                        , {field: 'companyName', title: '公司名称'}
                        , {field: 'corporate', title: '法人'}
                        , {fixed: 'right', title: '操作', align: 'center', toolbar: '#barDemo'}

                    ]]
                });
            }
        };
        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        //修改提交
        form.on('submit(editsubmitfilter)', function (data) {
            /* ----------------提交的代码------------------*/
            var url = storeHost + "/manage/company/updateCompanyByID";
            //下拉框
            var province = $("select[name='provinceId']");
            provinceId = province.find("option:selected").val();
            var city = $("select[name='cityId']");
            cityId = city.find("option:selected").val();
            var county = $("select[name='countyId']");
            countyId = county.find("option:selected").val();
            var params = {
                provinceId: provinceId, //省
                cityId: cityId,//市
                countyId: countyId,//区
                companyId: $("input[name='companyId']").val(),
                companyName: $("input[name='companyName']").val(),
                abbreviation: $("input[name='abbreviation']").val(),
                formerName: $("input[name='formerName']").val(),
                englishName: $("input[name='englishName']").val(),
                corporate: $("input[name='corporate']").val(),
                companyDetailedAddress: $("input[name='companyDetailedAddress']").val(),
                phoneNumber: $("input[name='phoneNumber']").val(),
                companyWebSite: $("input[name='companyWebSite']").val(),
                businessScope: $("input[name='businessScope ']").val(),
                registeredCapital: $("input[name='registeredCapital']").val(),
                businessStatus: $("input[name='businessStatus']").val(),
                registerDate: $("input[name='registerDate']").val(),
                creditCode: $("input[name='creditCode']").val(),
                registrationNumber: $("input[name='registrationNumber']").val(),
                registrID: $("input[name='registrID']").val(),
                organizationCode: $("input[name='organizationCode']").val(),
                companyType: $("input[name='companyType']").val(),
                industry: $("input[name='industry']").val(),
                approvedDate: $("input[name='approvedDate']").val(),
                registrationAuthority: $("input[name='registrationAuthority']").val(),
                staffNumber: $("input[name='staffNumber']").val(),
                termOperation: $("input[name='termOperation']").val(),
                remark: $("input[name='remark']").val(),
                dataCentreUserName: $("input[name='dataCentreUserName']").val(),
                dataCentrePassword: $("input[name='dataCentrePassword']").val(),
                modifyOperator: "${currentUser.trueName!}"
            };
            $.post(url, params, function (res) {
                if (res.responseStatusType.message == "Success") {
                    layer.open({
                        title: '修改'
                        , content: '修改成功！'
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
                } else {
                    layer.msg(res.responseStatusType.error.errorMsg, {
                        time: 20000, //20s后自动关闭
                        btn: ['明白了']
                    });
                }
            });
            return false;
        });

        //修改数据中心提交
        form.on('submit(addsubmitfilterDateCentre)', function (data) {
            /* ----------------提交的代码------------------*/
            var url = storeHost + "/manage/company/updateCompanyByID";
            var params = {
                companyId: $("input[name='companyId']").val(),
                dataCentre: $("input[name='dataCentre']").val(),
                modifyOperator: "${currentUser.trueName!}"
            };
            $.post(url, params, function (res) {
                if (res.responseStatusType.message == "Success") {
                    layer.open({
                        title: '修改'
                        , content: '修改成功！'
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
                } else {
                    layer.msg(res.responseStatusType.error.errorMsg, {
                        time: 20000, //20s后自动关闭
                        btn: ['明白了']
                    });
                }
            });
            return false;
        });


        //添加提交
        form.on('submit(addsubmitfilter)', function (data) {
            //为了防止form中的id值被重置后置空,将编辑的id存放在label中
            $("#editid").val($("#editlabelid").html());
            $("#editlabelid").html("");
            var index = null
            $.ajax({
                type: "POST",
                url: storeHost + "/manage/company/insertCompany",
                data: $('#addForm').serialize() + "&createOperator=" + "${currentUser.trueName!}",
                async: true,
                beforeSend: function () {
                    index = layer.load(3, {
                        shade: [0.9, '#fff'] //0.1透明度的白色背景
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
                            , content: '操作成功！' + data.result
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
            return false;
        });


        //添加银行账号
        var addOpen = null
        $("#addBankAccount").click(function () {
            if ($('input[name="accountType"]:checked').val() == 1) {
                //添加银行账号
                $("#resetBankAccount").click();//重置表单(新建时在进入表单前要重置一下表单的内容，不然表单打开后会显示上一次的表单的内容。这里调用表单中重置按钮的点击方法来重置)
                addOpen = layer.open({//开启表单弹层
                    // skin: 'layui-layer-molv',
                    area: '60%',
                    type: 1,
                    title: '添加银行账号',
                    area: ['514px', '384px'],
                    content: $('#addBankAccountDiv'), //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
                    success: function (layero) {

                    }
                });
            } else {
                //添加现金账号
                $("#resetCashAccount").click();//重置表单(新建时在进入表单前要重置一下表单的内容，不然表单打开后会显示上一次的表单的内容。这里调用表单中重置按钮的点击方法来重置)
                addOpen = layer.open({//开启表单弹层
                    // skin: 'layui-layer-molv',
                    area: '60%',
                    type: 1,
                    title: '添加现金账号',
                    area: ['514px', '384px'],
                    content: $('#addCashAccountDiv'), //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
                    success: function (layero) {

                    }
                });
            }

        });


        //监听添加提交-银行账号
        form.on('submit(addBankAccountSubmitfilter)', function () {
            var bankType = $("select[name='bankType']");
            var bankTypeName = bankType.find("option:selected").text();
            var bankId = bankType.find("option:selected").val();
            var url = storeHost + "/manage/company/addBankAccount";
            var data = {
                "accountName": $("input[name='accountNameBank']").val(),
                "accountNumber": $("input[name='accountNumberBank']").val(),
                "companyId": $("#addFormBankAccountDiv").attr("data-companyId"),
                "accountType": 1,
                "bankId": bankId,
                "bankName": bankTypeName
            };
            $.post(url, data, function (res) {
                if (res.responseStatusType.message == "Success") {
                    layer.open({
                        title: '添加银行账号'
                        , content: res.result
                        , btn: ["确定", "关闭"]
                        , yes: function (index) {
                            layer.close(index); //如果设定了yes回调，需进行手工关闭
                            layer.close(addOpen);
                        }
                    });
                    //重新加载表格
                    table.reload("bankAccountReload");
                } else {
                    layer.msg(res.responseStatusType.error.errorMsg, {
                        time: 20000, //20s后自动关闭
                        btn: ['明白了']
                    });
                }
            })
            return false;
        });
        //监听添加提交-现金账号
        form.on('submit(addCashAccountSubmitfilter)', function () {
            var url = storeHost + "/manage/company/addBankAccount";
            var data = {
                "accountName": $("input[name='accountNameCash']").val(),
                "accountNumber": $("input[name='accountNumberCash']").val(),
                "companyId": $("#addFormBankAccountDiv").attr("data-companyId"),
                "accountType": 2
            };
            $.post(url, data, function (res) {
                if (res.responseStatusType.message == "Success") {
                    layer.open({
                        title: '添加现金账号'
                        , content: res.result
                        , btn: ["确定", "关闭"]
                        , yes: function (index) {
                            layer.close(index); //如果设定了yes回调，需进行手工关闭
                            layer.close(addOpen);
                        }
                    });
                    //重新加载表格
                    table.reload("bankAccountReload");
                } else {
                    layer.msg(res.responseStatusType.error.errorMsg, {
                        time: 20000, //20s后自动关闭
                        btn: ['明白了']
                    });
                }
            })
            return false;
        });

        //监听工具条-银行和现金账号
        var data = null;
        table.on('tool(bankAccount)', function (obj) {
            data = obj.data;
            if (obj.event === 'allocation') {
                openCompanySelectForBankAllot(data, table, 1)
            } else if (obj.event === 'cancelAllocation') {
                openCompanySelectForBankAllot(data, table, 2)
            }
        });
    });


    //打开修改按钮
    function layerShow(form, data, table, $) {
        //页面弹框
        openId = layer.open({
            type: 1,
            title: '修改总公司',
            content: $('#editDiv'),
            area: ['900px', '500px'],
            scrollbar: true,
            closeBtn: 1,
            btn: ['关闭'],
            btn2: function () {
                layer.close(a2)
            },
            success: function () {
                if ($("#provinceEdit").val() != "110000" && $("#provinceEdit").val() != "120000" && $("#provinceEdit").val() != "310000" && $("#provinceEdit").val() != "500000") {
                    $("#countyEdit").attr("style", "display:none;");
                } else {
                    $("#countyEdit").attr("style", "display:block;");
                }
                form.val('example', {
                    "companyId": data.companyId,
                    "companyName": data.companyName,
                    "abbreviation": data.abbreviation,
                    "formerName": data.formerName,
                    "englishName": data.englishName,
                    "corporate": data.corporate,
                    "companyDetailedAddress": data.companyDetailedAddress,
                    "phoneNumber": data.phoneNumber,
                    "companyWebSite": data.companyWebSite,
                    "businessScope": data.businessScope,
                    "registeredCapital": data.registeredCapital,
                    "businessStatus": data.businessStatus,
                    "registerDate": data.registerDate,
                    "creditCode": data.creditCode,
                    "registrationNumber": data.registrationNumber,
                    "registrID": data.registrID,
                    "organizationCode": data.organizationCode,
                    "companyType": data.companyType,
                    "industry": data.industry,
                    "approvedDate": data.approvedDate,
                    "registrationAuthority": data.registrationAuthority,
                    "staffNumber": data.staffNumber,
                    "termOperation": data.termOperation,
                    "remark": data.remark,
                    "dataCentreUserName": data.dataCentreUserName,
                    "dataCentrePassword": data.dataCentrePassword
                });
                layui.form.render();
            }, end: function () {
                window.location.reload();
            }

        });
    }

    //打开修改数据中心按钮
    function layerShowDataCentre(form, data, table, $) {
        //页面弹框
        openId = layer.open({
            type: 1,
            title: '修改数据中心',
            content: $('#editDataCentreDiv'),
            area: ['900px', '500px'],
            scrollbar: true,
            closeBtn: 1,
            btn: ['关闭'],
            btn2: function () {
                layer.close(openId)
            },
            success: function () {
                form.val('example', {
                    "companyId": data.companyId,
                    "dataCentre": data.dataCentre
                });
                layui.form.render();
            }, end: function () {
                window.location.reload();
            }

        });
    }


    //打开添加按钮
    $("#add").click(function () {
        $("#resetAddCompany").click();//重置表单(新建时在进入表单前要重置一下表单的内容，不然表单打开后会显示上一次的表单的内容。这里调用表单中重置按钮的点击方法来重置)
        openId = layer.open({//开启表单弹层
            area: '60%',
            type: 1,
            title: '新建总公司',
            content: $('#addDiv'), //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
            success: function () {
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

    //删除总公司按钮事件
    function layerDelete(data, table, $) {
        var url = storeHost + "/manage/company/deleteCompanyByID";
        var data = {
            companyId: data.companyId,
            modifyOperator: "${currentUser.trueName!}"
        };
        $.post(url, data, function (res) {
            if (res.responseStatusType.message == "Success") {
                layer.open({
                    title: '删除'
                    , content: '删除成功！'
                });
                //同时删除仓库
                delStock(data.companyId, 1);
                //重新加载表格
                table.reload("companyReload");
            } else {
                layer.open({
                    title: '删除'
                    , content: '删除失败！'
                });
            }
        })
    }

    //生成仓库
    function insertStock(data, table, $) {
        var url = productHost + "/stock/addStock";
        var data = {
            companyId: data.companyId,
            companyType: 1,
            company: data.companyName,
            k3Number: data.k3Number,
            createOperator: "${currentUser.trueName!}"
        };
        var index = null;
        $.ajax({
            type: "POST",
            url: url,
            data: data,
            async: true,
            beforeSend: function () {
                index = layer.load(3, {
                    shade: [0.9, '#fff'] //0.1透明度的白色背景
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

    //生成银行账号
    function insertBankAccount(data, table, $) {
        layerid = layer.open({//开启表单弹层
            // skin: 'layui-layer-molv',
            area: '60%',
            type: 1,
            title: '选择银行账号类型',
            content: $('#chooseAccountType'), //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
            success: function (layero) {
                $("#addFormBankAccountDiv").attr("data-companyId", data.companyId);
            }
        });
    }

    //打开修改管理员密码选择框
    function updateAdminPassword(data, table, $) {
        layerid = layer.open({//开启表单弹层
            // skin: 'layui-layer-molv',
            area: '60%',
            type: 1,
            title: '选择管理员类型',
            content: $('#chooseAdminType'), //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
            success: function (layero) {
                $("#chooseAdminType").attr("data-companyId", data.companyId);
                $("#chooseAdminType").attr("data-adminUser", data.dataCentreUserName);
                $("#chooseAdminType").attr("data-yewuAdminUser", data.yewuDataCentreUserName);
            }
        });
    }

    //查询数据中心编号
    var openDataCentre = null
    $("#selectDataCentre").click(function () {
        openDataCentre = layer.open({//开启表单弹层
            // skin: 'layui-layer-molv',
            area: '60%',
            type: 1,
            title: '选择数据中心编号',
            content: $('#chooseDataCentre'), //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
            success: function (layero) {
                var url = k3Host + "/k3cloud/datacentre/datacentre/selectK3DataCentreList";
                layui.use('table', function () {
                    var table = layui.table;
                    table.render({
                        elem: '#dataCentreTable'
                        , url: url
                        , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                        , page: true          //显示分页默认不显示
                        , method: 'post'
                        , id: "dataCentreTableRelod"
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
                            {field: 'fnumber', title: '数据中心名称', fixed: 'left'}
                            , {field: 'fdatacenterid', title: '数据中心编号', fixed: 'left'}
                            , {
                                field: 'isUsed', title: '使用组织', fixed: 'left', templet: function (d) {
                                    if (d.isUsed == 1) {
                                        return d.useOrg;
                                    } else {
                                        return "未使用";
                                    }
                                }
                            }
                            , {fixed: 'right', title: '操作', align: 'center', toolbar: '#dataCentreDemo'}
                        ]]
                        , done: function (res, curr, count) {
                            for (var i = 0; i < res.data.length; i++) {
                                if (res.data[i].isUsed == 1) {//如果已经使用
                                    $("table[id='dataCentreTable'] tbody tr:eq(" + i + ")").children().find("#confire").attr("class", "layui-btn layui-btn-primary layui-btn-xs layui-btn-disabled")
                                    $("table[id='dataCentreTable'] tbody tr:eq(" + i + ")").children().find("#confire").attr("disabled", true)
                                }
                            }
                        }
                    });
                })
            }
        });
    });


    //公司选项
    function openCompanySelectForBankAllot(data, table, type) {
        layerid = layer.open({//开启表单弹层
            area: '60%',
            type: 1,
            title: '选择公司类型',
            content: $('#chooseCompanyType'), //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
            success: function (layero) {
                $("#chooseCompanyType").attr("data-accountId", data.id);
                $("#chooseCompanyType").attr("data-type", type);
            }
        });
    }


    //银行现金账号分配组织-子公司
    function batchAllocationZhi(accountId, dataCompanyArrayStr, layer, table) {
        var dataCompanyArrayStr1 = [];
        for (var i = 0; i < dataCompanyArrayStr.length; i++) {
            var b = {
                "orgId": dataCompanyArrayStr[i].orgId,
                "orgK3Number": dataCompanyArrayStr[i].orgK3Number,
                "orgName": dataCompanyArrayStr[i].orgName,
                "k3Id": dataCompanyArrayStr[i].k3Id
            };
            dataCompanyArrayStr1.push(b);
        }
        var url = storeHost + "/manage/company/batchAllocationSubCompany";
        var data = {
            id: accountId,
            subcompanyIdArrayStr: JSON.stringify(dataCompanyArrayStr1),
            companyType: 2,
            companyId: $("#addFormBankAccountDiv").attr("data-companyId"),
            accountType: $('input[name="accountType"]:checked').val()
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


    //银行现金账号分配组织-分公司
    function batchAllocationFen(accountId, dataCompanyArrayStr, layer, table) {
        var dataCompanyArrayStr1 = [];
        for (var i = 0; i < dataCompanyArrayStr.length; i++) {
            var b = {
                "orgId": dataCompanyArrayStr[i].orgId,
                "orgK3Number": dataCompanyArrayStr[i].orgK3Number,
                "orgName": dataCompanyArrayStr[i].orgName,
                "k3Id": dataCompanyArrayStr[i].k3Id
            }
            dataCompanyArrayStr1.push(b);
        }
        var url = storeHost + "/manage/company/batchAllocationStore";
        var data = {
            id: accountId,
            storeIdArrayStr: JSON.stringify(dataCompanyArrayStr1),
            companyType: 3,
            companyId: $("#addFormBankAccountDiv").attr("data-companyId"),
            accountType: $('input[name="accountType"]:checked').val()
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


    //银行现金账号取消分配-子公司
    function batchCancelAllocationZhi(accountId, dataCompanyArrayStr, layer, table) {
        var dataCompanyArrayStr1 = [];
        for (var i = 0; i < dataCompanyArrayStr.length; i++) {
            var b = {
                "orgId": dataCompanyArrayStr[i].orgId,
                "orgK3Number": dataCompanyArrayStr[i].orgK3Number,
                "orgName": dataCompanyArrayStr[i].orgName,
                "k3Id": dataCompanyArrayStr[i].k3Id
            };
            dataCompanyArrayStr1.push(b);
        }
        var url = storeHost + "/manage/company/batchCancelAllocationSubCompany";
        var data = {
            id: accountId,
            subcompanyIdArrayStr: JSON.stringify(dataCompanyArrayStr1),
            companyType: 2,
            companyId: $("#addFormBankAccountDiv").attr("data-companyId")
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


    //银行现金账号取消分配-分公司
    function batchCancelAllocationFen(accountId, dataCompanyArrayStr, layer, table) {
        var dataCompanyArrayStr1 = [];
        for (var i = 0; i < dataCompanyArrayStr.length; i++) {
            var b = {
                "orgId": dataCompanyArrayStr[i].orgId,
                "orgK3Number": dataCompanyArrayStr[i].orgK3Number,
                "orgName": dataCompanyArrayStr[i].orgName,
                "k3Id": dataCompanyArrayStr[i].k3Id
            }
            dataCompanyArrayStr1.push(b);
        }
        var url = storeHost + "/manage/company/batchCancelAllocationStore";
        var data = {
            id: accountId,
            storeIdArrayStr: JSON.stringify(dataCompanyArrayStr1),
            companyType: 3,
            companyId: $("#addFormBankAccountDiv").attr("data-companyId")
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
    //关于时间范围的js
    layui.use('laydate', function () {
        var laydate = layui.laydate;
        //营业期限
        laydate.render({
            elem: '#termOperationEdit'
            , range: true
        });
        //核准日期
        laydate.render({
            elem: '#approvedDateEdit'
        });
        //成立日期
        laydate.render({
            elem: '#registerDateEdit'
        });

        laydate.render({
            elem: '#termOperationAdd'
            , range: true
        });
        //核准日期
        laydate.render({
            elem: '#approvedDateAdd'
        });
        //成立日期
        laydate.render({
            elem: '#registerDateAdd'
        });
    });

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


    //生成账簿
    function insertZhangBu(data, table, $) {
        var url = storeHost + "/manage/company/insertZhangBu";
        var data = {
            companyId: data.companyId,
            companyType: "1"
        };
        var index = null
        $.ajax({
            type: "POST",
            url: url,
            data: data,
            async: true,
            beforeSend: function () {
                index = layer.load(3, {
                    shade: [0.9, '#fff'] //0.1透明度的白色背景
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

    //查看对应数据中心的法人组织编号
    function selectFaRenOrgNumber(data1, table, $) {
        var url = k3Host + "/k3cloud/datacentre/datacentre/selectK3LegalPersonNumber";
        var data = {
            "dataCentreName": data1.fdatabasename
        };
        $.ajax({
            type: "POST",
            url: url,
            data: data,
            async: true,
            error: function (request) {
                layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
            },
            success: function (data) {
                if (data.responseStatusType.message == 'Failure') {
                    layer.alert(data.responseStatusType.error.errorMsg);
                }
                if (data.responseStatusType.message == 'Success') {
                    $("input[name='k3Number']").val(data.result.fnumber);
                }
            }
        });
    }
</script>

</body>
</html>