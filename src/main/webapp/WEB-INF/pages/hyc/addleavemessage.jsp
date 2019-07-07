<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/pages/common/head.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/hyccss/baseaccount.css">
<script src="${pageContext.request.contextPath}/statics/hycjs/addleavemessage.js"></script>
    <div style="width:1800px;left: 210px;top: 50px;position: absolute;">
        <div style="height:50px;line-height: 50px;"><span style="margin-top: 15px">电子银行>>联系客服</span></div>
        <hr />
        <div style="width: 1000px">
            <div>
                <form class="layui-form" id="addMessageForm">
                    <div class="layui-form-item">
                        <label class="layui-form-label">单号：</label>
                        <div class="layui-input-inline">
                            <input id="oddnum"  type="text" name="oddnum" required  lay-verify="required" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-form-mid layui-word-aux"><span id="info1"></span></div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">汇款金额：</label>
                        <div class="layui-input-inline">
                            <input id="money"  type="text" name="money" required  lay-verify="required" autocomplete="off" class="layui-input" onKeyUp="value=(parseInt((value=value.replace(/\D/g,''))==''?'0':value,10))">
                        </div>
                        <div class="layui-form-mid layui-word-aux"><span id="info2"></span></div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">汇款时间：</label>
                        <div class="layui-input-inline">
                            <input id="date"  type="text" name="date" required  lay-verify="required" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-form-mid layui-word-aux"><span id="info3"></span></div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <input type="submit" class="layui-btn"  lay-submit lay-filter="formDemo" value="通知客服">
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
    </div>
<%@include file="/WEB-INF/pages/common/foot.jsp"%>