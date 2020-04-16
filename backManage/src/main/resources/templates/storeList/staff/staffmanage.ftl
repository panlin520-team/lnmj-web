<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>员工管理</title>
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
            width: 70px;
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
                <label class="layui-form-label">请选择门店</label>
                <div class="layui-input-inline">
                    <select name="stores" id="stores" lay-filter="stores">
                    </select>
                </div>
            </div>


            <div class="layui-inline">
                <label class="layui-form-label resetLabel">员工编号</label>
                <div class="layui-input-inline">
                    <input class="layui-input" type="text" name="keyWordStaffNumber" autocomplete="off"
                           placeholder="输入员工号码">
                </div>
                <label class="layui-form-label">名字</label>
                <div class="layui-input-inline">
                    <input class="layui-input" type="text" name="keyWordName" autocomplete="off" placeholder="输入名字">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label" style="width: 100px">请选择查看组织</label>
                <div class="layui-inline">
                    <input type="radio" name="companyTypeSelect" value="2" title="子公司" checked="">
                    <input type="radio" name="companyTypeSelect" value="3" title="分公司">
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
</div>
<table id="beautician" lay-filter="demo"></table>
</div>

<script type="text/html" id="barDemo">
    <input type="checkbox" name="isXiaoshou" data-k3Number="{{d.k3Number}}" data-yeWuYuanK3Id="{{d.yeWuYuanK3Id}}"
           data-companyId="{{d.companyId}}" data-companyType="{{d.companyType}}" data-beauticianId="{{d.beauticianId}}"
           lay-skin="switch" lay-text="是销售员|不是销售员" lay-filter="isXiaoshou" {{ d.isSaleMan== 1 ? 'checked' : '' }}>
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="checkSalaryDetailed">查看员工工资信息</a>
    <#-- <a class="layui-btn layui-btn-xs" lay-event="addProjuects">授权</a>-->
    <#--<a class="layui-btn layui-btn-xs" lay-event="orderwork">排班</a>-->
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>


<#--选择要添加员工的类型表单-->
    <div id="employeeType" hidden="" class="layui-fluid layui-form-pane layui-personal" style="margin: 15px;">
        <form class="layui-form" action="" id="employeeType" lay-filter="employeeType">
            <div class="layui-form-item">
                <label class="layui-form-label">请选择商品类型</label>
                <div class="layui-input-block">
                    <input type="radio" name="employeeType" value="1" title="子公司员工" checked=""
                           lay-filter="employeeType">
                    <input type="radio" name="employeeType" value="2" title="门店员工" lay-filter="employeeType">
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit="" lay-filter="employeeTypeConfir">确认</button>
                </div>
            </div>

        </form>
    </div>


<#--选择要添加员工的类型表单-->
    <div id="employeeType" hidden="" class="layui-fluid layui-form-pane layui-personal" style="margin: 15px;">
        <form class="layui-form" action="" id="employeeType" lay-filter="employeeType">
            <div class="layui-form-item">
                <label class="layui-form-label">请选择商品类型</label>
                <div class="layui-input-block">
                    <input type="radio" name="employeeType" value="1" title="子公司员工" checked=""
                           lay-filter="employeeType">
                    <input type="radio" name="employeeType" value="2" title="门店员工" lay-filter="employeeType">
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit="" lay-filter="employeeTypeConfir">确认</button>
                </div>
            </div>

        </form>
    </div>


<#--点击添加分公司的表单-->
<div id="addformdivid" hidden="" class="layui-fluid" style="margin: 15px;">
    <form class="layui-form layui-form-pane layui-personal" action="" id="addeditformid">

        <div class="layui-form-item" hidden="true">
            <label class="layui-form-label">员工id</label>
            <div class="layui-input-block">
                <input type="text" name="beauticianId" lay-verify="<#--required-->" autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label xrequired">名字</label>
            <div class="layui-input-block">
                <input type="text" name="name" lay-verify="required" autocomplete="off" placeholder="请输入员工名称"
                       class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label xrequired">电话</label>
            <div class="layui-input-block">
                <input type="text" name="mobile" lay-verify="required" autocomplete="off" placeholder="请输入员工电话"
                       class="layui-input"> <span style="color: red;">电话格式:例 028-38221918 手机格式：例 18284521115</span>
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label xrequired">性别</label>
            <div class="layui-input-block">
                <input type="radio" name="gender" value="1" title="男" checked="">
                <input type="radio" name="gender" value="0" title="女">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label xrequired">是否计算底薪</label>
            <div class="layui-input-block">
                <input type="radio" name="isBasicSalary" value="1" title="是" checked="">
                <input type="radio" name="isBasicSalary" value="0" title="否">
            </div>
        </div>


        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">入职时间</label>
                <div class="layui-input-inline">
                    <input type="text" name="entryTime" class="layui-input" id="entryTimeAddFgs"
                           placeholder="yyyy-MM-dd HH:mm:ss">
                </div>
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label xrequired">所属店铺</label>
            <div class="layui-input-inline">
                <input name="storeAddShow" id="storeAddShow" readonly="readonly"
                       type="text"
                       autocomplete="off" placeholder="请输入店铺" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;"
                       lay-verify="required">
                <input name="companyId" id="storeAdd" hidden="true" type="text">
                <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachStoreAdd"><i
                            class="layui-icon layui-icon-search"></i></button>

            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">所属分组</label>
            <div class="layui-input-inline">
                <input name="groupIdAddShow" id="groupIdAddShow" readonly="readonly"
                       type="text"
                       autocomplete="off" placeholder="请输入分组" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;"
                        <#-- lay-verify="required"-->>
                <input name="groupId" id="groupIdAdd" hidden="true" type="text">
                <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachGroupIdAdd"><i
                            class="layui-icon layui-icon-search"></i></button>

            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label xrequired">所属部门</label>
            <div class="layui-input-inline">
                <input name="departmentIdFgsAddShow" id="departmentIdFgsAddShow" readonly="readonly"
                       type="text"
                       autocomplete="off" placeholder="请输入部门" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;"
                       lay-verify="required">
                <input name="departmentId" id="departmentIdFgsAdd" hidden="true" type="text">
                <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachDepartmentIdFgsAdd"><i
                            class="layui-icon layui-icon-search"></i></button>

            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">所属行业</label>
            <div class="layui-input-inline">
                <input name="staffIndustryIDAddShow" id="staffIndustryIDAddShow" readonly="readonly"
                       type="text"
                       autocomplete="off" placeholder="请输入行业" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;"
                        <#-- lay-verify="required"-->>
                <input name="staffIndustryID" id="staffIndustryIDAdd" hidden="true" type="text">
                <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachStaffIndustryIDAdd"><i
                            class="layui-icon layui-icon-search"></i></button>

            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label xrequired">所属职位分类</label>
            <div class="layui-input-inline">
                <input name="postCategoryIdAddShow" id="postCategoryIdAddShow" readonly="readonly"
                       type="text"
                       autocomplete="off" placeholder="请输入职位分类" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;"
                       lay-verify="required">
                <input name="postCategoryId" id="postCategoryIdAdd" hidden="true" type="text">
                <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachPostCategoryIdAdd"><i
                            class="layui-icon layui-icon-search"></i></button>

            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label xrequired">所属职位</label>
            <div class="layui-input-inline">
                <input name="postIdAddShow" id="postIdAddShow" readonly="readonly"
                       type="text"
                       autocomplete="off" placeholder="请输入职位" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;"
                       lay-verify="required">
                <input name="postId" id="postIdAdd" hidden="true" type="text">
                <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachPostIdAdd"><i
                            class="layui-icon layui-icon-search"></i></button>

            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">是否跳过轮班</label>
            <div class="layui-input-block">
                <input type="radio" name="isSkipTurn" value="0" title="否" checked="">
                <input type="radio" name="isSkipTurn" value="1" title="是">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">手法评分</label>
            <div class="layui-input-block">
                <input type="text" name="tactGrade" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入员工手法评分"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">技能评分</label>
            <div class="layui-input-block">
                <input type="text" name="skillGrade" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入员工技能评分"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item" hidden="true">
            <label class="layui-form-label">累计客户</label>
            <div class="layui-input-block">
                <input type="text" name="cumulativeCustomer" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入员工累计评分"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">排序</label>
            <div class="layui-input-block">
                <input type="text" name="sort" <#--lay-verify="required"--> autocomplete="off" placeholder="请输入员工排序"
                       class="layui-input">
            </div>
        </div>


        <div class="layui-upload">
            <button type="button" class="layui-btn" id="test1">选择员工头像图片</button>
            <button type="button" class="layui-btn" id="startUpAdd">开始上传</button>
            <div class="layui-upload-list">
                <img class="layui-upload-img" id="demo1" style="width:100px;height: 100px">
                <p id="demoText"></p>
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">在职状态</label>
            <div class="layui-input-block">
                <input type="radio" name="workingState" value="0" title="不在职">
                <input type="radio" name="workingState" value="1" title="在职" checked="">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">人物简介</label>
            <div class="layui-input-block">
                <textarea name="introduction" id="introductionAdd_fgs" style="display: none;"></textarea>
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">是否兼职</label>
            <div class="layui-input-block">
                <input type="radio" name="isPartTime" lay-filter="isPartTime" value="0" title="否" checked="">
                <input type="radio" name="isPartTime" lay-filter="isPartTime" value="1" title="是">
            </div>
        </div>

        <fieldset class="layui-elem-field" id="partTimeJob">
            <legend>兼职职位</legend>
            <div class="layui-field-box">

                <div class="layui-form-item">
                    <label class="layui-form-label">兼职部门</label>
                    <div class="layui-input-inline">
                        <input name="departmentIdFgsAddShowPartTime" id="departmentIdFgsAddShowPartTime"
                               readonly="readonly"
                               type="text"
                               autocomplete="off" placeholder="请输入部门" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;"
                                <#--lay-verify="required"-->>
                        <input name="departmentId" id="departmentIdFgsAddPartTime" hidden="true" type="text">
                        <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachDepartmentIdFgsAddPartTime"><i
                                    class="layui-icon layui-icon-search"></i></button>

                    </div>
                </div>


                <div class="layui-form-item">
                    <label class="layui-form-label">兼职行业</label>
                    <div class="layui-input-inline">
                        <input name="staffIndustryPartTimeIDAddShow" id="staffIndustryPartTimeIDAddShow"
                               readonly="readonly"
                               type="text"
                               autocomplete="off" placeholder="请输入行业" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;"
                                <#-- lay-verify="required"-->>
                        <input name="staffIndustryPartTimeID" id="staffIndustryPartTimeIDAdd" hidden="true" type="text">
                        <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachStaffIndustryPartTimeIDAdd"><i
                                    class="layui-icon layui-icon-search"></i></button>

                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">兼职职位分类</label>
                    <div class="layui-input-inline">
                        <input name="partTimePostCategoryIdAddShow" id="partTimePostCategoryIdAddShow"
                               readonly="readonly"
                               type="text"
                               autocomplete="off" placeholder="请输入职位分类" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;"
                                <#--lay-verify="required"-->>
                        <input name="partTimePostCategoryId" id="partTimePostCategoryIdAdd" hidden="true" type="text">
                        <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachPartTimePostCategoryIdAdd"><i
                                    class="layui-icon layui-icon-search"></i></button>

                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">兼职职位</label>
                    <div class="layui-input-inline">
                        <input name="partTimePostIdAddShow" id="partTimePostIdAddShow" readonly="readonly"
                               type="text"
                               autocomplete="off" placeholder="请输入职位" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;"
                                <#--lay-verify="required"-->>
                        <input name="partTimePostId" id="partTimePostIdAdd" hidden="true" type="text">
                        <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachPartTimePostIdAdd"><i
                                    class="layui-icon layui-icon-search"></i></button>

                    </div>
                </div>
            </div>
        </fieldset>


        <div class="layui-form-item">
            <div class="layui-input-block">
                <button name="submit" id="" class="layui-btn" lay-submit="" lay-filter="addsubmitfilter">立即提交
                </button>
                <button id="resetInsertStaff" type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

