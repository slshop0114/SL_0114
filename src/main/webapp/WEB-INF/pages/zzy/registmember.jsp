<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<link href="/statics/css/zzy/registmember.css" rel="stylesheet">
<link rel="stylesheet" href="/statics/layui/css/layui.css"  media="all">

<script src="/statics/localjs/zzy/jquery.js" type="text/javascript"></script>
<script src="/statics/localjs/zzy/jQuery3.4.1.js" type="text/javascript"></script>

<script src="/statics/localjs/zzy/jquery.cookie.js" type="text/javascript"></script>
<%@include file="/WEB-INF/pages/common/head.jsp"%>

<div class="bodyall">
<div>
	<ul class="breadcrumb">
		<li><a href="#">会员管理</a> <span class="divider">/</span></li>
		<li><a href="/member/registmember.html">会员注册</a></li>
	</ul>
</div>
			<div class="row-fluid sortable">		
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-user"></i>会员注册</h2>
					</div>
					
				<div class="box-content">
			<%--	<form id="a_updateUserform" action="/member/saveregistmember.html"  enctype="multipart/form-data" method="post" onsubmit="return registMemberFunc();" >--%>

					<form class="layui-form fromrolesty" action="/member/saveregistmember.html" id="a_updateUserform">
					<%--银行卡身份证链接地址--%>
					<input name="idCardPicPath" type="hidden" value="" id="a_idCardPicPath">
					<input name="bankPicPath" type="hidden" value="" id="a_bankCardPicPath">
					<div class="member-modal-body">
						<ul id="add_formtip"></ul>
						
						<ul class="topul">
							
							<div class="left">
								<li>
								<label>用户名：</label>
								<input type="text" id="a_loginCode" name="loginCode" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')"/>
								<span style="color:red;font-weight: bold;">*</span>
							</li>
								<li>
									<label>姓名：</label>
									<input type="text" id="a_userName" name="userName" />
									<span style="color:red;font-weight: bold;">*</span>
								</li>
							</div>
							<br>
							 <div class="left">
								 <li>
									 <label>性别：</label>
									 <select id="a_sex" name="sex" style="width:100px;">
										 <option value="" selected="selected">--请选择--</option>
										 　　 <option value="男">男</option>
										 <option value="女">女</option>
									 </select>
								 </li>
								 <li>
									 <label>证件类型：</label>
									 <select id="a_cardType" name="cardType" style="width:100px;">
										 <option value="" selected="selected">--请选择--</option>
										 <option value="1">二代身份证</option>
										 <option value="4">护照</option>
										 <option value="3">军官证</option>

									 </select><span style="color:red;font-weight: bold;">*</span>
								 </li>
							 </div>
							<br>
							<div class="left">
								<li>
									<label>证件号码：</label>
									<input type="text" id="a_idCard" name="idCard" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')"/>
									<span style="color:red;font-weight: bold;">*</span>
								</li>
								<li>
									<label>生日：</label>
									<div class="layui-input-block">
										<input type="text" name="birthday" id="a_birthday" autocomplete="off" class="layui-input Wdate" size="15">
									</div>
								</li>
							</div>
							<br>
							<div class="left">
								<li>
									<label>联系电话：</label>
									<input type="text" id="a_mobile" name="mobile" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
									<span style="color:red;font-weight: bold;">*</span>
								</li>
								<li>
									<label>Email：</label>
									<input type="text" id="a_email" name="email"/>
								</li>
							</div>
							<br>
							<div class="left">
								<li>
									<label>邮政编码：</label>
									<input type="text" id="a_postCode" name="postCode" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
								</li>
								<li>
									<label>开户行：</label>
									<input type="text" id="a_bankName" name="bankName"/>
									<span style="color:red;font-weight: bold;">*</span>
								</li>
							</div>
							<br>
							<div class="left">
								<li>
									<label>开户卡号：</label>
									<input type="text" id="a_bankAccount" name="bankAccount" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
									<span style="color:red;font-weight: bold;">*</span>
								</li>
								<li>
									<label>开户人：</label>
									<input type="text" id="a_accountHolder" name="accountHolder"/>
									<span style="color:red;font-weight: bold;">*</span>
								</li>
							</div>
							<br>
							<div class="left">
								<li>
									<label>收货国家：</label>
									<%--<input type="text" id="a_country" name="country" value=""/>--%>
									<select id="acountry" name="cardType" style="width:100px;">
										<option value="" selected="selected">--请选择--</option>
										<option value="1">中国</option>
										<option value="2">美国</option>
										<c:if test="${countryList != null}">
											<c:forEach items="${countryList}" var="acountry">
												<option value="${acountry.valueId}">${acountry.valueName}</option>
											</c:forEach>
										</c:if>
									</select>
								</li>
								
								<li>
									<label>是否启用：</label>
									<select name="isStart" style="width:100px;height:30px ">
										<option value="1" selected="selected">启用</option>
										<option value="2">不启用</option>
									</select> <span style="color:red;font-weight: bold;">*</span>
								</li>
							</div>
							<br>
							<div class="left">
								<li class="lastli">
									<label>收货地址：</label><textarea id="a_useraddress" name="userAddress"></textarea>
								</li>
							</div>
							
						</ul>
						<div class="downbuttom">
						<div class="clear"></div>

                         <div class="left">
							
								 <button type="button" class="layui-btn" id="a_updateusercard">上传身份证</button>
								 <br>
								 <div class="layui-upload">
									 <div class="layui-upload-list">
										 <img class="layui-upload-img" id="a_idcardview" style="width: 100px;height: 100px">

									 </div>
								 </div>
							
					
								<button type="button" class="layui-btn" id="a_updateuserbankcard">上传银行卡</button>
								<div class="layui-upload">
									<div class="layui-upload-list">
										<img class="layui-upload-img" id="a_bankcardview" style="width: 100px;height: 100px">

									</div>
								</div>

						
							 

						 </div>
							
							<div class="layui-form-item">
								<div class="layui-input-block">
									<button class="layui-btn" lay-submit="" lay-filter="registuser">立即注册</button>
									
								</div>
							</div>
			
						</div>
					</div>
			</form>	
                    
                  
		</div>
	</div><!--/span-->
				
			</div><!--/row-->
</div>

<%--<script type="text/javascript" src="/statics/medire/WdatePicker.js"></script>--%>
<%--<script src="/statics/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
	layui.use(['form', 'laydate'], function(){
		var form = layui.form
				,layer = layui.layer
				,layedit = layui.layedit
				,laydate = layui.laydate;

		//日期
		laydate.render({
			elem: '#a_birthday'
		});
		
	});
</script>--%>
<%@include file="/WEB-INF/pages/common/foot.jsp"%>