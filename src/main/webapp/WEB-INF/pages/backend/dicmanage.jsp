<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/pages/common/head.jsp" %>


<%--数据展示--%>
<form class="layui-form fromrolesty" action="" id="fromdicmanagelist">

    <button type="button" class="layui-btn" onclick="adddclist()">添加</button>
    <button type="button" class="layui-btn layui-btn-warm" onclick="modifydclist()">修改</button>
    <button type="button" class="layui-btn layui-btn-danger" onclick="dedicmanage()">删除</button>

    <div class="layui-form">
        <table class="layui-table">
            <colgroup>
                <col width="150">
                <col width="100">
                <col width="100">
                <col width="100">
                <col width="200">
            </colgroup>
            <thead>
            <tr>
                <th>选择</th>
                <th>类型</th>
                <th>名称</th>
                <th>编码</th>
                <th>数据值</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach items="${dicmanagelist}" var="dicmanagelist" >
                <tr>
                    <td class="center">
                        <div class="layui-form-item" pane="">
                            <div class="layui-input-block">
                                <input type="radio" name="choosedicmanage" value="${dicmanagelist.id}"
                                       lay-filter="choosedicmanage" >
                            </div>
                        </div>
                    </td>
                    <td class="center">${dicmanagelist.typeName}</td>
                    <td class="center">${dicmanagelist.valueName}</td>
                    <td class="center">${dicmanagelist.typeCode}</td>
                    <td class="center">${dicmanagelist.valueId}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</form>

<div style="clear: both"></div>
<a   class="layui-btn layui-btn-warm"  href="/backend/dicmanage.html?pagechange=1">下一页</a>
<a   class="layui-btn layui-btn-warm"  href="/backend/dicmanage.html?pagechange=2">上一页</a>


<%-------------------------------------------------------------------------------------------------------%>
<%--添加字典--%>


<form class="layui-form fromrolesty" action="/backend/addDic.html" id="adddicfrom">
    <div class="layui-form-item">
        <label class="layui-form-label">类型</label>
        <div class="layui-input-block">
            <input type="text" name="typeName" lay-verify="required" autocomplete="off" placeholder="请输入标题"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">名称</label>
        <div class="layui-input-block">
            <input type="text" name="valueName" lay-verify="required" autocomplete="off" placeholder="请输入标题"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">编码</label>
        <div class="layui-input-block">
            <input type="text" name="typeCode" lay-verify="required" autocomplete="off" placeholder="请输入标题"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">数据值</label>
        <div class="layui-input-block">
            <input type="text" name="valueId" lay-verify="number" autocomplete="off" placeholder="请输入标题"
                   class="layui-input">
        </div>
    </div>


    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="adddic">立即提交</button>
            <a class="layui-btn layui-btn-primary" href="/backend/dicmanage.html">重置</a>
        </div>
    </div>
</form>


<%--修改字典--%>


<form class="layui-form fromrolesty" action="/backend/modifylDic.html" id="updatedicfrom">
    <input type="hidden" id="dicid2" name="id">
    <div class="layui-form-item">
        <label class="layui-form-label">类型</label>
        <div class="layui-input-block">
            <input type="text" name="typeName" lay-verify="required" autocomplete="off" placeholder="请输入标题"
                   class="layui-input" id="updatedicfromtypeName">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">名称</label>
        <div class="layui-input-block">
            <input type="text" name="valueName" lay-verify="required" autocomplete="off" placeholder="请输入标题"
                   class="layui-input" id="updatedicfromvalueName">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">编码</label>
        <div class="layui-input-block">
            <input type="text" name="typeCode" lay-verify="required" autocomplete="off" placeholder="请输入标题"
                   class="layui-input" id="updatedicfromtypeCode">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">数据值</label>
        <div class="layui-input-block">
            <input type="text" name="valueId" lay-verify="number" autocomplete="off" placeholder="请输入标题"
                   class="layui-input" id="updatedicfromvalueId">
        </div>
    </div>


    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="updatedic">立即提交</button>
            <a class="layui-btn layui-btn-primary" href="/backend/dicmanage.html">重置</a>
        </div>
    </div>
</form>




<div id="foradddicmanage"></div>
<%@include file="/WEB-INF/pages/common/foot.jsp" %>
<script type="text/javascript" src="/statics/localjs/dicmanage.js"></script>


<script>
    layui.use(['layer', 'form'], function () {
        var layer = layui.layer
            , form = layui.form;
        //监听提交
        form.on('submit(adddic)', function (data) {
            alert("添加成功");

        });

        form.on('submit(updatedic)', function (data) {
            alert("修改成功");

        });

        form.on("radio(choosedicmanage)", function (data) {
            var dicsid = data.value;
            $("#dicid2").val(dicsid)
            $.ajax({
                url: "/backend/typecodeisexit.html",
                dataType: "json",
                method: "post",
                data: {"id": dicsid},
                success: function (result) {
                    $("#updatedicfromtypeName").val(result.typeName)
                    $("#updatedicfromvalueName").val(result.valueName)
                    $("#updatedicfromtypeCode").val(result.typeCode)
                    $("#updatedicfromvalueId").val(result.valueId)
                }
            });
        });


    });


</script>
