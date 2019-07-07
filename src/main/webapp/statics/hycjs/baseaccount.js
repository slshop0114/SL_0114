$(function () {
    open()
    layui.use('laydate', function(){
        var laydate = layui.laydate;
        laydate.render({
            elem: '#date1',
        });
        laydate.render({
            elem: '#date2',
        });
    });
});

// 一页展示条数
var maxResults=4;
// 第几页
var firstResult=1;
// 首页
function firstpage() {
    firstResult=1;
    open()
}
// 下一页
function nextpage(){
    firstResult+=1;
    open()
}
// 上一页
function previouspage(){
    firstResult-=1;
    if (firstResult<1){
        firstResult=1;
    }
    open()
}


function open() {
    var userid = $("#userid").val() ;
    var date1 = $("#date1").val();
    var date2 = $("#date2").val();
    console.log("搜索" + date1+date2);
    $.ajax({
        url:"/account/getbase.html",
        data: {"userid": userid,"date1":date1,"date2":date2,"firstResult":firstResult,"maxResults":maxResults},
        type:"post",
        dataType:"json",
        success:function (jsonData) {
            console.log(jsonData);
            render(jsonData);
        },error:function (e) {
            alert("未取到数据")
        }
    })
}
$(document).ready(function () {
$("#searchform").submit(function (e) {
    e.preventDefault();
    open()
})
})
function render(jsonData) {
    $("#list").empty();
    console.log("hi")
    $.each(jsonData,function (index,value) {
        var actiontime =value.actiontime;
        var actiondesc=value.actiondesc;
        var basein=value.basein;
        var baseout=value.baseout;
        var basebalance=value.basebalance;
        var html=` <tr>
                        <td>`+actiontime +`</td>
                        <td>`+actiondesc +`</td>
                        <td>`+basein +`</td>
                        <td>`+baseout+`</td>
                        <td>`+basebalance+`</td>
                    </tr>`
        $("#list").append(html);
    })
}

