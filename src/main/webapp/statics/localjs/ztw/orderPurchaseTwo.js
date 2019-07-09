function existName() {
    var username = $("#userName").val();
    $.ajax({
        url: "/shopManger/existName.html",
        type: "post",
        data: "username=" + username,
        dataType: "json",
        success: function (result) {
            if (result.code == 400) {
                layer.open({
                    type: 1
                    , offset: 'auto'
                    , id: 'layerDemo' + 'auto' //防止重复弹出
                    , content: '<div style="padding: 20px 130px;">用户名不存在，请重新输入！</div>'
                    , btn: '关闭'
                    , btnAlign: 'c' //按钮居中
                    , shade: 0 //不显示遮罩
                    , yes: function () {
                        layer.closeAll();
                    }
                });
            } else if (result.code == 200) {
                window.location.href='/shopManger/orderPurchaseThree.do?username='+username+'';

            }
        }
    });
}