<#--点击添加子公司的表单-->
<div id="addformzgs" hidden="" class="layui-fluid" style="margin: 15px;">
    <form class="layui-form layui-form-pane layui-personal" action="" id="addformzgsform" lay-filter="addformzgs">

        <div class="layui-form-item" hidden="true">
            <label class="layui-form-label">员工id</label>
            <div class="layui-input-block">
                <input type="text" name="beauticianId" lay-verify="<#--required-->" autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label xrequired">名字</label>
            <div class="layui-input-block">
                <input type="text" name="name" lay-verify="required" autocomplete="off" placeholder="请输入员工名称"
                       class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label xrequired">电话</label>
            <div class="layui-input-block">
                <input type="text" name="mobile" lay-verify="required" autocomplete="off" placeholder="请输入员工电话"
                       class="layui-input"> <span style="color: red;">电话格式:例 028-38221918 手机格式：例 18284521115</span>
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label xrequired">性别</label>
            <div class="layui-input-block">
                <input type="radio" name="gender" value="1" title="男" checked="">
                <input type="radio" name="gender" value="0" title="女">
            </div>
        </div>


        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">入职时间</label>
                <div class="layui-input-inline">
                    <input type="text" name="entryTime" class="layui-input" id="entryTimeAddZgs"
                           placeholder="yyyy-MM-dd HH:mm:ss">
                </div>
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label xrequired">所属部门</label>
            <div class="layui-input-inline">
                <input name="departmentId_zgsAddShow" id="departmentId_zgsAddShow" readonly="readonly"
                       type="text"
                       autocomplete="off" placeholder="请输入部门" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;"
                       lay-verify="required">
                <input name="departmentId" id="departmentId_zgsAdd" hidden="true" type="text">
                <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachDepartmentId_zgsAdd"><i
                            class="layui-icon layui-icon-search"></i></button>

            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">所属行业</label>
            <div class="layui-input-inline">
                <input name="staffIndustryZgsIDAddShow" id="staffIndustryZgsIDAddShow" readonly="readonly"
                       type="text"
                       autocomplete="off" placeholder="请输入行业" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;"
                        <#-- lay-verify="required"-->>
                <input name="staffIndustryID" id="staffIndustryZgsIDAdd" hidden="true" type="text">
                <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachStaffIndustryZgsIDAdd"><i
                            class="layui-icon layui-icon-search"></i></button>

            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label xrequired">所属职位分类</label>
            <div class="layui-input-inline">
                <input name="postCategoryIdAdd_zgsShow" id="postCategoryIdAdd_zgsShow" readonly="readonly"
                       type="text"
                       autocomplete="off" placeholder="请输入职位分类" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;"
                       lay-verify="required">
                <input name="postCategoryId" id="postCategoryIdAdd_zgs" hidden="true" type="text">
                <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachPostCategoryIdAdd_zgs"><i
                            class="layui-icon layui-icon-search"></i></button>

            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label xrequired">所属职位</label>
            <div class="layui-input-inline">
                <input name="postIdAdd_zgsShow" id="postIdAdd_zgsShow" readonly="readonly"
                       type="text"
                       autocomplete="off" placeholder="请输入职位" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;"
                       lay-verify="required">
                <input name="postId" id="postIdAdd_zgs" hidden="true" type="text">
                <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachPostIdAdd_zgs"><i
                            class="layui-icon layui-icon-search"></i></button>

            </div>
        </div>


        <div class="layui-upload">
            <button type="button" class="layui-btn" id="test1">选择员工头像图片</button>
            <button type="button" class="layui-btn" id="startUpAdd">开始上传</button>
            <div class="layui-upload-list">
                <img class="layui-upload-img" id="demo1" style="width:100px;height: 100px">
                <p id="demoText"></p>
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">在职状态</label>
            <div class="layui-input-block">
                <input type="radio" name="workingState" value="0" title="不在职">
                <input type="radio" name="workingState" value="1" title="在职" checked="">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">人物简介</label>
            <div class="layui-input-block">
                <textarea name="introduction" id="introductionAdd_zgs" style="display: none;"></textarea>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button name="submit" id="" class="layui-btn" lay-submit="" lay-filter="addsubmitfilter">立即提交
                </button>
                <button id="resetInsertStaff_zgs" type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

<#--点击查看或修改后的表单  分公司-->
<div id="editformdivid" hidden="" class="layui-fluid" style="margin: 15px;">
    <form class="layui-form layui-form-pane layui-personal" action="" id="editForm" lay-filter="exampleEdit_fgs">
        <div class="layui-form-item" hidden="true">
            <label class="layui-form-label">员工id</label>
            <div class="layui-input-block">
                <input type="text" name="beauticianId" lay-verify="<#--required-->" autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label xrequired">名字</label>
            <div class="layui-input-block">
                <input type="text" name="name" lay-verify="required" autocomplete="off" placeholder="请输入员工名称"
                       class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label xrequired">电话</label>
            <div class="layui-input-block">
                <input type="text" name="mobile" lay-verify="required" autocomplete="off" placeholder="请输入员工电话"
                       class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label xrequired">性别</label>
            <div class="layui-input-block">
                <input type="radio" name="gender" value="1" title="男" checked="">
                <input type="radio" name="gender" value="0" title="女">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label xrequired">是否计算底薪</label>
            <div class="layui-input-block">
                <input type="radio" name="isBasicSalary" value="1" title="是" checked="">
                <input type="radio" name="isBasicSalary" value="0" title="否">
            </div>
        </div>


        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">入职时间</label>
                <div class="layui-input-inline">
                    <input type="text" name="entryTime" class="layui-input" id="entryTimeEditFgs"
                           placeholder="yyyy-MM-dd HH:mm:ss">
                </div>
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">所属分组</label>
            <div class="layui-input-inline">
                <input name="groupIdEditShow" id="groupIdEditShow" readonly="readonly"
                       type="text"
                       autocomplete="off" placeholder="请输入分组" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;"
                        <#-- lay-verify="required"-->>
                <input name="groupId" id="groupIdEdit" hidden="true" type="text">
                <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachGroupIdEdit"><i
                            class="layui-icon layui-icon-search"></i></button>

            </div>
        </div>


        <div class="layui-form-item" id="departmentId_other_fgs_div">
            <label class="layui-form-label xrequired">所属部门</label>
            <div class="layui-input-inline">
                <input name="departmentId_other_fgsShow" id="departmentId_other_fgsShow" readonly="readonly"
                       type="text"
                       autocomplete="off" placeholder="请输入部门" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;"
                       lay-verify="required">
                <input name="departmentId" id="departmentId_other_fgs" hidden="true" type="text">
                <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachDepartmentId_other_fgs"><i
                            class="layui-icon layui-icon-search"></i></button>

            </div>
        </div>


        <div class="layui-form-item" id="postCategoryId_fgs_div">
            <label class="layui-form-label xrequired">所属职位分类</label>
            <div class="layui-input-inline">
                <input name="postCategoryId_fgsShow" id="postCategoryId_fgsShow" readonly="readonly"
                       type="text"
                       autocomplete="off" placeholder="请输入职位分类" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;"
                       lay-verify="required">
                <input name="postCategoryId" id="postCategoryId_fgs" hidden="true" type="text">
                <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachPostCategoryId_fgsAdd"><i
                            class="layui-icon layui-icon-search"></i></button>

            </div>
        </div>


        <div class="layui-form-item" id="postId_fgs_div">
            <label class="layui-form-label xrequired">所属职位</label>
            <div class="layui-input-inline">
                <input name="postId_fgsShow" id="postId_fgsShow" readonly="readonly"
                       type="text"
                       autocomplete="off" placeholder="请输入职位" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;"
                       lay-verify="required">
                <input name="postId" id="postId_fgs" hidden="true" type="text">
                <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachPostId_fgs"><i
                            class="layui-icon layui-icon-search"></i></button>

            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">是否跳过轮班</label>
            <div class="layui-input-block">
                <input type="radio" name="isSkipTurn" value="0" title="否" checked="">
                <input type="radio" name="isSkipTurn" value="1" title="是">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">手法评分</label>
            <div class="layui-input-block">
                <input type="text" name="tactGrade" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入员工手法评分"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">技能评分</label>
            <div class="layui-input-block">
                <input type="text" name="skillGrade" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入员工技能评分"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item" hidden="true">
            <label class="layui-form-label">累计客户</label>
            <div class="layui-input-block">
                <input type="text" name="cumulativeCustomer" <#--lay-verify="required"--> autocomplete="off"
                       placeholder="请输入员工累计评分"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">排序</label>
            <div class="layui-input-block">
                <input type="text" name="sort" <#--lay-verify="required"--> autocomplete="off" placeholder="请输入员工排序"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-upload">
            <button type="button" class="layui-btn" id="test2">选择员工头像图片</button>
            <button type="button" class="layui-btn" id="startUp">开始上传</button>
            <div class="layui-upload-list">
                <img class="layui-upload-img" id="demo2" style="width:100px;height: 100px">
                <p id="demoText2"></p>
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">在职状态</label>
            <div class="layui-input-block">
                <input type="radio" name="workingState" value="0" title="不在职" checked="">
                <input type="radio" name="workingState" value="1" title="在职">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">人物简介</label>
            <div class="layui-input-block">
                <textarea name="introduction" id="introductionEdit_fgs" style="display: none;"></textarea>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">是否兼职</label>
            <div class="layui-input-block">
                <input type="radio" name="isPartTime" lay-filter="isPartTimeEdit" value="0" title="否" checked="">
                <input type="radio" name="isPartTime" lay-filter="isPartTimeEdit" value="1" title="是">
            </div>
        </div>

        <fieldset class="layui-elem-field" id="partTimeJobEdit">
            <legend>兼职职位</legend>
            <div class="layui-field-box">
                <div class="layui-form-item">
                    <label class="layui-form-label">兼职部门</label>
                    <div class="layui-input-inline">
                        <input name="departmentIdFgsEditShowPartTime" id="departmentIdFgsEditShowPartTime"
                               readonly="readonly"
                               type="text"
                               autocomplete="off" placeholder="请输入部门" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;"
                                <#--lay-verify="required"-->>
                        <input name="departmentId" id="departmentIdFgsEditPartTime" hidden="true" type="text">
                        <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachDepartmentIdFgsEditPartTime"><i
                                    class="layui-icon layui-icon-search"></i></button>
                    </div>
                </div>


                <div class="layui-form-item">
                    <label class="layui-form-label">兼职行业</label>
                    <div class="layui-input-inline">
                        <input name="staffIndustryPartTimeIDEditShow" id="staffIndustryPartTimeIDEditShow"
                               readonly="readonly"
                               type="text"
                               autocomplete="off" placeholder="请输入行业" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;"
                                <#-- lay-verify="required"-->>
                        <input name="staffIndustryPartTimeID" id="staffIndustryPartTimeIDEdit" hidden="true"
                               type="text">
                        <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachStaffIndustryPartTimeIDEdit"><i
                                    class="layui-icon layui-icon-search"></i></button>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">兼职职位分类</label>
                    <div class="layui-input-inline">
                        <input name="partTimePostCategoryIdEditShow" id="partTimePostCategoryIdEditShow"
                               readonly="readonly"
                               type="text"
                               autocomplete="off" placeholder="请输入职位分类" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;"
                                <#--lay-verify="required"-->>
                        <input name="partTimePostCategoryId" id="partTimePostCategoryIdEdit" hidden="true" type="text">
                        <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachPartTimePostCategoryIdEdit"><i
                                    class="layui-icon layui-icon-search"></i></button>

                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">兼职职位</label>
                    <div class="layui-input-inline">
                        <input name="partTimePostIdEditShow" id="partTimePostIdEditShow" readonly="readonly"
                               type="text"
                               autocomplete="off" placeholder="请输入职位" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;"
                                <#--lay-verify="required"-->>
                        <input name="partTimePostId" id="partTimePostIdEdit" hidden="true" type="text">
                        <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachPartTimePostIdEdit"><i
                                    class="layui-icon layui-icon-search"></i></button>
                    </div>
                </div>
            </div>
        </fieldset>


        <div class="layui-form-item">
            <div class="layui-input-block">
                <button name="submit" id="" class="layui-btn" lay-submit="" lay-filter="editsubmitfilter">立即提交
                </button>
                <#-- <button id="reset" type="reset" class="layui-btn layui-btn-primary">重置</button>-->
            </div>
        </div>
    </form>
