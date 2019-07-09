<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/pages/common/head.jsp" %>
<div class="orderDiv">
    <div>
        <hr style="background-color: #009688;border: 0px;">
        <h3>订单明细：</h3>
        <hr style="width: 800px;">
        <span>单号：</span><span id="orserSn">${uuid}</span><br><br>
        <span>购买会员用户名：</span><span>${userSession.loginCode}</span><br><br>
        <span>购买人姓名：</span>${userSession.userName}<span></span><br><br>
        <span>购买类型：</span><span>重消购货</span><br><br>
        <span>购买时间：</span><span>${time}</span><br><br>
    </div>
    <div>
        <h3>商品详细：</h3>
        <hr style="background-color: #009688;border: 0px;">
        <table class="layui-table" lay-even="" lay-skin="row" style="width: 1000px;left: 50px;">
            <colgroup>
                <col width="160">
                <col width="160">
                <col width="160">
                <col width="160">
                <col width="160">
            </colgroup>
            <thead>
            <tr>
                <th>套餐标题</th>
                <th>优惠价（元）</th>
                <th>数量</th>
                <th>总价</th>
                <th>积分</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${orderListZtw}" var="orderListZtw">
                <tr>
                    <td class="center">${orderListZtw.goodsName}</td>
                    <td class="center">${orderListZtw.eachPrice}</td>
                    <td class="center">${orderListZtw.goodsNum}</td>
                    <td class="center"><span class="totalPri">${orderListZtw.eachPrice*orderListZtw.goodsNum}</span></td>
                    <td class="center">
                        <span class="totalPv"><fmt:formatNumber type="number" groupingUsed="false"
                                                                value="${orderListZtw.eachPrice*orderListZtw.goodsNum*0.1}"></fmt:formatNumber></span>
                    </td>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div>
            <span>当前余额：</span><span id="residualMoney" style="color: red">${balance}</span><span>（元）</span>
            <span><a style="color: #0000FF">余额不足?马上充值</a></span>
            <span style="left: 400px;position: relative;">总价：</span>
            <span id="totalSum" style="color: red;left: 400px;position: relative;"></span><span
                style="left: 400px;position: relative;">（元）</span>
            <span style="left: 400px;position: relative;">积分：</span>
            <span id="totalPvs" style="color:red;left: 400px;position: relative;"></span><span
                style="left: 400px;position: relative;">(PV)</span>
        </div>
        <hr style="background-color: #009688;border: 0px;">
    </div>

    <div id="sureAddress" style="display:block;width: 500px;height: 80px;">
        <div id="modifyIcon" style="display: none;float: right;" onclick="modiyAds()"><i class="layui-icon layui-icon-tabs"></i></div>
        <span onmouseenter="displayIcon()" onmouseleave="hiddenIcon()" style="font-size: 14px;line-height: 25px;">收货地址:</span><span
            id="address" style="font-size: 14px;line-height: 25px;">${user1.userAddress}</span></br>
        <span style="font-size: 14px;line-height: 25px;">快递类型：</span><span id="postType" style="font-size: 14px">顺丰</span><br>
        <span style="font-size: 14px;line-height: 25px;">邮编：</span><span id="getZipCode" style="font-size: 14px">${user1.postCode}</span>
    </div>
    <div id="modifyAddress" style="display: none;height: 80px;">
        <div class="layui-form-item">
            <label class="gard layui-form-label">收货地址：</label>
            <div class="layui-input-inline">
                <select name="quiz1" id="selProvince">
                    <option value="" disabled="">请选择省</option>
                    <option value="浙江" selected="">浙江省</option>
                    <option value="江西省">江西省</option>
                    <option value="福建省">福建省</option>
                </select>
            </div>
            <div class="layui-input-inline">
                <select name="quiz2" id="selCity">
                    <option value="">请选择市</option>
                    <option value="杭州">杭州</option>
                    <option value="宁波">宁波</option>
                    <option value="温州">温州</option>
                    <option value="温州">台州</option>
                    <option value="温州">绍兴</option>
                </select>
            </div>
            <div class="layui-input-inline">
                <select name="quiz3" id="selCounty">
                    <option value="" disabled="">请选择县/区</option>
                    <option value="西湖区">西湖区</option>
                    <option value="余杭区">余杭区</option>
                    <option value="拱墅区">临安市</option>
                </select>
            </div>
            <div class="layui-input-inline">
                <input id="detailedAddress" type="text" name="title" required lay-verify="required"
                       placeholder="详细地址"
                       autocomplete="off"
                       class="layui-input" style="width: 200px;">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="gard layui-form-label">快递类型：</label>
            <div class="layui-input-inline">
                <select name="quiz4" id="post">
                    <option disabled="">---请选择快递方式---</option>
                    <option value="EMS">EMS</option>
                    <option value="顺丰">顺丰</option>
                    <option value="圆通">圆通</option>
                </select>
            </div>
            <label class="gard layui-form-label">邮编：</label>
            <div class="layui-input-inline">
                <input id="zipCode" type="text" name="title" required lay-verify="required" placeholder="请输入邮编"
                       autocomplete="off"
                       class="layui-input" style="width: 200px;">
            </div>

            <div><a onclick="hiddenSelect()" class="layui-btn">保存</a></div>
        </div>
    </div>
    <span style="display: none;" id="userLoginUserId">${userSession.id}</span>
    <div style="left: 920px;position: absolute;width: 100px;"><a onclick="payMoney()" class="layui-btn">支付</a></div>
</div>
<%@include file="/WEB-INF/pages/common/foot.jsp" %>