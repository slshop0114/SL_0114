<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/pages/common/head.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/hyccss/repeataccount.css">
<script src="${pageContext.request.contextPath}/statics/hycjs/repeataccount.js"></script>
        <div style="width:1800px;left: 210px;top: 50px;position: absolute;">
            <div style="height: 50px;line-height: 50px"><span>电子银行>>消费账户</span></div>
            <hr />
            <div style="width: 1000px">
                <div class="layui-container">
                    <form id="searchform" class="layui-form">
                        <input type="hidden" value="${userSession.id}" id="userid">
                        <label>日期:</label>
                        <input type="text" id="date1" style="box-shadow:none;width: 150px;height: 30px;border-radius: 5px">
                        <label>到:</label>
                        <input type="text" id="date2" style=" box-shadow:none;width: 150px;height: 30px;border-radius: 5px">
                        <input type="submit" value="查询" style="box-shadow:none;width: 60px;height: 33px;border-radius: 5px;background: #009688">
                    </form>
                </div>
                <br><br><br>
                <div>
                    &nbsp&nbsp&nbsp<i style="color: #0000FF;font-size:20px;font-weight: bold">当前消费账户余额：</i>
                    <i style="color: #0000FF;font-size:20px;font-weight: bold"><%= session.getAttribute("repeatbalance")%></i>
                </div>
                <div>
                    <table border="1" class="layui-table">
                        <colgroup>
                            <col width="150">
                            <col width="200">
                            <col>
                        </colgroup>
                        <thead>
                        <tr>
                            <td>日期</td>
                            <td>摘要</td>
                            <td>入账金额</td>
                            <td>出账金额</td>
                            <td>操作余额</td>
                        </tr>
                        </thead>
                        <tbody id="list">
                        <c:forEach items="${list}" var="s">
                        <tr>
                            <td>${s.actiontime}</td>
                            <td>${s.actiondesc}</td>
                            <td>${s.repeatin}</td>
                            <td>${s.repeatout}</td>
                            <td>${s.repeatbalance}</td>
                        </tr>
                        </tbody>
                        </c:forEach>
                    </table>
                </div>
            </div>
            <div style="position: absolute;left: 5px;top: 400px;">
                <input type="button" style="background: #009688"  class="layui-btn layui-btn-warm" value="首页" onclick="firstpage()">
                <input type="button" style="background: #009688"  class="layui-btn layui-btn-warm" value="上一页" onclick="previouspage()">
                <input type="button" style="background: #009688"  class="layui-btn layui-btn-warm" value="下一页" onclick="nextpage()">

            </div>
        </div>
<%@include file="/WEB-INF/pages/common/foot.jsp"%>
