layui.use('element', function(){
    //触发事件
    var active = {
        tabChange: function(){
            //切换到指定Tab项
            element.tabChange('demo', '22'); //切换到：用户管理
        }
    };
});
$(function () {
    huiyuanliuyanguanli();
    shownum();
})
//会员留言管理渲染
function huiyuanliuyanguanli() {

    $.ajax({
        url: "/message/getmessage.html",
        type: "post",
        data: {"firstResult":firstResult,"maxResults":maxResults},
        async: true,
        dataType: "json",
        success: function (list) {
            console.log(list)
            var str="";
            for(var i=0;i<list.length;i++){
                var obj=list[i];
               var messageContent=obj.messageContent;//留言内容
                if(obj.reply.length>=1){
                    var replyconten= obj.reply[0]

                    str+=" <div class=\"liuyankuang\" >\n" +
                        "    <div class=\"liuyan\">\n" +
                        "        留言"+ messageContent+
                        "    </div>\n" +
                        "    <div class=\"dafu\">\n" +
                        "        答复："+replyconten.replyContent+"(回复人员：" +replyconten.createdBy+ ")"+
                        "    </div>\n" +
                        "</div>"
                }else {
                    str+=" <div class=\"liuyankuang\" >\n" +
                        "    <div class=\"liuyan\">\n" +
                        "        留言"+ messageContent+
                        "    </div>\n" +
                        "    <div class=\"dafu\">\n" +
                        "        答复："+"暂无回复，管理员正在加班赶点的处理"+
                        "    </div>\n" +
                        "</div>"
                }
            }
            $("#list").html(str);
        },error : function() {
            // view("异常！");
            alert("异常！");
        }
    });

}

// 一页展示条数
var maxResults=2;
// 第几页
var firstResult=1;
// 首页
function firstpage() {
    firstResult=1;
    huiyuanliuyanguanli()
}
// 下一页
function nextpage(){
    firstResult+=1;
    huiyuanliuyanguanli()
}
// 上一页
function previouspage(){
    firstResult-=1;
    if (firstResult<1){
        firstResult=1;
    }
    huiyuanliuyanguanli()
}


//存放验证码的数组
var show_num = [];
//渲染验证码
function shownum() {

//页面初始化的时候加载一次验证码
    draw(show_num);
    $("#pageCheckCode").val(show_num.join(""));
//点击验证码图片的时候刷新
    $("#canvas").on('click',function(){
        draw(show_num);
        $("#pageCheckCode").val(show_num.join(""));
    })
}

//新增留言
function liuyantijiao() {
    var messagecontent =$(".liuyanleirong").val();//留言内容
    var shuruyanzhengma=$(".shuru").val();//输入的验证码内容

    // alert("留言内容"+messagecontent);
    // alert("渲染的验证码内容"+show_num);
    // alert("输入的验证码内容"+shuruyanzhengma);

    //验证验证码，通过了才提交
    var checkOK = false;
    var liuy=true;
    var num = show_num.join("");
    var username= $(".username").val();//获取用户名
    if(messagecontent==""){
       alert("留言内容不能为空")
        liuy=false
    }
    if (shuruyanzhengma == '') {
        $("#checkcodeMessage").html("请输入验证码！");
        shownum();//重新渲染新的验证码
    } else if (shuruyanzhengma == num) {
        $("#checkcodeMessage").html("验证成功");
        checkOK = true;
    } else {
        $("#checkcodeMessage").html("验证码错误！请重新输入!");
        $("#checkcode").val('');
        shownum();//重新渲染新的验证码
    }
   // 如果验证码输入成功并且留言内容不为空
    if(checkOK && liuy){

        $.ajax({
            url: "/message/addmessage.html",
            type: "post",
            data: {"MessageContent":messagecontent,"username":username},
            success: function () {
                alert("留言成功，等待处理")
                huiyuanliuyanguanli() ;//留言成功，重新加载页面
            },error : function() {
                // view("异常！");
                alert("异常！");
            }
        });


    }

}

