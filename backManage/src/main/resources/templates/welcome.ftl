<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>后台管理系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="icon" href="${basePath!}/logo.png">
    <link rel="stylesheet" href="${basePath!}/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="../../layui/css/iconfont.css" media="all"/>
    <link rel="stylesheet" href="${basePath!}/css/index.css" media="all"/>
    <script src="${basePath!}/layui/layui.js" charset="utf-8"></script>
    <script src="${basePath!}/js/host.js" type="text/javascript"></script>
    <#include "baseFtl/pageAuth.ftl" />
    <style>
        #img ul {
            width: 500px;
            margin: 0;
            padding: 0;
            display: flex;
            flex-wrap: wrap;
        }

        #img li {
            margin: 0;
            padding: 0;
            height: 80px;
            display: block;
        }

        #img_bag {
            width: 710px;
            height: 80px;
            margin: 0 60px;
            text-align: center;
            display: flex;
        }

        #img_bag #img {
            width: 660px;
            height: 80px;
            overflow: hidden;
            margin-right: 20px;
        }

        .buttonControl {
            width: 110px;
            margin-top: 5px;
        }

        .buttonControl button {
            display: block;
            width: 30px;
            height: 30px;
            line-height: 30px;
            margin-bottom: 5px;
            outline: none;
            border: none;
            background: #5fb878;
            color: #FFFFFF;
            border-radius: 4px;
            cursor: pointer;
        }

        .buttonControl button.active {
            background: #FFFFFF;
            color: #5fb878;
        }
    </style>
</head>
<body class="main_body">

<form class="layui-form layui-form-pane layui-personal" id="rolesForm" action="" lay-filter="rolesForm" method="post"
      hidden="true">
    <table id="rolesTable" class="rolesTable" lay-filter="rolesTable" hidden="true"></table>
</form>


