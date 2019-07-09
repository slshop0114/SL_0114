<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Title</title>

    <link href="/statics/css/zzy/index.css" rel="stylesheet">
    <link rel="stylesheet" href="/statics/layui/css/layui.css"  media="all">

    <script src="/statics/js/json2.js" type="text/javascript"></script>

    <script src="/statics/localjs/zzy/jQuery3.4.1.js" type="text/javascript"></script>
    <script src="/statics/localjs/zzy/index.js"></script>
    <script src="/statics/localjs/zzy/jquery.cookie.js" type="text/javascript"></script>
</head>
<body>

<div class="container-fluid" style="margin-left: 600px">
    <div class="row-fluid">

        <div class="row-fluid">
            <div class="span12 center login-header">
                <h2>SL会员商城</h2>
            </div><!--/span-->
        </div><!--/row-->

        <div class="row-fluid">
            <div class="well span5 center login-box">
                <div class="alert alert-info">
                    请输入登陆账号和密码...

                </div>


                <div class="form-horizontal" >
                    <fieldset>
                        <div class="input-prepend" title="登录账号" data-rel="tooltip">
                            <span class="add-on"><i class="layui-icon layui-icon-username"></i></span>
                            <input autofocus class="input-large span10" name="loginCode" id="logincode" type="text" value="" />
                        </div>
                        <div class="clearfix"></div>

                        <div class="input-prepend" title="登陆密码" data-rel="tooltip">
                            <span class="add-on"><i class="layui-icon layui-icon-password"></i></span>
                            <input class="input-large span10" name="password" id="password" type="password" value="" />
                        </div>
                        <div class="clearfix"></div>

                        <!-- <div class="input-prepend">
                        <label class="remember" for="remember"><input type="checkbox" id="remember" />Remember me</label>
                        </div> -->
                        <div class="clearfix"></div>
                        <ul id="formtip"></ul>
                        <p class="center span5">
                      <%--      <button type="submit" class="btn btn-primary" id="loginBtn">登录</button>--%>
                      <input type="submit" class="btn btn-primary" id="loginBtn" value="登录" onclick="dologin()"/>
                        </p>

                    </fieldset>
                    
                </div>
            </div><!--/span-->
        </div><!--/row-->
    </div><!--/fluid-row-->
</div>


</body>
</html>
