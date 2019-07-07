$(document).ready(function () {
    $("#name").focus(function () {
        $("#info1").empty();
    })
    $("#name").blur(function () {
        var name = $("#name").val();
        if (name == '') {
            $("#info1").html("请输入会员名");
        } else {
            $.ajax({
                url: "/account/existName",
                type: "post",
                data: "loginCode=" + $("#name").val(),
                dataType: "json",
                success: function (result) {
                    if (result < 1) {
                        $("#info1").html("用户不存在")
                        $("input[type=\"submit\"]").attr("disabled", true);
                    } else {
                        $("#info1").html("会员用户")
                        $("input[type=\"submit\"]").attr("disabled", false);
                    }
                }
            });
        }
    });
    $("#money").focus(function () {
        $("#info2").empty();
    })
    $("#money").blur(function () {
        var money = $("#money").val();
        var nowbalance = $("#nowbalance").val();
        if (money == '') {
            $("#info2").html("请输入金额");
        } else if ((nowbalance - money) < 0) {
            $("#info2").html("<a href=\"/recharge/recharge.html\" >余额不足，马上去汇款充值</a>");
            $("input[type=\"submit\"]").attr("disabled", true);
        } else {
            $("#info2").html("最大可转金额为:" + nowbalance);
            $("input[type=\"submit\"]").attr("disabled", false);
        }
    });
    $("#pw").blur(function () {
        var pw = $("#pw").val();
        var userid = $("#uid").val();
        if (pw == '') {
            $("#info3").html("请输入密码");
        } else {
            $.ajax({
                url: "/account/selectpw",
                type: "post",
                data: {"id": userid, "password2": pw},
                dataType: "json",
                success: function (result) {
                    if (result == "1") {
                        $("#info3").html("密码正确")
                        $("input[type=\"submit\"]").attr("disabled", false);
                    } else {
                        $("#info3").html("密码不正确，请重新输入！")
                        $("input[type=\"submit\"]").attr("disabled", true);
                    }
                }
            });
        }
    })
});

//表单提交
function conform() {
    var userid = $("#uid").val();
    var name = $("#name").val();
    var money = $("#money").val();
    var pw = $("#pw").val();
    if (name == '') {
        $("#info1").html("请输入会员名");
    }
    if (money == '') {
        $("#info2").html("请输入金额");
    }
    if (pw == '') {
        $("#info3").html("请输入密码");
    }
    $.ajax({
        url: "/account/dotransfer.html",
        type: "post",
        data: {"userid": userid, "baseout": money, "loginCode": name},
        dataType: "json",
        success: function (result) {
            if (result == "1") {
                layui.use('layer', function () {
                    var layer = layui.layer;
                    layer.closeAll();
                    //提示层
                    layer.msg('转账成功', {
                        area: ['200px'], //宽高
                        time: 20000, //20s后自动关闭
                        btn: ['确认']
                        , yes: function () {
                            window.location.href = '/account/baseAccount.html';
                        }
                    });
                })

            }
        }
    });
}

//弹窗关闭
    function cancle() {
        layui.use('layer', function () {
            var layer = layui.layer;
            layer.closeAll();
        })
    }

//询问框
$(function () {
    $("#subForm").submit(function (e) {
        e.preventDefault();
        var name = $("#name").val();
        var money = $("#money").val();
        layui.use('layer', function () {
            var layer = layui.layer;
            layer.open({
                type: 1,
                skin: 'layui-layer-rim', //加上边框
                title: ['确认汇款信息', 'font-size:14px;text-align:center'],
                area: ['400px', '300px'],
                content: '<div>\n' +
                    '            <div style="margin-left: 100px">\n' +
                    '                <p>对方账户：<span> '+ name +' </span></p><br>\n' +
                    '                <p>转账金额：<span> '+ money +' </span></p><br>\n' +
                    '                <p>转账时间：<span> '+ now +' </span></p><br>\n' +
                    '                <button onclick="conform()" class="layui-btn">确认</button>\n' +
                    '                <button onclick="cancle()" class="layui-btn">关闭</button>\n' +
                    '            </div>\n' +
                    '        </div>'
            });
        });
    });
});
//获取系统当前时间
function getNow(s) {
    return s < 10 ? '0' + s: s;
}
var myDate = new Date();
//获取当前年
var year=myDate.getFullYear();
//获取当前月
var month=myDate.getMonth()+1;
//获取当前日
var date=myDate.getDate();
var h=myDate.getHours();       //获取当前小时数(0-23)
var m=myDate.getMinutes();     //获取当前分钟数(0-59)
var s=myDate.getSeconds();
var now=year+'-'+getNow(month)+"-"+getNow(date)+" "+getNow(h)+':'+getNow(m)+":"+getNow(s);
//获取系统当前时间




