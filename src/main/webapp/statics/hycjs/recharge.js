//生成随机单号
$(function () {
    open()
    layui.use('laydate', function(){
        var laydate = layui.laydate;
        laydate.render({
            elem: '#date',
        });
    });
});
function getCode(n) {
    var all = "azxcvbnmsdfghjklqwertyuiopZXCVBNMASDFGHJKLQWERTYUIOP0123456789";
    var b = "";
    for (var i = 0; i < n; i++) {
        var index = Math.floor(Math.random() * 62);
        b += all.charAt(index);

    }
    return b;
}
function open() {
    $("#oddnum").html(getCode(20));
}
//生成随机单号

//表单提交
function conform(){
    var rechargeTime = $("#date").val();
    var rechargeMoney = $("#money").val();
    var note = $("#note").val();
    var rechargeNum = getCode(20);
    var recharge_account =  $("#recharge_account").val();
    var userid =  $("#userid").val();
    $.ajax({
        url: "/recharge/rechargeMoney.html",
        type: "post",
        data: {
            "rechargeTime": rechargeTime,
            "rechargeMoney": rechargeMoney,
            "note": note,
            "rechargeNum": rechargeNum,
            "recharge_account": recharge_account,
            "userId": userid
        },
        dataType: "json",
        success: function (result) {
            if (result == "1"){
                console.log(result);
                layui.use('layer', function () {
                    var layer = layui.layer;
                    layer.closeAll();
                    //提示层
                    layer.msg('充值成功', {
                        area: ['200px'], //宽高
                        time: 20000, //20s后自动关闭
                        btn: ['确认']
                        ,yes:function () {
                            if(recharge_account == 1) {
                                window.location.href = '/account/baseAccount.html';
                            }if (recharge_account == 0) {
                                window.location.href = '/account/repeatAccount.html';
                            }
                        }
                    });
                })
            }else{
                alert("出现错误");
                console.log("错误了")
            }
        }
    });
}
//表单提交

//弹窗关闭
function cancle() {
    layui.use('layer', function () {
        var layer = layui.layer;
        layer.closeAll();
    })
}

//汇款提交
//询问框
$(function () {
    $("#rechargeForm").submit(function (e) {
        e.preventDefault();
        var rechargeTime = $("#date").val();
        var rechargeMoney = $("#money").val();
        var note = $("#note").val();
        var rechargeNum = getCode(20);
        console.log(rechargeTime + rechargeMoney + note)
        layui.use('layer', function () {
            var layer = layui.layer;
            layer.open({
                type: 1,
                skin: 'layui-layer-rim', //加上边框
                title: ['确认汇款信息', 'font-size:18px;text-align:center'],
                area: ['400px','300px'],
                content: ' <div>\n' +
                    '            <div style="margin-left: 100px">\n' +
                    '                <p>汇款日期：<span>'+rechargeTime+'</span></p><br>\n' +
                    '                <p>汇款金额：<span>'+rechargeMoney+'</span></p><br>\n' +
                    '                <p>汇款摘要：<span>'+note+'</span></p><br>\n' +
                    '                <p>汇款单号：<span>'+rechargeNum+'</span></p><br>\n' +
                    '                <button onclick="conform()" class="layui-btn">确认</button>\n' +
                    '                <button onclick="cancle()" class="layui-btn">关闭</button>\n' +
                    '            </div>\n' +
                    '        </div>'
            });
        });
    });
    });




