<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/common/head.jsp"%>

<link href="/statics/css/zzy/memberlist.css" rel="stylesheet">


<script src="/statics/localjs/zzy/jquery.js" type="text/javascript"></script>
<script src="/statics/localjs/zzy/jQuery3.4.1.js" type="text/javascript"></script>

<script src="/statics/localjs/zzy/jquery.cookie.js" type="text/javascript"></script>

<div class="bodyall">
<div>
	<ul class="breadcrumb">
		<li><a href="#">会员管理</a> <span class="divider">/</span></li>
		<li><a href="/member/memberlist.html">新会员管理</a></li>
	</ul>
</div>

	<div class="layui-inline" onclick="reviseuser()">
		<a class="layui-btn layui-btn-danger " onclick="revuser()">修改</a>
	</div>
	<div class="layui-inline"  onclick="deluser()">
		<a class="layui-btn layui-btn-danger batchDel delmember" onclick="deluser()">删除</a>
	</div>

	<div class="layui-inline">
		<div class="layui-input-inline">
			<input type="text" id="sousuozzy" value="" placeholder="请输入关键字" class="layui-input search_input">
		</div>
		<a class="layui-btn search_btn" onclick="searchin()">查询</a>

	</div>

    
	<div class=" users_list">
        <table class="table table-striped table-bordered bootstrap-datatable datatable">
            <thead>
            <tr class="trgreen">
                <th id="logincode">用户名</th>
                <th>真实姓名</th>
                <th>联系电话</th>
                <th>推荐人</th>
                <th>注册时间</th>
                <th id="id">操作</th>
            </tr>
            </thead>
            <tbody id="list">
          
            </tbody>
          
        </table>

        <div class="page">
            <input type="button" id="starNum" value="首页" onclick="firstpage()">
            <input type="button" id="pageSize" value="下一页" onclick="nextpage()">
       
        </div>   
</div>
</div>



<div class="modal hide fade" id="modifyUserDivzzy">
    <form  action="/member/saveMember.html" id="updateUserformzzy" class="layui-form" >
        <input name="id" type="hidden" value="" id="useridhiddenm">
        <%--银行卡身份证链接地址--%>
        <input name="idCardPicPath" type="hidden" value="" id="idCardPicPath2">
        <input name="bankPicPath" type="hidden" value="" id="bankCardPicPath2">
       
        <div class="modal-header">
            <h3>修改会员</h3>
        </div>
        <div class="modal-body">
            <ul id="modify_formtip"></ul>
            <input id="m_id" type="hidden" name="id" value=""/>
            <div class="topul">
         
                <div class="left">

                    <li>
                        <label>角色：</label>
                        <input id="m_rolename" type="hidden" name="roleName" value=""/>
                        <select id="m_roleId" name="roleId" style="width:100px;">
                            <option value="" selected="selected" ></option>
                            <option value="2">会员</option>
                            <option value="1">管理员</option>
                        </select>
                       
                    </li>
                    <li>
                        <label>会员类型：</label>
                        <input id="m_selectusertypename" type="hidden" name="userTypeName" value=""/>
                        <select id="m_selectusertype" name="userType" style="width:100px;">
                            <option value=""></option>
                            <option value="1">注册会员</option>
                            <option value="2">消费会员</option>
                            <option value="3">VIP会员</option>
                            <option value="4">加盟店</option>
                        </select>
                    </li>
                </div>
              <div class="left">
                  <li>
                      <label>用户名：</label>
                      <input type="text" id="m_logincode" name="loginCode" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')"/>
                      <span style="color:red;font-weight: bold;">*</span>
                  </li>
                  <li>
                      <label>姓名：</label>
                      <input type="text" id="m_username" name="userName" />
                      <span style="color:red;font-weight: bold;">*</span>
                  </li>
              </div>
                
              <div class="left">
                  <li>
                      <label>联系电话：</label>
                      <input type="text" id="m_mobile" name="mobile" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
                      <span style="color:red;font-weight: bold;">*</span>
                  </li>
                  <li>
                      <label>证件号码：</label>
                      <input type="text" id="m_idcard" name="idCard" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')"/>
                      <span style="color:red;font-weight: bold;">*</span>
                  </li>
              </div>
                <div class="left">
                    <li>
                        <label>证件类型：</label>
                        <input id="m_cardtypename" type="hidden" name="cardTypeName" value=""/>
                        <select id="m_cardtype" name="cardType" style="width:100px;">
                            <option value=""></option>
                            <option value="1">二代身份证</option>
                            <option value="4">护照</option>
                            <option value="3">军官证</option>
                        </select>
                        
                    </li>

                    <li>
                        <label>收货国家：</label>
                        <%-- <input type="text" id="m_country" name="country"/>--%>
                        <select name="country" lay-verify="required">
                            <option value=""></option>
                            <option value="中国">中国</option>
                            <option value="其他">其他</option>
                        </select>
                    </li>
                </div>
                
               <div class="left">
                   <li>
                       <label>Email：</label>
                       <input type="text" id="m_email" name="email"/>
                   </li>
                   <li>
                       <label>邮政编码：</label>
                       <input type="text" id="m_postcode" name="postCode" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
                   </li>
               </div>
                
                <div class="left">
                    <li class="lastli">
                        <label>收货地址：</label>
                        <textarea id="m_useraddress" name="userAddress"></textarea>
                    </li>
                </div>
                
                <div class="left">
                    <li>
                        <label>开户行：</label>
                        <input type="text" id="m_bankname" name="bankName"/>
                        <span style="color:red;font-weight: bold;">*</span>
                    </li>
                    <li>
                        <label>开户卡号：</label>
                        <input type="text" id="m_bankaccount" name="bankAccount" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
                        <span style="color:red;font-weight: bold;">*</span>
                    </li>
                </div>
               <div class="left">
                   <li>
                       <label>开户人：</label>
                       <input type="text" id="m_accountholder" name="accountHolder"/>
                       <span style="color:red;font-weight: bold;">*</span>
                   </li>
                   <li>
                       <label>推荐人：</label>
                       <input type="text" id="m_refercode" readonly="readonly"/>
                   </li>

               </div>
                
            </ul>
        </div>

            <button type="button" class="layui-btn" id="updateusercard2zzy">上传身份证</button>
            <br>
            <div class="layui-upload">
                <div class="layui-upload-list">
                    <img src="#" class="layui-upload-img" id="idcardview2" style="width: 100px;height: 100px">

                </div>
            </div>

            <button type="button" class="layui-btn" id="updateuserbankcard2zzy">上传银行卡</button>
            <div class="layui-upload">
                <div class="layui-upload-list">
                    <img src="#" class="layui-upload-img" id="bankcardview2" style="width: 100px;height: 100px">

                </div>
            </div>

</div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button lay-submit=""  class="layui-btn" lay-filter="mupdateuser"/>立即提交</button>

                <a class="layui-btn layui-btn-primary" href="/member/memberlist.html" id="retouserliset">取消</a>
            </div>
        </div>

        
</form>
 
</div>

<%@include file="/WEB-INF/pages/common/foot.jsp"%>


<script type="text/javascript" src="/statics/localjs/zzy/memberlist.js"></script>