//生成并渲染出验证码图形
function draw(show_num) {
    var canvas_width=$('#canvas').width();
    var canvas_height=$('#canvas').height();
    var canvas = document.getElementById("canvas");//获取到canvas的对象，演员
    var context = canvas.getContext("2d");//获取到canvas画图的环境，演员表演的舞台
    canvas.width = canvas_width;
    canvas.height = canvas_height;
    var sCode = "a,b,c,d,e,f,g,h,i,j,k,m,n,p,q,r,s,t,u,v,w,x,y,z,A,B,C,E,F,G,H,J,K,L,M,N,P,Q,R,S,T,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0";
    var aCode = sCode.split(",");
    var aLength = aCode.length;//获取到数组的长度

    for (var i = 0; i < 4; i++) {  //这里的for循环可以控制验证码位数（如果想显示6位数，4改成6即可）
        var j = Math.floor(Math.random() * aLength);//获取到随机的索引值
        // var deg = Math.random() * 30 * Math.PI / 180;//产生0~30之间的随机弧度
        var deg = Math.random() - 0.5; //产生一个随机弧度
        var txt = aCode[j];//得到随机的一个内容
        show_num[i] = txt.toLowerCase();
        var x = 10 + i * 20;//文字在canvas上的x坐标
        var y = 20 + Math.random() * 8;//文字在canvas上的y坐标
        context.font = "bold 23px 微软雅黑";

        context.translate(x, y);
        context.rotate(deg);

        context.fillStyle = randomColor();
        context.fillText(txt, 0, 0);

        context.rotate(-deg);
        context.translate(-x, -y);
    }
    for (var i = 0; i <= 5; i++) { //验证码上显示线条
        context.strokeStyle = randomColor();
        context.beginPath();
        context.moveTo(Math.random() * canvas_width, Math.random() * canvas_height);
        context.lineTo(Math.random() * canvas_width, Math.random() * canvas_height);
        context.stroke();
    }
    for (var i = 0; i <= 30; i++) { //验证码上显示小点
        context.strokeStyle = randomColor();
        context.beginPath();
        var x = Math.random() * canvas_width;
        var y = Math.random() * canvas_height;
        context.moveTo(x, y);
        context.lineTo(x + 1, y + 1);
        context.stroke();
    }
}

//得到随机的颜色值
function randomColor() {
    var r = Math.floor(Math.random() * 256);
    var g = Math.floor(Math.random() * 256);
    var b = Math.floor(Math.random() * 256);
    return "rgb(" + r + "," + g + "," + b + ")";
}

//-------------------------------管理员

// 一页展示条数
var maxResults1=6;
// 第几页
var firstResult1=1;
// 首页
function firstpage1() {
    firstResult1=1;
    guanliyuan();
}
// 下一页
function nextpage1(){
    firstResult1+=1;
    guanliyuan();
}
// 上一页
function previouspage1(){
    firstResult1-=1;
    if (firstResult1<1){
        firstResult1=1;
    }
    guanliyuan();
}

//管理员留言管理页面渲染
function guanliyuan() {
    $.ajax({
        url: "/message/getmessage.html",
        type: "post",
        data: {"firstResult":firstResult1,"maxResults":maxResults1},
        async: true,
        dataType: "json",
        success: function (list) {
            // console.log(list)
            var biatou="   <table class=\"layui-table\" id=\"list\">\n" +
                "                    <thead>\n" +
                "                    <tr>\n" +
                "                        <th  class=\" layui-unselect\">选择</th>\n" +
                "                        <th class=\" layui-unselect\">留言会员号</th>\n" +
                "                        <th class=\" layui-unselect\">留言内容</th>\n" +
                "                        <th class=\" layui-unselect\">状态（已回复/未回复）</th>\n" +
                "                        <th class=\" layui-unselect\">留言时间</th>\n" +
                "                    </tr>\n" +
                "                    </thead>"
            var str="";
            for(var i=0;i<list.length;i++){
                var obj=list[i];

                var messageContent=obj.messageContent;//留言内容
                var id=obj.id;//id
                var createby=obj.createdBy;//留言人
                var state=obj.state==1?"已回复":"未回复";//回复状态
                var time=obj.createTime;//留言时间
                // console.log("id=="+id +"留言人=="+createby+"留言内容=="+messageContent+"回复状态=="+state+"留言时间=="+time)
                str+="  <tr >\n" +
                    "<td><input id=\""+id+"\" type=\"checkbox\" name=\"liuyan\"></td>\n" +
                    "<td>"+createby+"</td>\n" +
                    "<td>"+messageContent+"</td>\n" +
                    "<td ><span class=''>"+state+"</span></td>\n" +
                    "<td>"+time+"</td>\n" +
                    "</tr>"
            }
            $("#list1").html(biatou+str+"</table>");
        },error : function() {
            // view("异常！");
            alert("异常！");
        }
    });



}

