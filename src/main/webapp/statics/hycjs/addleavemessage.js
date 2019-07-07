$(function () {
    layui.use('laydate', function(){
        var laydate = layui.laydate;
        //日期时间选择器
        laydate.render({
            elem: '#date'
            ,type: 'datetime'
        });
    });
});

$(document).ready(function () {
    $("#addMessageForm").submit(function (e) {
        e.preventDefault();
        var oddnum = $("#oddnum").val();
        var money = $("#money").val();
        var date = $("#date").val();
        $.ajax({
            url:"/account/sendmessage.html",
            data: {"rechargeNum": oddnum,"rechargeMoney":money,"date":date},
            type:"post",
            dataType:"json",
            success:function (jsonData) {
                console.log(jsonData);
                if (jsonData == "1"){
                    layui.use('layer', function () {
                        var layer = layui.layer;
                        layer.closeAll();
                        //提示层
                        layer.msg('现已通知公司客服人员，\n' +
                            '\n' +
                            '他们会已最快时间处理，\n' +
                            '\n' +
                            '请您注意查询“留言答复”。', {
                            area: ['300px'], //宽高
                            time: 20000, //20s后自动关闭
                            btn: ['确认']
                            ,yes:function () {
                                window.location.href = '/account/baseAccount.html';
                            }
                        });
                    })
                }
            },error:function (e) {
                alert("未取到数据")
            }
        })
    })
})
