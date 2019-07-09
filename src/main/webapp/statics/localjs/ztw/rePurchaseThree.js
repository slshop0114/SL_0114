var totalPri = document.getElementsByClassName('totalPri')
var totalPv = document.getElementsByClassName('totalPv')
var totalPvs = 0;
var totalPric = 0;
$(function () {
    layui.use('form', function(){
        var form = layui.form;
        form.render('select');
    });
    for (i = 0; i < totalPri.length; i++) {
        totalPric += Number(totalPri[i].textContent)
    }
    $("#totalSum").html(totalPric)


    for (i = 0; i < totalPv.length; i++) {
        totalPvs += Number(totalPv[i].textContent)
    }
    $("#totalPvs").html(totalPvs)
})

function payMoney() {
    var residualMoney = $("#residualMoney").html();
    var judgeBuy= Number(residualMoney)-Number(totalPric);
    var repeatOut= Number(totalPric);
    alert(repeatOut)
    var shipNumber =  $("#orserSn").html();
    var totalPvs = $("#totalPvs").html();
    var userLoginUserId = $("#userLoginUserId").html();
    var str1 = $("#selProvince").val();
    var str2 = $("#selCity").val();
    var str3 = $("#detailedAddress").val();
    var address =str1+str2+str3;
    var s5 =$("#post").val();
    var s4 = $("#zipCode").val()
    if (judgeBuy>= 0&& repeatOut !=0){
        $.ajax({
            url:"/shopManger/rePurchaseThree.dopay",
            data:{"repeatOut":repeatOut,"pv":totalPvs,"id":userLoginUserId,"shipNumber":shipNumber,"address":address,"postType":s5,"zipCode":s4},
            type:"post",
            dataType:"json",
            success:function (result) {
                if (result.code ==200){
                    layer.open({
                        type: 1
                        , offset: 'auto'
                        , id: 'layerDemo' + 'auto' //防止重复弹出
                        , content: '<div style="padding: 20px 130px;">支付成功！</div>'
                        , btn: '关闭'
                        , btnAlign: 'c' //按钮居中
                        , shade: 0 //不显示遮罩
                        , yes: function () {
                            layer.closeAll();
                            window.location.href='/shopManger/rePurchase.html';
                        }
                    });
                }
            }
        })
    }else if (repeatOut ==0) {
        alert(judgeBuy)
        layer.close(layer.index);
        layer.msg('您还没买东西呢，需要去购物吗？', {
            time: 20000, //20s后自动关闭
            btn: ['需要', '关闭']
            , yes: function () {
                // window.location.href='/shopManger/rePurchaseTwo.show?loginCode='+loginCode+'';
                //跳转到充值页面！
            }
            , btn2: function() {
                layer.closeAll();
                window.location.href='/shopManger/rePurchase.html';
            }
        })
    }
}


