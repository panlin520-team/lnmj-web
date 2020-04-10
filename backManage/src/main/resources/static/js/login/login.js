layui.use(['form', 'layer', 'jquery'], function () {
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : top.layer
    $ = layui.jquery;

    // 表单输入效果
    $(".loginBody .input-item").click(function (e) {
        e.stopPropagation();
        $(this).addClass("layui-input-focus").find(".layui-input").focus();
    });
    $(".loginBody .layui-form-item .layui-input").focus(function () {
        $(this).parent().addClass("layui-input-focus");
    });
    $(".loginBody .layui-form-item .layui-input").blur(function () {
        $(this).parent().removeClass("layui-input-focus");
        if ($(this).val() != '') {
            $(this).parent().addClass("layui-input-active");
        } else {
            $(this).parent().removeClass("layui-input-active");
        }
    });

    // 监听表单提交事件
    form.on('submit(login)', function (data) {
        var loginType = $("input[name='loginType']:checked").val();
        var companyId = "0";
        var companyType = "0";
        var isSuperAdmin = "0";
        if (loginType === "1") {
            //如果是总公司登陆 获取总公司选中值
            var companySelectValue = $("#companySelect option:selected").val();
            companyId = companySelectValue;
            companyType = "1";
        } else if (loginType === "2") {
            //如果是子公司登陆 获取子公司选中值
            var subCompanySelectValue = $("#subCompanySelect option:selected").val();
            companyId = subCompanySelectValue;
            companyType = "2";
        } else if (loginType === "0") {
            isSuperAdmin = "1";
        }

        $.post("/login", {
            userName: $("#userName").val(),
            password: $("#password").val(),
            imageCode: $("#imageCode").val(),
            companyId: companyId,
            companyType: companyType,
            isSuperAdmin: isSuperAdmin
        }, function (result) {
            if (result.responseStatusType.message == "Success") {
                window.location.href = "/welcome?authStoreId=" + result.result.user.storeId.substring(1, result.result.user.storeId.length - 1);
            } else {
                alert(result.responseStatusType.error.errorMsg);
            }
        });
        return false;
    });
});

// session过期后登陆页面跳出iframe页面问题,登陆页面增加javascript
if (top.location !== self.location) {
    top.location = self.location;
}

// 验证码
// 点击换一张验证码
function changeImg() {
    var imgSrc = $("#imgObj");
    var src = imgSrc.attr("src");
    imgSrc.attr("src", chgUrl(src));
    $("#info").html("");
}

// 时间戳
// 为了使每次生成图片不一致，即不让浏览器读缓存，所以需要加上时间戳
function chgUrl(url) {
    var timestamp = (new Date()).valueOf();
    var dex = url.indexOf("drawImage") + "drawImage".length;
    url = url.substring(0, dex);
    if ((url.indexOf("&") >= 0)) {
        url = url + "×tamp=" + timestamp;
    } else {
        url = url + "?timestamp=" + timestamp;
    }
    return url;
}

// 验证码验证
function isRightCode() {
    var code = $("#veryCode").attr("value");
    //alert(code);
    code = "c=" + code;
    $.ajax({
        type: "POST",
        url: "ResultServlet",
        data: code,
        success: callback
    });
}

// 验证以后处理提交信息或错误信息
function callback(data) {
    if (data.toString() == 1) {
        return;
    } else {
        $("#info").html(data);
        return;
    }
}


//添加单选事件
layui.use(['form'], function () {
    var form = layui.form;
/*    loadCompany(form)
    loadSubCompany(form)*/
    form.on('radio(loginType)', function (data) {
        if (data.value == '1') {
            $("#company").css("display", "block");
            $("#subCompany").css("display", "none");
        } else {
            $("#company").css("display", "none");
            $("#subCompany").css("display", "block");
        }
    });

})

/*//初始化总公司列表
function loadCompany(form) {
    var url = storeHost + "/manage/company/selectCompanyListNoPage";
    var data = {};
    $.post(url, data, function (result) {
        if (result.responseStatusType.message == "Success") {
            var list = result.result;    //返回的数据
            var server = document.getElementById("companySelect"); //server为select定义的id
            server.innerHTML = "<option value='0' selected='selected'>请选择</option>";
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
}*/

/*//初始化子公司分组列表
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
                for (var n in subsidiaryList) {
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
