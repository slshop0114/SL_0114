<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/common/head.jsp"%>
<link href="/statics/css/zzy/modifypersonalinfo.css" rel="stylesheet">

<script src="/statics/localjs/zzy/jquery.js" type="text/javascript"></script>
<script src="/statics/localjs/zzy/jQuery3.4.1.js" type="text/javascript"></script>

<script src="/statics/localjs/zzy/jquery.cookie.js" type="text/javascript"></script>


<input id="getuserid" type="hidden" value="${userSession.id}">
<div class="bodyall">
<div>
	<ul class="breadcrumb">
		<li><a href="#">会员管理</a> <span class="divider">/</span></li>
		<li><a href="/member/getlist">修改本人资料</a></li>
	</ul>
</div>
	<div class="row-fluid sortable ">
		<div  class="box span12">
			<div class="box-header well" data-original-title>
				<h2><i class="icon-user"></i>修改本人资料</h2>
			</div>
			<br>
			<div class="box-content">
				<%--<form action="/member/savepersonalinfo.html" enctype="multipart/form-data" method="post" onsubmit="return modifyPersonalInfoFunc();">--%>

					<form class="layui-form fromrolesty" action="/member/savepersonalinfo.html" id="modifyUserform">
						<input name="id" type="hidden" value="" id="m_useridhidden">
						<%--银行卡身份证链接地址--%>
						<input name="idCardPicPath" type="hidden" value="" id="m_idCardPicPath2">
						<input name="bankPicPath" type="hidden" value="" id="m_bankCardPicPath2">	
				
				
					<div class="member-modal-body">
					<ul id="modify_formtip"></ul>
					<input id="m_id" type="hidden" name="id" value="${userSession.id}"/>
					<ul>
					
						<li>
							<label>用户名：</label>
							<input type="text" id="m_logincode" name="loginCode" value="${userSession.loginCode}" readonly="readonly"/>
							<span style="color:red;font-weight: bold;">*</span>
						</li>
						<br>
						<li>
							<label>姓名：</label><input type="text" id="m_username" name="userName" value="${userSession.userName}" />
							<span style="color:red;font-weight: bold;">*</span>
						</li>
						<br>
						<li>
							<div style="width: 150px">
								<label>证件类型：</label>
								<input id="m_cardtypename"  type="hidden" name="cardTypeName" value="${userSession.cardTypeName}"/>
								<select id="m_cardtype" name="cardType" style="width:100px;">
									<option value="1">二代身份证</option>
									<option value="4">护照</option>
									<option value="3">军官证</option>
								</select>
								<span style="color:red;font-weight: bold;">*</span>
							</div>
							
						</li>
						<br>
						<li>
							<label>证件号码：</label><input type="text" id="m_idcard" name="idCard" value="${userSession.idCard}" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')"/>
							<span style="color:red;font-weight: bold;">*</span>
						</li>
						<br>
						<li>
							<label>收货国家：</label>
							<input type="text" id="m_country" name="country" value="${userSession.country}" />
						</li>
						<br>
						<li>
							<label>联系电话：</label>
							<input type="text" id="m_mobile" name="mobile" value="${userSession.mobile}" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
							<span style="color:red;font-weight: bold;">*</span>
						</li>
						<br>
						<li>
							<label>Email：</label>
							<input type="text" id="m_email" name="email" value="${userSession.email}"/>
						</li>
						<br>
						<li>
							<label>邮政编码：</label>
							<input type="text" id="m_postcode" name="postCode" value="${userSession.postCode}" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
						</li>
						<br>
						<li>
							<label>开户行：</label><input type="text" id="m_bankname" name="bankName" value="${userSession.bankName}"/>
							<span style="color:red;font-weight: bold;">*</span>
						</li>
						<br>
						<li>
							<label>开户卡号：</label>
							<input type="text" id="m_bankaccount" name="bankAccount" value="${userSession.bankAccount}" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
							<span style="color:red;font-weight: bold;">*</span>
						</li>
						<br>
						<li>
							<label>开户人：</label>
							<input type="text" id="m_accountholder" name="accountHolder" value="${userSession.accountHolder}"/>
							<span style="color:red;font-weight: bold;">*</span>
						</li>
						<br>
				
						<li>
							<label>注册时间：</label>
							<input class="Wdate" id="m_createtime" size="15" name="createTime" disabled="disabled"  type="text" onClick="WdatePicker();" value="<fmt:formatDate value="${userSession.createTime}" pattern="yyyy-MM-dd"/>"/>
							<!--<input type="text" class="input-xlarge datepicker" id="m_createtime" name="createTime" value="<fmt:formatDate value="${userSession.createTime}" pattern="MM/dd/yyyy"/>" readonly="readonly"/>-->
						</li>
						<br>
						
						<li>
							<label>收货地址：</label><textarea id="m_useraddress" name="userAddress">${userSession.userAddress}</textarea>
						</li>
						<br>
					</ul>
					<div class="clear"></div>

					<div class="left">
						<button type="button" class="layui-btn" id="m_updateusercard">上传身份证</button>
						<div class="layui-upload">
							<div class="layui-upload-list">
								<img class="layui-upload-img" id="m_idcardview" style="width: 100px;height: 100px">

							</div>
						</div>
						<br>
						<button type="button" class="layui-btn" id="m_updateuserbankcard">上传银行卡</button>
						<div class="layui-upload">
							<div class="layui-upload-list">
								<img class="layui-upload-img" id="m_bankcardview" style="width: 100px;height: 100px">

							</div>
						</div>
					</div>
					<br>
					
					</div>
		
					
					<div class="clear"></div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit="" lay-filter="modifyuser">立即提交</button>
					
				</div>
			</div>
					<%--<div class="modifymemberinfo">
						<input type="submit"  class="btn btn-primary" value="保存" onclick="modifypersonalinfocancel()" />
					</div>--%>
				</form>
			</div>
		</div>
	</div>
		
	</div>		
<%@include file="/WEB-INF/pages/common/foot.jsp"%>

