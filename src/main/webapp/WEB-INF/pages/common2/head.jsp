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
        <link rel="stylesheet" href="../../../statics/layui/css/layui.css" media="all">
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



        <ul class="layui-nav layui-nav-tree layui-inline" lay-filter="demo" style="margin-right: 10px;">
            <li class="layui-nav-item layui-nav-itemed">
                <a href="javascript:;">默认展开</a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;">选项一</a></dd>
                    <dd><a href="javascript:;">选项二</a></dd>
                    <dd><a href="javascript:;">选项三</a></dd>
                    <dd><a href="">跳转项</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">解决方案</a>
                <dl class="layui-nav-child">
                    <dd><a href="">移动模块</a></dd>
                    <dd><a href="">后台模版</a></dd>
                    <dd><a href="">电商平台</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">云市场</a></li>
            <li class="layui-nav-item"><a href="">社区</a></li>
        </ul>
    </body>
    <script src="../../../statics/layui/layui.js" charset="utf-8"></script>
    <script>
        //注意：导航 依赖 element 模块，否则无法进行功能性操作
        layui.use('element', function () {
            var element = layui.element;

            //…
        });
    </script>

    <%--弹出表单--%>

    <script>
        layui.use('layer', function(){ //独立版的layer无需执行这一句
            var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句

            //触发事件
            var active = {

                notice: function(){
                    //示范一个公告层
                    layer.open({
                        type: 1
                        ,title: false //不显示标题栏
                        ,closeBtn: false
                        ,area: '300px;'
                        ,shade: 0.8
                        ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                        ,btn: ['提交', '取消']
                        ,btnAlign: 'c'
                        ,moveType: 1 //拖拽模式，0或者1
                        ,content: '<form>\n' +
                            '            请输入原密码<input id="oldpassword" type="password"><br>\n' +
                            '            请输出新密码<input id="newpassword" type="password"><br>\n' +
                            '            再次输入密码<input id="aginpassword" type="password"><br>\n' +
                            '        </form>'
                        ,success: function(layero){
                            var btn = layero.find('.layui-layer-btn');
                            btn.find('.layui-layer-btn0').attr({
                                href: 'http://www.layui.com/'
                                ,target: '_blank'
                            });
                        }
                    });
                }

            };

            $('#layerDemo .layui-btn').on('click', function(){
                var othis = $(this), method = othis.data('method');
                active[method] ? active[method].call(this, othis) : '';
            });

        });
    </script>
</html>