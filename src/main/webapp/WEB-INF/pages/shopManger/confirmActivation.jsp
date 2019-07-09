<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@include file="/WEB-INF/pages/common/head.jsp" %>
<div class="orderDiv">
    <form action="/shopManger/confirmActivation.search">
        <div class="layui-inline">
            <label class="layui-form-label">单号：</label>
            <div class="layui-input-inline">
                <input type="text" name="ordersn" lay-verify="required|ordersn" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">用户名：</label>
            <div class="layui-input-inline">
                <input type="text" name="loginCode" id="date" lay-verify="date" placeholder="用户名" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">日期：</label>
            <div class="layui-input-inline">
                <input type="text" name="date1" class="layui-input" id="test1" placeholder="yyyy-MM-dd">
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">to</label>
                <div class="layui-input-inline">
                    <input type="text" name="date2" class="layui-input" id="test2" placeholder="yyyy-MM-dd">
                </div>
            </div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="submit" class="layui-btn">查询</button>
        </div>
        <input type="text" id="getCount" style="display: none" value="${count}">
        <input type="text" id="getUserId" style="display: none" value="${userId}">
    </form>
    <%--  //前面写el表达式，没办法再用ajax去激活，只有通过激活按钮，触发form表单  --%>

    <form action="/shopManger/confirmActivation.go">
        <input type="text" id="getUserIdf" style="display: none" name="userId" value="">
        <button id="goForm"  type="submit" style="display: none">1111</button>
    </form>
    <table class="layui-table" lay-even="" lay-skin="row" style="width: 1250px;left: 50px;">
        <colgroup>
            <col width="150">
            <col width="150">
            <col width="120">
            <col width="100">
            <col width="100">
            <col width="100">
            <col width="100">
        </colgroup>
        <thead>
        <tr>
            <th>单号</th>
            <th>会员用户名</th>
            <th>收货人姓名</th>
            <th>日期</th>
            <th>时间</th>
            <th>购货金额</th>
            <th>激活</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list0}" var="orderInfoZtw">
            <tr>
                <td style="display: none" id="orderuserid">${orderInfoZtw.buyuserid}</td>
                <td>${orderInfoZtw.ordersn}</td>
                <td>
                    <c:forEach items="${list1}" var="list1">
                        <c:if test="${orderInfoZtw.buyuserid==list1.id}">
                            ${list1.loginCode}
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach items="${list1}" var="list1">
                        <c:if test="${orderInfoZtw.buyuserid==list1.id}">
                            ${list1.userName}
                        </c:if>
                    </c:forEach>
                </td>
                <td><fmt:formatDate value="${orderInfoZtw.ordertime}" pattern="yyyy-MM-dd"/></td>
                <td><fmt:formatDate value="${orderInfoZtw.ordertime}" pattern="hh:mm:ss"/></td>
                <td>${orderInfoZtw.servicefee}</td>
                <td>
                    <button type="button" onclick="goActivation()" class="layui-btn layui-btn-xs layui-btn-normal">激活
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div id="page" style="left: 900px;position: relative"></div>
</div>
<%@include file="/WEB-INF/pages/common/foot.jsp" %>
