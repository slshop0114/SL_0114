function addauthority() {

    $("#addgoodsinfo").css('display', 'block');
    $("#foraddgoodsinfo").css('display', 'block');
}

function modifyauthority() {
    // $("#updaterolehidden").val($('input:radio:checked').val())
    $("#updategoodsinfo").css('display', 'block');
    $("#foraddgoodsinfo").css('display', 'block');
}

function deauthority() {

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