</div>

<#--点击查看或修改后的表单  子公司-->
<div id="editformdivid_zgs" hidden="" class="layui-fluid" style="margin: 15px;">
    <form class="layui-form layui-form-pane layui-personal" action="" id="editForm_zgs" lay-filter="exampleEdit_zgs">
        <div class="layui-form-item" hidden="true">
            <label class="layui-form-label">员工id</label>
            <div class="layui-input-block">
                <input type="text" name="beauticianId" lay-verify="<#--required-->" autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label xrequired">名字</label>
            <div class="layui-input-block">
                <input type="text" name="name" lay-verify="required" autocomplete="off" placeholder="请输入员工名称"
                       class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label xrequired">电话</label>
            <div class="layui-input-block">
                <input type="text" name="mobile" lay-verify="required" autocomplete="off" placeholder="请输入员工电话"
                       class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label xrequired">性别</label>
            <div class="layui-input-block">
                <input type="radio" name="gender" value="1" title="男" checked="">
                <input type="radio" name="gender" value="0" title="女">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label xrequired">是否计算底薪</label>
            <div class="layui-input-block">
                <input type="radio" name="isBasicSalary" value="1" title="是" checked="">
                <input type="radio" name="isBasicSalary" value="0" title="否">
            </div>
        </div>


        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">入职时间</label>
                <div class="layui-input-inline">
                    <input type="text" name="entryTime" class="layui-input" id="entryTimeEditZgs"
                           placeholder="yyyy-MM-dd HH:mm:ss">
                </div>
            </div>
        </div>

        <div class="layui-form-item" id="departmentId_other_div">
            <label class="layui-form-label xrequired">所属部门</label>
            <div class="layui-input-inline">
                <input name="departmentId_other_fgsShow" id="departmentId_otherShow" readonly="readonly"
                       type="text"
                       autocomplete="off" placeholder="请输入部门" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;"
                       lay-verify="required">
                <input name="departmentId" id="departmentId_other" hidden="true" type="text">
                <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachDepartmentId_other"><i
                            class="layui-icon layui-icon-search"></i></button>

            </div>
        </div>


        <div class="layui-form-item" id="postCategoryId_div">
            <label class="layui-form-label xrequired">所属职位分类</label>
            <div class="layui-input-inline">
                <input name="postCategoryId_fgsShow" id="postCategoryIdEditShow" readonly="readonly"
                       type="text"
                       autocomplete="off" placeholder="请输入职位分类" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;"
                       lay-verify="required">
                <input name="postCategoryId" id="postCategoryIdEdit" hidden="true" type="text">
                <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachPostCategoryIdEdit"><i
                            class="layui-icon layui-icon-search"></i></button>

            </div>
        </div>


        <div class="layui-form-item" id="postId_div">
            <label class="layui-form-label xrequired">所属职位</label>
            <div class="layui-input-inline">
                <input name="postId_fgsShow" id=postIdEditShow" readonly="readonly"
                       type="text"
                       autocomplete="off" placeholder="请输入职位" class="layui-input" style="padding-right: 9px;height: 38px;width: 185px;"
                       lay-verify="required">
                <input name="postId" id="postIdEdit" hidden="true" type="text">
                <button style="position: absolute;top: 0;right: 6px;
    cursor: pointer;" type="button" class="layui-btn" id="serachPostIdEdit"><i
                            class="layui-icon layui-icon-search"></i></button>

            </div>
        </div>


        <div class="layui-upload">
            <button type="button" class="layui-btn" id="test2">选择员工头像图片</button>
            <button type="button" class="layui-btn" id="startUp">开始上传</button>
            <div class="layui-upload-list">
                <img class="layui-upload-img" id="demo2" style="width:100px;height: 100px">
                <p id="demoText2"></p>
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">在职状态</label>
            <div class="layui-input-block">
                <input type="radio" name="workingState" value="0" title="不在职" checked="">
                <input type="radio" name="workingState" value="1" title="在职">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">人物简介</label>
            <div class="layui-input-block">
                <textarea name="introduction" id="introductionEdit_zgs" style="display: none;"></textarea>
            </div>
        </div>


        <div class="layui-form-item">
            <div class="layui-input-block">
                <button name="submit" id="" class="layui-btn" lay-submit="" lay-filter="editsubmitfilter_zgs">立即提交
                </button>
                <button id="reset_zgs" type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

<#-- 选择工资查询时间范围-->
    <form class="layui-form layui-form-pane layui-personal" id="chooseSalaryDateForm" action=""
          lay-filter="examplechooseSalaryDateForm"
          method="post"
          hidden="true">
        <div class="layui-inline">
            <label class="layui-form-label">日期时间范围</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="dateTimeScope" placeholder=" - ">
            </div>
        </div>
    </form>
<#--查看业绩工资结果-->
    <div id="showSalaryDiv" hidden="" class="layui-fluid" style="margin: 15px;">
        <form class="layui-form layui-form-pane layui-personal" id="showSalaryForm" action="" lay-filter="exampleShow"
              method="post">
            <div class="layui-form-item">
                <label class="layui-form-label">员工编号</label>
                <div class="layui-input-inline">
                    <input type="text" name="staffNumber" id="staffNumberGz" lay-verify="required" autocomplete="off"
                           placeholder=""
                           class="layui-input" readonly="readonly">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">员工名称</label>
                <div class="layui-input-inline">
                    <input type="text" name="staffName" id="staffName" lay-verify="required" autocomplete="off"
                           placeholder=""
                           class="layui-input" readonly="readonly">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">统计开始时间</label>
                <div class="layui-input-inline">
                    <input type="text" name="statisticDateStart" id="statisticDateStart" lay-verify="required"
                           autocomplete="off" placeholder=""
                           class="layui-input" readonly="readonly">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">统计结束时间</label>
                <div class="layui-input-inline">
                    <input type="text" name="statisticDateEnd" id="statisticDateEnd" lay-verify="required"
                           autocomplete="off" placeholder=""
                           class="layui-input" readonly="readonly">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">个数业绩</label>
                <div class="layui-input-inline">
                    <input type="text" name="numberPerformance" id="numberPerformance" lay-verify="required"
                           autocomplete="off" placeholder=""
                           class="layui-input" readonly="readonly">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">金额业绩</label>
                <div class="layui-input-inline">
                    <input type="text" name="amountPerformance" id="amountPerformance" lay-verify="required"
                           autocomplete="off" placeholder=""
                           class="layui-input" readonly="readonly">
                </div>
            </div>

            <div class="layui-form-item">
                <button type="button" class="layui-btn layui-btn-fluid" style="width: 88%;" id="yejiHuiZong">业绩汇总
                </button>
            </div>

            <div class="layui-form-item">
                <button type="button" class="layui-btn layui-btn-fluid" style="width: 88%;" id="yejiMingXi">业绩明细
                </button>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">分数</label>
                <div class="layui-input-inline">
                    <input type="text" name="score" id="score" lay-verify="required" autocomplete="off" placeholder=""
                           class="layui-input" readonly="readonly">
                </div>
            </div>


            <div class="layui-form-item">
                <label class="layui-form-label">底薪</label>
                <div class="layui-input-inline">
                    <input type="text" name="baseSalary" id="baseSalary" lay-verify="required" autocomplete="off"
                           placeholder=""
                           class="layui-input" readonly="readonly">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">提成</label>
                <div class="layui-input-inline">
                    <input type="text" name="takePercentage" id="takePercentage" lay-verify="required"
                           autocomplete="off" placeholder=""
                           class="layui-input" readonly="readonly">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">工资</label>
                <div class="layui-input-inline">
                    <input type="text" name="salary" id="salary" lay-verify="required" autocomplete="off" placeholder=""
                           class="layui-input" readonly="readonly">
                </div>
            </div>
        </form>
    </div>

<#--查看业绩汇总表格-->
    <form class="layui-form" id="yejiHuiZongForm" action="" lay-filter="exampleYejiHuiZong" method="post" hidden="true">
        <div class="demoTable layui-form">
            <table id="yejiHuiZongTable" lay-filter="yejiHuiZongTable"></table>
        </div>
    </form>

<#--查看业绩明细表格-->
    <form class="layui-form" id="yejiMingXiForm" action="" lay-filter="exampleYejiMingXi" method="post" hidden="true">
        <div class="demoTable layui-form">
            <table id="yejiMingXiTable" lay-filter="yejiMingXiTable"></table>
        </div>
    </form>

<#include "../../baseFtl/loadLinkData.ftl" />
    <!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<#--是否打折自定义显示-->
