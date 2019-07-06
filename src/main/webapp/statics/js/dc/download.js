$(function () {
    selectstateall()
})

// 一页展示条数
var maxResults=6;
// 第几页
var firstResult=1;
// 首页
function firstpage() {
    firstResult=1;
    selectstateall()
}
// 下一页
function nextpage(){
    firstResult+=1;

    selectstateall()
}
// 上一页
function previouspage(){
    firstResult-=1;
    if (firstResult<1){
        firstResult=1;
    }
    selectstateall()
}

function selectstateall() {
    $.ajax({
        url: "/selectstateall",
        type: "post",
        data:{"firstResult":firstResult,"maxResults":maxResults},
        dataType: "json",
        success: function (list) {

            var str="";
            for(var i=0;i<list.length;i++){
                var obj=list[i];
               var title= obj.title;
               var publishTime=obj.publishTime;

                str+="  <tr >\n" +
                    "        <td onclick='add("+obj.id+")' >"+title+"</td>\n" +
                    "        <td>"+publishTime+"</td>\n" +
                    "    </tr>"
            }
            $("#list").html(str);

        }
    })
}

// 页面详情
function add(id) {
    document.getElementById('contes').style.display = 'block';
    document.getElementById('all_light').style.display = 'block';

    $.ajax({
        url:"/informanagegetid",
        type: "post",
        data:{"id":id},
        dataType: "json",
        success: function (list) {
            console.log(list)
          var title=  list.title;//标题
          var content=  list.content;//内容
          var publishTime =  list.publishTime;//发布时间
            var path=list.filePath ;//路径
              var  str=" <div class=\"tou3\">   <H4>下载中心>详细页面</H4> </div>\n" +
                    "    <div class=\"wenzitou3\">\n" +
                    "        <div class=\"wenzitouneir3\">\n" +
                    "            <span>"+title+"</span><br>\n" +
                    "            <span>"+publishTime+"</span>\n" +
                    "        </div>\n" +
                    "    </div>\n" +
                    "    <div class=\"wenbenkuang3\">\n" +
                        content+
                    "    </div>\n" +
                    "    <div class=\"xiazai3\">\n" +
                    "  <a href='/fileDownLoad?id="+id+"'>点击下载</a>      \n" +
                    "    </div>\n" +
                    "    <div class=\"fanhui3\">\n" +
                    "        <input class=\"layui-btn layui-btn-sm layui-btn-norma\" onclick=\"guan()\"  type=\"button\" value=\"返回\">\n" +
                    "    </div>"

            $("#contes").html(str);




        }
    })
}
// 关闭添加公告弹层
function guan() {
    document.getElementById('contes').style.display = 'none';
    document.getElementById('all_light').style.display = 'none';
}

