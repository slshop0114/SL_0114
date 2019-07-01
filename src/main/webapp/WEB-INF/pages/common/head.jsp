<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>SL会员商城</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
        <meta name="author" content="Muhammad Usman">
        <link rel="stylesheet" href="/statics/layui/css/layui.css" media="all">
        <link rel="stylesheet" href="/statics/localcss/main.css" media="all">
        <link rel="stylesheet" href="/statics/localcss/userlist.css" media="all">

        <script src="/statics/js/jQuery3.4.1.js" type="text/javascript"></script>

        <style type="text/css">
            body {
                padding-bottom: 40px;
            }

            .sidebar-nav {
                padding: 9px 0;
            }

            .navbar .nav li a {
                border: 0px;
            }

            .custom-setting {
            }

            .clear {
                clear: both;
            }

            div .modal-body label {
                color: black;
            }
        </style>

        <script>

            var tt = '${menus}';

        </script>

    </head>
    <body>
        <input type="hidden" value="'${userSession.id}'" id="userSessionid">
        <!-- topbar starts -->
        <div class="navbar">
            <ul class="layui-nav" lay-filter="">
                <li class="layui-nav-item"><a class="" href="/main.html"> <img alt="Charisma Logo"
                                                                               src="/statics/img/logo20.png"/> <span>SL会员商城</span></a>
                </li>
                <li class="layui-nav-item"><a href="#">你好，${userSession.loginCode}</a></li>
                <li class="layui-nav-item layui-this"><a href="#">角色：${userSession.roleName}</a></li>
                <li class="layui-nav-item"><a href="/main.html">首页</a></li>
                <li class="layui-nav-item"><a href="#">购物车</a></li>
                <li class="layui-nav-item"><a href="#">留言板</a></li>
                <li class="layui-nav-item">
                    <div class="site-demo-button" id="layerDemo" style="margin-bottom: 0;">
                        <button data-method="notice" class="layui-btn">修改密码</button>
                    </div>
                </li>
                <li class="layui-nav-item"><a href="/logout.html">注销</a></li>
            </ul>

        </div>

     <ul id="headleft" class="layui-nav layui-nav-tree layui-inline" lay-filter="demo" style="margin-right: 10px;">



        </ul>




