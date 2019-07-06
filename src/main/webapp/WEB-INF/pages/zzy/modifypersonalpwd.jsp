<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/common/head.jsp"%>
<link href="/statics/css/zzy/modifypersonalpassword.css" rel="stylesheet">

<script src="/statics/localjs/zzy/jquery.js" type="text/javascript"></script>
<script src="/statics/localjs/zzy/jQuery3.4.1.js" type="text/javascript"></script>
<script type="text/javascript" src="/statics/localjs/zzy/modifypersonalpwd.js"></script>
<script src="/statics/localjs/zzy/jquery.cookie.js" type="text/javascript"></script>
<div class="bodyall">
<div>
	<ul class="breadcrumb">
		<li><a href="#">会员管理</a> <span class="divider">/</span></li>
		<li><a href="/member/modifypersonalpassword.html">修改本人密码</a></li>
	</ul>
</div>
	<hr style="width: 80%;color:#CCCCCC; ">
<div class="row-fluid sortable">	
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-user"></i>修改密码</h2>
					</div>
					<div >
						<div class="modal-body">
							<div class="topul">
								<div class="modal-header">
									<h3>修改商城登录密码</h3>
								</div>
							</div>
							<hr style="width: 80%;color:#CCCCCC; ">
							<div class="member-modal-body">
								<p>
								<div>
								    <label>请输入原密码：</label>
								    <input id="oldloginpwd"  type="password"/>
								    <span style="color:red;font-weight: bold;">*</span>
							    </div>
								<br>
								<div>
									<label>请输入新密码：</label>
									<input id="newloginpwd"  type="password"/>
									<span style="color:red;font-weight: bold;">*新密码必须6位以上</span>
								</div>
								<br>
								<div>
									<label>再次输入新密码：</label>
									<input id="againloginpwd"  type="password"/>
									<span style="color:red;font-weight: bold;">*</span>
								</div>
									<br>
								</p>
								<p id="modifyloginpwdtip">
								</p>
							</div>
					</div>

						<a href="#" id="saveloginpwd" class="btn btn-primary" onclick="saveloginpwd()">保存</a>
				</div>
					<br>
					<div class="box-content">
						<div class="modal-body">
							<ul class="topul">
								<div class="modal-header">
									<h3>修改商城二级密码</h3>
								</div>
							</ul>
							<hr style="width: 80%;color:#CCCCCC; ">
							<div class="member-modal-body">
								<p>

								<div>
								   <label>请输入原密码：</label>
								   <input id="oldsecondpwd"  type="password"/>
								   <span style="color:red;font-weight: bold;">*</span>
							    </div>
								<br>
								<div>
									<label>请输入新密码：</label>
									<input id="newsecondpwd"  type="password"/>
									<span style="color:red;font-weight: bold;">*新密码必须6位以上</span>
								</div>
								<br>
								<div>
									<label>再次输入新密码：</label>
									<input id="againsecondpwd"  type="password"/>
									<span style="color:red;font-weight: bold;">*</span>
								</div>
								<br>

								</p>
								<p id="modifysecondpwdtip">
								</p>
							</div>
							<a href="#" id="savesecondpwd" class="btn btn-primary" onclick="savesecondpwd()">保存</a>
						</div>
					</div>	
					
		</div><!--/row-->
</div>
	
		${passWord }
	
</div>

<%@include file="/WEB-INF/pages/common/foot.jsp"%>
