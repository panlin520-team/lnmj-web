<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>登录</title>
    <link rel="stylesheet" href="${basePath!}/layui/css/layui.css"/>
    <link rel="stylesheet" href="${basePath!}/css/login/login.css"/>
</head>
<body class="loginBody">
<form class="layui-form login" action="" lay-filter="aaah">
    <div class="logo">
        <img src="${basePath!}/images/companyLogo.png" alt="">
    </div>
    <div class="formSection">
        <div class="title">
            <img src="${basePath!}/images/company.png" alt="">
            <p>Login</p>
        </div>
        <div class="maincontent">
            <div class="layui-form-item input-item">
                <label for="userName">UserName</label>
                <input type="text" placeholder="请输入用户名" <#--autocomplete="off"--> id="userName" name="userName" class="layui-input"
                       lay-verify="required|userName">
            </div>
            <div class="layui-form-item input-item">
                <label for="password">PassWord</label>
                <input type="password" placeholder="请输入密码" autocomplete="off" id="password" name="password" class="layui-input"
                       lay-verify="required|password">
            </div>
            <div class="layui-form-item input-item" id="imgCode">
                <label for="code">Code</label>
                <input type="text" placeholder="请输入验证码" id="imageCode" name="imageCode" autocomplete="off" id="code"
                       class="layui-input">
                <#--验证码通过接口获取-->
                <img id="imgObj" title="看不清，换一张" src="${basePath!}/drawImage" onclick="changeImg()"/>
            </div>

           <#-- <div class="layui-form-item">
                <label class="inline">选择登陆方式</label>
                <div class="layui-input-block inline-block">
                    <input type="radio" name="loginType" value="0" title="超级管理员" checked="" lay-filter="loginType">
                    <input type="radio" name="loginType" value="1" title="总公司" lay-filter="loginType">
                    <input type="radio" name="loginType" value="2" title="子公司" lay-filter="loginType">
                </div>
            </div>

            <div class="layui-form-item" id="company" style="display:none;">
                <label class="inline">选择总公司</label>
                <div class="layui-input-block inline-block">
                    <select name="company" lay-filter="company" id="companySelect">
                    </select>
                </div>
            </div>

            <div class="layui-form-item" id="subCompany" style="display:none;">
                <label class="inline">选择子公司</label>
                <div class="layui-input-block inline-block">
                    <select name="subCompany" lay-verify="required" lay-search="" id="subCompanySelect">
                    </select>
                </div>
            </div>-->

            <div class="layui-form-item">
                <button class="layui-btn" lay-filter="login" id="login" lay-submit>登录</button>
            </div>
        </div>
    </div>
    <#--<div class="login-avatar"><img src="${basePath!}/logo.png" alt="凝美时尚" title="凝美时尚"></div>-->
</form>
</body>

<script type="text/javascript" src="${basePath!}/layui/layui.js"></script>
<script type="text/javascript" src="${basePath!}/js/host.js"></script>
<script type="text/javascript" src="${basePath!}/js/cache.js"></script>
<script type="text/javascript" src="${basePath!}/js/login/login.js"></script>
</html>

<script>
    //添加单选事件
    layui.use(['form'], function () {
        var form = layui.form;
       /* loadCompany(form)
        loadSubCompany(form)*/
        form.on('radio(loginType)', function (data) {
            if (data.value == '1') {
                $("#company").css("display", "block");
                $("#subCompany").css("display", "none");
            } else if(data.value == '2'){
                $("#company").css("display", "none");
                $("#subCompany").css("display", "block");
            } else if(data.value == '0'){
                $("#company").css("display", "none");
                $("#subCompany").css("display", "none");
            }
        });

    });

/*    //初始化总公司列表
    function loadCompany(form) {
        var url = storeHost + "/manage/company/selectCompanyListNoPage";
        var data = {};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("companySelect"); //server为select定义的id
                server.innerHTML = "";//"<option value='0' selected='selected'>请选择</option>";
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

    //初始化子公司分组列表
    function loadSubCompany(form) {
        var url = storeHost + "/manage/company/selectCompanyAndSubListNoPage";
        var data = {};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("subCompanySelect"); //server为select定义的id
                server.innerHTML = "<option value='0' selected='selected'>直接选择或搜索选择</option>";
                for (var p in list) {
                    var optgroup = document.createElement("optgroup");  // 创建添加optgroup属性
                    optgroup.setAttribute("label", list[p].companyName); // 给optgroup的label添加值
                    var subsidiaryList = list[p].subsidiaryList;
                    for (var n in subsidiaryList){
                        var option = document.createElement("option");  // 创建添加option属性
                        option.setAttribute("value", subsidiaryList[n].subsidiaryId); // 给option的value添加值
                        option.innerText = subsidiaryList[n].subsidiaryName;     // 打印option对应的纯文本
                        optgroup.appendChild(option)
                    }
                    server.appendChild(optgroup);           //给select添加option子标签
                }
                form.render();
            } else {

            }
        })
    }*/
</script>