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
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
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
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
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