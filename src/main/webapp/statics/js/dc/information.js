$(function () {
    selectinformationall();
})
// 一页展示条数
var maxResults=4;
// 第几页
var firstResult=1;
// 首页
function firstpage() {
    firstResult=1;
    selectinformationall()
}
// 下一页
function nextpage(){
    firstResult+=1;
    selectinformationall()
}
// 上一页
function previouspage(){
    firstResult-=1;
    if (firstResult<1){
        firstResult=1;
    }
    selectinformationall()
}
// 渲染页面
function selectinformationall() {
    $.ajax({
        url: "/selectall",
        type: "post",
        data:{"firstResult":firstResult,"maxResults":maxResults},
        dataType: "json",
        success: function (list) {
            console.log(list)

var biaotou=" <thead>\n" +
    "        <tr>\n" +
    "            <th class=\" layui-unselect\">选择</th>\n" +
    "            <th class=\" layui-unselect\">文件标题（点击下载）</th>\n" +
    "            <th class=\" layui-unselect\">下载说明</th>\n" +
    "            <th class=\" layui-unselect\">文件大小</th>\n" +
    "            <th class=\" layui-unselect\">下载次数</th>\n" +
    "            <th class=\" layui-unselect\">状态（发布/不发布）</th>\n" +
    "            <th class=\" layui-unselect\">最后修改时间</th>\n" +
    "        </tr>\n" +
    "        </thead>"
            var str="";
            for (var i=0;i<list.length;i++){
               var obj= list[i];
               var fl="";
                // 状态显示
               var state= obj.state;//1发布  0 不发布
               if (state==1){
                   fl="checked='checked'";
               }else {
                   fl="";
                }

               // 转换文件大小 kb  m  G
                var fileSizes=obj.fileSize;
               var fileSize=";"
                if ((fileSizes/1024)<1024){
                    fileSize=(fileSizes/1024).toFixed(2)+"KB"

                    // alert((fileSizes/1024).toFixed(2)+"kb")
                }else if((fileSizes/1024/1024)<1024){
                    fileSize=(fileSizes/1024/1024).toFixed(2)+"M"
                    // alert((fileSizes/1024/1024).toFixed(2)+"M")
                }else {
                    fileSize=(fileSizes/1024/1024/1024).toFixed(2)+"G"
                    // alert( (fileSizes/1024/1024/1024).toFixed(2)+"G")
                }

                str+="<tr>\n" +
                    "            <td><input type=\"checkbox\" id='"+obj.id+"' name=\"zixun\"></td>\n" +
                    "            <td>"+obj.title+"</td>\n" +
                    "            <td>"+obj.title+"</td>\n" +
                    "            <td>"+fileSize+"</td>\n" +
                    "            <td>"+obj.download+"</td>\n" +
                    "            <td><input type=\"checkbox\" "+fl+" name='onclickcheckbox"+obj.id+"'  onclick='onclickcheckbox("+obj.id+")'></td>\n" +
                    "            <td>"+obj.publishTime+"</td>\n" +
                    "        </tr>"

            // console.log(str)
            }
            $("#list").html(biaotou+str);
        }
    })
}
// 点击状态更改属性 （发布/不发布）
function onclickcheckbox(id) {
    var name = document.getElementsByName("onclickcheckbox"+id);
    // var flag=false;
    for (var i=0;i<name.length;i++){
        if(name[i].checked){
            // 发布
            $.ajax({
                url: "/informanage/modifyInfoState.html",
                type: "post",
                data:{"id":id,"state":1},
                dataType: "json",
                success: function (list) {
                }}
                )
           alert("已发布")
            break;
        }else {
            // 不发布
            $.ajax({
                url: "/informanage/modifyInfoState.html",
                type: "post",
                data:{"id":id,"state":0},
                dataType: "json",
                success: function (list) {
                }}
            )
            alert("已取消")
        }
    }
}
// <%--弹层--%>

// 添加资讯
function add() {
    document.getElementById('contes').style.display = 'block';
    document.getElementById('all_light').style.display = 'block';
    selectdatadictionall();
}
// 关闭添加资讯弹层
function guan() {
    document.getElementById('contes').style.display = 'none';
    document.getElementById('all_light').style.display = 'none';
}
// 查询数据字典表资讯类型
function selectdatadictionall() {
    $.ajax({
        url: "/selectdatadictionary",
        type: "post",
        data:{},
        dataType: "json",
        success: function (list) {

            var str="";
            for (var i=0;i<list.length;i++){
               var obj= list[i];
                str+=" <option id='"+obj.valueId+"' class='zixunzidian' >"+obj.valueName+"</option>"
            }
            // console.log(str);
            $("#zixunleixing").html(str)
        }
})
}
function sc(){
    $('#uploadFile').click()
}






