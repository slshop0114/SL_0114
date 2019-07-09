<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/pages/common/head.jsp" %>
<div class="orderDiv">
    <div style="left: 30%;top: 30%;position: relative;width:300px;height: 150px;">
        <span style="font-size: 18px;">报单购货会员用户名：</span>
        <input type="text" id="userName" name="title" required lay-verify="required" placeholder="用户名"
               autocomplete="off" class="layui-input" style="width: 300px;">
        <div style="right: 0px;bottom:0px;position: absolute;"><a onclick="existName()" class="layui-btn">下一步</a></div>
    </div>
</div>

<%@include file="/WEB-INF/pages/common/foot.jsp" %>
