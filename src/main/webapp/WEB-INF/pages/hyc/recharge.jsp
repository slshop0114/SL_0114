<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/pages/common/head.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/hyccss/recharge.css">
<script src="${pageContext.request.contextPath}/statics/hycjs/recharge.js"></script>
        <div style="width:1800px;left: 210px;top: 50px;position: absolute;">
            <div style="height:50px;line-height: 50px;"><span>电子银行>>汇款充值</span></div>
            <hr />
                <div style="width: 1000px">
                    <input type="hidden" value="${userSession.id}" id="userid">
                    <form class="layui-form" id="rechargeForm">
                        <%--<div class="layui-form-item">
                            <label class="layui-form-label">汇款日期:</label>
                            <div class="layui-input-block">
                                <input id="date" type="text" name="date" required  lay-verify="required" placeholder="YYYY-MM-DD" autocomplete="off" class="layui-input" style="width: 250px">
                            </div>
                        </div>--%>
                        <div class="layui-form-item">
                            <label class="layui-form-label">汇款金额:</label>
                            <div class="layui-input-inline">
                                <input id="money" type="text" name="money" required lay-verify="required" placeholder="请输入金额" autocomplete="off" class="layui-input" style="width: 250px" onKeyUp="value=(parseInt((value=value.replace(/\D/g,''))==''?'0':value,10))">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">充值账户:</label>
                            <div class="layui-input-block" style="width: 250px">
                                <select id="recharge_account" name="accounr" lay-verify="required">
                                    <option value=""></option>
                                    <option value="1">--基本账户--</option>
                                    <option value="0">--消费账户--</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-form-item layui-form-text">
                            <label class="layui-form-label">摘要:</label>
                            <div class="layui-input-block">
                                <textarea id="note" name="desc"  class="layui-textarea" style="width: 250px"></textarea>
                            </div>
                        </div>
                        <div style="margin-top: 5px">
                            <label class="layui-form-label" style="margin-top: -10px">单号:</label>
                            <label id="oddnum" style="color:#8700FF;font-weight: bold;font-size: 16px;margin-top: 5px"></label>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <input type="submit" class="layui-btn"  lay-submit lay-filter="formDemo" value="提交">
                                <input type="reset" class="layui-btn layui-btn-primary" value="重置">
                            </div>
                        </div>
                    </form>

                    <script>
                        //Demo
                        layui.use('form', function(){
                            var form = layui.form;

                            //监听提交
                            form.on('submit(formDemo)', function(data){
                                layer.msg(JSON.stringify(data.field));
                                return false;
                            });
                        });
                    </script>
                </div>
        </div>
<%@include file="/WEB-INF/pages/common/foot.jsp"%>


