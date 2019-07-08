
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
    if (window.confirm("确定删除？")) {

    }
    var dicid = $('#fromdicmanagelist input:radio:checked').val();
    $.ajax({
        url: "/backend/delMainDic.html",
        method: "post",
        data: {"id": dicid},
        dataType: "text",
        complete: function (result) {
            window.location.href = "/backend/dicmanage.html"
        }
    })
}

