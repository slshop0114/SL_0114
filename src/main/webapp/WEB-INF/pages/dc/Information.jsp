<%@include file="/WEB-INF/pages/common/head.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>

    <title>资讯管理</title>

    <link href="/statics/css/dc/information.css" rel="stylesheet">
    <link href="/statics/layui/css/layui.css" rel="stylesheet" >
<script src="/statics/js/dc/jQuery3.4.1.js"></script>
<%--<script src="/statics/layui/layui.js"></script>--%>
<script src="/statics/kindeditor/kindeditor-all.js"></script>
<script src="/statics/kindeditor/lang/zh-CN.js"></script>




</head>
<body>
<div style="margin-left: 210px">
<div class="tou">
    <p><span >资讯管理 》资讯管理</span></p><input type="hidden" value="${userSession.loginCode}" class="username" >
</div>

<!--//功能键 新增 修改  删除-->
<div class="anniu">
    <input type="button" class="layui-btn layui-btn-normal layui-btn-radius touimpl" value="新增" onclick="add()" >
    <input type="button" class="layui-btn layui-btn-normal layui-btn-radius touimpl" value="修改" onclick="updatezx()">
    <input type="button" class="layui-btn layui-btn-danger layui-btn-radius touimpl" onclick="deleteid()" value="删除">

</div>
<div>
    <table class="layui-table" id="list">
        <%--<thead>--%>
        <%--<tr>--%>
            <%--<th class=" layui-unselect">选择</th>--%>
            <%--<th class=" layui-unselect">文件标题（点击下载）</th>--%>
            <%--<th class=" layui-unselect">下载说明</th>--%>
            <%--<th class=" layui-unselect">文件大小</th>--%>
            <%--<th class=" layui-unselect">下载次数</th>--%>
            <%--<th class=" layui-unselect">状态（发布/不发布）</th>--%>
            <%--<th class=" layui-unselect">最后修改时间</th>--%>
        <%--</tr>--%>
        <%--</thead>--%>
        <%--<tr >--%>
            <%--<td><input type="checkbox" name="zixun"></td>--%>
            <%--<td>新世纪发布会【视屏】</td>--%>
            <%--<td>新世纪发布会花絮</td>--%>
            <%--<td>112M</td>--%>
            <%--<td>22</td>--%>
            <%--<td><input type="checkbox" checked="checked"></td>--%>
            <%--<td>2013-12-26-15:04:01</td>--%>
        <%--</tr>--%>
    </table>
</div>

<div class="zhushi">
    <span>注：状态打钩或去掉打钩则立即生效</span>
</div>

<%--增加资讯弹层表单--%>
<div id="contes" style="">
    <div style="width:500px;height:40px;">
        添加资讯
        <hr>
        <form style=" margin-left: 100px; " method=POST>
            <br>
            标题：<input type="text" id="title" name=""><br><br>
            资讯类型：<select name="cars" id="zixunleixing">
                        <%--<option value="volvo">文本</option>--%>
                        <%--<option value="saab">图片</option>--%>
                        <%--<option value="fiat">视屏</option>--%>
                    </select><br><br>
            <%--<input id="uploadFile1" type="file" name="uploadFile">--%>
            <button type="button" class="layui-btn" id="updateusercard12">点击上传附件</button><br>
            <input type="hidden" id="fiLepath1">
            <input type="hidden" id="fiLepathsize1">
            <input type="hidden" id="fiLepathname1">
            <script type="text/javascript">
                KindEditor.ready(function(K) {

                    var editor =  K.create('#editor_id', {
                        uploadJson : '/dc/kindedito/jsp/upload_json.jsp',
                        fileManagerJson : '/dc/kindedito/jsp/file_manager_json.jsp',
                        allowFileManager : true,

                        autoHeightMode :["200px","200px"],//自动调整编辑区的高度
                        afterCreate : function(){
                            this.loadPlugin('autoheight');//加载插件
                            this.sync();},
                        afterBlur: function(){this.sync();}
                        //this.sync()用来同步数据
                    });
                });
            </script>

            公告内容:<textarea   style=" width: 300px" id="editor_id" name="content" ></textarea><br><br>

            状态：<input type="radio" name="state" checked="checked" value="1">发布  &nbsp;&nbsp;<input type="radio" name="state" value="0">不发布<br><br>

            <input type="button" value="保存" onclick="baocun1()">
            <input type="button" value="返回" onclick="guan()">
        </form>
    </div>
</div>
<div id="all_light"></div>


<%--修改资讯弹层--%>
    <div id="conte1" style="">
        <%--<div style="width:500px;height:40px;">--%>
            <%--修改--%>
            <%--<hr>--%>
            <%--<form style=" margin-left: 100px; " method=POST>--%>
                <%--<br>--%>
                <%--标题：<input type="text" id="title13" name=""><br><br>--%>
                <%--资讯类型：<select name="cars" id="zixunleixing13">--%>
                <%--&lt;%&ndash;<option value="volvo">文本</option>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<option value="saab">图片</option>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<option value="fiat">视屏</option>&ndash;%&gt;--%>
            <%--</select><br><br>--%>
                <%--<button type="button" class="layui-btn" id="updateusercard13">点击上传附件</button><br>--%>
                <%--<input type="hidden" id="fiLepath13">--%>
                <%--<input type="hidden" id="fiLepathsize13">--%>
                <%--<input type="hidden" id="fiLepathname13">--%>
                <%--<script type="text/javascript">--%>
                    <%--KindEditor.ready(function(K) {--%>

                        <%--var editor =  K.create('#editor_id1', {--%>
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

                <%--公告内容:<textarea   style=" width: 300px" id="editor_id1" name="content" ></textarea><br><br>--%>

                <%--状态：<input type="radio" name="state" checked="checked" value="1">发布  &nbsp;&nbsp;<input type="radio" name="state" value="0">不发布<br><br>--%>

                <%--<input type="button" value="保存" onclick="xiugaizx()">--%>
                <%--<input type="button" value="返回" onclick="guanxiugai()">--%>
            <%--</form>--%>
        <%--</div>--%>
    </div>
    <div id="alllight1"></div>

<!--分页-->
<div class="fenye">
    <input type="button" id="shouye" class="layui-btn layui-btn-warm" value="首页" onclick="firstpage()">
    <input type="button" id="xia" class="layui-btn layui-btn-warm" value="上一页" onclick="previouspage()">
    <input type="button" id="shang" class="layui-btn layui-btn-warm" value="下一页" onclick="nextpage()">

</div>

</div>
    <script src="/statics/layui/layui.js" charset="utf-8"></script>
    <script src="/statics/layui/layui.all.js" charset="utf-8"></script>
    <script src="/statics/js/dc/information.js"></script>

<%@include file="/WEB-INF/pages/common/foot.jsp" %>
