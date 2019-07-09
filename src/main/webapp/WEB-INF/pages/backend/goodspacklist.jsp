<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/pages/common/head.jsp" %>

<div style="width: 1000px;height: 30px;font-size: 20px">
    商品包管理    <i class="layui-icon layui-icon-next"></i>
</div>
<%--商品展示--%>
<form class="layui-form fromrolesty" action="/backend/goodspacklist.html" id="fromgoodspacklist">


    <button type="button" class="layui-btn" onclick="addgoodspack()">添加</button>
    <button type="button" class="layui-btn layui-btn-warm" onclick="modifygoodspack()">修改</button>
    <button type="button" class="layui-btn layui-btn-danger" onclick="degoodspack()">删除</button>
    <button type="button" class="layui-btn layui-btn-danger" onclick="searchgoodspack()">查看</button>
    <div class="layui-form-item fl">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="serachgoospack">查询</button>
        </div>
    </div>

    <div class="layui-input-inline fl">
        <input type="text" name="goodsPackName" placeholder="请输入名称" class="layui-input search_input" id="searchgoodspackinput">
    </div>



    <div class="layui-form">
        <table class="layui-table">
            <colgroup>
                <col width="100">
                <col width="100">
                <col width="100">
                <col width="100">
                <col width="100">
                <col width="100">
                <col width="100">
                <col width="100">
            </colgroup>
            <thead>
            <tr>
                <th>选择</th>
                <th>编号</th>
                <th>套餐名称</th>
                <th>零售价（元）</th>
                <th>优惠价</th>
                <th>剩余套餐数</th>
                <th>状态（商家/下架）</th>
                <th>套餐类型</th>

            </tr>
            </thead>
            <tbody>


            <c:forEach items="${goodsPackList}" var="goodsPackList">
                <tr>

                    <td class="center">
                        <div class="layui-form-item" pane="">
                            <div class="layui-input-block">
                                <input type="radio" name="choosegoodspack" value="${goodsPackList.id}"
                                       lay-filter="choosegoodspack" >
                            </div>
                        </div>
                    </td>

                    <td class="center">${goodsPackList.goodsPackCode}</td>
                    <td class="center">${goodsPackList.goodsPackName}</td>
                    <td class="center">${goodsPackList.totalPrice*1.2}</td>
                    <td class="center">${goodsPackList.totalPrice}</td>
                    <td class="center">${goodsPackList.num}</td>

                    <td class="center">
                        <input disabled type="checkbox" data-rel="tooltip" class="modifyIsStart"
                               isstart="${goodsPackList.state}" roleid="${role.id}"
                               <c:if test="${goodsPackList.state == 1}">checked="true"</c:if>/>
                    </td>
                    <td class="center">${goodsPackList.typeName}</td>

                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</form>
<%-------------------------------------------------------------------------------------------------------%>
<%--添加商品--%>

