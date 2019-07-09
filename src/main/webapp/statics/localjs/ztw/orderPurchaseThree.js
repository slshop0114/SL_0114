function hiddenIcon() {
    $(function () {
        setTimeout(function () {
            $("#modifyIcon").css("display", "none");
        }, 4000);
    })
}

function displayIcon() {
    $("#modifyIcon").css("display", "block");
}

function modiyAds() {
    $("#modifyAddress").css("display", "block");
    $("#sureAddress").css("display", "none");
    $("#address").html("");
    $("#postType").html("");
    $("#getZipCode").html("");
}

function hiddenSelect() {
    var str1 = $("#selProvince").val();
    var str2 = $("#selCity").val();
    var str21 =$("#selCounty").val();
    var str3 = $("#detailedAddress").val();
    var str4 = $("#post").val();
    var str5 = $("#zipCode").val();
    if (str1==""||str2==""||str21==""||str3==""||str4==""||str5=="") {
        layer.open({
            type: 1
            , offset: 'auto'
            , id: 'layerDemo' + 'auto' //防止重复弹出
            , content: '<div style="padding: 20px 130px;">请填写完整的格式！</div>'
            , btn: '关闭'
            , btnAlign: 'c' //按钮居中
            , shade: 0 //不显示遮罩
            , yes: function () {
                layer.closeAll();
            }
        });
    }else{
        $("#modifyAddress").css("display", "none");
        $("#sureAddress").css("display", "block");
        $("#address").append(str1);
        $("#address").append(str2);
        $("#address").append(str21);
        $("#address").append(str3);
        $("#postType").empty().append(str4);
        $("#getZipCode").append(str5);
    }
}



function conformButton() {
    var s0 =$("#user").val();
    var s1 =$("#userId").val();
    var s2 =$('input[name="cost"]:checked ').val();
    var s7 =$("#currentBalance1").val();
    if (s2 =="消费会员(消费金额:4900元、PV:300)") {
        var s6= -4900;
        var pv = 300;
    }else if (s2=="VIP会员(消费金额:14900元、PV:900)") {
        var s6 =-14900;
        var pv = 900;
    }else {
        var s6 =-28800;
        var pv = 1500;
    }
    var str1 = $("#selProvince").val();
    var str2 = $("#selCity").val();
    var str21 = $("#selCounty").val()
    var str3 = $("#detailedAddress").val();
    var s3=str1+str2+str21+str3;
    var s4 = $("#zipCode").val()
    var s5 =$("#post").val();
    var s8 =Number(s6)+Number(s7)
    var s9 = $("#getFromHeadToUserLoginName").val();
    if (s8<=0){
        layer.open({
            type: 1
            , offset: 'auto'
            , id: 'layerDemo' + 'auto' //防止重复弹出
            , content: '<div style="padding: 20px 130px;">余额不足，请充值！</div>'
            , btn: '关闭'
            , btnAlign: 'c' //按钮居中
            , shade: 0 //不显示遮罩
            , yes: function () {
                layer.closeAll();
            }
        });
    }else {
        $.ajax({
            url:"/shopManger/confirmActivation.html1",
            type:"post",
            data:{"userId":s1,"username":s0,"pv":pv,"costMoney":s6,"deliveryAddress":s3,"zipCode":s4,"postType":s5},
            dataType:"json",
            success:function (result) {
                if (result.code==200) {
                    layer.close(layer.index);
                    layer.msg('报单购货成功<br>马上去激活购货吗？', {
                        time: 20000, //20s后自动关闭
                        btn: ['去激活', '暂不']
                        ,yes:function () {
                            window.location.href='/shopManger/confirmActivation.do?userId='+s1+'&costMoney='+s6+'&pv='+pv+'&userLoginName='+s9+'';
                        }
                    });
                }
            }
        })
    }

}
function cancelButton() {
    layer.close(layer.index);
}


//页面加载方法
$(function () {
    layui.use('form', function(){
        var form = layui.form;
        form.render();
    });

    $('#openConfirm').on('click', function () {
        var s1 =$("#user").val();
        var s2 =$('input[name="cost"]:checked ').val();
        if (s2 =="消费会员(消费金额:4900元、PV:300)") {
            var s6= 4900
        }else if (s2=="VIP会员(消费金额:14900元、PV:900)") {
            var s6 =14900
        }else {
            var s6 =28800
        }
        var str1 = $("#selProvince").val();
        var str2 = $("#selCity").val();
        var str21 = $("#selCounty").val()
        var str3 = $("#detailedAddress").val();
        var s3=str1+str2+str21+str3;
        var s4 = $("#zipCode").val()
        var s5 =$("#post").val();
        layer.open({
            type: 1,
            area: ['500px', '360px'],
            shadeClose: true, //点击遮罩关闭
            title:'确认报单购货信息',
            content: '报单购货会员用户名：<span id="getUser">'+s1+'</span><br>\n' +
                '报单级别：<span id="getOrderLevel">'+s2+'</span><br>\n' +
                '总计金额：<span id="getMoney" style="color: red">'+s6+'</span>(元)<br>\n' +
                '收货地址：<span id="getAdds">'+s3+'</span><br>\n' +
                '邮编：<span id="getZipCode1">'+s4+'</span><br>\n' +
                '快递方式：<span id="getPostType">'+s5+'</span><br>\n'+
                '<div style="right: 20px; bottom: 20px; position: absolute;">\n' +
                '    <a onclick="conformButton()" class="layui-btn">确认</a>\n' +
                '    <a onclick="cancelButton()" class="layui-btn">关闭</a>\n' +
                '</div>'
        });
    });
})

