<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/pages/common/head.jsp" %>
<div class="orderDiv">
    <form class="layui-form" action="">
        <div>
            <input id="userId" value="${udf.id}" style="display: none">
            <input id="currentBalance1" value="${balance}" style="display: none">
            <span>当前余额：</span><span id="currentBalance" style="color: red">${balance}</span><a
                href="#dianziyihang">余额不足？马上去汇款充值</a>
        </div>
        <div><span>报单购货会员用户名：</span>
            <input id="user" type="text" name="title" required lay-verify="required" value="${udf.loginCode}"
                   autocomplete="off"
                   class="layui-input" style="width: 300px;">
        </div>
        <div>以下报单级别必须选择其一：</div>
        <div style="width: 150px;">
            <label>
                <input type="radio" name="cost" value="消费会员(消费金额:4900元、PV:300)" checked>消费会员：<br>
                &nbsp;&nbsp;消费金额：4900元<br>
                &nbsp;&nbsp;PV:300<br>
            </label>
            <label>
                <input type="radio" name="cost" value="VIP会员(消费金额:14900元、PV:900)">VIP会员：<br>
                &nbsp;&nbsp;消费金额：14900元<br>
                &nbsp;&nbsp;PV:900<br>
            </label>
            <label>
                <input type="radio" name="cost" value="加盟店(消费金额:28800元、PV:1500)">加盟店：<br>
                &nbsp;&nbsp;消费金额：28800元<br>
                &nbsp;&nbsp;PV:1500<br>
            </label>
        </div>
        <div id="sureAddress" style="display:block;width: 500px;height: 80px;">
            <div id="modifyIcon" style="display: none;float: right;" onclick="modiyAds()"><i class="layui-icon layui-icon-tabs"></i></div>
            <span onmouseenter="displayIcon()" onmouseleave="hiddenIcon()" style="font-size: 14px;line-height: 25px;">收货地址:</span><span
                id="address" style="font-size: 14px;line-height: 25px;">${udf.userAddress}</span></br>
            <span style="font-size: 14px;line-height: 25px;">快递类型：</span><span id="postType" style="font-size: 14px">顺丰</span><br>
            <span style="font-size: 14px;line-height: 25px;">邮编：</span><span id="getZipCode" style="font-size: 14px">${udf.postCode}</span>
        </div>
        <div id="modifyAddress" style="display: none">
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
        <div style="display: none"><input type="text" id="getFromHeadToUserLoginName" value="${userSession.loginCode}"></div>
        <div><a id="openConfirm" class="layui-btn">下一步</a></div>
    </form>
</div>
<%@include file="/WEB-INF/pages/common/foot.jsp" %>
