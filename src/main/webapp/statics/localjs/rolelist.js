function addrole(){

    $("#addrole").css('display','block');
    $("#foraddrole").css('display','block');
}

function modifyRolerole(){
    $("#updaterolehidden").val($('input:radio:checked').val())
    $("#updaterole").css('display','block');
    $("#foraddrole").css('display','block');
}
function deRole() {

    var deid=$("input:radio:checked").val();
    $.ajax({
        url:"/backend/delRole.html",
        method:"post",
        data:{"id":deid},
        dataType:"json",
        success:function (result) {
            window.location.href="/backend/rolelist.html"
        }
    })
}