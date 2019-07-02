<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/pages/common/head.jsp" %>


<form class="layui-form fromrolesty" action="">
	<button type="button" class="layui-btn" onclick="addauthority()">添加</button>
	<button type="button" class="layui-btn" onclick="modifyauthority()">修改</button>
	<button type="button" class="layui-btn" onclick="deauthority()">删除</button>
	<div class="layui-form">
		<table class="layui-table">
			<colgroup>
				<col width="150">
				<col width="150">
				<col width="200">
				<col width="50">
				<col width="100">
				<col>
			</colgroup>
			<thead>
			<tr>
				<th>角色代码</th>
				<th>角色名称</th>
				<th>创建时间</th>
				<th>状态</th>
				<th>创建者</th>
				<th>操作</th>
			</tr>
			</thead>
			<tbody>


			<c:forEach items="${roleList}" var="role">
				<tr>

					<td class="center">${role.roleCode}</td>
					<td class="center">${role.roleName}</td>
					<td class="center"><fmt:formatDate value="${role.createDate}" pattern="yyyy-MM-dd"/></td>
					<td class="center">
						<input type="checkbox" data-rel="tooltip" class="modifyIsStart"
							   isstart="${role.isStart}" roleid="${role.id}"
							   <c:if test="${role.isStart == 1}">checked="true"</c:if>/>
					</td>
					<td class="center">${role.createdBy}</td>
					<td class="center">
						<div class="layui-form-item" pane="">
							<div class="layui-input-block">
								<input type="radio" name="chooserole" value="${role.id}">
							</div>
						</div>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</form>









<%@include file="/WEB-INF/pages/common/foot.jsp" %>

<script>
    layui.use('form', function () {
        var form = layui.form;

//监听提交
        form.on('submit(addrole)', function (data) {
            alert("添加成功");

        });

    });
</script>