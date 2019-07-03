function adddclist() {

    $("#adddicfrom").css('display', 'block');
    $("#foradddicmanage").css('display', 'block');
}

function modifydclist() {
    // $("#updaterolehidden").val($('input:radio:checked').val())
    $("#updatedicfrom").css('display', 'block');
    $("#foradddicmanage").css('display', 'block');
}

function dedicmanage() {
    var dicid = $('#fromdicmanagelist input:radio:checked').val();
    $.ajax({
        url: "/backend/delgoodsinfo.html",
        method: "post",
        data: {"id": dicid},
        dataType: "json",
        success: function (result) {
            window.location.href = "/backend/dicmanage.html"
        }
    })
}