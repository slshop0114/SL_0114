function addShopCart() {
    chooseId = document.getElementsByName("choosegoodspack");
    var loginCode =$("#getUserId").val()
    for (k in chooseId) {
        if (chooseId[k].checked) {
            var goodsPackId = chooseId[k].value;
            var num = $("#inp"+k+"").val();
            if (num==''){
                num = 1;
            }
            $.ajax({
                url: "/shopManger/rePurchaseTwo.add",
                type: "post",
                data: {"goodsPackId": goodsPackId, "num": num,"loginCode":loginCode},
                dataType: "json",
                success: function (result) {
                    if (result.code == 200) {
                        layer.close(layer.index);
                        layer.msg('加入购物车成功，需要结算吗？', {
                            time: 20000, //20s后自动关闭
                            btn: ['确定', '继续购物']
                            , yes: function () {
                                    window.location.href='/shopManger/rePurchaseTwo.show?loginCode='+loginCode+'';
                            }
                            , btn2: function() {
                                layer.closeAll();
                                window.location.href='/shopManger/rePurchase.html'
                            }
                        })
                    }
                    if (result.code == 400){
                        layer.open({
                            type: 1
                            , offset: 'auto'
                            , id: 'layerDemo' + 'auto' //防止重复弹出
                            , content: '<div style="padding: 20px 130px;">数量不能为0，请重新填写</div>'
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
function goPay() {


}