<form class="layui-form fromrolesty" action="/backend/addgoodspack.html" id="addgoodspack">
    <div class="layui-form-item">
        <div class="layui-input-block">
            <input type="hidden" name="createdBy"  autocomplete="off" placeholder="请输入标题"
                   class="layui-input" value="${userSession.loginCode}">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">套餐名称</label>
        <div class="layui-input-block">
            <input type="text" name="goodsPackName" lay-verify="required" autocomplete="off" placeholder="请输入标题"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">编号</label>
        <div class="layui-input-block">
            <input type="text" name="goodsPackCode" lay-verify="required" autocomplete="off" placeholder="请输入标题"
                   class="layui-input" id="goodspackcodefxc">
        <div id="testgoodspackcodefxc" style="display: none">编号重复</div>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">套餐类型</label>
        <div class="layui-input-block">
            <select name="typeName" lay-filter="typeName">
                <option value="" selected=""></option>
                <option value="报单购货">报单购货</option>
                <option value="辅销购货">辅销购货</option>
                <option value="重销购货">重销购货</option>
            </select>
        </div>
    </div>



    <div class="layui-form-item">
        <label class="layui-form-label">优惠价</label>
        <div class="layui-input-block">
            <input type="text" name="totalPrice" lay-verify="number" autocomplete="off" placeholder="请输入标题"
                   class="layui-input">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">状态</label>
        <div class="layui-input-block">
            <input type="radio" name="state" value="1" title="上架" checked="">
            <input type="radio" name="state" value="2" title="下架">
        </div>
    </div>
    <%--添加商品套餐中的商品--%>
    <div class="layui-form">
        <table class="layui-table">
            <colgroup >
                <col width="100">
                <col width="100">
                <col width="100">
                <col width="100">

            </colgroup>
            <thead>
            <tr>
                <th>选择</th>
                <th>商品名称</th>
                <th>库存量</th>
                <th>添加数量</th>
            </tr>
            </thead>
            <tbody>


            <c:forEach items="${goodsInfoListforpack}" var="goodsInfoList" varStatus="i">
                <tr>
                    <td>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <input type="radio" value="${goodsInfoList.id}" name="GoodsInfos[${i.count}].id" title="${goodsInfoList.goodsName}">
                            </div>
                        </div>
                    </td>


                    <td class="center">${goodsInfoList.goodsName}</td>
                    <td class="center">${goodsInfoList.num}</td>

                    <td>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <input type="text" name="GoodsInfos[${i.count}].num" lay-verify="number" autocomplete="off" placeholder="请输入数量"
                                   class="layui-input" style="width: 100px" value="0">
                        </div>
                    </div>
                    </td>


                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>


    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">说明</label>
        <div class="layui-input-block">
            <textarea name="note" placeholder="请输入内容" class="layui-textarea"></textarea>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="subgoodspaclinfo">立即提交</button>
            <a class="layui-btn layui-btn-primary" href="/backend/goodspacklist.html">重置</a>
        </div>
    </div>
</form>
<%---------------------------------------------分割线--------------------------------------------------------------------------%>


<%--修改商品--%>


<form class="layui-form fromrolesty" action="/backend/savemodifygoodspack.html" id="updategoodspack">
    <div class="layui-form-item">
        <div class="layui-input-block">
            <input type="hidden" name="createdBy" lay-verify="title" autocomplete="off" placeholder="请输入标题"
                   class="layui-input" value="${userSession.loginCode}">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">套餐名称</label>
        <div class="layui-input-block">
            <input type="text" name="goodsPackName" lay-verify="required" autocomplete="off" placeholder="请输入标题"
                   class="layui-input" id="goodsPackName">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">编号</label>
        <div class="layui-input-block">
            <input type="text" name="goodsPackCode" lay-verify="required" autocomplete="off" placeholder="请输入标题"
                   class="layui-input" id="goodsPackCode"  disabled="disabled">

        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">套餐类型</label>
        <div class="layui-input-block">
            <select name="typeName" lay-filter="typeName" >
                <option value="" selected=""></option>
                <option value="报单购货">报单购货</option>
                <option value="辅销购货">辅销购货</option>
                <option value="重销购货">重销购货</option>
            </select>
        </div>
    </div>



    <div class="layui-form-item">
        <label class="layui-form-label">优惠价</label>
        <div class="layui-input-block">
            <input type="text" name="totalPrice" lay-verify="number" autocomplete="off" placeholder="请输入标题"
                   class="layui-input" id="goodspacktotalPrice">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">状态</label>
        <div class="layui-input-block">
            <input type="radio" name="state" value="1" title="上架" checked="">
            <input type="radio" name="state" value="2" title="下架">
        </div>
    </div>
    <%--添加商品套餐中的商品--%>
    <div class="layui-form">
        <table class="layui-table">
            <colgroup >
                <col width="100">
                <col width="100">
                <col width="100">
                <col width="100">

            </colgroup>
            <thead>
            <tr>
                <th>选择</th>
                <th>商品名称</th>
                <th>库存量</th>
                <th>添加数量</th>
            </tr>
            </thead>
            <tbody>


            <c:forEach items="${goodsInfoListforpack}" var="goodsInfoList" varStatus="i">
                <tr>
                    <td>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <input type="radio" value="${goodsInfoList.id}" name="GoodsInfos[${i.count}].id" title="${goodsInfoList.goodsName}">
                            </div>
                        </div>
                    </td>


                    <td class="center">${goodsInfoList.goodsName}</td>
                    <td class="center">${goodsInfoList.num}</td>

                    <td>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <input type="text" name="GoodsInfos[${i.count}].num"  autocomplete="off" placeholder="请输入数量"
                                       class="layui-input" style="width: 100px">
                            </div>
                        </div>
                    </td>


                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>


    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">说明</label>
        <div class="layui-input-block">
            <textarea name="note" placeholder="请输入内容" class="layui-textarea" id="goodspacknote"></textarea>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="updategoodspaclinfo">立即提交</button>
            <a class="layui-btn layui-btn-primary" href="/backend/goodspacklist.html">重置</a>
        </div>
    </div>
