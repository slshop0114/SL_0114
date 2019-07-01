
<%@include file="/WEB-INF/pages/common/head.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

		<blockquote class="layui-elem-quote main_search ">

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
				<<c:forEach  items="${list}" var="user">
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
		</blockquote>
		<div id="page"></div>

		<%@include file="/WEB-INF/pages/common/foot.jsp"%>
