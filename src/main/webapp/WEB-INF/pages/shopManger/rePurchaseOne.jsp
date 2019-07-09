<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/pages/common/head.jsp" %>
<div class="orderDiv">
    <form action="/shopManger/rePurchase.form">
        <div class="layui-inline">
            <label class="layui-form-label">编号：</label>
            <div class="layui-input-inline">
                <input type="text" name="goodsPackCode" lay-verify="required|goodsPackCode" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">套餐标题</label>
            <div class="layui-input-inline">
                <input type="text" name="goodsPackName" lay-verify="date" placeholder="用户名" autocomplete="off"
                       class="layui-input">
            </div>
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
        </colgroup>
        <thead>
        <tr>
            <th>选择</th>
            <th>编号</th>
            <th>套餐标题</th>
            <th>零售价</th>
            <th>优惠价</th>
            <th>说明</th>
            <th>数量</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${goodsPack}" var="goodsPackList" varStatus="status">
            <tr>
                <td class="center">
                    <div class="layui-form-item" pane="">
                        <div class="layui-input-block">
                            <input type="checkbox" name="choosegoodspack" id="goodsPackChose"
                                   value="${goodsPackList.id}"
                                   lay-filter="choosegoodspack">
                        </div>
                    </div>
                <td class="center">${goodsPackList.goodsPackCode}</td>
                <td class="center">${goodsPackList.goodsPackName}</td>
                <td class="center">${goodsPackList.totalPrice*1.2}</td>
                <td class="center">${goodsPackList.totalPrice}</td>
                <td class="center">${goodsPackList.note}</td>
                <td><input type="text" id="inp${status.index}" placeholder="1"></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div style="right: 10px;position: absolute;width: 500px;">
        <a class="layui-btn layui-btn-warm" href="/shopManger/rePurchase.html?pageChange=2">上一页</a>
        <a class="layui-btn layui-btn-warm" href="/shopManger/rePurchase.html?pageChange=1">下一页</a>
    </div>
    <div>
        <input style="display: none" id="getUserId" value="${userSession.loginCode}">
        <button class="layui-btn" onclick="goPay()">去结算</button>
        <button class="layui-btn" onclick="addShopCart()">加入购物车</button>
    </div>
</div>
<%@include file="/WEB-INF/pages/common/foot.jsp" %>


