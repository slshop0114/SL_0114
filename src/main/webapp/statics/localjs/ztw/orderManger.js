function deleteOrderList() {
    obj = document.getElementsByName("getChecked");
    check_val = [];
    layer.close(layer.index);
    layer.msg('确认要删除吗？', {
        time: 20000, //20s后自动关闭
        btn: ['删除', '暂不']
        , yes: function () {
            for (k in obj) {
                if (obj[k].checked) {
                    var orderid=obj[k].value
                    $.ajax({
                        url: "/shopManger/rePurchase.dodel",
                        type: "post",
                        data: {"orderid":orderid},
                        dataType: "json",
                        success: function (result) {
                            if (result.code == 200) {
                                layer.open({
                                    type: 1
                                    , offset: 'auto'
                                    , id: 'layerDemo' + 'auto' //防止重复弹出
                                    , content: '<div style="padding: 20px 130px;">删除成功！</div>'
                                    , btn: '关闭'
                                    , btnAlign: 'c' //按钮居中
                                    , shade: 0 //不显示遮罩
                                    , yes: function () {
                                        layer.closeAll();
                                        window.location.href = '/shopManger/orderManger.html';
                                    }
                                });
                            } else {
                                layer.open({
                                    type: 1
                                    , offset: 'auto'
                                    , id: 'layerDemo' + 'auto' //防止重复弹出
                                    , content: '<div style="padding: 20px 130px;">删除失败！请联系后台人员</div>'
                                    , btn: '关闭'
                                    , btnAlign: 'c' //按钮居中
                                    , shade: 0 //不显示遮罩
                                    , yes: function () {
                                        layer.closeAll();
                                    }
                                });
                            }
                        }
                    })
                }
            }
        }
    });

}