//查看留言弹窗打开
function chakantanchuang() {
    var obj = document.getElementsByName("liuyan");
    var checkVal = [];//获取选中的id
    for (var k in obj) {
        if (obj[k].checked) {
            checkVal.push(obj[k].id);
        }
    }

    if (checkVal.length > 1) {
        alert("只能同时查询一个留言")
    } else if (checkVal.length == 0) {
        alert("请选择一个查询")
    } else {
        document.getElementById('conte').style.display = 'block';
        document.getElementById('alllight').style.display = 'block';
        $.ajax({
            url: "/message/getmessageone",
            type: "post",
            data: {"id":checkVal[0]},
            async: true,
            dataType: "json",
            success: function (list) {
                console.log(list)
                var messageContent=list.messageContent;//内容
                var createTime=  list.createTime;//留言时间
                var createdBy= list.createdBy;//留言人

                var str =""
                if(list.reply.length>=1){
                    var messageContent1 =list.reply[0].replyContent;//回复内容
                    var createTime1= list.reply[0].createTime;//回复时间

                    str+=" <h4>回复留言查看</h4>\n" +
                        "留言人:<span>"+createdBy+"</span><br>\n"+
                        "    <div class=\"liuyan12\">\n" +
                        "        留言内容:<div class=\"liuyanhuifukuang12\">"+messageContent+"</div><br>\n" +
                        "        留言时间: <span> "+createTime+"</span>\n" +
                        "    </div>\n" +
                        "    <div>\n" +
                        "        回复：<div class=\"liuyanhuifukuang12\">"+messageContent1+"</div><br>\n" +
                        "        回复时间：<span>"+createTime1+"</span>\n" +
                        "    </div>\n" +
                        "    <input type=\"button\" class=\"layui-btn layui-btn-sm\" value=\"关闭\" onclick=\"guangai()\">"
                }else {
                    str+=" <h4>回复留言查看</h4>\n" +
                        "留言人:<span>"+createdBy+"</span><br>\n"+
                        "    <div class=\"liuyan12\">\n" +
                        "        留言内容:<div class=\"liuyanhuifukuang12\">"+messageContent+"</div><br>\n" +
                        "        留言时间: <span> "+createTime+"</span>\n" +
                        "    </div>\n" +
                        "    <div>\n" +
                        "        回复：<div class=\"liuyanhuifukuang12\">暂无回复</div><br>\n" +
                        "        回复时间：<span></span>\n" +
                        "    </div>\n" +
                        "    <input type=\"button\" class=\"layui-btn layui-btn-sm\" value=\"关闭\" onclick=\"guangai()\">"
                }

                $("#conte").html(str);
            },error : function() {
                // view("异常！");
                alert("异常！");
            }
        })
    }
}
// 关闭查看弹层
function guangai() {
    document.getElementById('conte').style.display = 'none';
    document.getElementById('alllight').style.display = 'none';
}

// 回复留言
//回复留言弹窗打开
function huifutanchuang() {
    var obj = document.getElementsByName("liuyan");
    var checkVal = [];//获取选中的id
    for (var k in obj) {
        if (obj[k].checked) {
            checkVal.push(obj[k].id);
        }
    }

    if (checkVal.length > 1) {
        alert("只能同时回复一个留言")
    } else if (checkVal.length == 0) {
        alert("请选择一个留言回复")
    } else {
        document.getElementById('contes').style.display = 'block';
        document.getElementById('alllights').style.display = 'block';
        $.ajax({
            url: "/message/getmessageone",
            type: "post",
            data: {"id":checkVal[0]},
            async: true,
            dataType: "json",
            success: function (list) {
                console.log(list)
                var messageContent=list.messageContent;//留言内容
                var createTime=  list.createTime;//留言时间
                var createdBy= list.createdBy;//留言人

                  var  str="  <h4>回复留言</h4>\n" +
                        "    留言人：<span>"+createdBy+"</span>\n" +
                        "    <div class=\"huifu\">\n" +
                        "        留言内容:<div class=\"huifukuang\">"+messageContent+"</div><br>\n" +
                        "        留言时间: <span>"+createTime+"</span>\n" +
                        "    </div>\n" +
                        "    <div>\n" +
                        "        回复：<div class=\"huifukuang\">\n" +
                        "        <textarea class='huifuneirong' id='huifuwenbenneirong'  style=\"width:300px;height: 50px \"></textarea>\n" +
                        "    </div><br>\n" +
                        "<input type=\"button\" class=\"layui-btn layui-btn-sm\" value=\"保存\" onclick=\"baocunhuifu()\">\n"+
                        "        <input type=\"button\" class=\"layui-btn layui-btn-sm\" value=\"关闭\" onclick=\"huifuguanbi()\">\n" +
                        "    </div>"


                $("#contes").html(str);
            },error : function() {
                // view("异常！");
                alert("异常！");
            }
        })
    }
}
// 关闭回复弹层
function huifuguanbi() {
    document.getElementById('contes').style.display = 'none';
    document.getElementById('alllights').style.display = 'none';
}
// 添加回复
function baocunhuifu() {
    var obj = document.getElementsByName("liuyan");
    var username= $(".username").val();//获取用户名
    for(var k in obj) {
        if (obj[k].checked) {
            // alert("回复id=" + obj[k].id);
            var content = $("#huifuwenbenneirong").val();//文本内容
            // alert("回复内容=" + content)

            $.ajax({
                url: "/insertreply",
                type: "post",
                data: {"id": obj[k].id, "replyContent": content,"username":username},

                success: function () {
                    alert("添加成功");
                    huifuguanbi();//关闭弹层
                    guanliyuan();//重新加载页面
                },error : function() {
                    // view("异常！");
                    alert("异常！");
                }
            })


        }
    }
}

//删除留言
function deleteliuyan() {
    var obj = document.getElementsByName("liuyan");
    var checkeds=[];
    for(var k in obj) {
        if (obj[k].checked) {
        checkeds.push(obj[k].id)
        }
    }
    // 弹层确认是否删除
    if (confirm("确定要删除选中的留言吗")) {
    } else {
        return false;
    }
    for (var i=0;i<checkeds.length;i++){
        $.ajax({
            url: "/deleteLeave",
            type: "post",
            data: {"id":checkeds[i]},

            success: function () {
                alert("留言删除成功");
                guanliyuan();
            },error : function() {
                // view("异常！");
                alert("异常！");
            }
        });
    }



}