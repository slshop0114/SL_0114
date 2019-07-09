$(function () {

    selectannouncementsall();
})
// 一页展示条数
var maxResults=4;
// 第几页
var firstResult=1;
// 首页
function firstpage() {
    firstResult=1;
    selectannouncementsall()
}
// 下一页
function nextpage(){
    firstResult+=1;

    selectannouncementsall()
}
// 上一页
function previouspage(){
    firstResult-=1;
    if (firstResult<1){
        firstResult=1;
    }
    selectannouncementsall()
}

// 公告管理渲染
function selectannouncementsall(){

    $.ajax({
        url: "/afficheselect.html",
        type: "post",
        data:{"firstResult":firstResult,"maxResults":maxResults},
        dataType: "json",
        success: function (list) {
            console.log(list)

            var str="";
            for(var i=0;i<list.length;i++){
                var obj=list[i];
                var title=obj.title;
                var publishTime = obj.publishTime
                console.log("主题"+obj.title) ;
                console.log("时间"+obj.publishTime);
                str+="<tr class=\"xuanranhang\">\n" +
                    "            <td class=\"danxuan\"><input type=\"checkbox\" name=\"gonggao\" id=\""+obj.id+"\"></td>\n" +
                    "            <td class=\"wenben\"> <a href=\"/getaffichexiangxi?id="+obj.id+"\"><span>"+title+"</span></a></td>\n" +
                    "            <td class=\"shijian\"><span>"+publishTime+"</span></td>\n" +
                    "        </tr>"
            }
            $("#listgonggao").html(str);

        }
    })
}



// <%--弹层--%>
// 添加公告
function add() {
    document.getElementById('contes').style.display = 'block';
    document.getElementById('all_light').style.display = 'block';
}
// 关闭添加公告弹层
function guan() {
    document.getElementById('contes').style.display = 'none';
    document.getElementById('all_light').style.display = 'none';
}

// 修改公告 // 修改前信息渲染表单
function updatea() {

    var obj = document.getElementsByName("gonggao");
    var checkVal= [];//获取选中的id
    for(var k in obj){
        if(obj[k].checked){
            checkVal.push(obj[k].id);
        }
    }
    if (checkVal.length == 1) {

        $.ajax({
            url: "/getaffichexiangxi.html",
            type: "post",
            data:{"id":checkVal[0]},
            dataType: "json",
            success: function (obj) {
                console.log(obj)
                var str="";
                    var title=obj.title;
                    var startTime = obj.startTime
                    var endtime=obj.endTime;
                    var content=obj.content;

                    str+="    <div style=\"width:500px;height:40px;\">\n" +
                        "        修改公告\n" +
                        "        <hr>\n" +
                        "        <form style=\" margin-left: 100px;\">\n" +
                        "            标题：<input type=\"text\" value=\""+title+"\" id=\"titlesgai\" name=\"title\" ><br>\n" +
                        "            公告现实时间段：<input type=\"date\" id=\"startTimegai\" name=\"startTime\" > - <input type=\"date\" id=\"endTimegai\" name=\"endTime\" > <span class=\"gonggaozhushi\">注：为空则没有时间限制</span><br>\n" +
                        "            <script type=\"text/javascript\">\n" +
                        "                KindEditor.ready(function(K) {\n" +
                        "\n" +
                        "                    var editor =  K.create('#editoridgai', {\n" +
                        "                        uploadJson : '/dc/kindedito/jsp/upload_json.jsp',\n" +
                        "                        fileManagerJson : '/dc/kindedito/jsp/file_manager_json.jsp',\n" +
                        "                        allowFileManager : true,\n" +
                        "\n" +
                        "                        autoHeightMode :[\"200px\",\"200px\"],//自动调整编辑区的高度\n" +
                        "                        afterCreate : function(){\n" +
                        "                            this.loadPlugin('autoheight');//加载插件\n" +
                        "                            this.sync();},\n" +
                        "                        afterBlur: function(){this.sync();}\n" +
                        "                        //this.sync()用来同步数据\n" +
                        "                    });\n" +
                        "                });\n" +
                        "            </script>\n" +
                        "            公告内容：\n" +
                        "            <textarea id=\"editoridgai\"style=\" width: 300px\" name=\"content\" aria-invalid=\"content\" > "+content+"</textarea><br>\n" +
                        "            <input type=\"submit\" value=\"修改\" onclick=\"updateaffiche()\">\n" +
                        "            <input type=\"button\" value=\"关闭\" onclick=\"guangai()\">\n" +
                        "        </form>\n" +
                        "    </div>\n"
                // console.log(str)
                $("#conte").html(str);

            },
            error : function() {
                    // view("异常！");
                         alert("异常！");
                   }
        })
        document.getElementById('conte').style.display = 'block';
        document.getElementById('alllight').style.display = 'block';
    } else if (checkVal.length > 1) {
        alert("只能同时修改一个公告")
        return false;
    } else {
        alert("请选择一个公告进行修改")
    }
}
// 关闭修改弹层
function guangai() {
    document.getElementById('conte').style.display = 'none';
    document.getElementById('alllight').style.display = 'none';
}