</form>



<%--查询商品--%>

<form class="layui-form fromrolesty" action="" id="searchgoodspack">

    <div class="layui-form-item">
        <label class="layui-form-label">套餐名称</label>
        <div class="layui-input-block">
            <input type="text" name="goodsPackName" lay-verify="title" autocomplete="off" placeholder="请输入标题"
                   class="layui-input" id="goodsPackName2" disabled="disabled">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">编号</label>
        <div class="layui-input-block">
            <input type="text" name="goodsPackCode" lay-verify="title" autocomplete="off" placeholder="请输入标题"
                   class="layui-input" id="goodsPackCode2"  disabled="disabled">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">套餐类型</label>
        <div class="layui-input-block">
            <select name="typeName" lay-filter="typeName"  disabled="disabled">
                <option value="" selected=""></option>
                <option value="报单购货">报单购货</option>
                <option value="辅销购货">辅销购货</option>
                <option value="重销购货">重销购货</option>
            </select>
        </div>
    </div>



    <div class="layui-form-item">
        <label class="layui-form-label">优惠价</label>
        <div class="layui-input-block">
            <input type="text" name="totalPrice" lay-verify="title" autocomplete="off" placeholder="请输入标题"
                   class="layui-input" id="goodspacktotalPrice2"  disabled="disabled">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">状态</label>
        <div class="layui-input-block">
            <input type="radio" name="state" value="1" title="上架" checked=""  disabled="disabled">
            <input type="radio" name="state" value="2" title="下架"  disabled="disabled">
        </div>
    </div>
    <%--添加商品套餐中的商品--%>
    <div class="layui-form">
        <table class="layui-table">
            <colgroup >
                <col width="100">
                <col width="100">
                <col width="100">
                <col width="100">

            </colgroup>
            <thead>
            <tr>
                <th>商品名称</th>
                <th>数量</th>

            </tr>
            </thead>
            <tbody id="goodsinfossearch">



            </tbody>
        </table>
    </div>


    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">说明</label>
        <div class="layui-input-block">
            <textarea name="note" placeholder="请输入内容" class="layui-textarea" id="goodspacknote2"  disabled="disabled"></textarea>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <a class="layui-btn layui-btn-primary" href="/backend/goodspacklist.html">重置</a>
        </div>
    </div>
</form>






<div id="forgoodspacklist"></div>
<%@include file="/WEB-INF/pages/common/foot.jsp" %>
<script type="text/javascript" src="/statics/localjs/goodspacklist.js"></script>

<script>
    layui.use('form', function () {
        var form = layui.form;

//监听提交
        form.on('submit(subgoodspaclinfo)', function (data) {
            alert("添加成功");

        });

        form.on('submit(updategoodspaclinfo)', function (data) {
            alert("修改成功");

        });
        form.on('submit(serachgoospack)', function (data) {

        });
        form.on("radio(choosegoodspack)", function (data) {
         var goodpacksid = data.value;
            $.ajax({
                url: "/backend/modifygoodspack.html",
                dataType: "json",
                method: "post",
                data: {"id": goodpacksid},
                success: function (result) {

                    $("#goodsPackName").val(result.goodsPack1.goodsPackName)
                    $("#goodsPackCode").val(result.goodsPack1.goodsPackCode)
                    $("#goodspacktotalPrice").val(result.goodsPack1.totalPrice)
                    $("#goodspacknote").val(result.goodsPack1.note)
                }
            });
        });

    });
</script>