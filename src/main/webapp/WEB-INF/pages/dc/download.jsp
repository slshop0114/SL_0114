<%@include file="/WEB-INF/pages/common/head.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>下载中心</title>

    <link href="/statics/css/dc/download.css" rel="stylesheet">
    <script src="/statics/js/dc/jQuery3.4.1.js"></script>
    <script src="/statics/layui/layui.js"></script>
    <script src="/statics/layui/layui.all.js" charset="utf-8"></script>
    <script src="/statics/js/dc/download.js"></script>




</head>
<body>
<div style="margin-left: 210px">
<div class="tou">   <H4>下载中心</H4> </div>
<div class="wenbenxuanrna">
<table id="list" class="layui-table">
    <%--<tr >--%>
        <%--<td >新世纪新品发布会花絮【视频】</td>--%>
        <%--<td>2013-12-12</td>--%>
    <%--</tr>--%>

</table>
</div>
<div class="fenye">
    <input class="layui-btn layui-btn-xs" type="button" onclick="firstpage()" value="首页">
    <input class="layui-btn layui-btn-xs" type="button" onclick="previouspage()" value="上一页">
    <input class="layui-btn layui-btn-xs" type="button" onclick="nextpage()" value="下一页">
</div>


<%--查看详情--%>
<div id="contes" style="">
    <%--<div class="tou3">   <H4>下载中心>详细页面</H4> </div>--%>
    <%--<div class="wenzitou3">--%>
        <%--<div class="wenzitouneir3">--%>
            <%--<span>新世纪新品发布会花絮</span><br>--%>
            <%--<span>3013/01/12</span>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--<div class="wenbenkuang3">--%>
        <%--文本内容--%>
    <%--</div>--%>
    <%--<div class="xiazai3">--%>
        <%--<input class="layui-btn layui-btn-lg layui-btn-normal" type="button" value="点击下载">--%>
    <%--</div>--%>
    <%--<div class="fanhui3">--%>
        <%--<input class="layui-btn layui-btn-sm layui-btn-norma" onclick="guan()"  type="button" value="返回">--%>
    <%--</div>--%>
</div>
<div id="all_light"></div>
</div>
<%@include file="/WEB-INF/pages/common/foot.jsp" %>
