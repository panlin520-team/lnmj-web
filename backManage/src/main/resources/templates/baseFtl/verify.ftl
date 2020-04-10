<script>
    //校验
    layui.use(['form'], function () {
        var form = layui.form;
        form.verify({
            money: [
                /(^[1-9]([0-9]+)?(\.[0-9]{1,2})?$)|(^(0){1}$)|(^[0-9]\.[0-9]([0-9])?$)/
                , '输入内容必须为金额数值'
            ],
            mobile: [
                /^1[3456789]\d{9}$/
                , '手机号格式不正确'
            ],
            password: [
                /^[a-zA-Z\d_]{8,}$/
                , '密码长度必须大于等于8位'
            ],
            name: [
                /[a-zA-Z\u4E00-\u9FA5\uf900-\ufa2d]/
                , '用户名称必须为中文或英文'
            ],
            confirmPass:function(value){
                if($('input[name=password]').val() !== value)
                    return '两次密码输入不一致！';

            }
        });
    });

</script>