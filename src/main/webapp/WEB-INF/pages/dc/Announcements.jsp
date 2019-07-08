<%@include file="/WEB-INF/pages/common/head.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>


<title>公告管理</title><input type="hidden" value="${userSession.loginCode}" class="username">

<link href="/statics/css/dc/announcements.css" rel="stylesheet">
<script src="/statics/js/dc/jQuery3.4.1.js"></script>
<script src="/statics/layui/layui.js"></script>
<script src="/statics/layui/layui.all.js" charset="utf-8"></script>
<script src="/statics/js/dc/announcements.js"></script>
<script src="/statics/kindeditor/kindeditor-all.js"></script>
<script src="/statics/kindeditor/lang/zh-CN.js"></script>


</head>
<div></div>

<body>
    <div style="margin-left: 210px">
        <div class="tou">
            <p><span>公告管理</span></p>
        </div>
        <!--//功能键 新增 修改  删除-->
        <div class="anniu">
            <input type="button" class="layui-btn layui-btn-normal layui-btn-radius touimpl" value="新增" onclick="add()">
            <input type="button" class="layui-btn layui-btn-normal layui-btn-radius touimpl" value="修改"
                   onclick="updatea()">
            <input type="button" class="layui-btn layui-btn-danger layui-btn-radius touimpl" id="shanchu" value="删除"
                   onclick="deleteid()">

        </div>
        <!--文本渲染-->
        <div class="xuanranbiaoge">
            <table class="" id="listgonggao">
                <%--<tr class="xuanranhang">--%>
                <%--<td class="danxuan"><input type="checkbox" name="gonggao" id="1"></td>--%>
                <%--<td class="wenben"> <a href=""><span>关于加盟店级别取消政策</span></a></td>--%>
                <%--<td class="shijian"><span>2019-12-11</span></td>--%>
                <%--</tr>--%>
            </table>
        </div>
        <%--增加公告弹层表单--%>
        <div id="contes" style="">
            <div style="width:500px;height:40px;">
                添加公告
                <hr>
                <form style=" margin-left: 100px;">
                    标题：<input type="text" value="" id="title" name="title"><br>
                    公告现实时间段：<input type="date" id="startTime" name="startTime"> - <input type="date" id="endTime"
                                                                                         name="endTime"> <span
                        class="gonggaozhushi">注：为空则没有时间限制</span><br>
                    <script type="text/javascript">
                        KindEditor.ready(function (K) {

                            var editor = K.create('#editor_id', {
                                uploadJson: '/dc/kindedito/jsp/upload_json.jsp',
                                fileManagerJson: '/dc/kindedito/jsp/file_manager_json.jsp',
                                allowFileManager: true,

                                autoHeightMode: ["200px", "200px"],//自动调整编辑区的高度
                                afterCreate: function () {
                                    this.loadPlugin('autoheight');//加载插件
                                    this.sync();
                                },
                                afterBlur: function () {
                                    this.sync();
                                }
                                //this.sync()用来同步数据
                            });
                        });
                    </script>
                    公告内容：
                    <textarea id="editor_id" style=" width: 300px" name="content"
                              aria-invalid="content"> </textarea><br>
                    <input type="submit" value="保存" onclick="addaffiche()">
                    <input type="button" value="关闭" onclick="guan()">
                </form>
            </div>
        </div>
        <div id="all_light"></div>


        <%--修改公告弹层--%>
        <div id="conte" style="">
            <%--<div style="width:500px;height:40px;">--%>
            <%--修改公告--%>
            <%--<hr>--%>
            <%--<form style=" margin-left: 100px;">--%>
            <%--标题：<input type="text" value="" id="titlesgai" name="title" ><br>--%>
            <%--公告现实时间段：<input type="date" id="startTimegai" name="startTime"> - <input type="date" id="endTimegai" name="endTime"> <span class="gonggaozhushi">注：为空则没有时间限制</span><br>--%>
            <%--<script type="text/javascript">--%>
            <%--KindEditor.ready(function(K) {--%>

            <%--var editor =  K.create('#editoridgai', {--%>
            <%--uploadJson : '/dc/kindedito/jsp/upload_json.jsp',--%>
            <%--fileManagerJson : '/dc/kindedito/jsp/file_manager_json.jsp',--%>
            <%--allowFileManager : true,--%>

            <%--autoHeightMode :["200px","200px"],//自动调整编辑区的高度--%>
            <%--afterCreate : function(){--%>
            <%--this.loadPlugin('autoheight');//加载插件--%>
            <%--this.sync();},--%>
            <%--afterBlur: function(){this.sync();}--%>
            <%--//this.sync()用来同步数据--%>
            <%--});--%>
            <%--});--%>
            <%--</script>--%>
            <%--公告内容：--%>
            <%--<textarea id="editoridgai"style=" width: 300px" name="content" aria-invalid="content" > </textarea><br>--%>
            <%--<input type="submit" value="保存" onclick="updateaffiche()">--%>
            <%--<input type="button" value="关闭" onclick="guangai()">--%>
            <%--</form>--%>
            <%--</div>--%>
        </div>
        <div id="alllight"></div>

        <div class="zhushi">
            <span>注释：修改时只能选择一条数据，删除可以选择多条</span>
        </div>

        <!--分页-->

        <div class="fenye">
            <input type="button" id="shouye" class="layui-btn layui-btn-warm" value="首页" onclick="firstpage()">
            <input type="button" id="xia" class="layui-btn layui-btn-warm" value="上一页" onclick="previouspage()">
            <input type="button" id="shang" class="layui-btn layui-btn-warm" value="下一页" onclick="nextpage()">

        </div>
    </div>

    <%@include file="/WEB-INF/pages/common/foot.jsp" %>
