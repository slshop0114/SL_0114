$(document).ready(function(){
    open()
    $("#cashMoney").focus(function () {
        $("#info1").empty();
    })
    $("#cashMoney").blur(function () {
        var cashMoney = $("#cashMoney").val();
        var nowbalance = $("#nowbalance").val();
        if (cashMoney == '') {
            $("#info1").html("请输入金额");
        } else if ((nowbalance - cashMoney) < 0) {
            $("#info1").html("余额不足，无法提现");
            $("input[type=\"submit\"]").attr("disabled", true);
        } else {
            $("#info1").html("最大可体现金额为:" + nowbalance);
            $("input[type=\"submit\"]").attr("disabled", false);
        }
    });
});

function open() {
    layui.use('layer', function () {
        var layer = layui.layer;
        layer.open({
            type: 1,
            skin: 'layui-layer-rim', //加上边框
            area: ['300px', '200px'],
            title:'注意',
            content:$("#info").html(),
            btn: ['好的，继续'],
            btnAlign: 'c',
            fixed: true,
            resize: false,
        });
    });
}
$(document).ready(function () {
    $("#forCashForm").submit(function (e) {
        e.preventDefault();
        $.ajax({
            url:"/cash/addCash.html",
            data: $("#forCashForm").serialize(),
            type:"post",
            dataType:"json",
            success:function (result) {
                console.log(result);
                if (result == "1"){
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
                                window.location.href = '/cash/detailForCash.html';
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


