<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/common/head.jsp"%>
<link href="/statics/css/zzy/registok.css" rel="stylesheet">
<link rel="stylesheet" href="/statics/layui/css/layui.css"  media="all">

<div class="bodyall">
<div>
	<ul class="breadcrumb">
		<li><a href="#">会员管理</a> <span class="divider">/</span></li>
		<li><a href="/member/registok.html">会员注册成功</a></li>
	</ul>
</div>
			<div class="row-fluid">
				<div class="box span12">
					
					<div class="box-content">
						<p class="green">注册成功！恭喜您成为注册会员！</p>
						<br/>
						<p><b>注意：用户名、编号是您登录网站时使用的，您的初始密码是证件号码的后6位，注册成功后要立即更改。您的用户信息如下：</b></p>
						<ul class="userregist">
							
							
							<li><label>用户名：</label>${sessionUser.loginCode}</li>
						<li><label>姓名：</label>${sessionUser.userName}</li>
						<li><label>证件号码：</label>${sessionUser.idCard}</li>
						<li><label>移动电话：</label>${sessionUser.mobile}</li>
						<li><label>开户行：</label>${sessionUser.bankName}</li>
						<li><label>银行卡号：</label>${sessionUser.bankAccount}</li>
						<li><label>开户人：</label>${sessionUser.accountHolder}</li>
						</ul>

					
						<p class="right">
							<a href="/shopManger/orderPurchaseOne.html" class="btn btn-large btn-primary nextbtn"><i class="icon-chevron-left icon-white"></i>报单购货</a>
						</p>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
</div>




<%@include file="/WEB-INF/pages/common/foot.jsp"%>

