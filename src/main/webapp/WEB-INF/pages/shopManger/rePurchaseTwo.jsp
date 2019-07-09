<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/pages/common/head.jsp" %>
<div class="orderDiv">
    <table class="layui-table" lay-even="" lay-skin="row" style="width: 1250px;left: 50px;">
        <colgroup>
            <col width="150">
            <col width="150">
            <col width="150">
            <col width="150">
            <col width="150">
            <col width="150">
        </colgroup>
        <thead>
        <tr>
            <th>套餐标题</th>
            <th>零售价（元）</th>
            <th>优惠价（元）</th>
            <th>数量</th>
            <th>总价</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${orderListZtw}" var="orderListZtw" varStatus="status">
            <tr>
                <td class="center">${orderListZtw.goodsName}</td>
                <td class="center"><fmt:formatNumber type="number" value="${orderListZtw.eachPrice*1.2}"></fmt:formatNumber></td>
                <td class="center" id="eachPrice${status.index}">${orderListZtw.eachPrice}</td>
                <td class="center">
                    <input type="text" id="gsc${status.index}" placeholder="${orderListZtw.goodsNum}" class="getTest" oninput="onInput()">
                </td>
                <td class="center"><span id="sp${status.index}" class="sumPrice">${orderListZtw.eachPrice*orderListZtw.goodsNum}</span></td>
                <td>
                    <form action="/shopManger/rePurchaseTwo.dodel">
                        <input style="display: none" id="getUserId" name="loginCode" value="${userSession.loginCode}">
                        <input name="listId"  id="listId${status.index}" style="display: none" value="${orderListZtw.listId}">
                        <button type="submit" class="layui-btn layui-btn-xs layui-btn-normal">删除</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div style="left: 1000px;position: absolute;width: 100px;">
        总价：
        <span style="color: red;font-size: large;" id="totalPrice"></span>
        <button class="layui-btn" onclick="goPay()">去结算</button>
    </div>


</div>
<%@include file="/WEB-INF/pages/common/foot.jsp" %>
