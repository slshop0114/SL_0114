<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<link href="/statics/css/zzy/registList.css" rel="stylesheet">
<link rel="stylesheet" href="/statics/layui/css/layui.css"  media="all">

<script src="/statics/localjs/zzy/jquery.js" type="text/javascript"></script>
<script src="/statics/localjs/zzy/jQuery3.4.1.js" type="text/javascript"></script>

<script src="/statics/localjs/zzy/jquery.cookie.js" type="text/javascript"></script>
<%@include file="/WEB-INF/pages/common/head.jsp"%>


<div class="bodyall">

    <ul class="userregist">
        <%String referCode = request.getParameter("referCode");%>
        <%String loginCode = request.getParameter("loginCode");%>
        <%String userName = request.getParameter("userName");%>
        <%String idCard = request.getParameter("idCard");%>
        <%String mobile = request.getParameter("mobile");%>
        <%String bankName = request.getParameter("bankName");%>
        <%String bankAccount = request.getParameter("bankAccount");%>
        <%String accountHolder = request.getParameter("accountHolder");%>
        <%String userAddress = request.getParameter("userAddress");%>
        <%String cardType = request.getParameter("cardType");%>
        <%String postCode = request.getParameter("postCode");%>
        <li><label>推荐人：</label><%=referCode%></li>
        <li><label>用户名：</label><%=loginCode%></li>
        <li><label>姓名：</label><%=userName%></li>
        <li><label>证件号码：</label><%=idCard%></li>
        <li><label>移动电话：</label><%=mobile%></li>
        <li><label>开户行：</label><%=bankName%></li>
        <li><label>银行卡号：</label><%=bankAccount%></li>
        <li><label>开户人：</label><%=accountHolder%></li>
        <li><label>收货地址：</label><%=userAddress%></li>
        <li><label>收货国家：</label><%=cardType%></li>
        <li><label>邮政编码：</label><%=postCode%></li>
    </ul>
    <button class="layui-btn" onclick="toLast()">上一步</button>
    <button class="layui-btn" onclick="toNext()">提交</button>
    
</div>

<%@include file="/WEB-INF/pages/common/foot.jsp"%>
<%--<script>
    var logina=${sessionUser}
</script>--%>
<script src="/statics/localjs/zzy/registList.js" type="text/javascript"></script>