// 新增资讯
function baocun1(){
    // alert("1")
    //jquery获取input file文件名
    var path= $("#fiLepath1").val();//路径

   var size=  $("#fiLepathsize1").val();//文件大小
   var filename= $("#fiLepathname1").val();//文件名字
    var title =$("#title").val();//标题值
    var zixunid= $(".zixunzidian").attr("id");//资讯类型id
    var zixunleixing= $("#"+zixunid).text();//资讯类型值
    var content =$("#editor_id").val();//文本内容
   var state= $('input:radio:checked').val();//发布状态
    var username= $(".username").val();//获取用户名

    // alert("11")
    // // console.log("文件typeName名=="+filename+"大小size=="+size+"文件路径path=="+path+"标题值title=="+title+"资讯类型值typeId=="+zixunleixing+"资讯类型id=="+zixunid+"文本content内容==content"+content+"状态"+state)
    // alert("22")
    $.ajax({
        url: "/informanage/addInformation.html",
        fileElementId:'uploadFile',
        type: "post",
        data:{"title":title,
            "content":content,
            "state":state,
            "typeId":zixunid,
            "typeName":zixunleixing,
            "fileName":filename,
            "filePath":path,
            "fileSize":size,
            "publisher":username
        },
        dataType: "json",
        success: function () {
            // alert("添加资讯成功");
            // selectinformationall();
        }
    })
    guan()
    alert("添加资讯成功");
    selectinformationall();
}
//删除资讯
function deleteid() {
    var obj = document.getElementsByName("zixun");
    var checkVal= [];//获取选中的id
    for(var k in obj){
        if(obj[k].checked){
            checkVal.push(obj[k].id);
            console.log(obj[k].id)
        }
    }
    if(checkVal.length>=1){
    // 弹层确认是否删除
    if (confirm("确定要删除选中的公告吗")) {
    } else {
        return false;
    }
    for (var i=0;i<checkVal.length;i++){
        $.ajax({
            url: "/informanage/delInfo.html",
            type: "post",
            data: {"id":checkVal[i]},
            async: true,
            dataType: "json",
            success: function () {
            }
        });
    }
    alert("公告删除成功")
    selectinformationall();}else {
        alert("请至少选择一条进行删除")
    }
}

