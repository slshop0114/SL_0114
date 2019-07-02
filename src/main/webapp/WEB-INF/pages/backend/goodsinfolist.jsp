<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/pages/common/head.jsp" %>


<%--商品展示--%>
<form class="layui-form fromrolesty" action="/backend/goodsinfolist.html" id="fromgoodslist">

    <div class="layui-input-inline">
        <input type="text" name="goodsName" placeholder="请输入名称" class="layui-input search_input">
    </div>
    <button type="button" class="layui-btn" onclick="addauthority()">添加</button>
    <button type="button" class="layui-btn layui-btn-warm" onclick="modifyauthority()">修改</button>
    <button type="button" class="layui-btn layui-btn-danger" onclick="deauthority()">删除</button>

    <div class="layui-form-item fl">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="searchgoodsinfo">查询</button>
        </div>
    </div>





    <div class="layui-form">
        <table class="layui-table">
            <colgroup>
                <col width="150">
                <col width="100">
                <col width="100">
                <col width="100">
                <col width="100">
                <col width="200">
                <col width="100">
            </colgroup>
            <thead>
            <tr>
                <th>商品名称</th>
                <th>市场价(元)</th>
                <th>优惠价(元)</th>
                <th>库存量</th>
                <th>状态(上架/下架)</th>
                <th>最后更新时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>


            <c:forEach items="${goodsInfoList}" var="goodsInfoList">
                <tr>

                    <td class="center">${goodsInfoList.goodsName}</td>
                    <td class="center">${goodsInfoList.marketPrice}</td>
                    <td class="center">${goodsInfoList.realPrice}</td>
                    <td class="center">${goodsInfoList.num}</td>
                    <td class="center">
                        <input type="checkbox" data-rel="tooltip" class="modifyIsStart"
                               isstart="${goodsInfoList.state}" roleid="${role.id}"
                               <c:if test="${goodsInfoList.state == 1}">checked="true"</c:if>/>
                    </td>
                    <td class="center"><fmt:formatDate value="${goodsInfoList.lastUpdateTime}"
                                                       pattern="yyyy-MM-dd"/></td>
                    <td class="center">
                        <div class="layui-form-item" pane="">
                            <div class="layui-input-block">
                                <input type="radio" name="choosegoods" value="${goodsInfoList.id}"
                                       lay-filter="choosegoods" id="choosegoods">
                            </div>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</form>
<%-------------------------------------------------------------------------------------------------------%>
<%--添加商品--%>

<form class="layui-form fromrolesty" action="/backend/addgoodsinfo.html" id="addgoodsinfo">
    <div class="layui-form-item">
        <label class="layui-form-label">商品名称</label>
        <div class="layui-input-block">
            <input type="text" name="goodsName" lay-verify="title" autocomplete="off" placeholder="请输入标题"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商品编号</label>
        <div class="layui-input-block">
            <input type="text" name="goodsSN" lay-verify="title" autocomplete="off" placeholder="请输入标题"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">市场价</label>
        <div class="layui-input-block">
            <input type="text" name="marketPrice" lay-verify="title" autocomplete="off" placeholder="请输入标题"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">优惠价</label>
        <div class="layui-input-block">
            <input type="text" name="realPrice" lay-verify="title" autocomplete="off" placeholder="请输入标题"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">库存</label>
        <div class="layui-input-block">
            <input type="text" name="num" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">单位</label>
        <div class="layui-input-block">
            <input type="text" name="unit" lay-verify="title" autocomplete="off" placeholder="请输入标题"
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
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">商品规格</label>
        <div class="layui-input-block">
            <textarea name="goodsFormat" placeholder="请输入内容" class="layui-textarea"></textarea>
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">商品说明</label>
        <div class="layui-input-block">
            <textarea name="note" placeholder="请输入内容" class="layui-textarea"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="subgoodsinfo">立即提交</button>
            <a class="layui-btn layui-btn-primary" href="/backend/goodsinfolist.html">重置</a>
        </div>
    </div>
</form>


<%--修改商品--%>

