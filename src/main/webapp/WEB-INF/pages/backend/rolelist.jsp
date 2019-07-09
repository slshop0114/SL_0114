<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/pages/common/head.jsp" %>

<div style="width: 1000px;height: 30px;font-size: 20px">
    角色管理    <i class="layui-icon layui-icon-next"></i>
</div>
<form class="layui-form fromrolesty" action="">
    <button type="button" class="layui-btn" onclick="addrole()">添加</button>
    <button type="button" class="layui-btn" onclick="modifyRolerole()">修改</button>
    <button type="button" class="layui-btn" onclick="deRole()">删除</button>
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
                        <input disabled type="checkbox" data-rel="tooltip" class="modifyIsStart"
                               isstart="${role.isStart}" roleid="${role.id}"
                               <c:if test="${role.isStart == 1}">checked="true"</c:if>/>
                    </td>
                    <td class="center">${role.createdBy}</td>
                    <td class="center">
                        <div class="layui-form-item" pane="">
                            <div class="layui-input-block">
                                <input type="radio" name="chooserole" value="${role.id}" lay-filter="chooseroleid" >
                            </div>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</form>

<%--增加角色--%>
<form class="layui-form" action="/backend/addRole.html" id="addrole">
    <div class="layui-form-item">
        <div class="layui-input-block">
            <input type="hidden"  name="createdBy" required lay-verify="required" autocomplete="off" class="layui-input" value="${userSession.loginCode}">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">角色代码</label>
        <div class="layui-input-block">
            <input type="text" id="roleCodeblur" name="roleCode" required lay-verify="required" autocomplete="off" class="layui-input">
            <div style="display: none" id="hiddenrolecode">rolecode重复</div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">角色名称</label>
        <div class="layui-input-block">
            <input type="text" name="roleName" required lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="addrole">立即提交</button>
            <a class="layui-btn" href="/backend/rolelist.html">返回</a>
        </div>
    </div>
</form>

<%--修改role--%>
<form class="layui-form" action="/backend/modifyRole.html" id="updaterole" >
    <div class="layui-form-item">
        <div class="layui-input-block">
            <input type="hidden"  name="id" id="updaterolehidden" required lay-verify="required" autocomplete="off" class="layui-input" >
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">角色代码</label>
        <div class="layui-input-block">
            <input type="text" id="roleCodeblur2" name="roleCode" required lay-verify="required" autocomplete="off" class="layui-input">
            <div style="display: none" id="hiddenrolecode2">rolecode重复</div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">角色名称</label>
        <div class="layui-input-block">
            <input type="text" id="rolename2" name="roleName" required lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="updaterole">立即提交</button>
            <a class="layui-btn" href="/backend/rolelist.html">返回</a>
        </div>
    </div>
</form>


<div id="foraddrole"></div>

<%@include file="/WEB-INF/pages/common/foot.jsp" %>

<script type="text/javascript" src="/statics/localjs/rolelist.js"></script>
<script>
    layui.use('form', function () {
        var form = layui.form;

//监听提交
        form.on('submit(addrole)', function (data) {
            alert("添加成功");

        });
        form.on('submit(updaterole)', function (data) {
            alert("修改成功");

        });

        form.on("radio(chooseroleid)", function (data) {
            var roleid = data.value;
            $.ajax({
                url: "/backend/blurrole.html",
                dataType: "json",
                method: "post",
                data: {"id": roleid},
                success: function (result) {
                    console.log(result)
                    $("#roleCodeblur2").val(result.role.roleCode);
                    $("#rolename2").val(result.role.roleName);


                }
            });
        });
    });
</script>