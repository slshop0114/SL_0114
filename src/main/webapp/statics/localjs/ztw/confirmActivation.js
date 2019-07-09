$(function () {
    layui.use('laydate', function () {
        var laydate = layui.laydate;

        //常规用法
        laydate.render({
            elem: '#test1'
        })
        laydate.render({
            elem: '#test2'
        })

    })
    var count = $("#getCount").val()
    layui.use('laypage', function () {
        var laypage = layui.laypage;
        //执行一个laypage实例
        laypage.render({
            elem: 'page' //注意，这里的 test1 是 ID，不用加 # 号
            , count: count//数据总数，从服务端得到
            , limits: 5
        });
    });
})

function goActivation() {
    layer.open({
        type: 1
        , offset: 'auto'
        , id: 'layerDemo' + 'auto' //防止重复弹出
        , content: '<div style="padding: 20px 130px;">激活成功！</div>'
        , btn: '关闭'
        , btnAlign: 'c' //按钮居中
        , shade: 0 //不显示遮罩
        , yes: function () {
            var orderuserid = $("#orderuserid").html();
            $("#getUserIdf").val(orderuserid);
            $("#goForm").click();
            layer.closeAll();
        }
    });
}