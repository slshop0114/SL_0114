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

            var list=result.list;
            var list2=result.num;
            var str="";
            for (var i=0;i<list.length;i++) {
                var obj=list[i];
                var obj2=list2[i];
                str+="<tr><td>"+obj.goodsName+"</td><td>"+obj2.goodsNum+"</td></tr>"
            }
            $("#goodsinfossearch").html(str);

            $("#goodsPackName2").val(result.goodsPack1.goodsPackName)
            $("#goodsPackCode2").val(result.goodsPack1.goodsPackCode)
            $("#goodspacktotalPrice2").val(result.goodsPack1.totalPrice)
            $("#goodspacknote2").val(result.goodsPack1.note)
        }
    });

}

$("#goodspackcodefxc").blur(function () {
    $("#testgoodspackcodefxc").hide();
    var goodspackcode=$("#goodspackcodefxc").val()
    $.ajax({
        url: "/backend/searchgoodspackcode.html",
        method: "post",
        data:{"goodsPackCode":goodspackcode},
        dataType: "text",
        success:function (r) {
            if(r=="1"){
                $("#testgoodspackcodefxc").show();
            }

        }
    })
})