<form class="layui-form fromrolesty" action="/backend/modifygoodsinfo.html" id="updategoodsinfo">
    <div class="layui-form-item">

        <div class="layui-input-block">
            <input type="hidden" name="id" lay-verify="title" autocomplete="off" placeholder="请输入标题"
                   class="layui-input" id="goodsInfo1idr">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商品名称</label>
        <div class="layui-input-block">
            <input type="text" name="goodsName" lay-verify="title" autocomplete="off" placeholder="请输入标题"
                   class="layui-input" id="goodsInfo1goodsName">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商品编号</label>
        <div class="layui-input-block">
            <input type="text" name="goodsSN" lay-verify="title" autocomplete="off" placeholder="请输入标题"
                   class="layui-input" id="goodsInfo1id">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">市场价</label>
        <div class="layui-input-block">
            <input type="text" name="marketPrice" lay-verify="title" autocomplete="off" placeholder="请输入标题"
                   class="layui-input" id="goodsInfo1marketPrice">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">优惠价</label>
        <div class="layui-input-block">
            <input type="text" name="realPrice" lay-verify="title" autocomplete="off" placeholder="请输入标题"
                   class="layui-input" id="goodsInfo1realPrice">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">库存</label>
        <div class="layui-input-block">
            <input type="text" name="num" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input"
                   id="goodsInfo1num">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">单位</label>
        <div class="layui-input-block">
            <input type="text" name="unit" lay-verify="title" autocomplete="off" placeholder="请输入标题"
                   class="layui-input" id="goodsInfo1uni}">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">状态</label>
        <div class="layui-input-block">
            <input type="radio" name="state" value="1" title="上架" checked="">
            <input type="radio" name="state" value="2" title="下架">
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">商品规格</label>
        <div class="layui-input-block">
            <textarea name="goodsFormat" placeholder="请输入内容" class="layui-textarea" id="goodsInfo1formate"></textarea>
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">商品说明</label>
        <div class="layui-input-block">
            <textarea name="note" placeholder="请输入内容" class="layui-textarea" id="goodsInfo1note"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="subgoodsinfo">立即提交</button>
            <a href="/backend/goodsinfolist.html" class="layui-btn layui-btn-primary">重置</a>
        </div>
    </div>
</form>
<%--



<div class="modal hide fade" id="viewGoodsInfoDiv">
    <div class="modal-header">
        <button type="button" class="close viewgoodsinfocancel" data-dismiss="modal">×</button>
        <h3>查看商品信息</h3>
    </div>
    <div class="modal-body">
        <ul class="topul">
            <li>
                <label>商品名称：</label><input type="text" id="v_goodsName" name="goodsName" readonly="readonly"/>
            </li>
            <li>
                <label>商品编号：</label><input type="text" id="v_goodsSN" name="goodsSN" readonly="readonly"/>
            </li>
            <li>
                <label>市场价：</label><input type="text" id="v_marketPrice" name="marketPrice" readonly="readonly"/>
            </li>
            <li>
                <label>优惠价：</label>
                <input type="text" id="v_realPrice" name="realPrice" readonly="readonly"/>
            </li>
            <li>
                <label>库存量：</label><input type="text" id="v_num" name="num" readonly="readonly"/>
            </li>
            <li>
                <label>单位：</label>
                <input type="text" id="v_unit" name="unit" readonly="readonly"/>
            </li>
            <li>
                <label>状态：</label>
                <span id="v_state"></span>
            </li>
        </ul>
        <div class="clear"></div>
        <ul class="downul">
            <li>
                <span>商品规格：</span> <br/>
                <div id="v_goodsFormat" readonly="readonly" rows="3"></div>
            </li>
        </ul>
        <ul class="downul">
            <li>
                <span>商品说明：</span> <br/>
                <div id="v_note" readonly="readonly" rows="3"></div>
            </li>
        </ul>
    </div>
    <div class="modal-footer">
        <a href="#" class="btn viewgoodsinfocancel" data-dismiss="modal">关闭</a>
    </div>
</div>--%>
<div id="foraddgoodsinfo"></div>
<%@include file="/WEB-INF/pages/common/foot.jsp" %>
<script type="text/javascript" src="/statics/localjs/goodsinfolist.js"></script>

<script>
    layui.use('form', function () {
        var form = layui.form;

//监听提交
        form.on('submit(subgoodsinfo)', function (data) {
            alert("添加成功");

        });
        form.on('submit(searchgoodsinfo)', function (data) {
            alert("查询成功");

        });
        form.on('submit(updaterole)', function (data) {
            alert("修改成功");

        });
        form.on("radio(choosegoods)", function (data) {
            var goodsid = data.value;
            $.ajax({
                url: "/backend/getgoodsinfo.html",
                dataType: "json",
                method: "post",
                data: {"id": goodsid},
                success: function (result) {
                    $("#goodsInfo1goodsName").val(result.goodsName)
                    $("#goodsInfo1id").val(result.goodsSN)
                    $("#goodsInfo1idr").val(result.id)
                    $("#goodsInfo1marketPrice").val(result.marketPrice)
                    $("#goodsInfo1realPrice").val(result.realPrice)
                    $("#goodsInfo1num").val(result.num)
                    $("#goodsInfo1uni").val(result.unit)
                    $("#goodsInfo1formate").val(result.goodsFormat)
                    $("#goodsInfo1note").val(result.note)
                }
            })
        });

    });
</script>