// 删除获取多选框公告的id
function deleteid() {
    var obj = document.getElementsByName("gonggao");
    var checkVal= [];//获取选中的id
    for(var k in obj){
        if(obj[k].checked){
            checkVal.push(obj[k].id);
            console.log(obj[k].id)
        }
    }
    // 弹层确认是否删除
    if (confirm("确定要删除选中的公告吗")) {
    } else {
        return false;
    }
    for (var i=0;i<checkVal.length;i++){
    $.ajax({
        url: "/deleteaffiche",
        type: "post",
        data: {"id":checkVal[i]},
        async: true,
        success: function () {
            alert("公告删除成功")
        },error : function() {
            // view("异常！");
            alert("异常！");
        }
    });
    }
    selectannouncementsall();
}
// 添加公告
function addaffiche(){
    var title =$("#title").val();//标题值
    var startTime =$("#startTime").val();//展示时间
    var endTime =$("#endTime").val();//截止时间
    var content =$("#editor_id").val();//文本内容
    var username= $(".username").val();//获取用户名
    alert("1")
    console.log(startTime+endTime)
    // console.log("title----"+title+"startTime----"+startTime+"endTime---"+endTime+"content---"+content)
    // alert("title----"+title+"startTime----"+startTime+"endTime---"+endTime+"content---"+content)
    if(title==""||title==null){
        alert("标题不能为空")
        return ;
    }else if(content==""||content==null){
        alert("内容不能为空")
        return ;
    }else {
        // ajax添加公告
        $.ajax({
            url: "/addaffiche.html",
            type: "post",
            data: {"title":title,"startTime":startTime,"endTime":endTime,"content":content,"username":username},
            async: true,
            success: function () {
                alert("添加成功");
                selectannouncementsall();
            },error : function() {
            // view("异常！");
            alert("异常！");
        }
        });


    }



}
// 修改公告
function updateaffiche() {
    //获取选中的id
    var obj = document.getElementsByName("gonggao");
    var checkVal=[];
    for(var k in obj){
        if(obj[k].checked){
            checkVal.push(obj[k].id);
            console.log(obj[k].id)
            var title =$("#titlesgai").val();//标题值
            var startTime =$("#startTimegai").val();//展示时间
            var endTime =$("#endTimegai").val();//截止时间
            var content =$("#editoridgai").val();//文本内容
            console.log("title----"+title+"startTime----"+startTime+"endTime---"+endTime+"content---"+content)
             // alert("title----"+title+"startTime----"+startTime+"endTime---"+endTime+"content---"+content)
            // 修改
            if(title==""||title==null){
                alert("标题不能为空")
                return ;
            }else if(content==""||content==null){
                alert("内容不能为空")
                return ;
            }else {
                // ajax 修改数据
                $.ajax({
                    url: "/updateaffiche.html",
                    type: "post",
                    data: {"title":title,"startTime":startTime,"endTime":endTime,"content":content,"id":obj[k].id},
                    async: true,
                    success: function () {
                        alert("修改成功");
                        selectannouncementsall();
                    },error : function() {
                        // view("异常！");
                        alert("异常！");
                    }
                });
            }
        }
    }
}