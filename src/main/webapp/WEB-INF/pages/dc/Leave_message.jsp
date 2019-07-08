<%@include file="/WEB-INF/pages/common/head.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>留言管理</title><input type="hidden" value="${userSession.loginCode}" class="username" >

    <link href="/statics/css/dc/Leave_message.css" rel="stylesheet">
    <script src="/statics/js/dc/jQuery3.4.1.js"></script>
    <script src="/statics/layui/layui.js"></script>
    <script src="/statics/layui/layui.all.js" charset="utf-8"></script>
    <script src="/statics/js/dc/Leave_message.js"></script>
</head>
<body>
<div style="margin-left: 210px">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend>留言板管理</legend>
</fieldset>
<div class="layui-tab">
    <ul class="layui-tab-title">
        <li onclick="huiyuanliuyanguanli()" class="layui-this">会员留言管理</li>
        <li onclick="guanliyuan()">管理员留言管理</li>

    </ul>
    <%--头部选择kuang--%>
    <div class="layui-tab-content">
        <!--会员留言-->
        <div class="layui-tab-item layui-show" >
            <p >我的留言:</p>
            <dia id="list">
            <%--<div class="liuyankuang" >--%>
                <%--<div class="liuyan">--%>
                    <%--留言：您好：0080806869 2011-12-2 金额：0 信用卡汇款未到账。速查--%>
                <%--</div>--%>
                <%--<div class="dafu">--%>
                    <%--答复：您好！您的汇款金额为0元，没有查询到该笔交易记录（客服人员：z060）--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="liuyankuang" >--%>
                <%--<div class="liuyan">--%>
                    <%--留言：您好：0080806869 2011-12-2 金额：0 信用卡汇款未到账。速查--%>
                <%--</div>--%>
                <%--<div class="dafu">--%>
                    <%--答复：您好！您的汇款金额为0元，没有查询到该笔交易记录（客服人员：z060）--%>
                <%--</div>--%>
            <%--</div>--%>
            </dia>
            <div class="fenye">
                <input class="layui-btn layui-btn-xs" type="button" onclick="firstpage()" value="首页">
                <input class="layui-btn layui-btn-xs" type="button" onclick="previouspage()" value="上一页">
                <input class="layui-btn layui-btn-xs" type="button" onclick="nextpage()" value="下一页">
            </div>
            <div class="yaoliuyan">
                <p>我要留言：</p>
                <div class="woyaoliuyankuang">
                    <form>
                    <span>留言类容:</span><textarea class="liuyanleirong"></textarea><br>
                        <label for="checkcode" class="">验证码</label>
                        <input id="checkcode" class="shuru" name="checkcode" type="text"  placeholder="请输入验证码">
                        <canvas id="canvas" class="yanzhengma" ></canvas>
                        <span id="checkcodeMessage" class=""></span>
                    <input type="button" style="float: right" class="layui-btn layui-btn-sm" onclick="liuyantijiao()" value="提交">
                    </form>
                </div>
            </div>

        </div>

        <!--管理员留言-->
        <div class="layui-tab-item  ">
            <div class="anniu">
                <input type="button" class="layui-btn layui-btn-normal layui-btn-radius touimpl" value="查看" onclick="chakantanchuang() " >
                <input type="button" class="layui-btn layui-btn-normal layui-btn-radius touimpl" value="回复" onclick="huifutanchuang()" >
                <input type="button" class="layui-btn layui-btn-danger layui-btn-radius touimpl" id="shanchu" value="删除" onclick="deleteliuyan()">
            </div>
            <div class="tablegao" id="list1">
                <%--<table class="layui-table" id="list">--%>
                    <%--<thead>--%>
                    <%--<tr>--%>
                        <%--<th  class=" layui-unselect">选择</th>--%>
                        <%--<th class=" layui-unselect">留言会员号</th>--%>
                        <%--<th class=" layui-unselect">留言内容</th>--%>
                        <%--<th class=" layui-unselect">状态（已回复/未回复）</th>--%>
                        <%--<th class=" layui-unselect">留言时间/th>--%>
                    <%--</tr>--%>
                    <%--</thead>--%>
                        <%--<tr >--%>
                        <%--<td><input id="" type="checkbox" name="zixun"></td>--%>
                        <%--<td>sl_role01</td>--%>
                        <%--<td>您好：0080806869 2011-12-2 金额：0 信用卡汇款未到账。速查</td>--%>
                        <%--<td>已回复</td>--%>
                        <%--<td>2013-12-26-15:04:01</td>--%>
                        <%--</tr>--%>
                <%--</table>--%>
            </div>

            <div class="zhushi">
                <span>注：回复后留言章台自动改为“已回复”</span>
            </div>

            <div class="fenye">
                <input class="layui-btn layui-btn-xs" type="button" onclick="firstpage1()" value="首页">
                <input class="layui-btn layui-btn-xs" type="button" onclick="previouspage1()" value="上一页">
                <input class="layui-btn layui-btn-xs" type="button" onclick="nextpage1()" value="下一页">
            </div>
        </div>

    </div>
</div>
<%--//查看留言弹窗--%>
<div id="conte" style="">
    <%--<h4>回复留言查看</h4>--%>
    <%--<div class="liuyan12">--%>
        <%--留言内容:<div class="liuyanhuifukuang12">您好：0080806869 2011-12-2 金额：0 信用卡汇款未到账。速查</div><br>--%>
        <%--留言时间: <span> 2013-12-24</span>--%>
    <%--</div>--%>
    <%--<div>--%>
        <%--回复：<div class="liuyanhuifukuang12">您好！您的汇款金额为0元，没有查询到该笔交易记录（客服人员：z060）</div><br>--%>
        <%--回复时间：<span>2013-12-27</span>--%>
    <%--</div>--%>
    <%--<input type="button" class="layui-btn layui-btn-sm" value="关闭" onclick="guangai()">--%>
</div>
<div id="alllight"></div>

<%--回复留言弹窗--%>
<div id="contes" style="">
    <%--<h4>回复留言查看</h4>--%>
    <%--留言人：<span>admin</span>--%>
    <%--<div class="huifu">--%>
        <%--留言内容:<div class="huifukuang">您好：0080806869 2011-12-2 金额：0 信用卡汇款未到账。速查</div><br>--%>
        <%--留言时间: <span> 2013-12-24</span>--%>
    <%--</div>--%>
    <%--<div>--%>
        <%--回复：<div class="huifukuang">--%>
        <%--<textarea style="width:300px;height: 50px "></textarea>--%>
    <%--</div><br>--%>
        <%--<input type="button" class="layui-btn layui-btn-sm" value="关闭" onclick="huifuguanbi()">--%>
    <%--</div>--%>
</div>
<div id="alllights"></div>

</div>
<%@include file="/WEB-INF/pages/common/foot.jsp" %>
