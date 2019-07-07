<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/pages/common/head.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/hyccss/baseaccount.css">
<script src="${pageContext.request.contextPath}/statics/hycjs/baseaccount.js"></script>
        <div style="width:1800px;left: 210px;top: 50px;position: absolute;">
                <div style="height:50px;line-height: 50px;"><span style="margin-top: 15px">电子银行>>基本账户</span></div>
            <hr />
            <div style="width: 1000px">
                <div >
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
                        &nbsp&nbsp&nbsp<i style="color: #0000FF;font-size:20px;font-weight: bold">当前基本账户余额：</i>
                        <i style="color: #0000FF;font-size:20px;font-weight: bold"><%= session.getAttribute("basebalance")%></i>
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

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div style="position: absolute;left: 5px;top: 400px;">
                <input type="button" style="background: #009688"  class="layui-btn layui-btn-warm" value="首页" onclick="firstpage()">
                <input type="button" style="background: #009688"  class="layui-btn layui-btn-warm" value="上一页" onclick="previouspage()">
                <input type="button" style="background: #009688"  class="layui-btn layui-btn-warm" value="下一页" onclick="nextpage()">
            </div>
            <div style="position: absolute;left: 5px;top: 550px;"><i class="layui-icon layui-icon-flag" style="font-size: 16px; color: #1E9FFF;">提示：如果您的汇款单未到账，请点击<a href="/account/addleavemessage.html" class="layui-btn layui-btn-sm">联系客服</a>通知公司客服为您解决！</i> </div>
        </div>
<%@include file="/WEB-INF/pages/common/foot.jsp"%>


