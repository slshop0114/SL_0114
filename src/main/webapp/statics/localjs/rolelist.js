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
    if (window.confirm("确定删除？")) {

    }
    var deid=$("input:radio:checked").val();
    $.ajax({
        url:"/backend/delRole.html",
        method:"post",
        data:{"id":deid},
        dataType:"text",
        success:function (result) {

            window.location.href="/backend/rolelist.html"
        }
    })
}


    $("#roleCodeblur").blur(function () {
        $("#hiddenrolecode").hide();
        var rolecode=$("#roleCodeblur").val()
        $.ajax({
            url: "/backend/blurrole.html",
            method: "post",
            data:{"roleCode":rolecode},
            dataType: "json",
            success:function (r) {
                if(r.key=="fault"){
                    $("#hiddenrolecode").show();
                }

            }
        })
    })
    $("#roleCodeblur2").blur(function () {
        $("#hiddenrolecode2").hide();
        var rolecode=$("#roleCodeblur2").val()
        $.ajax({
            url: "/backend/blurrole.html",
            method: "post",
            data:{"roleCode":rolecode},
            dataType: "json",
            success:function (r) {
                if(r.key=="fault"){
                    $("#hiddenrolecode2").show();
                }

            }
        })
    })


