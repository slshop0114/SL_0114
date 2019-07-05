<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/pages/common/head.jsp" %>

<form action="/backend/loadUserTypeList.html" method="post" class="layui-form fromrolesty" id="formforuser">
    <button type="button" class="layui-btn" onclick="adduser()">添加</button>
    <button type="button" class="layui-btn layui-btn-warm" onclick="updateuser()">修改</button>
    <button type="button" class="layui-btn layui-btn-danger" onclick="deleteuser()">删除</button>
    <div class="layui-input-inline">
        <input type="text" name="userName" placeholder="请输入名称" class="layui-input search_input" id="">
    </div>

    <div class="layui-form-item fl">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="searchforuser">查询</button>
        </div>
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
                                <input type="radio" name="id" value="${user.id}" lay-filter="chooseuserid">
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


<%--增加用户--%>


<form class="layui-form fromrolesty" action="/backend/adduser.html" id="addUserform">
    <input name="idCardPicPath" type="hidden" value="" id="idCardPicPath">
    <input name="bankPicPath" type="hidden" value="" id="bankCardPicPath">
    <div class="layui-form-item">
        <label class="layui-form-label">角色</label>
        <div class="layui-input-block">
            <select name="roleId" lay-verify="required">
                <option value=""></option>
                <option value="2">会员</option>
                <option value="1">管理员</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">会员类型</label>
        <div class="layui-input-block">
            <select name="userType" lay-verify="required">
                <option value=""></option>
                <option value="0">管理员</option>
                <option value="1">注册会员</option>
                <option value="2">消费会员</option>
                <option value="3">VIP会员</option>
                <option value="4">加盟店</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-block">
            <input type="text" name="loginCode" lay-verify="required" autocomplete="off" placeholder="请输入标题"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">姓名</label>
        <div class="layui-input-block">
            <input type="text" name="userName" lay-verify="required" autocomplete="off" placeholder="请输入标题"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">证件类型</label>
        <div class="layui-input-block">
            <select name="cardType" lay-verify="required">
                <option value=""></option>
                <option value="1">二代身份证</option>
                <option value="4">护照</option>
                <option value="3">军官证</option>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">证件号码</label>
        <div class="layui-input-block">
            <input type="text" name="idCard" lay-verify="identity" autocomplete="off" placeholder="请输入标题"
                   class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">地区</label>
        <div class="layui-input-block">
            <select name="country" lay-verify="required">
                <option value=""></option>
                <option value="中国">中国</option>
                <option value="其他">其他</option>

            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">移动电话</label>
        <div class="layui-input-block">
            <input type="text" name="mobile" lay-verify="phone" autocomplete="off" placeholder="请输入标题"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">电子邮箱</label>
        <div class="layui-input-block">
            <input type="text" name="email" lay-verify="email" autocomplete="off" placeholder="请输入标题"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">邮政编码</label>
        <div class="layui-input-block">
            <input type="text" name="postCode" lay-verify="required" autocomplete="off" placeholder="请输入标题"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">收货地址</label>
        <div class="layui-input-block">
            <input type="text" name="userAddress" lay-verify="required" autocomplete="off" placeholder="请输入标题"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">开户行</label>
        <div class="layui-input-block">
            <input type="text" name="bankName" lay-verify="required" autocomplete="off" placeholder="请输入标题"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">卡号</label>
        <div class="layui-input-block">
            <input type="text" name="bankAccount" lay-verify="number" autocomplete="off" placeholder="请输入标题"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">开户人</label>
        <div class="layui-input-block">
            <input type="text" name="accountHolder" lay-verify="required" autocomplete="off" placeholder="请输入标题"
                   class="layui-input">
        </div>
    </div>

    <button type="button" class="layui-btn" id="updateusercard">上传身份证</button>
    <div class="layui-upload">
        <div class="layui-upload-list">
            <img class="layui-upload-img" id="idcardview" style="width: 100px;height: 100px">

        </div>
    </div>
    <br>
    <button type="button" class="layui-btn" id="updateuserbankcard">上传银行卡</button>
    <div class="layui-upload">
        <div class="layui-upload-list">
            <img class="layui-upload-img" id="bankcardview" style="width: 100px;height: 100px">

        </div>
    </div>
    <br><br>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="adduser">立即提交</button>
            <a class="layui-btn layui-btn-primary" href="/backend/userlist.html">重置</a>
        </div>
    </div>
