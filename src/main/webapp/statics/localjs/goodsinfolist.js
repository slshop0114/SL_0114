function addgoodsinfo() {

    $("#addgoodsinfo").css('display', 'block');
    $("#foraddgoodsinfo").css('display', 'block');
}

function modifygoodsinfo() {
    // $("#updaterolehidden").val($('input:radio:checked').val())
    $("#updategoodsinfo").css('display', 'block');
    $("#foraddgoodsinfo").css('display', 'block');
}

function degoodsinfo() {

    var deid = $("#fromgoodslist input:radio:checked").val();
    alert("删除")
    $.ajax({
        url: "/backend/delgoodsinfo.html",
        method: "post",
        data: {"id": deid},
        dataType: "json",
        success: function (result) {

            window.location.href = "/backend/goodsinfolist.html"
        }
    })
}

function searchgoodsinfo() {
    var goodsid = $("#searchgoodsinput").val();
    $("#foraddgoodsinfo").css('display', 'block');
    $("#searchgoodsinfo").css('display', 'block');
    $.ajax({
        url: "/backend/getgoodsinfo.html",
        dataType: "json",
        method: "post",
        data: {"id": goodsid},
        success: function (result) {
            $("#goodsInfo2goodsName").val(result.goodsName)
            $("#goodsInfo2id").val(result.goodsSN)
            $("#goodsInfo2idr").val(result.id)
            $("#goodsInfo2marketPrice").val(result.marketPrice)
            $("#goodsInfo2realPrice").val(result.realPrice)
            $("#goodsInfo2num").val(result.num)
            $("#goodsInfo2uni").val(result.unit)
            $("#goodsInfo2formate").val(result.goodsFormat)
            $("#goodsInfo2note").val(result.note)
        }
    })

}