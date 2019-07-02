<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/pages/common/head.jsp" %>

<form action="/backend/userlist.html" method="post" class="layui-form" style="float:left">


    <div class="layui-inline" onclick="adduser()">
        <a class="layui-btn layui-btn-normal usersAdd_btn">添加用户</a>
    </div>
    <div class="layui-inline" onclick="updateuser()">
        <a class="layui-btn layui-btn-danger userUpdate">修改</a>
    </div>
    <div class="layui-inline">
        <a class="layui-btn layui-btn-danger batchDel">删除</a>
    </div>


    <div class="layui-inline">
        <div class="layui-input-inline">
            <input type="text" value="" placeholder="请输入关键字" class="layui-input search_input">
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo">查询</button>
            </div>
        </div>
    </div>


    <blockquote class="layui-elem-quote main_search">
        <div class="layui-form users_list">
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

    </blockquote>
</form>
<div id="page"></div>


<%--增加表单--%>
<div class="modal hide fade" id="addUserDiv">
    <form action="/backend/adduser.html" enctype="multipart/form-data" method="post"
          onsubmit="return addUserFunction();">
        <div class="modal-header">
            <button type="button" class="close addusercancel" data-dismiss="modal">×</button>
            <h3>添加用户信息</h3>
        </div>
        <div class="modal-body">
            <ul id="add_formtip"></ul>
            <ul class="topul">
                <li>
                    <label>角色：</label>
                    <input id="selectrolename" type="hidden" name="roleName" value=""/>
                    <select id="selectrole" name="roleId" style="width:100px;">
                        <option value="" selected="selected">--请选择--</option>
                        <c:if test="${roleList != null}">
                            <c:forEach items="${roleList}" var="role">
                                <option value="${role.id}">${role.roleName}</option>
                            </c:forEach>
                        </c:if>
                    </select>
                    <span style="color:red;font-weight: bold;">*</span>
                </li>
                <li>
                    <label>会员类型：</label>
                    <input id="selectusertypename" type="hidden" name="userTypeName" value=""/>
                    <select id="selectusertype" name="userType" style="width:100px;">
                        <option value="" selected="selected">--请选择--</option>
                    </select>
                </li>
                <li>
                    <label>用户名：</label><input type="text" id="a_logincode" name="loginCode"
                                              onkeyup="value=value.replace(/[^\w\.\/]/ig,'')"/>
                    <span style="color:red;font-weight: bold;">*</span>
                </li>
                <li>
                    <label>姓名：</label><input type="text" id="a_username" name="userName"/>
                    <span style="color:red;font-weight: bold;">*</span>
                </li>
                <li>
                    <label>性别：</label>
                    <select name="sex" style="width:100px;">
                        <option value="" selected="selected">--请选择--</option>
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                </li>
                <li>
                    <label>证件类型：</label>
                    <input id="selectcardtypename" type="hidden" name="cardTypeName" value=""/>
                    <select id="selectcardtype" name="cardType" style="width:100px;">
                        <option value="" selected="selected">--请选择--</option>
                        <c:if test="${cardTypeList != null}">
                            <c:forEach items="${cardTypeList}" var="cardType">
                                <option value="${cardType.valueId}">${cardType.valueName}</option>
                            </c:forEach>
                        </c:if>
                    </select>
                    <span style="color:red;font-weight: bold;">*</span>
                </li>
                <li>
                    <label>证件号码：</label><input type="text" id="a_idcard" name="idCard"
                                               onkeyup="value=value.replace(/[^\w\.\/]/ig,'')"/>
                    <span style="color:red;font-weight: bold;">*</span>
                </li>
                <li>
                    <label>生日：</label>
                    <input class="Wdate" id="a_birthday" size="15" name="birthday" readonly="readonly" type="text"
                           onClick="WdatePicker();"/>
                    <!--<input type="text" class="input-xlarge datepicker" id="a_birthday" name="birthday" value="" readonly="readonly"/> -->
                </li>
                <li>
                    <label>收货国家：</label><input type="text" name="country" value="中国"/>
                </li>
                <li>
                    <label>联系电话：</label><input type="text" id="a_mobile" name="mobile"
                                               onkeyup="this.value=this.value.replace(/\D/g,'')"
                                               onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
                    <span style="color:red;font-weight: bold;">*</span>
                </li>
                <li>
                    <label>Email：</label><input type="text" id="a_email" name="email"/>
                </li>
                <li>
                    <label>邮政编码：</label><input type="text" id="a_postCode" name="postCode"
                                               onkeyup="this.value=this.value.replace(/\D/g,'')"
                                               onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
                </li>
                <li>
                    <label>开户行：</label><input type="text" id="a_bankname" name="bankName"/>
                    <span style="color:red;font-weight: bold;">*</span>
                </li>
                <li>
                    <label>开户卡号：</label><input type="text" id="a_bankaccount" name="bankAccount"
                                               onkeyup="this.value=this.value.replace(/\D/g,'')"
                                               onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
                    <span style="color:red;font-weight: bold;">*</span>
                </li>
                <li>
                    <label>开户人：</label><input type="text" id="a_accountholder" name="accountHolder"/>
                    <span style="color:red;font-weight: bold;">*</span>
                </li>
                <li>
                    <label>推荐人：</label><input type="text" name="referCode" value="${user.loginCode}"
                                              readonly="readonly"/>
                </li>
                <li>
                    <label>注册时间：</label>
                    <input type="text" id="a_cdate" value="" readonly="readonly"/>
                </li>
                <li>
                    <label>是否启用：</label>
                    <select name="isStart" style="width:100px;">
                        <option value="1" selected="selected">启用</option>
                        <option value="2">不启用</option>
                    </select> <span style="color:red;font-weight: bold;">*</span>
                </li>
                <li class="lastli">
                    <label>收货地址：</label><textarea id="a_useraddress" name="userAddress"></textarea>
                </li>

            </ul>
            <div class="clear"></div>
            <ul class="downul">
                <li>
                    <label>上传身份证图片：</label>
                    <input type="hidden" id="a_fileInputIDPath" name="idCardPicPath" value=""/>
                    <input id="a_fileInputID" name="a_fileInputID" type="file"/>
                    <input type="button" id="a_uploadbtnID" value="上传"/>
                    <p><span style="color:red;font-weight: bold;">*注：1、正反面.2、大小不得超过50k.3、图片格式：jpg、png、jpeg、pneg</span>
                    </p>
                    <div id="a_idPic"></div>
                </li>
            </ul>
            <ul class="downul">
                <li>
                    <label>上传银行卡图片：</label>
                    <input type="hidden" id="a_fileInputBankPath" name="bankPicPath" value=""/>
                    <input id="a_fileInputBank" name="a_fileInputBank" type="file"/>
                    <input type="button" id="a_uploadbtnBank" value="上传"/>
                    <p><span style="color:red;font-weight: bold;">*注：1、大小不得超过50k.2、图片格式：jpg、png、jpeg、pneg</span></p>
                    <div id="a_bankPic"></div>
                </li>
            </ul>
        </div>

        <div class="modal-footer">
            <a href="/backend/adduser.html" class="btn addusercancel" data-dismiss="modal">取消</a>
            <input type="submit" class="btn btn-primary" value="保存"/>
        </div>
    </form>