<div class="layui-layout layui-layout-admin">
    <!-- 顶部 -->
    <div class="layui-header header">
        <div class="layui-main mag0" style="height: 80px ;display: flex;width: 100%; margin-bottom: 30px; clear: both">
            <a href="${basePath!}/welcome" class="logo">
                <img src="${basePath!}/images/logo.png" alt="">
            </a>
            <!-- 显示/隐藏菜单 -->
            <#--<a href="javascript:;" class="seraph hideMenu icon-caidan"><i class="layui-icon layui-icon-shrink-right"></i></a>-->
            <!-- 顶级菜单 -->
            <ul class="layui-nav mobileTopLevelMenus" mobile>
                <li class="layui-nav-item" data-menu="contentManagement">
                    <a href="javascript:;"><i class="seraph icon-caidan"></i><cite>layuiCMS</cite></a>
                    <dl class="layui-nav-child">
                        <#--使用freemarker从session中获得一级菜单列表-->
                        <#list tmenuOneClassList as key>
                            <dd data-menu="${key.name!}"><a href="javascript:;">
                        <i class="layui-icon" data-icon="${key.icon!}">${key.icon!}</i>
                            <cite>${key.name!}</cite></a></dd>
                        </#list>
                        <#--<dd class="layui-this" data-menu="contentManagement"><a href="javascript:;"><i class="layui-icon" data-icon="&#xe63c;">&#xe63c;</i><cite>内容管理</cite></a></dd>
                        <dd data-menu="systemeSttings"><a href="javascript:;"><i class="layui-icon" data-icon="&#xe620;">&#xe620;</i><cite>系统设置</cite></a></dd>-->
                    </dl>
                </li>
            </ul>

            <div id="img_bag" style="width: 800px;">
                <div id="img" style="width: 660px">
                    <ul class="layui-nav topLevelMenus"
                        style=" width: 660px; clear: both; height: 80px;" pc>
                        <#--使用freemarker从session中获得一级菜单列表-->
                        <#list tmenuOneClassList as key>
                            <#if key_index == 0>
                                <li class="layui-nav-item layui-this left" style="float: left;" data-menu="${key.name!}">
                                <a href="javascript:;">
                            <i class="layui-icon-out" data-icon="${key.icon!}">${key.icon!}</i>
                                <cite>${key.name!}</cite>
                                </a>
                                </li>
                            </#if>
                            <#if key_index != 0>
                                <li class="layui-nav-item left" data-menu="${key.name!}">
                                <a href="javascript:;">
                            <i class="layui-icon-out" data-icon="${key.icon!}">${key.icon!}</i>
                                <cite>${key.name!}</cite>
                                </a>
                                </li>
                            </#if>
                        </#list>
                    </ul>
                </div>
                <div class="buttonControl">
                    <button class="layui-icon layui-icon-up" id="up" onmousedown="moveTop()"></button>
                    <button class="layui-icon layui-icon-down" id="down" onmousedown="moveBottom()"></button>
                </div>
            </div>

            <!-- 顶部右侧菜单 -->
            <ul class="layui-nav top_menu">
                <#--                <li class="layui-nav-item" pc>
                                    <a href="javascript:;" class="clearCache" >
                                        <i class="layui-icon" data-icon="&#xe640;">&#xe640;</i><cite style="line-height: 20px;">清除缓存</cite>
                                    </a>
                                </li>-->
                <li class="layui-nav-item lockcms" pc>
                    <a href="javascript:;"><cite style="line-height: 80px;">锁屏</cite></a>
                </li>
                <li class="layui-nav-item" id="userInfo">
                    <a href="javascript:;"><img src="${basePath!}/logo.png" class="layui-nav-img userAvatar" width="35"
                                                height="35"><cite class="adminName">
                            <div id="userInfoId"></div>
                        </cite></a>
                    <dl class="layui-nav-child">
                        <dd pc><a href="javascript:;" class="changeSkin"><i
                                        class="layui-icon">&#xe61b;</i><cite>更换皮肤</cite></a></dd>
                        <dd><a href="${basePath!}/admin/user/logout" class="signOut"><i
                                        class="seraph icon-tuichu"></i><cite>退出</cite></a>
                        </dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>
    <!-- 左侧导航 -->
    <div class="layui-side layui-bg-black">
        <div class="user-photo">
            <a class="img" title="我的头像"><img src="${basePath!}/logo.png" class="userAvatar"></a>
            <p>你好！<span class="userName">${currentUser.trueName!}</span>, 欢迎登录</p>
            <#--<p><button type="button" class="layui-btn layui-btn-xs layui-btn-radius" onclick="checkRoles();">查看角色</button></p>-->
            <p>当前角色为: ${currentUser.roles!}</p>
            <p>${currentUser.companyName!}</p>

        </div>

        <!-- 搜索 -->

        <#--        <div class="layui-form component">
                    <select name="search" id="search" lay-search lay-filter="searchPage">
                        <option value="">搜索页面或功能</option>
                        <option value="1">layer</option>
                        <option value="2">form</option>
                    </select>
                    <i class="layui-icon">&#xe615;</i>
                </div>-->


        <div class="navBar layui-side-scroll" id="navBar">
            <ul class="layui-nav layui-nav-tree">
                <li class="layui-nav-item layui-this">
                    <#--<a href="javascript:;" data-url="${basePath!}/welcome.html"><i class="layui-icon"-->
                    <a href="javascript:;" data-url="/topagehome"><i class="layui-icon" data-icon=""></i><cite
                                class="twocaidan">后台首页</cite></a>
                </li>
            </ul>
        </div>
    </div>
    <!-- 右侧内容 -->
    <div class="layui-body layui-form" style="padding-top: 30px">
        <div class="layui-tab mag0" lay-filter="bodyTab" id="top_tabs_box">
            <ul class="layui-tab-title top_tab" id="top_tabs">
                <li class="layui-this" lay-id=""><i class="layui-icon">&#xe68e;</i> <cite>后台首页</cite></li>
            </ul>
            <ul class="layui-nav closeBox">
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="layui-icon caozuo">&#xe643;</i> 页面操作</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" class="refresh refreshThis"><i class="layui-icon">&#x1002;</i>
                                刷新当前</a></dd>
                        <dd><a href="javascript:;" class="closePageOther"><i class="seraph icon-prohibit"></i> 关闭其他</a>
                        </dd>
                        <dd><a href="javascript:;" class="closePageAll"><i class="seraph icon-guanbi"></i> 关闭全部</a></dd>
                    </dl>
                </li>
            </ul>
            <div class="layui-tab-content clildFrame">
                <div class="layui-tab-item layui-show">
                    <#--<iframe src="${basePath!}/welcome.html"></iframe>-->
                    <iframe src="/topagehome"></iframe>
                </div>
            </div>
        </div>
    </div>
    <!-- 底部 -->
    <#--<div class="layui-footer footer">-->
    <#--<p><span>copyright @2018 ZJT</span></p>-->
    <#--</div>-->


