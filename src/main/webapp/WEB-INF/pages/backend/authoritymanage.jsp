<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/pages/common/head.jsp" %>

<div style="width: 1000px;height: 30px;font-size: 20px">
    权限管理    <i class="layui-icon layui-icon-next"></i>
</div>

<div style="width: 1000px" class="fl">

<form class="layui-form fromrolesty" action="/backend/functions.html" id="formforauthorith">
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="updateauthorith">保存修改</button>
        </div>
    </div>
    <div class="layui-form">
        <table class="layui-table">
            <colgroup>
                <col width="200">
                <col width="200">
                <col width="200">
                <col width="200">
                <col>
            </colgroup>
            <thead>
            <tr>
                <th>角色代码</th>
                <th>角色名称</th>
                <th>创建时间</th>
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

                    <td class="center">${role.createdBy}</td>
                    <td class="center">
                        <div class="layui-form-item" pane="">
                            <div class="layui-input-block">
                                <input type="radio" name="roleid" value="${role.id}" lay-filter="chooseroleuser">
                            </div>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="layui-form-item" id="authorityfunctioninputfxc">
        <label class="layui-form-label">权限管理:</label>
        <div class="layui-input-block">
            <c:forEach items="${functionlist}" var="function">
                <input type="checkbox" name="functionid" title="${function.functionName}" value="${function.id}">
            </c:forEach>
        </div>
    </div>
</form>
</div>

<%@include file="/WEB-INF/pages/common/foot.jsp" %>

<script>
    layui.use('form', function () {
        var form = layui.form;

//监听提交
        form.on('submit(updateauthorith)', function (data) {
            alert("修改成功");

        });
        form.on("radio(chooseroleuser)", function (data) {
            var roleId = data.value;
            $.ajax({
                url: "/backend/getAuthorityDefault.html",
                data: {"roleId": roleId},
                dataType: "json",
                method: "post",
                success: function (result) {
                    $('#formforauthorith input[type="checkbox"][name="functionid"]').removeAttr("checked");

                    for (var j = 0; j < result.length; j++) {
                        var ir = result[j].functionId;
                        $('#formforauthorith input[name="functionid"]').each(function () {
                                var iv = $(this).val();
                                if (ir == iv) {
                                    $(this).attr("checked", "")
                                }
                            }
                        );
                    }
                    form.render("checkbox");
                }
            });
        });
    })

</script>