$(document).ready(function(){
    open()

    //金额校验
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
    //金额校验

    //银行卡号校验
    $("#bankAccount").focus(function () {
        $("#info4").empty();
    })
    $("#bankAccount").blur(function () {
        CheckBankNo();
    });
});

//银行卡号校验
//检查银行卡号
function CheckBankNo() {
    var bankno = $("#bankAccount").val();
    var bankno = bankno.replace(/\s/g,'');
    if(bankno == '') {
        $("#info4").html("请填写银行卡号");
        $("input[type=\"submit\"]").attr("disabled", true);
       return false;
    }
    if(bankno.length < 16 || bankno.length > 19) {
        $("#info4").html("银行卡号长度必须在16到19之间");
        $("input[type=\"submit\"]").attr("disabled", true);
        return false;
    }
    var num = /^\d*$/;//全数字
    if(!num.exec(bankno)) {
        $("#info4").html("银行卡号必须全为数字");
        $("input[type=\"submit\"]").attr("disabled", true);
        return false;
    }
    //开头6位
    var strBin = "10,18,30,35,37,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,58,60,62,65,68,69,84,87,88,94,95,98,99";
    if(strBin.indexOf(bankno.substring(0, 2)) == -1) {
        $("#info4").html("银行卡号开头6位不符合规范");
        $("input[type=\"submit\"]").attr("disabled", true);
        return false;
    }
    //Luhn校验
    if(!luhnCheck(bankno)){
        $("#info4").html("银行卡号检测警告，请仔细校对！");
        $("input[type=\"submit\"]").attr("disabled", false);
        return true;
    }
    $("#info4").html("验证通过！");
    $("input[type=\"submit\"]").attr("disabled", false);
    return true;
}
//Luhn校验
function luhnCheck(bankno){
    var lastNum=bankno.substr(bankno.length-1,1);//取出最后一位（与luhn进行比较）

    var first15Num=bankno.substr(0,bankno.length-1);//前15或18位
    var newArr=new Array();
    for(var i=first15Num.length-1;i>-1;i--){    //前15或18位倒序存进数组
        newArr.push(first15Num.substr(i,1));
    }
    var arrJiShu=new Array();  //奇数位*2的积 <9
    var arrJiShu2=new Array(); //奇数位*2的积 >9

    var arrOuShu=new Array();  //偶数位数组
    for(var j=0;j<newArr.length;j++){
        if((j+1)%2==1){//奇数位
            if(parseInt(newArr[j])*2<9)
                arrJiShu.push(parseInt(newArr[j])*2);
            else
                arrJiShu2.push(parseInt(newArr[j])*2);
        }
        else //偶数位
            arrOuShu.push(newArr[j]);
    }

    var jishu_child1=new Array();//奇数位*2 >9 的分割之后的数组个位数
    var jishu_child2=new Array();//奇数位*2 >9 的分割之后的数组十位数
    for(var h=0;h<arrJiShu2.length;h++){
        jishu_child1.push(parseInt(arrJiShu2[h])%10);
        jishu_child2.push(parseInt(arrJiShu2[h])/10);
    }

    var sumJiShu=0; //奇数位*2 < 9 的数组之和
    var sumOuShu=0; //偶数位数组之和
    var sumJiShuChild1=0; //奇数位*2 >9 的分割之后的数组个位数之和
    var sumJiShuChild2=0; //奇数位*2 >9 的分割之后的数组十位数之和
    var sumTotal=0;
    for(var m=0;m<arrJiShu.length;m++){
        sumJiShu=sumJiShu+parseInt(arrJiShu[m]);
    }

    for(var n=0;n<arrOuShu.length;n++){
        sumOuShu=sumOuShu+parseInt(arrOuShu[n]);
    }

    for(var p=0;p<jishu_child1.length;p++){
        sumJiShuChild1=sumJiShuChild1+parseInt(jishu_child1[p]);
        sumJiShuChild2=sumJiShuChild2+parseInt(jishu_child2[p]);
    }
    //计算总和
    sumTotal=parseInt(sumJiShu)+parseInt(sumOuShu)+parseInt(sumJiShuChild1)+parseInt(sumJiShuChild2);

    //计算luhn值
    var k= parseInt(sumTotal)%10==0?10:parseInt(sumTotal)%10;
    var luhn= 10-k;

    if(lastNum==luhn){
        console.log("验证通过");
        return true;
    }else{
        console.log("银行卡号必须符合luhn校验");
        return false;
    }
}
//Luhn校验
//银行卡号校验

//页面打开弹窗
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