</div>

<!-- 移动导航 -->
<div class="site-tree-mobile"><i class="layui-icon">&#xe602;</i></div>
<div class="site-mobile-shade"></div>

<script type="text/javascript" src="${basePath!}/layui/layui.js"></script>
<script type="text/javascript" src="${basePath!}/js/cache.js"></script>


<#--把index.js提到页面中，为了使用freemarker-->
<script type="text/javascript">
    var $, tab, dataStr, layer;
    layui.config({
        base: "js/"
    }).extend({
        "bodyTab": "bodyTab"
    })
    layui.use(['bodyTab', 'form', 'element', 'layer', 'jquery'], function () {
        var form = layui.form,
            element = layui.element;
        $ = layui.$;
        layer = parent.layer === undefined ? layui.layer : top.layer;
        tab = layui.bodyTab({
            openTabNum: "50",  //最大可打开窗口数量
            /*url : "static/json/navs.json" //获取菜单json地址*/
            url: authHost + "/manager/menu/loadMenuInfo?parentId=1&roleId="+"${currentUser.roleId!}",
            method: "post"
        });

        //通过顶部菜单获取左侧二三级菜单   注：此处只做演示之用，实际开发中通过接口传参的方式获取导航数据
        function getData(json) {
            $.getJSON(tab.tabConfig.url, function (data) {
                <#list tmenuOneClassList as key>
                if (json == "${key.name!}") {
                    dataStr = data.${key.name!};
                    //重新渲染左侧菜单
                    tab.render();
                }
                </#list>
            })
        }

        //页面加载时判断左侧菜单是否显示
        //通过顶部菜单获取左侧菜单
        $(".topLevelMenus li,.mobileTopLevelMenus dd").click(function () {
            if ($(this).parents(".mobileTopLevelMenus").length != "0") {
                $(".topLevelMenus li").eq($(this).index()).addClass("layui-this").siblings().removeClass("layui-this");
            } else {
                $(".mobileTopLevelMenus dd").eq($(this).index()).addClass("layui-this").siblings().removeClass("layui-this");
            }
            $(".layui-layout-admin").removeClass("showMenu");
            $("body").addClass("site-mobile");
            getData($(this).data("menu"));
            //渲染顶部窗口
            tab.tabMove();
        })

        //隐藏左侧导航
        $(".hideMenu").click(function () {
            if ($(".topLevelMenus li.layui-this a").data("url")) {
                layer.msg("此栏目状态下左侧菜单不可展开");  //主要为了避免左侧显示的内容与顶部菜单不匹配
                return false;
            }
            $(".layui-layout-admin").toggleClass("showMenu");
            //渲染顶部窗口
            tab.tabMove();
        })


        //手机设备的简单适配
        $('.site-tree-mobile').on('click', function () {
            $('body').addClass('site-mobile');
        });
        $('.site-mobile-shade').on('click', function () {
            $('body').removeClass('site-mobile');
        });

        // 添加新窗口
        $("body").on("click", ".layui-nav .layui-nav-item a:not('.mobileTopLevelMenus .layui-nav-item a')", function () {
            //如果不存在子级
            if ($(this).siblings().length == 0) {
                addTab($(this));
                $('body').removeClass('site-mobile');  //移动端点击菜单关闭菜单层
            }
            $(this).parent("li").siblings().removeClass("layui-nav-itemed");
        })

        //清除缓存
        $(".clearCache").click(function () {
            window.sessionStorage.clear();
            window.localStorage.clear();
            var index = layer.msg('清除缓存中，请稍候', {icon: 16, time: false, shade: 0.8});
            setTimeout(function () {
                layer.close(index);
                layer.msg("缓存清除成功！");
            }, 1000);
        })

        //刷新后还原打开的窗口
        if (cacheStr == "true") {
            if (window.sessionStorage.getItem("menu") != null) {
                menu = JSON.parse(window.sessionStorage.getItem("menu"));
                curmenu = window.sessionStorage.getItem("curmenu");
                var openTitle = '';
                for (var i = 0; i < menu.length; i++) {
                    openTitle = '';
                    if (menu[i].icon) {
                        if (menu[i].icon.split("-")[0] == 'icon') {
                            openTitle += '<i class="seraph ' + menu[i].icon + '"></i>';
                        } else {
                            openTitle += '<i class="layui-icon">' + menu[i].icon + '</i>';
                        }
                    }
                    openTitle += '<cite>' + menu[i].title + '</cite>';
                    openTitle += '<i class="layui-icon layui-unselect layui-tab-close" data-id="' + menu[i].layId + '">&#x1006;</i>';
                    element.tabAdd("bodyTab", {
                        title: openTitle,
                        content: "<iframe src='" + menu[i].href + "' data-id='" + menu[i].layId + "' ></frame>",
                        id: menu[i].layId
                    })
                    //定位到刷新前的窗口
                    if (curmenu != "undefined") {
                        if (curmenu == '' || curmenu == "null") {  //定位到后台首页
                            element.tabChange("bodyTab", '');
                        } else if (JSON.parse(curmenu).title == menu[i].title) {  //定位到刷新前的页面
                            element.tabChange("bodyTab", menu[i].layId);
                        }
                    } else {
                        element.tabChange("bodyTab", menu[menu.length - 1].layId);
                    }
                }
                //渲染顶部窗口
                tab.tabMove();
            }
        } else {
            window.sessionStorage.removeItem("menu");
            window.sessionStorage.removeItem("curmenu");
        }


        //锁屏相关js 原来位置在cache.js中
        //锁屏
        function lockPage() {
            layer.open({
                title: false,
                type: 1,
                content: '<div class="admin-header-lock" id="lock-box">' +
                    '<div class="admin-header-lock-img"><img src="${basePath!}/logo.png" class="userAvatar"/></div>' +
                    '<div class="admin-header-lock-name" id="lockUserName">${currentUser.account!}</div>' +
                    '<div class="input_btn">' +
                    '<input type="password" class="admin-header-lock-input layui-input" autocomplete="off" placeholder="请输入密码解锁.." name="lockPwd" id="lockPwd" />' +
                    '<button class="layui-btn" id="unlock">解锁</button>' +
                    '</div>' +
                    '<p>请输入账号登录密码！！！</p>' +
                    '</div>',
                closeBtn: 0,
                shade: 0.9,
                success: function () {
                    //判断是否设置过头像，如果设置过则修改顶部、左侧和个人资料中的头像，否则使用默认头像
                    if (window.sessionStorage.getItem('userFace') && $(".userAvatar").length > 0) {
                        $(".userAvatar").attr("src", $(".userAvatar").attr("src").split("images/")[0] + "images/" + window.sessionStorage.getItem('userFace').split("images/")[1]);
                    }
                }
            })
            $(".admin-header-lock-input").focus();
        }

        $(".lockcms").on("click", function () {
            window.sessionStorage.setItem("lockcms", true);
            lockPage();
        })
        // 判断是否显示锁屏
        if (window.sessionStorage.getItem("lockcms") == "true") {
            lockPage();
        }
        // 解锁
        $("body").on("click", "#unlock", function () {
            if ($(this).siblings(".admin-header-lock-input").val() == '') {
                layer.msg("请输入解锁密码！");
                $(this).siblings(".admin-header-lock-input").focus();
            } else {
                var flag = false;
                $.ajax({
                    type: "POST",
                    url: authHost + "/manager/authority/unlock",
                    async: false,
                    data: {
                        "userId": "${currentUser.id!}",
                        "password": $(this).siblings(".admin-header-lock-input").val()
                    },
                    dataType: 'json',
                    timeout: 1000,
                    cache: false,
                    error: function (request) {
                        layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
                    },
                    success: function (data) {
                        if (data.responseStatusType.message == "Success") {
                            flag = data.result
                            console.log(flag)
                        } else {
                            alert(data.responseStatusType.error.errorMsg);
                        }
                    }
                });

                if (flag) {
                    window.sessionStorage.setItem("lockcms", false);
                    $(this).siblings(".admin-header-lock-input").val('');
                    layer.closeAll("page");
                } else {
                    layer.msg("密码错误，请重新输入！");
                    $(this).siblings(".admin-header-lock-input").val('').focus();
                }
            }
        });
        $(document).on('keydown', function (event) {
            var event = event || window.event;
            if (event.keyCode == 13) {
                $("#unlock").click();
            }
        });


    })

    //打开新窗口
    function addTab(_this) {
        tab.tabAdd(_this);
    }

    //图片管理弹窗
    function showImg() {
        $.getJSON('json/images.json', function (json) {
            var res = json;
            layer.photos({
                photos: res,
                anim: 5
            });
        });
    }
