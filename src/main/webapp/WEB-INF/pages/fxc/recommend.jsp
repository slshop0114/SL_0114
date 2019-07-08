<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/pages/common/head.jsp" %>

<ul class="layui-nav layui-nav-tree layui-bg-cyan layui-inline fl">
    <li class="layui-nav-item layui-nav-itemed">
        <a href="javascript:;">${userSession.loginCode}</a>
        <dl class="layui-nav-child">
            <c:forEach items="${userreferlist}" var="userreferlist">
            <dd><a href="javascript:;" onclick="searchuserreferlistfxc(${userreferlist.id})">${userreferlist.loginCode}${userreferlist.userTypeName}</a></dd>
            </c:forEach>
        </dl>
    </li>
    <li class="layui-nav-item">
        <a href="javascript:;">推荐会员</a>
    </li>

</ul>
<div class="fl" >会员信息：
    <ul id="userreferinfo">

    </ul>

</div>

<%@include file="/WEB-INF/pages/common/foot.jsp" %>

<script type="text/javascript" src="/statics/localjs/recommend.js"></script>
<script>
    layui.use('element', function () {
        var elementre = layui.element;

//监听提交
        elementre.on('nav(recommendfxc)', function(elem){
            //console.log(elem)
            layer.msg(elem.text());
        });

    });
</script>