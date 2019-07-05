function addgoodspack() {

    $("#addgoodspack").css('display', 'block');
    $("#forgoodspacklist").css('display', 'block');
}

function modifygoodspack() {
    // $("#updaterolehidden").val($('input:radio:checked').val())
    $("#updategoodspack").css('display', 'block');
    $("#forgoodspacklist").css('display', 'block');
}

function degoodspack() {
    if (window.confirm("确定删除？")) {

    }
    var dicid = $('#fromgoodspacklist input:radio:checked').val();
    $.ajax({
        url: "/backend/delgoodspack.html",
        method: "post",
        data: {"id": dicid},
        dataType: "text",
        success: function (result) {
            window.location.href = "/backend/goodspacklist.html"
        }
    })
}

function searchgoodspack() {
    var goodpackid = $('#fromgoodspacklist input:radio:checked').val()
    $("#searchgoodspack").css('display', 'block');
    $("#forgoodspacklist").css('display', 'block');
    $.ajax({
        url: "/backend/modifygoodspack.html",
        dataType: "json",
        method: "post",
        data: {"id": goodpackid},
        success: function (result) {
            $("#goodsPackName2").val(result.goodsPackName)
            $("#goodsPackCode2").val(result.goodsPackCode)
            $("#goodspacktotalPrice2").val(result.totalPrice)
            $("#goodspacknote2").val(result.note)
        }
    });

}

