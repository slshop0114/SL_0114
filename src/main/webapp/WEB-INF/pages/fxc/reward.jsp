<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/pages/common/head.jsp" %>
<div style="width: 600px" class="fl">
    <table class="layui-table">
        <colgroup>
            <col width="150">
            <col width="150">
            <col width="150">

        </colgroup>
        <thead>
        <tr>
            <th>级别</th>
            <th>${userSession.userTypeName}</th>
            <th>本人直推会员</th>
            <th>${refercount}</th>
        </tr>
        </thead>
    </table>
</div>
<div class="fl" style="width: 1300px">
    <div class="layui-tab">
        <ul class="layui-tab-title">
            <li class="layui-this">奖金明细表</li>
            <li>结算表</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <table class="layui-table">
                    <colgroup>
                        <col width="150">
                        <col width="200">
                        <col width="200">
                        <col>
                    </colgroup>
                    <thead>
                    <tr>
                        <th>日期</th>
                        <th>推荐奖</th>
                        <th>消费积分奖</th>
                        <th>合计</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <c:forEach items="${Userpointlist}" var="Userpointlist">
                            <td><fmt:formatDate value="${Userpointlist.buytime}" pattern="yyyy-MM-dd"/></td>
                            <td>${Userpointlist.bonusPv}</td>


                          <c:forEach items="${UserBuyBonuslist}" var="UserBuyBonuslist">
                               <c:choose>
                                <c:when test="${UserBuyBonuslist.calTime==Userpointlist.buytime}">
                                    <td>
                                            ${UserBuyBonuslist.bonusPv}
                                    </td>
                                    <td>
                                            ${UserBuyBonuslist.bonusPv+Userpointlist.bonusPv}
                                    </td>

                                </c:when>
                                   <c:otherwise>
                                       <td>0</td>
                                       <td>${Userpointlist.bonusPv}</td>
                                   </c:otherwise>
                               </c:choose>
                            </c:forEach>

                        </c:forEach>
                    </tr>

                    </tbody>
                </table>


            </div>
            <div class="layui-tab-item">
                <table class="layui-table">
                    <colgroup>
                        <col width="150">
                        <col width="200">
                        <col width="200">
                        <col>
                    </colgroup>
                    <thead>
                    <tr>
                        <th>序号</th>
                        <th>总推荐人数奖励</th>
                        <th>总消费人数奖励</th>
                        <th>实际合发</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <c:forEach items="${UserBuyMonthBonuslist}" var="UserBuyMonthBonuslist" varStatus="i">
                        <td>${i.index+1}</td>
                        <td>0</td>
                        <td>${UserBuyMonthBonuslist.bonusPv}</td>
                        <td>${UserBuyMonthBonuslist.bonusPv}</td>
                        </c:forEach>
                    </tr>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<%@include file="/WEB-INF/pages/common/foot.jsp" %>


<script>
    layui.use('element', function () {
        var elementre2 = layui.element;
    })


</script>