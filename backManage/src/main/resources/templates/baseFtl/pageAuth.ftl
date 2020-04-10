<script>
    window.onload = function (ev) {
        <#if Session["currentUser"]??>
        <#else>
        layui.use('layer', function () { //独立版的layer无需执行这一句
            var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
            layer.open({
                type: 1
                ,
                title: false //不显示标题栏
                ,
                closeBtn: false
                ,
                area: '300px;'
                ,
                shade: 0.8
                ,
                id: 'LAY_layuipro' //设定一个id，防止重复弹出
                ,
                btn: ['前往登录', '残忍拒绝']
                ,
                btnAlign: 'c'
                ,
                moveType: 1 //拖拽模式，0或者1
                ,
                content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">暂未登录，请先登录！</div>'
                ,
                success: function (layero) {
                    var btn = layero.find('.layui-layer-btn');
                    btn.find('.layui-layer-btn0').attr({
                        href: '/tologin'
                    });
                }
            });
        });
        </#if>
    }

</script>
