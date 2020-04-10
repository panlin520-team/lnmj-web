<div class="layui-fluid">
    <div class="user_message">
        <div class="block" style="overflow: hidden;">
            <div class="name_all" style="display: none;"></div>
            <div class="VIPCard" hidden="hidden"><label>用户id:<label><input type="text" name="userId" value=""
                                                                           style="height:25px;"></div>
            <div class="VIPCard"><img width="60px" src="" name="headimg" id="headimg" alt="用户头像"/></div>
            <div class="VIPCard"><label>会员卡号:</label><input type="text" name="VIPCard" value="" style="height:25px;">
            </div>
            <div class="VIPCard"><label>真实姓名:</label><input type="text" name="RealName" value="" style="height:25px;">
            </div>
            <div class="VIPCard"><input class="btn" type="button" name="edit_username" value="修改姓名"></div>
            <div class="VIPCard"><label>联系电话:</label><input type="text" name="Mobile" value="" style="height:25px;">
            </div>
            <div class="VIPCard"><label>微信昵称:</label><input type="text" name="nickname" value="" style="height:25px;">
            </div>
            <div class="VIPCard"><input class="btn" type="button" name="userdata" value="获取信息"></div>
            <div class="VIPCard"><input class="btn" type="button" name="resetUserData" value="重置会员信息"></div>
        </div>

        <div class="block" style="overflow: hidden;">
            <div class="VIPCard"><label>账户类型:</label><select name="findaccountType" id="findaccountType"
                                                             lay-filter="findaccountType" lay-verify="required"
                                                             style="width: 130px;height: 30px;"></select></div>
            <div class="VIPCard"><label>账户金额:</label><input type="text" name="accountValue" value=""
                                                            style="height:25px;"></div>
            <div class="VIPCard"><input class="btn" type="button" name="accountdata" value="获取账户信息"></div>
        </div>
    </div>
</div>
<script>
    window.onload = function () {
        loadFindAccountType()
    }

    //获取用户信息按钮
    var isUserId = null;
    var carNumber = null;
    var name = null;
    var membermobile = null;
    $(document).on("click", "input[name='userdata']", function getUserData() {
        //用户信息
        var url = accountHost + "/manage/account/selectAccountByCondition";
        var mobile = $("input[name='Mobile']").val()
        var cardNumber = $("input[name='VIPCard']").val()
        if (mobile == "" && cardNumber == "") {
            layer.msg("请输入会员卡号或手机号")
        }
        var data = {"mobile": mobile, "cardNumber": cardNumber};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var res = result.result;
                $("input[name='userId']").val(res.userId)
                $("input[name='VIPCard']").val(res.cardNumber)
                $("input[name='RealName']").val(res.name)
                $("input[name='Mobile']").val(res.mobile)
                $("input[name='nickname']").val(res.nickName)
                if (res.account.headImgUrl == null) {
                    $("img[name='headimg']").attr("src", "${basePath!}/noImg.png");
                }
                isUserId = res.userId;
                carNumber = res.cardNumber;
                name = res.name;
                membermobile = res.mobile;
            } else {
                layer.msg(result.responseStatusType.error.errorMsg)
                return;
            }
        })
    });

    //获取用户账户信息
    $(document).on("click", "input[name='accountdata']", function getAccountData() {
        if (isUserId == null) {
            layer.msg("请先获取用户信息")
            return
        }
        //账户信息
        var url = walletHost + "/wallet/selectWalletBalanceInfoById";
        var userId = $("input[name='userId']").val()
        var rechargeType = $("#findaccountType").find("option:selected").val()
        if (rechargeType == 0) {
            layer.msg("请选择账户类型")
        }
        var data = {"userId": userId, "rechargeType": rechargeType};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var res = result.result.walletAmountsMap.walletAmount[0];
                $("input[name='accountValue']").val(res.amount)//金额值
            } else {
                layer.msg(result.responseStatusType.error.errorMsg)
                return;
            }
        })
    });

    //重置会员信息
    $(document).on("click", "input[name='resetUserData']", function () {
        $("input[name='userId']").val("")
        $("input[name='VIPCard']").val("")
        $("input[name='RealName']").val("")
        $("input[name='Mobile']").val("")
        $("input[name='nickname']").val("")
        $("input[name='integral']").val("")//返利余额
        $("input[name='prestore']").val("")//储值余额
        $("input[name='rebate']").val("")//赠送余额
        $("img[name='headimg']").attr("src", "${basePath!}/noImg.png");
        isUserId = null;
    });

    //加载账户类型-获取账户金额
    function loadFindAccountType() {
        var url = walletHost + "/manage/wallet/selectWalletAccountList";
        var data = {};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("findaccountType"); //server为select定义的name
                server.innerHTML = "<option value='0' selected='true'>请选择</option>";
                for (var p in list) {
                    var option = document.createElement("option");  // 创建添加option属性
                    option.setAttribute("value", list[p].accountTypeId); // 给option的value添加值
                    option.innerText = list[p].accountType;     // 打印option对应的纯文本
                    server.appendChild(option);           //给select添加option子标签
                }
            } else {

            }
        })
    }

</script>

