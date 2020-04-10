<script src="${basePath!}/js/jquery.min.js" type="text/javascript"></script>
<script>
    var storeId = null;
    window.onload = function (ev) {
        if (sessionStorage.getItem("currentUserStore") != null) {
            storeId = JSON.parse(sessionStorage.getItem("currentStore")).storeId;
            var authStoreIdArray = JSON.parse(sessionStorage.getItem("currentUserStore")).storeId;
            var authStoreId = authStoreIdArray.substring(1, authStoreIdArray.length - 1);
            if (authStoreId.split(',').indexOf(storeId.toString()) == -1) {
                alert("抱歉！您没有进入此店铺的权限")
                window.location.href = "/toStorelogin"
            }
        } else {
            alert("用户未登录")
            window.location.href = "/toStorelogin"
        }

    }

</script>
<script>
    //获取url中的参数
    function getUrlParam(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
        var r = window.parent.location.search.substr(1).match(reg);  //匹配目标参数
        if (r != null) return decodeURI(r[2]);
        return null; //返回参数值
    }

    //获取url中的参数
    function getUrlParamCurrent(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
        var r = window.location.search.substr(1).match(reg);  //匹配目标参数
        if (r != null) return decodeURI(r[2]);
        return null; //返回参数值
    }
</script>