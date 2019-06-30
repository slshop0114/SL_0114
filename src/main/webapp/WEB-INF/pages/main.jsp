<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html >
	<head>
		<title>用户管理</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="format-detection" content="telephone=no">
		<script src="/statics/js/jQuery3.4.1.js" type="text/javascript"></script>
		<link rel="stylesheet" href="fxc/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="//at.alicdn.com/t/font_tnyc012u2rlwstt9.css" media="all" />
		<link rel="stylesheet" href="../../statics/css/user.css" media="all" />
	</head>
	<body>

		<blockquote class="layui-elem-quote news_search">

			<div class="layui-inline">
				<a class="layui-btn layui-btn-normal usersAdd_btn">添加用户</a>
			</div>
			<div class="layui-inline">
				<a class="layui-btn layui-btn-danger userUpdate">修改</a>
			</div>
			<div class="layui-inline">
				<a class="layui-btn layui-btn-danger batchDel">删除</a>
			</div>

			<div class="layui-inline">
				<div class="layui-input-inline">
					<input type="text" value="" placeholder="请输入关键字" class="layui-input search_input">
				</div>
				<a class="layui-btn search_btn">查询</a>
			</div>

		</blockquote>

		<div class="layui-form users_list">
			<table class="layui-table">
				<colgroup>
					<col width="50">
					<col>
					<col width="18%">
					<col width="8%">
					<col width="12%">
					<col width="12%">
					<col width="18%">
					<col width="15%">
				</colgroup>
				<thead>
				<tr>
					<th><input type="radio" name="" lay-skin="primary" lay-filter="allChoose" id="allChoose"></th>
					<th>用户名</th>
					<th>角色</th>
					<th>会员类型</th>
					<th>推荐人</th>
					<th>状态</th>
					<th>最后修改时间</th>
				</tr>
				</thead>
				<tbody class="users_content"></tbody>
				<c:forEach  items="${list}" var="user">
					<tr>
						<th><input type="radio" id="${user.id}"> </th>
						<th>${user.userName} </th>
						<th>${user.roleName}</th>
						<th>${user.userTypeName}</th>
						<th>${user.referCode}</th>
						<th><input type="checkbox" id="${user.id}"></th>
						<th>${user.lastUpdateTime}</th>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div id="page"></div>
		<script type="text/javascript" src="fxc/layui/layui.js"></script>
		<script type="text/javascript" src="fxc/userManage.js"></script>

	</body>
</html>
