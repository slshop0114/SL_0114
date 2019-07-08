<%@include file="/WEB-INF/pages/common/head.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<title>详情页</title>

<link href="/statics/css/dc/announcementsxqy.css" rel="stylesheet">
<script src="/statics/js/dc/jQuery3.4.1.js"></script>
<script src="/statics/layui/layui.js"></script>
<script src="/statics/layui/layui.all.js" charset="utf-8"></script>
<script src="/statics/js/dc/announcementsxqy.js"></script>


</head>
<body>
    <div style="margin-left: 210px">
        <div class="dingbu">
            <p><span>公告管理 > 详细页</span></p>
        </div>
        <!--标题-->

        <%--<p>关于市场管理的通知</p>--%>
        <%--<p>2013-01-12</p>--%>

        <div class="toubu">
            <p>${affiche.title}</p>
            <p><fmt:formatDate value="${affiche.publishTime}" pattern="yyyy-MM-dd"/></p>
        </div>
        <div class="wenben">
            ${affiche.content}
        </div>
        <div class="luokuan">
            <p><span>${affiche.publisher}</span></p>
            <p><fmt:formatDate value="${affiche.publishTime}" pattern="yyyy-MM-dd"/></p>
        </div>
        <div class="anniu" onclick="fanhui()">
            <input type="button" value="返回">
        </div>
        <%----%>


        <%--${affiche}--%>

        <%--<!--内容-->--%>
        <%--<div class="wenben">--%>
        <%--5G来了，无数资本蜂拥而至，多方探索5G能够赋能的应用和商业模式，探索商业模式到底是不是现在应该做的事情？--%>

        <%--中兴通讯股份有限公司执行董事、总裁徐子阳，在央视财经频道《对话》栏目中谈到，对商业模式不要过度留恋，因为当一代技术和一代技术出现更迭的时--%>
        <%--候，往往是对商业模式的一种颠覆。如果对已有的商业模式过度留恋，那会造成时间上的损失。--%>

        <%--</div>--%>

        <%--<div class="luokuan">--%>
        <%--<p><span>sl会员商城</span></p>--%>
        <%--<p><span>2013、01、11</span></p>--%>
        <%--</div>--%>
        <%--<!--返回按钮-->--%>
        <%--<div class="anniu">--%>
        <%--<input type="button" value="返回">--%>
        <%--</div>--%>

    </div>

    <%@include file="/WEB-INF/pages/common/foot.jsp" %>