</div>


<%--修改用户--%>
<div class="modal hide fade" id="modifyUserDiv">
    <form action="/backend/modifyuser.html" enctype="multipart/form-data" method="post"
          onsubmit="return modifyUserFunction();">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">×</button>
            <h3>修改用户信息</h3>
        </div>
        <div class="modal-body">
            <ul id="modify_formtip"></ul>
            <input id="m_id" type="hidden" name="id"/>
            <ul class="topul">
                <li>
                    <label>角色：</label>
                    <input id="m_rolename" type="hidden" name="roleName" value=""/>
                    <select id="m_roleId" name="roleId" style="width:100px;">
                    </select>
                    <span style="color:red;font-weight: bold;">*</span>
                </li>
                <li>
                    <label>会员类型：</label>
                    <input id="m_selectusertypename" type="hidden" name="userTypeName" value=""/>
                    <select id="m_selectusertype" name="userType" style="width:100px;">
                    </select>
                </li>
                <li>
                    <label>用户名：</label><input type="text" id="m_logincode" name="loginCode"
                                              onkeyup="value=value.replace(/[^\w\.\/]/ig,'')"/>
                    <span style="color:red;font-weight: bold;">*</span>
                </li>
                <li>
                    <label>姓名：</label><input type="text" id="m_username" name="userName"/>
                    <span style="color:red;font-weight: bold;">*</span>
                </li>
                <li>
                    <label>性别：</label>
                    <select id="m_sex" name="sex" style="width:100px;">
                    </select>
                </li>
                <li>
                    <label>证件类型：</label>
                    <input id="m_cardtypename" type="hidden" name="cardTypeName" value=""/>
                    <select id="m_cardtype" name="cardType" style="width:100px;">
                    </select>
                    <span style="color:red;font-weight: bold;">*</span>
                </li>
                <li>
                    <label>证件号码：</label><input type="text" id="m_idcard" name="idCard"
                                               onkeyup="value=value.replace(/[^\w\.\/]/ig,'')"/>
                    <span style="color:red;font-weight: bold;">*</span>
                </li>
                <li>
                    <label>生日：</label>
                    <input class="Wdate" id="m_birthday" size="15" name="birthday" readonly="readonly" type="text"
                           onClick="WdatePicker();"/>
                    <!--<input type="text" class="input-xlarge datepicker" id="m_birthday" name="birthday" readonly="readonly"/>-->
                </li>
                <li>
                    <label>收货国家：</label><input type="text" id="m_country" name="country"/>
                </li>
                <li>
                    <label>联系电话：</label><input type="text" id="m_mobile" name="mobile"
                                               onkeyup="this.value=this.value.replace(/\D/g,'')"
                                               onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
                    <span style="color:red;font-weight: bold;">*</span>
                </li>
                <li>
                    <label>Email：</label><input type="text" id="m_email" name="email"/>
                </li>
                <li>
                    <label>邮政编码：</label><input type="text" id="m_postcode" name="postCode"
                                               onkeyup="this.value=this.value.replace(/\D/g,'')"
                                               onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
                </li>
                <li>
                    <label>开户行：</label><input type="text" id="m_bankname" name="bankName"/>
                    <span style="color:red;font-weight: bold;">*</span>
                </li>
                <li>
                    <label>开户卡号：</label><input type="text" id="m_bankaccount" name="bankAccount"
                                               onkeyup="this.value=this.value.replace(/\D/g,'')"
                                               onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
                    <span style="color:red;font-weight: bold;">*</span>
                </li>
                <li>
                    <label>开户人：</label><input type="text" id="m_accountholder" name="accountHolder"/>
                    <span style="color:red;font-weight: bold;">*</span>
                </li>
                <li>
                    <label>推荐人：</label><input type="text" id="m_refercode" readonly="readonly"/>
                </li>
                <li>
                    <label>注册时间：</label>
                    <input type="text" id="m_createtime" name="createTime" readonly="readonly"/>
                </li>
                <li>
                    <label>是否启用：</label>
                    <select id="m_isstart" name="isStart" style="width:100px;">
                    </select>
                    <span style="color:red;font-weight: bold;">*</span>
                </li>
                <li class="lastli">
                    <label>收货地址：</label><textarea id="m_useraddress" name="userAddress"></textarea>
                </li>

            </ul>
            <div class="clear"></div>
            <ul class="downul">
                <li>
                    <label>上传身份证图片：</label>
                    <input type="hidden" id="m_fileInputIDPath" name="idCardPicPath" value=""/>
                    <input id="m_fileInputID" name="m_fileInputID" type="file">
                    <input type="button" id="m_uploadbtnID" value="上传" style="display:none;"/>
                    <p><span style="color:red;font-weight: bold;">*注：1、正反面.2、大小不得超过50k.3、图片格式：jpg、png、jpeg、pneg</span>
                    </p>
                    <div id="m_idPic"></div>
                </li>
            </ul>
            <ul class="downul">
                <li>
                    <label>上传银行卡图片：</label>
                    <input type="hidden" id="m_fileInputBankPath" name="bankPicPath" value=""/>
                    <input id="m_fileInputBank" name="m_fileInputBank" type="file">
                    <input type="button" id="m_uploadbtnBank" value="上传"/>
                    <p><span style="color:red;font-weight: bold;">*注：1、大小不得超过50k.2、图片格式：jpg、png、jpeg、pneg</span></p>
                    <div id="m_bankPic"></div>
                </li>
            </ul>
        </div>

        <div class="modal-footer">
            <a href="#" class="btn modifyusercancel" data-dismiss="modal">取消</a>
            <input type="submit" class="btn btn-primary" value="保存"/>
        </div>
    </form>
</div>

<div id="foradduser"></div>
<%@include file="/WEB-INF/pages/common/foot.jsp" %>
<script>
    //Demo
    layui.use('form', function(){
        var form = layui.form;

        //监听提交
        form.on('submit(formDemo)', function(data){
            layer.msg(JSON.stringify(data.field));
            return false;
        });
    });
</script>