<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/pages/common/head.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/hyccss/internaltransfer.css">
<script src="${pageContext.request.contextPath}/statics/hycjs/internaltransfer.js"></script>
    <div style="width:1800px;left: 210px;top: 50px;position: absolute;">
        <input type="hidden" value="${userSession.id}" id="uid">
        <div style="height:50px;line-height: 50px;"><span style="margin-top: 15px">电子银行>>内部转账</span></div>
        <hr />
        <div style="width: 1000px">
            <div>
                <br><br><br>
                &nbsp&nbsp&nbsp<i style="color: #0000FF;font-size:20px;font-weight: bold">基本账户当前余额:</i>
                <i style="color: #0000FF;font-size:20px;font-weight: bold">
                    <input type="text" value="${sessionScope.basebalance}" id="nowbalance" style="border: none">
                </i>
            </div>
            <br><br><br>
        <form class="layui-form" id="subForm">
            <div class="layui-form-item">
                <label class="layui-form-label">对方账户：</label>
                <div class="layui-input-inline">
                    <input id="name"  type="text" name="name" required  lay-verify="required" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux"><span id="info1"></span></div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">转账金额：</label>
                <div class="layui-input-inline">
                    <input id="money"  type="text" name="money" required  lay-verify="required"  class="layui-input" onKeyUp="value=(parseInt((value=value.replace(/\D/g,''))==''?'0':value,10))">
                </div>
                <div class="layui-form-mid layui-word-aux"><span id="info2"></span></div>
            </div>


            <div class="layui-form-item">
                <label class="layui-form-label">支付密码：</label>
                <div class="layui-input-inline">
                    <input id="pw" type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
            </div>
                <div class="layui-form-mid layui-word-aux"><span id="info3"></span></div>
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