// 修改资讯
function xiugaizx(){

    //获取选中的id
    var obj = document.getElementsByName("zixun");
    var checkVal=[];
    for(var k in obj){
        if(obj[k].checked){
            checkVal.push(obj[k].id);
            console.log(obj[k].id)
            var title =$("#title13").val();//标题值
            var content =$("#editor_id1").val();//文本内容
            var state= $('input:radio:checked').val();//发布状态
            var zixunid= $(".zixunzidian").attr("id");//资讯类型id
            var zixunleixing= $("#"+zixunid).text();//资讯类型值

            var path= $("#fiLepath14").val();//路径
            var size=  $("#fiLepathsize14").val();//文件大小
            var filename= $("#fiLepathname14").val();//文件名字
            // alert("22")
            // console.log(
            //     "title------" + title+
            //     ")))content------"+ content+
            //     ")))state-------"+ state+
            //     ")))zixunid-----"+ zixunid+
            //     ")))zixunleixing----" + zixunleixing
            //
            // )
            // alert("111")
            // 修改
            if(title==""||title==null){
                alert("标题不能为空")
                return ;
            }else if(content==""||content==null){
                alert("内容不能为空")
                return ;
            }else {
                $.ajax({
                    url: "/informanage/modifyinformation.html",
                    type: "post",
                    data: {
                        "title":title,
                        "content":content,
                        "state":state,
                        "typeId":zixunid,
                        "typeName":zixunleixing,
                        "fileName":filename,
                        "filePath":path,
                        "fileSize":size,
                        "id":obj[k].id
                    },
                    async: true,
                    success: function () {
                    }
                });
                alert("修改成功");
                guanxiugai()
                selectinformationall()
            }

        }
    }


}
// 关闭修改资讯弹框
function guanxiugai(){
    document.getElementById('conte1').style.display = 'none';
    document.getElementById('alllight1').style.display = 'none';

}
// 打开修改资讯弹窗
function updatezx(){
    var obj = document.getElementsByName("zixun");
    var checkVal= [];//获取选中的id
    for(var k in obj){
        if(obj[k].checked){
            checkVal.push(obj[k].id);
        }
    }
    if (checkVal.length == 1) {

        $.ajax({
            url: "/informanagegetid",
            type: "post",
            data:{"id":checkVal[0]},
            dataType: "json",
            success: function (obj) {
                console.log(obj)
               var title= obj.title;//标题
               var typeName = obj.typeName;//资讯类型
               var content= obj.content;//资讯内容
               var state= obj.state;//发布状态
                var s1="";
                var s2="";
                if (state==1){
                  s1=  checked="checked";
                    s2="";
                } else {
                    s2= checked="checked";
                    s1="";
                }
                var str="<div style=\"width:500px;height:40px;\">\n" +
                    "            修改\n" +
                    "            <hr>\n" +
                    "            <form style=\" margin-left: 100px; \" method=POST>\n" +
                    "                <br>\n" +
                    "                标题：<input type=\"text\"  id=\"title13\" value='"+title+"' name=\"\"><br><br>\n" +
                    "                资讯类型：<select name=\"cars\" id=\"zixunleixing13\">\n" +
                    "                <%--<option value=\"volvo\">文本</option>--%>\n" +
                    "                <%--<option value=\"saab\">图片</option>--%>\n" +
                    "                <%--<option value=\"fiat\">视屏</option>--%>\n" +
                    "            </select><br><br>\n" +
                    "                <button type=\"button\" class=\"layui-btn\" id=\"updateusercard14\">点击上传附件</button><br>\n" +
                    "                <input type=\"hidden\" id=\"fiLepath14\">\n" +
                    "                <input type=\"hidden\" id=\"fiLepathsize14\">\n" +
                    "                <input type=\"hidden\" id=\"fiLepathname14\">\n" +
                    "                <script type=\"text/javascript\">\n" +
                    "                    KindEditor.ready(function(K) {\n" +
                    "\n" +
                    "                        var editor =  K.create('#editor_id1', {\n" +
                    "                            uploadJson : '/dc/kindedito/jsp/upload_json.jsp',\n" +
                    "                            fileManagerJson : '/dc/kindedito/jsp/file_manager_json.jsp',\n" +
                    "                            allowFileManager : true,\n" +
                    "\n" +
                    "                            autoHeightMode :[\"200px\",\"200px\"],//自动调整编辑区的高度\n" +
                    "                            afterCreate : function(){\n" +
                    "                                this.loadPlugin('autoheight');//加载插件\n" +
                    "                                this.sync();},\n" +
                    "                            afterBlur: function(){this.sync();}\n" +
                    "                            //this.sync()用来同步数据\n" +
                    "                        });\n" +
                    "                    });\n" +
                    "                </script>\n" +
                    "\n" +
                    "                公告内容:<textarea   style=\" width: 300px\" id=\"editor_id1\" name=\"content\" >"+content+"</textarea><br><br>\n" +
                    "\n" +
                    "                状态：<input type=\"radio\" name=\"state\" "+s1+" value=\"1\">发布  &nbsp;&nbsp;<input type=\"radio\" name=\"state\" "+s2+" value=\"0\">不发布<br><br>\n" +
                    "\n" +
                    "                <input type=\"button\" value=\"保存\" onclick=\"xiugaizx()\">\n" +
                    "                <input type=\"button\" value=\"返回\" onclick=\"guanxiugai()\">\n" +
                    "            </form>\n" +
                    "        </div>"

                // console.log(str)
                $("#conte1").html(str);



            }
        })
        selectdatadictionall();
        document.getElementById('conte1').style.display = 'block';
        document.getElementById('alllight1').style.display = 'block';
    } else if (checkVal.length > 1) {
        alert("只能同时修改一个资讯")
        return false;
    } else {
        alert("请选择一个资讯进行修改")
    }






    // selectdatadictionall();

}

// 上传资讯附件
layui.use('upload', function () {

    var upload = layui.upload;

    // 上文件
    var uploadidcard = upload.render({
        elem: '#updateusercard12' //绑定元素
        , url: '/upinformanage' //上传接口
        , field: "uploadFile"
        ,accept:"file"//指定允许上传时校验的文件类型，可选值有：images（图片）、file（所有文件）、video（视频）、audio（音频）
        , done: function (res) {
            $("#fiLepath1").val(res.file);//路径
            $("#fiLepathsize1").val(res.filesize);//文件大小
            $("#fiLepathname1").val(res.filename);//文件名
        }
        , error: function () {
            //请求异常回调
        }
    });

// 修改上传文件

    var uploadidcard1 = upload.render({
        elem: '#updateusercard14' //绑定元素
        , url: '/upinformanage' //上传接口
        , field: "uploadFile"
        , done: function (res) {
            $("#fiLepath14").val(res.file);//路径
            $("#fiLepathsize14").val(res.filesize);//文件大小
            $("#fiLepathname14").val(res.filename);//文件名
        }
        , error: function () {
            //请求异常回调
        }
    });

})