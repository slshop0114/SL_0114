<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/pages/common/head.jsp" %>
<div class="orderDiv">
    <form action="/shopManger/rePurchase.doSearch">
        <div class="layui-inline">
            <label class="layui-form-label">单号：</label>
            <div class="layui-input-inline">
                <input type="text" name="ordersn" lay-verify="required|ordersn" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">会员用户：</label>
            <div class="layui-input-inline">
                <input type="text" name="loginCode" lay-verify="date" placeholder="用户名" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-input-inline">
            <label class="layui-form-label">收货地址：</label>
            <select name="quiz1" id="selProvince">
                <option value="">--请选择--</option>
                <option value="报单购货">报单购货</option>
                <option value="重消购货">重消购货</option>
            </select>
        </div>
        <button type="submit" class="layui-btn">查询</button>
    </form>

    <table class="layui-table" lay-even="" lay-skin="row" style="width: 1250px;left: 50px;">
        <colgroup>
            <col width="120">
            <col width="150">
            <col width="150">
            <col width="100">
            <col width="100">
            <col width="100">
            <col width="100">
            <col width="100">
        </colgroup>
        <thead>
        <tr>
            <th>选择</th>
            <th>单号</th>
            <th>会员用户名</th>
            <th>收货人姓名</th>
            <th>日期</th>
            <th>销售类型</th>
            <th>销售金额</th>
            <th>积分值</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list0}" var="orderInfoZtw">
            <tr>
                <td class="center">
                    <input type="checkbox" id="goodsPackChose" name="getChecked" value="${orderInfoZtw.orderid}">
                </td>
                <td class="center">${orderInfoZtw.ordersn}</td>
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
                <td class="center">${orderInfoZtw.tel}</td>
                <td class="center">${orderInfoZtw.servicefee}</td>
                <td>
                    <c:if test="${orderInfoZtw.tel=='重消购货'}">
                        ${orderInfoZtw.repeatpv}
                    </c:if>
                    <c:if test="${orderInfoZtw.tel=='报单购货'}">
                        ${orderInfoZtw.basepv}
                    </c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div>
        <button class="layui-btn" onclick="deleteOrderList()">删除</button>
    </div>
</div>
<%@include file="/WEB-INF/pages/common/foot.jsp" %>