<script type="text/html" id="isBasicSalary">
    {{#  if(d.isBasicSalary == 0){ }}
    否
    {{#  }else if(d.isBasicSalary == 1){ }}
    是
    {{#  } }}
</script>
<script>

    if ("${currentUser.companyType!}" == "1") {
        $("#add").attr("style", "display:none;");
    }
    //列表显示--员工
    var resultImgUrlAdd = "";
    var resultImgUrl = "";
    var nowED = null;
    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#beautician'
            , url: storeHost + "/manage/beautician/selectBeauticianList"
            , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , page: true          //显示分页默认不显示
            , method: 'post'
            , id: 'beauticianReload'
            , request: {
                pageName: 'pageNum', //页码的参数名称，默认：page
                limitName: 'pageSize' //每页数据量的参数名，默认：limit
            }
            , where: {
                storeId: 0,
                companyType: "${currentUser.companyType!}",
                companyId: "${currentUser.companyId!}"
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
                    field: 'headUrl', title: '员工头像', fixed: 'left', templet: function (d) {
                        return d.headUrl == "" || d.headUrl == null ? "<div><img src='/noImg.png' style='width:60px;height: 60px'></div>" : "<div><img src=" + d.headUrl + " style='width:60px;height: 60px'></div>"
                    }
                }
                , {field: 'name', title: '员工名称', fixed: 'left', width: 190}
                , {field: 'staffNumber', title: '员工号码', width: 98}
                , {field: 'isBasicSalary', title: '是否计算底薪', templet: '#isBasicSalary', width: 120}
                , {field: 'introduction', title: '人物简介', width: 210}
                , {fixed: 'right', title: '操作', align: 'center', toolbar: '#barDemo'}
            ]]
        });
    });


    //增删改查操作实现
    var layerid;//当前弹层id;这个id可以定义多个，主要的目的是为了在回调函数关闭弹层时使用的
    var selectBoxsAll;//授权框中选中的行
    var resultDataAll;//请求返回的所有数据
    var resultDataAllSearch;//请求返回的搜索数据
    var isFind = 0;
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
                ]
            };
        loadSubCompanyStore(form);


        /*------所属门店关联数据查看-添加-分公司-----*/
        $("#" + "serachStoreAdd").click(function () {
            var url = storeHost + "/manage/store/selectStoreList";
            var param = {companyId: "${currentUser.companyId!}", companyType: "${currentUser.companyType!}"};
            loadLinkData(layer, layui, url, "storeId", "name", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "storeAddShow").val(data.name);
                $("#" + "storeAdd").val(data.storeId);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {
                    keyWordName: wordSearch,
                    companyId: "${currentUser.companyId!}",
                    companyType: "${currentUser.companyType!}"
                }
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

        /*------所属分组关联数据查看-添加-分公司-----*/
        $("#" + "serachGroupIdAdd").click(function () {
            var url = storeHost + "/manage/beautician/selectGroup";
            var storeIdAdd = $("input[id='storeAdd']").val();
            if (storeIdAdd == "" || storeIdAdd == null) {
                layer.msg("请先选择所属门店")
                return
            }
            var param = {storeId: storeIdAdd};
            loadLinkData(layer, layui, url, "groupId", "name", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "groupIdAddShow").val(data.name);
                $("#" + "groupIdAdd").val(data.groupId);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {keyWord: wordSearch, storeId: storeIdAdd};
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

        /*------所属部门关联数据查看-添加-分公司-----*/
        $("#" + "serachDepartmentIdFgsAdd").click(function () {
            var url = storeHost + "/manage/department/listDepartment";
            var storeIdAdd = $("input[id='storeAdd']").val();
            if (storeIdAdd == "" || storeIdAdd == null) {
                layer.msg("请先选择所属门店")
                return
            }
            var param = {searchCompanyType: "3", companyType: "3", companyId: storeIdAdd};
            loadLinkData(layer, layui, url, "id", "name", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "departmentIdFgsAddShow").val(data.name);
                $("#" + "departmentIdFgsAdd").val(data.id);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {
                    keyWordName: wordSearch,
                    companyType: "3",
                    searchCompanyType: "3",
                    companyId: storeIdAdd
                };
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

        /*------行业关联数据查看-添加-分公司-----*/
        $("#" + "serachStaffIndustryIDAdd").click(function () {
            var url = storeHost + "/manage/industry/selectList";
            var param = {};
            loadLinkData(layer, layui, url, "industryID", "industryName", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "staffIndustryIDAddShow").val(data.industryName);
                $("#" + "staffIndustryIDAdd").val(data.industryID);
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

        /*------所属职位分类关联数据查看-添加-分公司-----*/
        $("#" + "serachPostCategoryIdAdd").click(function () {
            var url = storeHost + "/manage/beautician/selectPostCategoryList";
            var industryIdAdd = $("input[id='staffIndustryIDAdd']").val();
            if (industryIdAdd == "" || industryIdAdd == null) {
                layer.msg("请先选择所属行业")
                return
            }
            var param = {postIndustryIDSearch: industryIdAdd};
            loadLinkData(layer, layui, url, "postCategoryId", "name", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "postCategoryIdAddShow").val(data.name);
                $("#" + "postCategoryIdAdd").val(data.postCategoryId);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {postCategoryNameKeyword: wordSearch, postIndustryIDSearch: industryIdAdd}
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

        /*------所属职位关联数据查看-添加-分公司-----*/
        $("#" + "serachPostIdAdd").click(function () {
            var url = storeHost + "/manage/beautician/selectPost";
            var postCategoryIdAdd = $("input[id='postCategoryIdAdd']").val();
            if (postCategoryIdAdd == "" || postCategoryIdAdd == null) {
                layer.msg("请先选择所属职位分类")
                return
            }
            var storeAdd = $("input[id='storeAdd']").val();
            if (storeAdd == "" || storeAdd == null) {
                layer.msg("请先选择所属门店")
                return
            }
            var departmentIdFgsAdd = $("input[id='departmentIdFgsAdd']").val();
            if (departmentIdFgsAdd == "" || departmentIdFgsAdd == null) {
                layer.msg("请先选择所属部门")
                return
            }
            var param = {
                postCategoryId: postCategoryIdAdd,
                companyType: "3",
                companyId: storeAdd,
                departmentId: departmentIdFgsAdd
            };
            loadLinkData(layer, layui, url, "postId", "name", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "postIdAddShow").val(data.name);
                $("#" + "postIdAdd").val(data.postId);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {
                    postNameKeyword: wordSearch,
                    postCategoryId: postCategoryIdAdd,
                    companyType: "3",
                    companyId: storeAdd,
                    departmentId: departmentIdFgsAdd
                };
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

        /*------兼职行业关联数据查看-添加-分公司-----*/
        $("#" + "serachStaffIndustryPartTimeIDAdd").click(function () {
            var url = storeHost + "/manage/industry/selectList";
            var param = {};
            loadLinkData(layer, layui, url, "industryID", "industryName", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "staffIndustryPartTimeIDAddShow").val(data.industryName);
                $("#" + "staffIndustryPartTimeIDAdd").val(data.industryID);
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

        /*------兼职部门关联数据查看-添加-分公司-----*/
        $("#" + "serachDepartmentIdFgsAddPartTime").click(function () {
            var url = storeHost + "/manage/department/listDepartment";
            var storeIdAdd = $("input[id='storeAdd']").val();
            if (storeIdAdd == "" || storeIdAdd == null) {
                layer.msg("请先选择所属门店")
                return
            }
            var param = {searchCompanyType: "3", companyType: "3", companyId: storeIdAdd};
            loadLinkData(layer, layui, url, "id", "name", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "departmentIdFgsAddShowPartTime").val(data.name);
                $("#" + "departmentIdFgsAddPartTime").val(data.id);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {
                    keyWordName: wordSearch,
                    companyType: "3",
                    searchCompanyType: "3",
                    companyId: storeIdAdd
                };
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

        /*------兼职所属职位分类关联数据查看-添加-分公司-----*/
        $("#" + "serachPartTimePostCategoryIdAdd").click(function () {
            var url = storeHost + "/manage/beautician/selectPostCategoryList";
            var industryIdAdd = $("input[id='staffIndustryPartTimeIDAdd']").val();
            if (industryIdAdd == "" || industryIdAdd == null) {
                layer.msg("请先选择所属行业")
                return
            }
            var param = {postIndustryIDSearch: industryIdAdd};
            loadLinkData(layer, layui, url, "postCategoryId", "name", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "partTimePostCategoryIdAddShow").val(data.name);
                $("#" + "partTimePostCategoryIdAdd").val(data.postCategoryId);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {postCategoryNameKeyword: wordSearch, postIndustryIDSearch: industryIdAdd}
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

        /*------兼职所属职位关联数据查看-添加-分公司-----*/
        $("#" + "serachPartTimePostIdAdd").click(function () {
            var url = storeHost + "/manage/beautician/selectPost";
            var postCategoryIdAdd = $("input[id='partTimePostCategoryIdAdd']").val();
            if (postCategoryIdAdd == "" || postCategoryIdAdd == null || postCategoryIdAdd == 0) {
                layer.msg("请先选择所属职位分类")
                return
            }
            var departmentIdFgsAddPartTime = $("input[id='departmentIdFgsAddPartTime']").val();
            if (departmentIdFgsAddPartTime == "" || departmentIdFgsAddPartTime == null) {
                layer.msg("请先选择所属部门")
                return
            }
            var param = {postCategoryId: postCategoryIdAdd, departmentId: departmentIdFgsAddPartTime};
            loadLinkData(layer, layui, url, "postId", "name", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "partTimePostIdAddShow").val(data.name);
                $("#" + "partTimePostIdAdd").val(data.postId);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {
                    postNameKeyword: wordSearch,
                    postCategoryId: postCategoryIdAdd,
                    departmentId: departmentIdFgsAddPartTime
                };
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


        /*------所属部门关联数据查看-添加-子公司-----*/
        $("#" + "serachDepartmentId_zgsAdd").click(function () {
            var url = storeHost + "/manage/department/listDepartment";
            var param = {searchCompanyType: "2", companyType: "2", companyId: "${currentUser.companyId!}"};
            loadLinkData(layer, layui, url, "id", "name", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "departmentId_zgsAddShow").val(data.name);
                $("#" + "departmentId_zgsAdd").val(data.id);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {
                    keyWordName: wordSearch,
                    companyType: "2",
                    searchCompanyType: "2",
                    companyId: "${currentUser.companyId!}"
                };
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

        /*------行业关联数据查看-添加-子公司-----*/
        $("#" + "serachStaffIndustryZgsIDAdd").click(function () {
            var url = storeHost + "/manage/industry/selectList";
            var param = {};
            loadLinkData(layer, layui, url, "industryID", "industryName", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "staffIndustryZgsIDAddShow").val(data.industryName);
                $("#" + "staffIndustryZgsIDAdd").val(data.industryID);
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

        /*------所属职位分类关联数据查看-添加-子公司-----*/
        $("#" + "serachPostCategoryIdAdd_zgs").click(function () {
            var url = storeHost + "/manage/beautician/selectPostCategoryList";
            var industryIdAdd = $("input[id='staffIndustryZgsIDAdd']").val();
            if (industryIdAdd == "" || industryIdAdd == null) {
                layer.msg("请先选择所属行业")
                return
            }
            var param = {postIndustryIDSearch: industryIdAdd};
            loadLinkData(layer, layui, url, "postCategoryId", "name", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "postCategoryIdAdd_zgsShow").val(data.name);
                $("#" + "postCategoryIdAdd_zgs").val(data.postCategoryId);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {postCategoryNameKeyword: wordSearch, postIndustryIDSearch: industryIdAdd}
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

        /*------所属职位关联数据查看-添加-子公司-----*/
        $("#" + "serachPostIdAdd_zgs").click(function () {
            var url = storeHost + "/manage/beautician/selectPost";
            var postCategoryIdAdd = $("input[id='postCategoryIdAdd_zgs']").val();
            if (postCategoryIdAdd == "" || postCategoryIdAdd == null) {
                layer.msg("请先选择所属职位分类")
                return
            }
            var departmentId_zgsAdd = $("input[id='departmentId_zgsAdd']").val();
            if (departmentId_zgsAdd == "" || departmentId_zgsAdd == null) {
                layer.msg("请先选择所属部门")
                return
            }
            var param = {
                postCategoryId: postCategoryIdAdd,
                companyType: "2",
                companyId: "${currentUser.companyId!}",
                departmentId: departmentId_zgsAdd
            };
            loadLinkData(layer, layui, url, "postId", "name", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "postIdAdd_zgsShow").val(data.name);
                $("#" + "postIdAdd_zgs").val(data.postId);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {
                    postNameKeyword: wordSearch,
                    postCategoryId: postCategoryIdAdd,
                    companyType: "2",
                    companyId: "${currentUser.companyId!}",
                    departmentId: departmentId_zgsAdd
                };
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


        /*------所属分组关联数据查看-修改-分公司-----*/
        $("#" + "serachGroupIdEdit").click(function () {
            var url = storeHost + "/manage/beautician/selectGroup";
            var param = {storeId: $("#editForm").attr("data-storeId")};
            loadLinkData(layer, layui, url, "groupId", "name", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "groupIdEditShow").val(data.name);
                $("#" + "groupIdEdit").val(data.groupId);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {keyWord: wordSearch, storeId: $("#editForm").attr("data-storeId")};
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

        /*------兼职行业关联数据查看-修改-分公司-----*/
        $("#" + "serachStaffIndustryPartTimeIDEdit").click(function () {
            var url = storeHost + "/manage/industry/selectList";
            var param = {};
            loadLinkData(layer, layui, url, "industryID", "industryName", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "staffIndustryPartTimeIDEditShow").val(data.industryName);
                $("#" + "staffIndustryPartTimeIDEdit").val(data.industryID);
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

        /*------兼职部门关联数据查看-修改-分公司-----*/
        $("#" + "serachDepartmentIdFgsEditPartTime").click(function () {
            var url = storeHost + "/manage/department/listDepartment";
            var param = {searchCompanyType: "3", companyType: "3", companyId: $("#editForm").attr("data-storeId")};
            loadLinkData(layer, layui, url, "id", "name", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "departmentIdFgsEditShowPartTime").val(data.name);
                $("#" + "departmentIdFgsEditPartTime").val(data.id);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {
                    keyWordName: wordSearch,
                    companyType: "3",
                    searchCompanyType: "3",
                    companyId: $("#editForm").attr("data-storeId")
                };
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

        /*------兼职所属职位分类关联数据查看-修改-分公司-----*/
        $("#" + "serachPartTimePostCategoryIdEdit").click(function () {
            var url = storeHost + "/manage/beautician/selectPostCategoryList";
            var industryIdAdd = $("input[id='staffIndustryPartTimeIDEdit']").val();
            if (industryIdAdd == "" || industryIdAdd == null) {
                layer.msg("请先选择所属行业")
                return
            }
            var param = {postIndustryIDSearch: industryIdAdd};
            loadLinkData(layer, layui, url, "postCategoryId", "name", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "partTimePostCategoryIdEditShow").val(data.name);
                $("#" + "partTimePostCategoryIdEdit").val(data.postCategoryId);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {postCategoryNameKeyword: wordSearch, postIndustryIDSearch: industryIdAdd}
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

        /*------兼职所属职位关联数据查看-修改-分公司-----*/
        $("#" + "serachPartTimePostIdEdit").click(function () {
            var url = storeHost + "/manage/beautician/selectPost";
            var postCategoryIdAdd = $("input[id='partTimePostCategoryIdEdit']").val();
            if (postCategoryIdAdd == "" || postCategoryIdAdd == null || postCategoryIdAdd == 0) {
                layer.msg("请先选择所属职位分类")
                return
            }
            var departmentIdFgsAddPartTime = $("input[id='departmentIdFgsEditPartTime']").val();
            if (departmentIdFgsAddPartTime == "" || departmentIdFgsAddPartTime == null) {
                layer.msg("请先选择所属部门")
                return
            }
            var param = {postCategoryId: postCategoryIdAdd, departmentId: departmentIdFgsAddPartTime};
            loadLinkData(layer, layui, url, "postId", "name", param);
            table.on('row(showLinDataTable)', function (obj) {
                var data = obj.data;
                $("#" + "partTimePostIdEditShow").val(data.name);
                $("#" + "partTimePostIdEdit").val(data.postId);
                layer.close(Open);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
            //搜索
            $("#searchwordLinkData").click(function () {
                var wordSearch = $(".demoTable input[name='wordSearchLinkData']").val();
                var searchJsonName = {
                    postNameKeyword: wordSearch,
                    postCategoryId: postCategoryIdAdd,
                    departmentId: departmentIdFgsAddPartTime
                };
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

        $("#yejiHuiZong").click(function () {
            //统计开始时间
            var statisticDateStart = $("input[id='statisticDateStart']").val();
            //统计结束时间
            var statisticDateEnd = $("input[id='statisticDateEnd']").val();
            //员工编号
            var staffNumber = $("input[id='staffNumberGz']").val();
            var a = layer.open({
                type: 1
                , content: $('#yejiHuiZongForm')
                , title: '业绩汇总表'
                , area: ['723px', '474px']
                , btn: ['关闭']
                , success: function (layero) {
                    layui.use('table', function () {
                        var table = layui.table;
                        table.render({
                            elem: '#yejiHuiZongTable'
                            , url: dataHost + "/statistic/yejiHuiZongStatistic"
                            , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                            , page: true          //显示分页默认不显示
                            , method: 'post'
                            , id: 'yejiHuiZongTableReload'
                            , request: {
                                pageName: 'pageNum', //页码的参数名称，默认：page
                                limitName: 'pageSize' //每页数据量的参数名，默认：limit
                            }
                            , where: {
                                salesmanID: staffNumber,
                                startDate: statisticDateStart,
                                endDate: statisticDateEnd
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
                                {field: 'achievementPostName', title: '业绩名称'}
                                , {field: 'amountOrNumber', title: '金额/个数'}
                                , {field: 'type', title: '业绩统计方式'}
                            ]]
                        });
                    });

                }
                , yes: function (index, layero) {
                    layer.close(index);
                    layer.close(a);
                }
                , end: function () {
                }
            });


        });

        $("#yejiMingXi").click(function () {
            //统计开始时间
            var statisticDateStart = $("input[id='statisticDateStart']").val();
            //统计结束时间
            var statisticDateEnd = $("input[id='statisticDateEnd']").val();
            //员工编号
            var staffNumber = $("input[id='staffNumberGz']").val();
            var b = layer.open({
                type: 1
                , content: $('#yejiMingXiForm')
                , title: '业绩明细表'
                , area: ['723px', '474px']
                , btn: ['关闭']
                , success: function (layero) {
                    layui.use('table', function () {
                        var table = layui.table;
                        table.render({
                            elem: '#yejiMingXiTable'
                            , url: dataHost + "/statistic/yejiMingXiStatistic"
                            , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                            , page: true          //显示分页默认不显示
                            , method: 'post'
                            , id: 'yejiMingXiTableReload'
                            , request: {
                                pageName: 'pageNum', //页码的参数名称，默认：page
                                limitName: 'pageSize' //每页数据量的参数名，默认：limit
                            }
                            , where: {
                                salesmanID: staffNumber,
                                startDate: statisticDateStart,
                                endDate: statisticDateEnd
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
                                {field: 'id', title: '业绩明细id',width:99}
                                , {field: 'achievementPostName', title: '业绩名称' ,width:149}
                                , {field: 'ladderDetailedAmount', title: '业绩金额' ,width:110}
                                , {field: 'ladderDetailedNumber', title: '业绩个数' ,width:110}
                                , {field: 'ladderDetailedDatetime', title: '生成时间'}
                            ]]
                        });
                    });

                }
                , yes: function (index, layero) {
                    layer.close(index);
                    layer.close(b);
                }
                , end: function () {
                }
            });


        });

        //监听表格复选框选择
        table.on('checkbox(demo)', function (obj) {
        });


        table.on('checkbox(selectProjectDemo)', function (obj) {
            if (obj.type == "one") {//如果是单行选
                if (obj.checked) {//如果选中,加入
                    selectBoxsAll.push(obj.data.serviceProductId)
                } else {//如果没选中,删除
                    var index = selectBoxsAll.indexOf(obj.data.serviceProductId);
                    if (index > -1) {
                        selectBoxsAll.splice(index, 1);
                    }
                }
            } else if (obj.type == "all") {//如果是全选
                if (isFind == 1) {//如果是搜索
                    if (obj.checked) {//是全选
                        for (var select in resultDataAllSearch) {
                            var flag = true;
                            for (var all in selectBoxsAll) {
                                if (resultDataAllSearch[select].serviceProductId == selectBoxsAll[all]) {
                                    flag = false;
                                }
                            }
                            if (flag == true) {//如果在全部里面找不到，就加入
                                selectBoxsAll.push(resultDataAllSearch[select].serviceProductId)
                            }
                        }
                    } else {//不是全选

                        for (var select in resultDataAllSearch) {
                            var flag = true;
                            for (var all in selectBoxsAll) {
                                if (resultDataAllSearch[select].serviceProductId == selectBoxsAll[all]) {
                                    flag = false;
                                }
                            }
                            if (flag == false) {//如果在全部里面找的到，就删除
                                var inde = selectBoxsAll.indexOf(resultDataAllSearch[select].serviceProductId);
                                selectBoxsAll.splice(inde, 1);
                            }
                        }
                    }
                } else if (isFind == 0) {//不是搜索
                    if (obj.checked) {//是全选
                        selectBoxsAll = new Array();
                        for (var all in resultDataAll) {
                            selectBoxsAll.push(resultDataAll[all].serviceProductId)
                        }
                    } else {//不是全选
                        selectBoxsAll = new Array();
                    }
                }

            }

        });


        //监听工具条
        table.on('tool(demo)', function (obj) {
            var data = obj.data;
            if (obj.event === 'detail') {
                layerShow(form, data, table, $, layedit, ptool);
            } else if (obj.event === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    layerDelete(data, table, $);
                    obj.del();
                    layer.close(index);
                });
            } else if (obj.event === 'edit') {
                layerShowAndEdit(form, data, table, $, layedit, ptool);
            } else if (obj.event === 'addProjuects') {
                bindingProject(data, table, $);
            } else if (obj.event === 'orderwork') {
                orderwork(data, table, $);
            } else if (obj.event === 'checkSalaryDetailed') {

                //页面弹框
                var a2 = layer.open({
                    type: 1,
                    title: '时间范围选择',
                    content: $('#chooseSalaryDateForm'),
                    area: ['346px', '164px'],
                    closeBtn: 1,
                    btn: ['关闭'],
                    btn2: function () {
                        layer.close(a2);
                    },
                    success: function (layero) {
                        $("#chooseSalaryDateForm").attr("data-staffNumber",data.staffNumber);
                        $("#chooseSalaryDateForm").attr("data-staffName",data.name);
                        layui.use('laydate', function () {
                            var laydate = layui.laydate;
                            //日期时间范围
                            laydate.render({
                                elem: '#dateTimeScope'
                                , type: 'datetime'
                                , range: true
                                , done: function (value, date) {

                                    var url = dataHost + "/statistic/salesmanStatistic";
                                    var data1 = {
                                        salesmanID: $("#chooseSalaryDateForm").attr("data-staffNumber"),
                                        startDate: value.split(" - ")[0].replace(/^\s+|\s+$/g, ""),
                                        endDate: value.split(" - ")[1].replace(/^\s+|\s+$/g, "")
                                    };
                                    $.post(url, data1, function (result) {
                                        if (result.responseStatusType.message == "Success") {
                                            var a3 = layer.open({
                                                type: 1,
                                                title: '工资结果',
                                                content: $('#showSalaryDiv'),
                                                area: ['451px', '635px'],
                                                closeBtn: 1,
                                                btn: ['关闭'],
                                                btn2: function () {
                                                    layer.close(a3);
                                                },
                                                success: function (layero) {
                                                    form.val('exampleShow', {
                                                        "staffNumber": result.result.salesmanID  //员工编号
                                                        , "staffName": $("#chooseSalaryDateForm").attr("data-staffName")  //员工名称
                                                        , "statisticDateStart": result.result.statisticDateStart  // 统计开始时间
                                                        , "statisticDateEnd": result.result.statisticDateEnd  // 统计结束时间
                                                        , "numberPerformance": result.result.numberPerformanceAll   //个数业绩
                                                        , "amountPerformance": result.result.amountPerformanceAll   //金额业绩
                                                        , "score": result.result.score    //分数
                                                        , "salary": result.result.salary     //工资
                                                        , "baseSalary": result.result.baseSalary    //底薪
                                                        , "takePercentage": result.result.takePercentage     //提成
                                                    })
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


        //监听添加提交
        form.on('submit(addsubmitfilter)', function (data) {
            var moreContent = layedit.getContent(nowED);
            var data = null;
            var div = null;
            var companyType = "";
            if ($('input[name="employeeType"]:checked').val() == "1") {
                $("#introductionAdd_zgs").val(moreContent);
                div = $('#addformzgsform');
                companyType = "2";
                data = div.serialize() + "&createOperator=" + "${currentUser.trueName!}" + "&headUrl=" + resultImgUrlAdd + "&FCreateOrgId=" + "${currentUser.orgK3Number!}" + "&FUseOrgId=" + "${currentUser.orgK3Number!}" + "&companyType=" + companyType + "&companyId=" + "${currentUser.companyId!}"
            } else {
                $("#introductionAdd_fgs").val(moreContent);
                div = $('#addeditformid');
                companyType = "3";
                data = div.serialize() + "&createOperator=" + "${currentUser.trueName!}" + "&headUrl=" + resultImgUrlAdd + "&companyType=" + companyType
            }
            if (resultImgUrlAdd == "") {
                //如果没有上传
                layer.open({
                    skin: 'layui-layer-molv',
                    type: 1,
                    area: "10%",
                    content: "您还未上次头像图片，要继续添加吗？",
                    shadeClose: true,
                    btn: ['继续', '取消'],
                    yes: function (index) {
                        layer.close(index); //如果设定了yes回调，需进行手工关闭
                        var index = null
                        $.ajax({
                            type: "POST",
                            url: storeHost + "/manage/beautician/insertBeautician",
                            data: data,
                            async: true,
                            beforeSend: function () {
                                index = layer.load(3, {
                                    shade: [0.9, '#fff'] //0.1透明度的白色背景
                                });
                            },
                            error: function (request) {
                                layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
                                $("#partTimeJob").attr("hidden", false);
                                layer.close(index);    //返回数据关闭loading
                            },
                            success: function (data) {
                                layer.close(index);    //返回数据关闭loading
                                if (data.responseStatusType.message == 'Failure') {
                                    layer.alert(data.responseStatusType.error.errorMsg);
                                    $("#partTimeJob").attr("hidden", false);
                                }
                                if (data.responseStatusType.message == 'Success') {
                                    layer.open({
                                        skin: 'layui-layer-molv',
                                        type: 1,
                                        area: "10%",
                                        content: "操作成功:",
                                        shadeClose: true,
                                        btn: ["关闭"],
                                        yes: function (index) {
                                            layer.close(index); //如果设定了yes回调，需进行手工关闭
                                            layer.closeAll();
                                            $("#partTimeJob").attr("hidden", false);
                                            resultImgUrlAdd = "";
                                        }, end: function () {
                                            layer.close(layerid);
                                            $("#reset").click();//重置表单
                                            $("#partTimeJob").attr("hidden", false);
                                            table.reload("beauticianReload");
                                        }
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
                var index = null
                $.ajax({
                    type: "POST",
                    url: storeHost + "/manage/beautician/insertBeautician",
                    data: $('#addeditformid').serialize() + "&createOperator=" + "${currentUser.trueName!}" + "&imgUrl=" + resultImgUrlAdd,
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
                        }
                        if (data.responseStatusType.message == 'Success') {
                            layer.open({
                                skin: 'layui-layer-molv',
                                type: 1,
                                area: "10%",
                                content: "操作成功:",
                                shadeClose: true,
                                btn: ["关闭"],
                                yes: function (index) {
                                    layer.close(index); //如果设定了yes回调，需进行手工关闭
                                    resultImgUrlAdd = "";
                                }, end: function () {
                                    layer.close(layerid);
                                    $("#reset").click();//重置表单
                                    table.reload("beauticianReload");
                                }
                            });
                        }
                    }
                });
            }

            return false;
        });

        //监听修改提交-分公司
        form.on('submit(editsubmitfilter)', function (data) {
            var isBasicSalary = $("input[name='isBasicSalary']").is(":checked") == true ? 1 : 0;
            var moreContent = layedit.getContent(nowED);
            var companyType = $("#editformdivid").attr("data-companyType");
            var companyId = $("#editformdivid").attr("data-companyId");
            $("#introductionEdit_fgs").val(moreContent);
            $.ajax({
                type: "POST",
                url: storeHost + "/manage/beautician/updateBeautician",
                data: $('#editForm').serialize() + "&modifyOperator=" + "${currentUser.trueName!}" + "&headUrl=" + resultImgUrl + "&companyType=" + companyType + "&companyId=" + companyId,
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
                            , content: '修改成功！'
                            , btn: ["确认"]
                            , yes: function (index) {
                                layer.close(index); //如果设定了yes回调，需进行手工关闭
                            }, end: function () {
                                layer.close(layerid);
                                table.reload("beauticianReload");
                            }
                        });
                    }
                }
            });
            return false;
        });

        //监听修改提交-子公司
        form.on('submit(editsubmitfilter_zgs)', function (data) {
            var moreContent = layedit.getContent(nowED);
            var companyType = $("#editformdivid_zgs").attr("data-companyType");
            var companyId = $("#editformdivid_zgs").attr("data-companyId");
            $("#introductionEdit_zgs").val(moreContent);
            $.ajax({
                type: "POST",
                url: storeHost + "/manage/beautician/updateBeautician",
                data: $('#editForm_zgs').serialize() + "&modifyOperator=" + "${currentUser.trueName!}" + "&headUrl=" + resultImgUrl + "&companyType=" + companyType + "&companyId=" + companyId,
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
                            , content: '修改成功！'
                            , btn: ["确认"]
                            , yes: function (index) {
                                layer.close(index); //如果设定了yes回调，需进行手工关闭
                            }, end: function () {
                                layer.close(layerid);
                                table.reload("beauticianReload");
                            }
                        });
                    }
                }
            });
            return false;
        });


        var $ = layui.$;
        var table = layui.table, active = {
            search: function () {
                var companyType = null;
                var companyId = null;
                if ($('input[name="companyTypeSelect"]:checked').val() == 2) {
                    companyType = "${currentUser.companyType!}";
                    companyId = "${currentUser.companyId!}";
                } else {
                    var selectStoreId = $("select[name='stores']").find("option:selected").val()
                    if (selectStoreId == 0) {
                        layer.msg("请选择门店");
                        return;
                    } else {
                        companyType = 3;
                        companyId = selectStoreId;
                    }

                }
                var keyWordStaffNumber = $(".demoTable input[name='keyWordStaffNumber']").val();
                var keyWordName = $(".demoTable input[name='keyWordName']").val();
                table.render({
                    elem: '#beautician'
                    , url: storeHost + "/manage/beautician/selectBeauticianList"
                    , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    , page: true          //显示分页默认不显示
                    , method: 'post'
                    , id: 'beauticianReload'
                    , request: {
                        pageName: 'pageNum', //页码的参数名称，默认：page
                        limitName: 'pageSize' //每页数据量的参数名，默认：limit
                    }
                    , where: {
                        keyWordStaffNumber: keyWordStaffNumber,
                        keyWordName: keyWordName,
                        companyType: companyType,
                        companyId: companyId
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
                            field: 'headUrl', title: '员工头像', fixed: 'left', templet: function (d) {
                                return d.headUrl == "" || d.headUrl == null ? "<div><img src='/noImg.png' style='width:60px;height: 60px'></div>" : "<div><img src=" + d.headUrl + " style='width:60px;height: 60px'></div>"
                            }
                        }
                        , {field: 'name', title: '员工名称', fixed: 'left', width: 190}
                        , {field: 'staffNumber', title: '员工号码', width: 98}
                        , {field: 'isBasicSalary', title: '是否计算底薪', templet: '#isBasicSalary', width: 120}
                        , {field: 'introduction', title: '人物简介', width: 210}
                        , {fixed: 'right', title: '操作', align: 'center', toolbar: '#barDemo'}
                    ]]
                });
            }
            , add: function () {

            }
        };

        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });


        //添加按钮点击事件-打开添加窗口
        $("#add").click(function () {

            layerid = layer.open({//开启表单弹层
                skin: 'layui-layer-molv',
                area: '60%',
                type: 1,
                title: '新建员工',
                content: $('#employeeType'), //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
                success: function () {
                    $("#demo1").attr("src", "${basePath!}/noImg.png")
                }

            });
        });

        //监听确认-打开对应的添加员工类型弹窗
        form.on('submit(employeeTypeConfir)', function (data) {
            var div = null;
            var introductionAdd = null;
            if ($('input[name="employeeType"]:checked').val() === "1") {
                div = $('#addformzgs');
                introductionAdd = "introductionAdd_zgs"
            } else {
                div = $('#addformdivid');
                introductionAdd = "introductionAdd_fgs"
            }

            $("#resetInsertStaff_zgs").click();//重置表单
            $("#resetInsertStaff").click();//重置表单
            layerid = layer.open({//开启表单弹层
                // skin: 'layui-layer-molv',
                area: '60%',
                type: 1,
                title: '添加员工',
                content: div, //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
                success: function (layero) {
                    nowED = layedit.build(introductionAdd, ptool);
                    layero.find("input[id='partTimePostIdAdd']").val(0);
                    layero.find("input[id='partTimePostCategoryIdAdd']").val(0);
                }
            });
            return false;//防止表单提交后跳转
        });


        //监听性别操作
        form.on('switch(isXiaoshou)', function (obj) {
            var companyId = $(this).attr("data-companyId");
            var companyType = $(this).attr("data-companyType");
            var beauticianId = $(this).attr("data-beauticianId");
            var yeWuYuanK3Id = $(this).attr("data-yeWuYuanK3Id");
            var k3Number = $(this).attr("data-k3Number");
            console.log(companyId)
            console.log(companyType)
            console.log(beauticianId)
            var isSaleMan;
            if (obj.elem.checked == true) {
                isSaleMan = 1;
            } else {
                isSaleMan = 0;
            }
            //修改员工是否是销售员
            var url = storeHost + "/manage/beautician/updateBeautician";
            var param = {
                companyId: companyId,
                companyType: companyType,
                beauticianId: beauticianId,
                yeWuYuanK3Id: yeWuYuanK3Id,
                k3Number: k3Number,
                isSaleMan: isSaleMan,
                modifyOperator: "${currentUser.trueName!}"
            };
            $.post(url, param, function (res) {
                if (res.responseStatusType.message == "Success") {
                    layer.msg("设置成功！")
                    //重新加载表格
                    table.reload("beauticianReload");
                } else {
                    layer.msg("设置失败！")
                }
            })

        });

    });


    //修改员工按钮事件-打开修改窗口
    function layerShowAndEdit(form, data, table, $, layedit, ptool) {
        var div = null;
        var introductionEdit = null
        var exampleEdit = null
        if (data.companyType == "2") {
            div = $('#editformdivid_zgs')
            introductionEdit = "introductionEdit_zgs"
            $("#departmentId_other_div").attr("style", "display:none");
            $("#staffIndustryZgsDiv").attr("style", "display:none");
            $("#postCategoryId_div").attr("style", "display:none");
            $("#postId_div").attr("style", "display:none");
            exampleEdit = "exampleEdit_zgs"
        } else {
            div = $('#editformdivid');
            introductionEdit = "introductionEdit_fgs";
            $("#departmentId_other_fgs_div").attr("style", "display:none");
            $("#staffIndustry_fgs_div").attr("style", "display:none");
            $("#postCategoryId_fgs_div").attr("style", "display:none");
            $("#postId_fgs_div").attr("style", "display:none");
            exampleEdit = "exampleEdit_fgs"
        }

        //页面弹框
        layerid = layer.open({
            type: 1,
            title: '员工修改',
            content: div,
            area: ['600px', '700px'],
            closeBtn: 1,
            scrollbar: true,
            btn: [],
            yes: function (index, layero) {

            },
            btn2: function () {
                layer.closeAll();
            },
            success: function (layero) {
                $("#editForm").attr("data-storeId", data.companyId);

                if (data.companyType == "2") {
                    $("#editformdivid_zgs").attr("data-companyType", data.companyType);
                    $("#editformdivid_zgs").attr("data-companyId", data.companyId);
                } else {
                    $("#editformdivid").attr("data-companyType", data.companyType);
                    $("#editformdivid").attr("data-companyId", data.companyId);
                }
                form.val(exampleEdit, {
                    "beauticianId": data.beauticianId
                    , "name": data.name
                    , "mobile": data.mobile
                    , "gender": data.gender

                    , "departmentId_other_fgsShow": data.departmentName
                    , "departmentId": data.departmentId

                    , "entryTime": data.entryTime
                    , "storeId": data.storeId

                    , "groupIdEditShow": data.groupName
                    , "groupId": data.groupId


                    , "postId_fgsShow": data.postName
                    , "postId": data.postId

                    , "postCategoryId": data.postCategoryId
                    , "postCategoryId_fgsShow": data.postCategoryName

                    , "isSkipTurn": data.isSkipTurn
                    , "tactGrade": data.tactGrade
                    , "skillGrade": data.skillGrade
                    , "sort": data.sort
                    , "workingState": data.workingState
                    , "isPartTime": data.isPartTime
                    , "isBasicSalary": data.isBasicSalary

                    , "partTimePostCategoryIdEditShow": data.parTimePostCategoryName
                    , "partTimePostCategoryId": data.partTimePostCategoryId

                    , "partTimePostIdEditShow": data.parTimePostName
                    , "partTimePostId": data.partTimePostId
                });
                //头像地址-赋值
                layero.find("img[id='demo2']").attr("src", (data.headUrl == null || data.headUrl == "") ? "${basePath!}/noImg.png" : data.headUrl);
                layui.form.render();
                //富文本赋值
                var index = layedit.build(introductionEdit, ptool);
                nowED = index;
                //富文本赋值
                layedit.setContent(index, data.introduction);
            }

        });
    }

    //删除员工按钮事件
    function layerDelete(data, table, $) {
        //删除数据库数据
        var url = storeHost + "/manage/beautician/deleteBeautician";
        var data = {
            beauticianIds: data.beauticianId,
            modifyOperator: "${currentUser.trueName!}"
        };
        $.post(url, data, function (res) {
            if (res.responseStatusType.message == "Success") {
                layer.open({
                    title: '删除'
                    , content: '删除成功！'
                });
                //重新加载表格
                table.reload("beauticianReload");
            } else {
                layer.open({
                    title: '删除'
                    , content: '删除失败！'
                });
            }
        })
    }


    //绑定授权项目事件
    function bindingProject(datas, table, $) {
        isFind = 0;
        var a3 = layer.open({
            type: 1,
            title: '护理项目',
            area: ['740px', '500px'],
            closeBtn: 1,
            scrollbar: true,
            content: '<div class="demoTableSerch layui-form">\n' +
                '    <div class="layui-form-item">\n' +
                '        <div class="layui-inline">\n' +
                '            <label class="layui-form-label">商品名称</label>\n' +
                '            <div class="layui-input-inline">\n' +
                '                <input class="layui-input" type="text" name="keyWordProductName" autocomplete="off"\n' +
                '                       placeholder="输入商品名称">\n' +
                '            </div>\n' +
                '            <label class="layui-form-label">商品号</label>\n' +
                '            <div class="layui-input-inline">\n' +
                '                <input class="layui-input" type="text" name="keyWordProductCode" autocomplete="off" placeholder="输入商品号">\n' +
                '            </div>\n' +
                '        </div>\n' +
                '        <div class="layui-inline">\n' +
                '            <button class="layui-btn"  id="find"><i class="layui-icon layui-icon-search"></i></button>\n' +
                '        </div>\n' +
                '    </div>\n' +
                '</div>' +
                '<table id="selectProject" lay-filter="selectProjectDemo"></table>',
            btn: ['提交', '取消'],
            yes: function (index, layero) {
                var url = storeHost + "/manage/beautician/insertProjectToBeautician";//添加授权
                var params = {
                    beauticianId: datas.beauticianId,
                    projects: JSON.stringify(selectBoxsAll)
                };
                $.post(url, params, function (res) {
                    if (res.responseStatusType.message == "Success") {
                        layer.open({
                            title: '授权'
                            , content: '授权成功！'
                            , btn: ["关闭"]
                            , yes: function (index) {
                                layer.close(index); //如果设定了yes回调，需进行手工关闭
                                layer.close(a3);
                            }
                        });
                    } else {

                    }
                })
            },
            btn2: function () {
                layer.closeAll();
            },
            success: function (layero, index) {

                /*----------------渲染表格数据-------------------*/
                layui.use('table', function () {
                    var table = layui.table;
                    var $ = layui.jquery;
                    table = $.extend(table, {config: {checkName: 'isChecked'}});
                    table.render({
                        elem: layero.find('#selectProject')
                        , url: storeHost + "/manage/beautician/selectProject"
                        , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                        , page: true          //显示分页默认不显示
                        , method: 'post'
                        , request: {
                            pageName: 'pageNum', //页码的参数名称，默认：page
                            limitName: 'pageSize' //每页数据量的参数名，默认：limit
                        }
                        , where: {
                            beauticianId: datas.beauticianId
                        }
                        , id: "allDataTable"
                        , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                            return {
                                "code": 0, //解析接口状态
                                "msg": "暂无授权项目", //解析提示文本
                                "count": res.result == null ? 0 : res.result.total, //解析数据长度
                                "data": res.result == null ? 0 : res.result.list //解析数据列表
                            };
                        }
                        , cols: [[
                            {type: 'checkbox', fixed: 'left', width: 100}
                            , {field: 'serviceProductId', title: '项目id', sort: true}
                            , {field: 'productCode', title: '商品编号'}
                            , {field: 'productName', title: '项目名称'}
                            , {field: 'isChecked', title: '是否选择'}
                        ]],
                        done: function (res, curr, count) {
                            resultDataAll = res.data;
                            selectBoxsAll = new Array();
                            var checkStatus = table.checkStatus('allDataTable')
                                , data = checkStatus.data;
                            for (var p in data) {
                                //加入所有选中项目
                                selectBoxsAll.push(data[p].serviceProductId)
                            }
                        }
                    });

                });
                /*----------------渲染表格数据-------------------*/


                /*----------------给搜索按钮绑定事件-------------------*/
                layui.use('layer', function () {
                    var $ = layui.jquery, layer = layui.layer;
                    $(document).on('click', '#find', function () {
                        isFind = 1;
                        layui.use('table', function () {
                            var table = layui.table;
                            var $ = layui.jquery;
                            table = $.extend(table, {config: {checkName: 'isChecked'}});
                            var keyWordProductName = $(".demoTableSerch input[name='keyWordProductName']").val();
                            var keyWordProductCode = $(".demoTableSerch input[name='keyWordProductCode']").val();
                            table.render({
                                elem: layero.find('#selectProject')
                                , url: storeHost + "/manage/beautician/selectProject"
                                , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                                , page: true          //显示分页默认不显示
                                , method: 'post'
                                , request: {
                                    pageName: 'pageNum', //页码的参数名称，默认：page
                                    limitName: 'pageSize' //每页数据量的参数名，默认：limit
                                }
                                , id: "searchDataTable"
                                , where: {
                                    keyWordProductName: keyWordProductName,
                                    keyWordProductCode: keyWordProductCode,
                                    beauticianId: datas.beauticianId
                                }
                                , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                                    return {
                                        "code": 0, //解析接口状态
                                        "msg": "暂无授权项目", //解析提示文本
                                        "count": res.result == null ? 0 : res.result.total, //解析数据长度
                                        "data": res.result == null ? 0 : res.result.list //解析数据列表
                                    };
                                }
                                , cols: [[
                                    {type: 'checkbox', fixed: 'left', width: 100}
                                    , {field: 'serviceProductId', title: '项目id', sort: true}
                                    , {field: 'productCode', title: '商品编号'}
                                    , {field: 'productName', title: '项目名称'}
                                    , {field: 'isChecked', title: '是否选择'}
                                ]],
                                done: function (res, curr, count) {
                                    resultDataAllSearch = res.data;
                                }
                            });
                        });
                    });
                });
                /*----------------给搜索按钮绑定事件-------------------*/
            }
        });

    }


    var currentBeauticianId = "";
    var currentDate = "";
    var leisureTimeNodesArray = new Array();
    var busyTimeNodesArray = new Array();
    var restTimeNodesArray = new Array();
    var a4;

    //排班事件
    function orderwork(datas, table, $) {
        isFind = 0;
        a4 = layer.open({
            type: 1,
            title: '排班管理',
            area: ['740px', '600px'],
            closeBtn: 1,
            scrollbar: true,
            content: $(".orderworkDate"),
            btn: ['提交', '取消'],
            yes: function (index, layero) {
                /*------------获取三种状态时间节点的数组-------------*/
                var leisureTimeNodesArrayAdd = new Array();
                var busyTimeNodesArrayAdd = new Array();
                var restTimeNodesArrayAdd = new Array();
                $(".orderworkDate input[name='check']").each(function (i) {
                    if ($(this).attr("data-type") == 1) {
                        leisureTimeNodesArrayAdd.push($(this).next().text())
                    } else if ($(this).attr("data-type") == 2) {
                        busyTimeNodesArrayAdd.push($(this).next().text())
                    } else if ($(this).attr("data-type") == 3) {
                        restTimeNodesArrayAdd.push($(this).next().text())
                    }
                })

                /*------------获取三种状态时间节点的数组-------------*/

                var url = storeHost + "/manage/orderwork/updateOrderwork";//添加或修改排班
                var params = {
                    beauticianId: currentBeauticianId,
                    orderworkDate: currentDate,
                    leisureTimeNodes: JSON.stringify(leisureTimeNodesArrayAdd),
                    busyTimeNodes: JSON.stringify(busyTimeNodesArrayAdd),
                    restTimeNodes: JSON.stringify(restTimeNodesArrayAdd)
                };
                $.post(url, params, function (res) {
                    if (res.responseStatusType.message == "Success") {
                        layer.open({
                            title: '排班'
                            , content: '排班成功！'
                            , btn: ["关闭"]
                            , yes: function (index) {
                                layer.close(index); //如果设定了yes回调，需进行手工关闭
                                layer.close(a4);
                            }
                        });
                    } else {

                    }
                })
            },
            btn2: function () {
                layer.closeAll();
                $(".orderworkDate input[name='check']").parent().css("background-color", "rgb(90, 124, 72)");
                $(".orderworkDate input[name='check']").attr("data-type", 1);
            },
            success: function (layero, index) {
                $(".nore").css("display", "none")
                $(".basetime").attr("readonly", "readonly");
                $(".orderworkDate input[name='check']").parent().css("background-color", "rgb(90, 124, 72)");
                $(".orderworkDate input[name='check']").attr("data-type", 1);
                currentBeauticianId = datas.beauticianId;
            }
        });

    }

    //时间状态管理事件
    function timeStatus(data) {
        if (data == 1) { //空闲
            $(".orderworkDate input[name='check']:checked").each(function (i) {
                $(this).parent().css("background-color", '#5A7C48');
                $(this).attr("checked", false)
                $(this).attr("data-type", 1)
            })

        } else if (data == 2) {//忙碌
            $(".orderworkDate input[name='check']:checked").each(function (i) {
                $(this).parent().css("background-color", '#F58100')
                $(this).attr("checked", false)
                $(this).attr("data-type", 2)
            })
        } else if (data == 3) {//休息
            $(".orderworkDate input[name='check']:checked").each(function (i) {
                $(this).parent().css("background-color", '#B2B2B2')
                $(this).attr("checked", false)
                $(this).attr("data-type", 3)
            })
        }

    }

    //批量修改时间状态按钮事件
    function moreTime() {
        var beginTimeValue = $("select[name='begin_time'] option:checked").val();
        var endTimeValue = $("select[name='end_time'] option:checked").val();
        var timeStatus = $("select[name='time_status'] option:checked").val();
        if (eval(endTimeValue) == 0 || eval(beginTimeValue) == 0) {
            alert("起始时间或结束时间不能为空")
            return;
        }
        if (eval(endTimeValue) < eval(beginTimeValue)) {
            alert("起始时间不能大于结束时间")
            return;
        }

        if (eval(timeStatus) == 0) {
            alert("请选择时间状态")
            return;
        }
        //给时间范围内的节点赋值
        $(".orderworkDate input[name='check']").each(function () {
            if ($(this).val() <= eval(endTimeValue) && $(this).val() >= beginTimeValue) {
                if (eval(timeStatus) == 1) {
                    $(this).parent().css("background-color", "#5A7C48");
                    $(this).attr("data-type", "1");
                } else if (eval(timeStatus) == 2) {
                    $(this).parent().css("background-color", "#F58100");
                    $(this).attr("data-type", "2");
                } else if (eval(timeStatus) == 3) {
                    $(this).parent().css("background-color", "#B2B2B2");
                    $(this).attr("data-type", "3");
                }
            }
        })

    }

    //删除排班事件
    function deleteOrderWork(data) {
        var url = storeHost + "/manage/orderwork/deleteOrderwork";//删除排班
        var params = {
            beauticianId: currentBeauticianId,
            orderworkDate: currentDate
        };
        $.post(url, params, function (res) {
            if (res.responseStatusType.message == "Success") {
                layer.open({
                    title: '删除排班'
                    , content: '删除成功！'
                    , btn: ["关闭"]
                    , yes: function (index) {
                        layer.close(index); //如果设定了yes回调，需进行手工关闭
                        layer.close(a4);
                    }
                });
            } else {
                layer.msg(res.responseStatusType.error.errorMsg)
            }
        })

    }

    //查看员工按钮事件
    function layerShow(form, data, table, $, layedit, ptool) {
        var div = null;
        var exampleEdit = null;
        var introductionEdit = null;
        if (data.companyType == "2") {
            div = $('#editformdivid_zgs');
            $("#departmentId_other_div").attr("style", "display:block");
            $("#staffIndustryZgsDiv").attr("style", "display:block");
            $("#postCategoryId_div").attr("style", "display:block");
            $("#postId_div").attr("style", "display:block");
            exampleEdit = "exampleEdit_zgs"
            introductionEdit = "introductionEdit_zgs"
        } else {
            div = $('#editformdivid');
            $("#departmentId_other_fgs_div").attr("style", "display:block");
            $("#staffIndustry_fgs_div").attr("style", "display:block");
            $("#postCategoryId_fgs_div").attr("style", "display:block");
            $("#postId_fgs_div").attr("style", "display:block");
            exampleEdit = "exampleEdit_fgs"
            introductionEdit = "introductionEdit_fgs";
        }


        //页面弹框
        layerid = layer.open({
            type: 1,
            title: '员工详情',
            content: div,
            scrollbar: true,
            area: ['600px', '700px'],
            closeBtn: 1,
            btn: ['关闭'],
            btn2: function () {
                layer.close(layerid)
            },
            success: function (layero) {
                form.val(exampleEdit, {
                    "beauticianId": data.beauticianId
                    , "name": data.name
                    , "mobile": data.mobile
                    , "gender": data.gender

                    , "departmentId_other_fgsShow": data.departmentName
                    , "departmentId": data.departmentId

                    , "entryTime": data.entryTime
                    , "storeId": data.storeId

                    , "groupIdEditShow": data.groupName
                    , "groupId": data.groupId

                    , "postId_fgsShow": data.postName
                    , "postId": data.postId

                    , "postCategoryId": data.postCategoryId
                    , "postCategoryId_fgsShow": data.postCategoryName

                    , "isSkipTurn": data.isSkipTurn
                    , "tactGrade": data.tactGrade
                    , "skillGrade": data.skillGrade
                    , "sort": data.sort
                    , "workingState": data.workingState
                    , "introduction": data.introduction
                    , "isPartTime": data.isPartTime

                    , "partTimePostCategoryIdEditShow": data.parTimePostCategoryName
                    , "partTimePostCategoryId": data.partTimePostCategoryId

                    , "partTimePostIdEditShow": data.parTimePostName
                    , "partTimePostId": data.partTimePostId
                });
                //头像地址-赋值
                layero.find("img[id='demo2']").attr("src", (data.headUrl == null || data.headUrl == "") ? "${basePath!}/noImg.png" : data.headUrl);
                form.render();
                //富文本赋值
                var index = layedit.build(introductionEdit, ptool);
                nowED = index;
                //富文本赋值
                layedit.setContent(index, data.introduction);
            }
        });
    }

</script>


<script>
    //关于时间范围的js
    layui.use('laydate', function () {
        var laydate = layui.laydate;
        //时间范围
        laydate.render({
            elem: '#shopBusinessTime'
            , type: 'time'
            , range: true
        });
        //日期时间选择器-添加
        laydate.render({
            elem: '#entryTimeAddFgs'
            , type: 'datetime'
        });
        //日期时间选择器-添加
        laydate.render({
            elem: '#entryTimeAddZgs'
            , type: 'datetime'
        });
        //日期时间选择器-修改
        laydate.render({
            elem: '#entryTimeEditFgs'
            , type: 'datetime'
        });
        //日期时间选择器-修改
        laydate.render({
            elem: '#entryTimeEditZgs'
            , type: 'datetime'
        });
        //常规用法
        laydate.render({
            elem: '#normalDate'
            , done: function (value, date) {
                /*  layer.msg('你选择的日期是：' + value + '<br><br>获得的对象是' + JSON.stringify(date));*/
                currentDate = value;
                $(".nore").css("display", "block")
                /*---------------初始化数据------------------*/
                var url = storeHost + "/manage/orderwork/selectOrderwork";
                var params = {
                    beauticianId: currentBeauticianId,
                    orderworkDate: value
                };
                $.post(url, params, function (res) {
                    if (res.responseStatusType.message == "Success") {
                        leisureTimeNodesArray = JSON.parse(res.result.leisureTimeNodes);
                        busyTimeNodesArray = JSON.parse(res.result.busyTimeNodes);
                        restTimeNodesArray = JSON.parse(res.result.restTimeNodes);
                        //给多选框赋值
                        $(".orderworkDate input[name='check']").each(function (i) {
                            for (var item in leisureTimeNodesArray) {
                                if ($(this).next().text() == leisureTimeNodesArray[item]) {
                                    $(this).parent().css("background-color", '#5A7C48');
                                    $(this).attr("data-type", "1");
                                }
                            }
                            for (var item in busyTimeNodesArray) {
                                if ($(this).next().text() == busyTimeNodesArray[item]) {
                                    $(this).parent().css("background-color", '#F58100');
                                    $(this).attr("data-type", "2");
                                }
                            }
                            for (var item in restTimeNodesArray) {
                                if ($(this).next().text() == restTimeNodesArray[item]) {
                                    $(this).parent().css("background-color", '#B2B2B2');
                                    $(this).attr("data-type", "3");
                                }
                            }
                        })
                    } else {
                        $(".orderworkDate input[name='check']").each(function () {
                            $(this).parent().css("background-color", "#5A7C48");
                            $(this).attr("data-type", "1");
                        })
                        layer.msg(res.responseStatusType.error.errorMsg, {
                            time: 20000, //20s后自动关闭
                            btn: ['明白了']
                        });
                    }
                })
                /*---------------初始化数据------------------*/
            }
        });
    });
</script>


<script>
    layui.use('upload', function () {
        var $ = layui.jquery
            , upload = layui.upload;

        //普通图片上传--添加
        var uploadInst1 = upload.render({
            elem: '#test1'
            , url: storeHost + "/manage/beautician/uploadBeauticianImg"
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
            elem: '#test2'
            , url: storeHost + "/manage/beautician/uploadBeauticianImg"
            , auto: false
            , bindAction: '#startUp'
            , choose: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#demo2').attr('src', result); //图片链接（base64）
                });
            }
            , done: function (res) {
                //如果上传失败
                if (res.code > 0) {
                    return layer.msg('上传失败');
                }
                //上传成功
                resultImgUrl = "http://" + res.result.imageUrl
                layer.msg('上传成功');
            }
            , error: function () {
                //演示失败状态，并实现重传
                var demoText2 = $('#demoText2');
                demoText2.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText2.find('.demo-reload').on('click', function () {
                    uploadInst2.upload();
                });
            }
        });
    });

</script>

<script>
    //数组合并并去重
    function concat(resultDataSelected, resultDataAllSearchSelected) {
        var length1 = resultDataSelected.length;
        var length2 = resultDataAllSearchSelected.length;
        for (var i = 0; i < length1; i++) {
            for (var j = 0; j < length2; j++) {
                //判断添加的数组是否为空了
                if (resultDataSelected.length > 0) {
                    if (resultDataSelected[i] == resultDataSelected[j]) {
                        resultDataSelected.splice(i, 1); //利用splice函数删除元素，从第i个位置，截取长度为1的元素
                        length1--;
                    }
                }
            }
        }
        for (var n = 0; n < resultDataAllSearchSelected.length; n++) {
            resultDataSelected.push(resultDataAllSearchSelected[n]);
        }
        return resultDataSelected;
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