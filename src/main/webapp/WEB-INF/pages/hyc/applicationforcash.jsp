<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/pages/common/head.jsp" %>
<script src="${pageContext.request.contextPath}/statics/hycjs/applicationforcash.js"></script>
        <div style="width:1800px;left: 210px;top: 50px;position: absolute;">
            <div style="height:50px;line-height: 50px;"><span style="margin-top: 15px">电子银行>>申请提现</span></div>
            <hr />
            <div style="width: 1000px">
                <div class="layui-form-item">
                    <label class="layui-form-label">账户余额：</label>
                    <div class="layui-input-inline" style="margin-top: 10px">
                        <input type="text" value="${sessionScope.basebalance}" id="nowbalance" style="border: none;font-size: 18px">
                    </div>
                </div>

                <form class="layui-form" id="forCashForm">

                    <input type="hidden" value="${userSession.id}" id="uid" name="userId">
                    <div class="layui-form-item">
                        <label class="layui-form-label">提现金额：</label>
                        <div class="layui-input-inline">
                            <input id="cashMoney"  type="text" name="cashMoney" required  lay-verify="required" autocomplete="off" class="layui-input" onKeyUp="value=(parseInt((value=value.replace(/\D/g,''))==''?'0':value,10))">
                        </div>
                        <div class="layui-form-mid layui-word-aux"><span id="info1"></span></div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">银行地址：</label>
                        <div class="layui-input-inline">
                            <input id="note"  type="text" name="note" required  lay-verify="required" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-form-mid layui-word-aux"><span id="info2"></span></div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">银行名称：</label>
                        <div class="layui-input-block" style="width: 250px">
                            <select id="bankName" name="bankName" lay-verify="required">
                                <option value="">--请选择--</option>
                                <option value="1">--中国银行--</option>
                                <option value="0">--建设银行--</option>
                                <option value="0">--工商银行--</option>
                                <option value="0">--交通银行--</option>
                                <option value="0">--农业银行--</option>
                            </select>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">开户名：</label>
                        <div class="layui-input-inline">
                            <input id="bankBrance"  type="text" name="bankBrance" required  lay-verify="required" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-form-mid layui-word-aux"><span id="info3"></span></div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">银行卡号：</label>
                        <div class="layui-input-inline">
                            <input id="bankAccount"  type="text" name="bankAccount" required  lay-verify="required" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-form-mid layui-word-aux"><span id="info4"></span></div>
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
    <div id="info" style="display: none">
        <span style="font-weight: bold;">
        &nbsp&nbsp&nbsp&nbsp&nbsp您好，根据公司的提现规定，每月10号之前申请提现，30号发放，20号之前申请提现，次月10号发放，每月30
        号之前申请提现，次月20号发放，提现有5%手续费（国际汇款费用，汇率差）。谢谢！
        </span>
    </div>
        <%@include file="/WEB-INF/pages/common/foot.jsp"%>