</script>

<script type="text/javascript">
    function getEle(obj) {
        return document.getElementById(obj);
    }

    var maxHeight = getEle("img").getElementsByTagName("ul")[0].getElementsByTagName("li").length * 105;
    //����ͼƬ�����߶�
    var targety = 211;
    //һ�ι�������
    var dx;
    var a = null;

    function moveTop() {
        var le = parseInt(getEle("img").scrollTop);

        getEle("up").className = "layui-icon layui-icon-up active";
        getEle("down").className = "layui-icon layui-icon-down";
        if (le > 211) {
            targety = parseInt(getEle("img").scrollTop) - 211;
            console.log('-', le);
        } else {
            targety = parseInt(getEle("img").scrollTop) - le - 1;
            console.log('-2', le);
        }
        scTop();
    }

    function scTop() {
        dx = parseInt(getEle("img").scrollTop) - targety;
        getEle("img").scrollTop -= dx * .3;
        clearScroll = setTimeout(scTop, 50);
        if (dx * .3 < 1) {
            clearTimeout(clearScroll);
        }
    }

    function moveBottom() {
        var le = parseInt(getEle("img").scrollTop) + 211;
        getEle("up").className = "layui-icon layui-icon-up";
        getEle("down").className = "layui-icon layui-icon-down active";
        var maxL = maxHeight - 600;
        if (le < maxL) {
            targety = parseInt(getEle("img").scrollTop) + 211;
        } else {
            targety = maxL
        }
        scBottom();
    }

    function scBottom() {
        dx = targety - parseInt(getEle("img").scrollTop);
        getEle("img").scrollTop += dx * .3;
        a = setTimeout(scBottom, 50);
        if (dx * .3 < 1) {
            clearTimeout(a)
        }
    }


    function checkRoles() {
        layui.use('table', function () {
            var table = layui.table;
            layerid = layer.open({//开启表单弹层
                // skin: 'layui-layer-molv',
                area: '60%',
                type: 1,
                title: '选择管理员类型',
                content: $('#rolesForm'), //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
                success: function (layero) {
                    var table = layui.table;
                    table.render({
                        elem: '#rolesTable'
                        , url: authHost + "/admin/user/selectRoleListByUserId"
                        , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                        , page: true          //显示分页默认不显示
                        , method: 'post'
                        , request: {
                            pageName: 'pageNum', //页码的参数名称，默认：page
                            limitName: 'pageSize' //每页数据量的参数名，默认：limit
                        }
                        , where: {
                            id: "${currentUser.id!}"
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
                            {field: 'id', title: 'id', sort: true, fixed: 'left'}
                            , {field: 'bz', title: '权限介绍'}
                            , {field: 'name', title: '权限名称'}
                            , {field: 'remarks', title: '备注'}
                        ]]
                    });
                }
            });

        });
    }


</script>
</body>
</html>