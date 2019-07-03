<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/pages/common/head.jsp" %>

<form action="/backend/userlist.html" method="post" class="layui-form fromrolesty" >
    <button type="button" class="layui-btn" onclick="">添加</button>
    <button type="button" class="layui-btn layui-btn-warm" onclick="">修改</button>
    <button type="button" class="layui-btn layui-btn-danger" onclick="">删除</button>
    <div class="layui-input-inline">
        <input type="text" name="" placeholder="请输入名称" class="layui-input search_input" id="">
    </div>


    <div class="layui-form">
            <table class="layui-table">
                <colgroup>
                    <col width="50">
                    <col width="100">
                    <col width="100">
                    <col width="150">
                    <col width="100">
                    <col width="100">
                    <col width="100">
                </colgroup>
                <thead>
                <tr>
                    <th>选项</th>
                    <th>用户名</th>
                    <th>角色</th>
                    <th>会员类型</th>
                    <th>推荐人</th>
                    <th>状态</th>
                    <th>最后修改时间</th>
                </tr>
                </thead>
                <tbody class="users_content"></tbody>
                <c:forEach items="${list}" var="user">
                    <tr>
                        <th>
                            <div class="layui-form-item">
                                <%--<label class="layui-form-label">单选框</label>--%>
                                <div class="layui-input-block">
                                    <input type="radio" name="id" value="${user.id}" >

                                </div>
                            </div>
                        </th>
                        <th>${user.userName} </th>
                        <th>${user.roleName}</th>
                        <th>${user.userTypeName}</th>
                        <th>${user.referCode}</th>
                        <th>
                            <c:if test="${user.isStart == 2}"><input type="checkbox" disabled="disabled"/></c:if>
                            <c:if test="${user.isStart == 1}"><input type="checkbox" checked="true"
                                                                     disabled="disabled"/></c:if>
                        </th>
                        <th>
                            <fmt:formatDate value="${user.lastUpdateTime}" pattern="yyyy-MM-dd"/>
                        </th>
                    </tr>
                </c:forEach>
            </table>

        </div>

</form>


<%--增加表单--%>







<%--修改用户--%>
<div id="foradduser"></div>
<%@include file="/WEB-INF/pages/common/foot.jsp" %>
<script>
    layui.use('form', function () {
        var form = layui.form;

//监听提交
        form.on('submit()', function (data) {
            alert("添加成功");

        });

        form.on('submit()', function (data) {
            alert("修改成功");

        });
        form.on('submit()', function (data) {
            alert("查询");

        });
        form.on("radio()", function (data) {
            var goodpacksid = data.value;
            $.ajax({
                url: "/backend/modifygoodspack.html",
                dataType: "json",
                method: "post",
                data: {"id": goodpacksid},
                success: function (result) {
                    $("#goodsPackName").val(result.goodsPackName)
                    $("#goodsPackCode").val(result.goodsPackCode)
                    $("#goodspacktotalPrice").val(result.totalPrice)
                    $("#goodspacknote").val(result.note)
                }
            });
        });

    });
</script>