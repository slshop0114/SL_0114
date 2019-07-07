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
        url:"/cash/getdetailcash.html",
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
        var cashTime=value.cashTime;
        var cashMoney=value.cashMoney;
        var stat=value.stat;
        if (stat == 1){
            var state = "转账中"
        }else {
            var state = "已完成"
        }
        var html=` <tr>
                        <td>`+cashTime +`</td>
                        <td>`+cashMoney +`</td>
                        <td>`+state+`</td>
                    </tr>`
        $("#list").append(html);
    })
}
