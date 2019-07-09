var sumPrice = document.getElementsByClassName('sumPrice')
getTest = document.getElementsByClassName('getTest')
var totalPrices = 0;
$(function () {
    for (i = 0; i < sumPrice.length; i++) {
        Number(sumPrice[i].textContent)
        totalPrices += Number(sumPrice[i].textContent)
    }
    $("#totalPrice").html(totalPrices)
})

function goPay() {
    var loginCode = $("#getUserId").val()
    window.location.href = '/shopManger/rePurchaseThree.html?loginCode=' + loginCode + '';
}

function onInput() {
    for (k in getTest) {
        if (getTest[k].value != undefined && getTest[k].value != "" && getTest[k].value != null) {
            var num = $("#gsc" + k + "").val()
            var listId = $("#listId" + k + "").val()
            var loginCode = $("#getUserId").val();
            $.ajax({
                url: "/shopManger/rePurchaseTwo.changenum",
                type: "post",
                data: {"goodsNum": num, "listId": listId},
                dataType: "json",
                success: function (result) {
                    if (result.code == 200) {
                        window.location.href = '/shopManger/rePurchaseTwo.show?loginCode=' + loginCode + '';
                    }
                }
            })
        }
    }
}