</form>


<%--修改用户--%>
<form class="layui-form fromrolesty" action="/backend/modifyuser.html" id="updateUserform">
    <input name="id" type="hidden" value="" id="useridhidden">
    <%--银行卡身份证链接地址--%>
    <input name="idCardPicPath" type="hidden" value="" id="idCardPicPath2">
    <input name="bankPicPath" type="hidden" value="" id="bankCardPicPath2">
    <div class="layui-form-item">
        <label class="layui-form-label">角色</label>
        <div class="layui-input-block">
            <select name="roleId" lay-verify="required">
                <option value=""></option>
                <option value="2">会员</option>
                <option value="1">管理员</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">会员类型</label>
        <div class="layui-input-block">
            <select name="userType" lay-verify="required">
                <option value=""></option>
                <option value="0">管理员</option>
                <option value="1">注册会员</option>
                <option value="2">消费会员</option>
                <option value="3">VIP会员</option>
                <option value="4">加盟店</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-block">
            <input type="text" name="loginCode" lay-verify="required" autocomplete="off" placeholder="请输入标题"
                   class="layui-input" id="loginCode2">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">姓名</label>
        <div class="layui-input-block">
            <input type="text" name="userName" lay-verify="required" autocomplete="off" placeholder="请输入标题"
                   class="layui-input" id="userName2">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">证件类型</label>
        <div class="layui-input-block">
            <select name="cardType" lay-verify="required">
                <option value=""></option>
                <option value="1">二代身份证</option>
                <option value="4">护照</option>
                <option value="3">军官证</option>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">证件号码</label>
        <div class="layui-input-block">
            <input type="text" name="idCard" lay-verify="identity" autocomplete="off" placeholder="请输入标题"
                   class="layui-input" id="idCard2">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">地区</label>
        <div class="layui-input-block">
            <select name="country" lay-verify="required">
                <option value=""></option>
                <option value="中国">中国</option>
                <option value="其他">其他</option>

            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">移动电话</label>
        <div class="layui-input-block">
            <input type="text" name="mobile" lay-verify="phone" autocomplete="off" placeholder="请输入标题"
                   class="layui-input" id="mobile2">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">电子邮箱</label>
        <div class="layui-input-block">
            <input type="text" name="email" lay-verify="email" autocomplete="off" placeholder="请输入标题"
                   class="layui-input" id="email2">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">邮政编码</label>
        <div class="layui-input-block">
            <input type="text" name="postCode" lay-verify="required" autocomplete="off" placeholder="请输入标题"
                   class="layui-input" id="postCode2">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">收货地址</label>
        <div class="layui-input-block">
            <input type="text" name="userAddress" lay-verify="required" autocomplete="off" placeholder="请输入标题"
                   class="layui-input" id="userAddress2">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">开户行</label>
        <div class="layui-input-block">
            <input type="text" name="bankName" lay-verify="required" autocomplete="off" placeholder="请输入标题"
                   class="layui-input" id="bankName2">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">卡号</label>
        <div class="layui-input-block">
            <input type="text" name="bankAccount" lay-verify="title" autocomplete="off" placeholder="请输入标题"
                   class="layui-input" id="bankAccount2">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">开户人</label>
        <div class="layui-input-block">
            <input type="text" name="accountHolder" lay-verify="number" autocomplete="off" placeholder="请输入标题"
                   class="layui-input" id="accountHolder2">
        </div>
    </div>

    <button type="button" class="layui-btn" id="updateusercard2">上传身份证</button>
    <br>
    <div class="layui-upload">
        <div class="layui-upload-list">
            <img class="layui-upload-img" id="idcardview2" style="width: 100px;height: 100px">

        </div>
    </div>

    <button type="button" class="layui-btn" id="updateuserbankcard2">上传银行卡</button>
    <div class="layui-upload">
        <div class="layui-upload-list">
            <img class="layui-upload-img" id="bankcardview2" style="width: 100px;height: 100px">

        </div>
    </div>

    <br><br>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="updateuser">立即提交</button>
            <a class="layui-btn layui-btn-primary" href="/backend/userlist.html" id="retouserliset">重置</a>
        </div>
    </div>
</form>


<div id="foradduser"></div>
<%@include file="/WEB-INF/pages/common/foot.jsp" %>
