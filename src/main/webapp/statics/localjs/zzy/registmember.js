function checkEmail(str){
	var reg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	if(str == null || str == "" || reg.test(str))
		return true;
	else
		return false;
}

$(".agreerule").click(function(){
	if($(".agreerule").attr("checked") == 'checked')
		$(".nextbtn").removeAttr("disabled");
	else
		$(".nextbtn").attr("disabled","disabled");
});

$(".rule").click(function(){
	window.open("/member/registe.html");
});


$(".backbtn").click(function(){
	window.location.href="/member/registe.html";
});

$("#a_cardType").change(function(){
	$("#a_cardTypeName").val($("#a_cardType").find("option:selected").text()) ;
});

$("#a_uploadbtnID").click(function(){
	TajaxFileUpload('0','a_fileInputID','a_uploadbtnID','a_idPic','a_fileInputIDPath');
});

$("#a_uploadbtnBank").click(function(){
	TajaxFileUpload('0','a_fileInputBank','a_uploadbtnBank','a_bankPic','a_fileInputBankPath');
});

$("#a_loginCode").blur(function(){
	var alc = $.trim($("#a_loginCode").val());
	if(alc != ""){
		$.post("/member/cheakUser.html",{'loginCode':alc},function(result){
			if(result == "repeat"){
				$("#add_formtip").css("color","red");
				$("#add_formtip").html("<li>对不起，该用户名已存在。</li>");
				$("#add_formtip").attr("key","1");;
				result = false;
			}else if(result == "failed"){
				alert("操作超时!");
			}else if(result == "only"){
				$("#add_formtip").css("color","green");
				$("#add_formtip").html("<li>该用户名可以正常使用。</li>");
				$("#add_formtip").attr("key","0");
			}
		},'html');
	}
});

$("#a_email").blur(function(){
	var flag = checkEmail($("#a_email").val());
	if(flag == false){
		$("#add_formtip").css("color","red");
		$("#add_formtip").html("<li>email格式不正确</li>");
		$("#add_formtip").attr("email","1");
	}else{
		$("#add_formtip").html("");
		$("#add_formtip").attr("email","0");
	}
});



/*
function registMemberFunc(){
	$("#add_formtip").html("");
	var result = true;
	if($.trim($("#a_loginCode").val()) == "" || $("#a_loginCode").val() == null){
		$("#add_formtip").css("color","red");
		$("#add_formtip").append("<li>对不起，用户名不能为空。</li>");
		result = false;
	}else{
		if($("#add_formtip").attr("key") == "1"){
			$("#add_formtip").append("<li>对不起，该用户名已存在。</li>");
			result = false;
		}
	}
	if($.trim($("#a_userName").val()) == "" || $("#a_userName").val() == null){
		$("#add_formtip").css("color","red");
		$("#add_formtip").append("<li>对不起，真实姓名不能为空。</li>");
		result = false;
	}
	if($("#a_cardType").val() == ""){
		$("#add_formtip").css("color","red");
		$("#add_formtip").append("<li>对不起，证件类型不能为空。</li>");
		result = false;
	}
	if($.trim($("#a_idCard").val()) == "" || $("#a_idCard").val() == null){
		$("#add_formtip").css("color","red");
		$("#add_formtip").append("<li>对不起，证件号码不能为空。</li>");
		result = false;
	}else{
		if($("#a_idCard").val().length < 6){
			$("#add_formtip").css("color","red");
			$("#add_formtip").append("<li>对不起，证件号码长度必须超过6位。</li>");
			result = false;
		}
	}
	if($.trim($("#a_mobile").val()) == "" || $("#a_mobile").val() == null){
		$("#add_formtip").css("color","red");
		$("#add_formtip").append("<li>对不起，联系电话不能为空。</li>");
		result = false;
	}
	if($.trim($("#a_bankName").val()) == "" || $("#a_bankName").val() == null){
		$("#add_formtip").css("color","red");
		$("#add_formtip").append("<li>对不起，开户行不能为空。</li>");
		result = false;
	}
	if($.trim($("#a_bankAccount").val()) == "" || $("#a_bankAccount").val() == null){
		$("#add_formtip").css("color","red");
		$("#add_formtip").append("<li>对不起，开户卡号不能为空。</li>");
		result = false;
	}
	if($.trim($("#a_accountHolder").val()) == "" || $("#a_accountHolder").val() == null){
		$("#add_formtip").css("color","red");
		$("#add_formtip").append("<li>对不起，开户人不能为空。</li>");
		result = false;
	}
	if($.trim($("#a_email").val()) != "" && $("#a_email").val() != null && $("#add_formtip").attr("email") == "1"){
		$("#add_formtip").css("color","red");
		$("#add_formtip").append("<li>email格式不正确</li>");
		result = false;
	}
	if(result == true)
		alert("添加成功 ^_^");
	
	return result;
	
}
*/



layui.use(['form', 'upload'], function () {
	var form = layui.form;
	var upload = layui.upload;

	// 上传身份证
	var a_uploadidcard = upload.render({
		elem: '#a_updateusercard' //绑定元素
		, url: '/member/upload.html' //上传接口
		, field: "uploadFile"
		, before: function (obj) {
			//预读本地文件示例，不支持ie8
			obj.preview(function (index, file, result) {
				$('#a_idcardview').attr('src', result); //图片链接（base64）
			});
		}
		, done: function (res) {
			//上传完毕回调

			$("#a_idCardPicPath").val(res.file)
		}
		, error: function () {
			//请求异常回调
		}
	});
	//上传银行卡
	var a_uploadbankcard = upload.render({
		elem: '#a_updateuserbankcard' //绑定元素
		, url: '/member/upload.html' //上传接口
		, field: "uploadFile"
		, before: function (obj) {
			//预读本地文件示例，不支持ie8
			obj.preview(function (index, file, result) {
				$('#a_bankcardview').attr('src', result); //图片链接（base64）
			});
		}
		, done: function (res) {
			//上传完毕回调

			$("#a_bankCardPicPath").val(res.file)
		}
		, error: function () {
			//请求异常回调
		}
	});


//监听提交
	form.on('submit(registuser)', function (data) {

		$("#add_formtip").html("");
		var result = true;
		if($.trim($("#a_loginCode").val()) == "" || $("#a_loginCode").val() == null){
			$("#add_formtip").css("color","red");
			$("#add_formtip").append("<li>对不起，用户名不能为空。</li>");
			result = false;
		}else{
			if($("#add_formtip").attr("key") == "1"){
				$("#add_formtip").append("<li>对不起，该用户名已存在。</li>");
				result = false;
			}
		}
		if($.trim($("#a_userName").val()) == "" || $("#a_userName").val() == null){
			$("#add_formtip").css("color","red");
			$("#add_formtip").append("<li>对不起，真实姓名不能为空。</li>");
			result = false;
		}
		if($("#a_cardType").val() == ""){
			$("#add_formtip").css("color","red");
			$("#add_formtip").append("<li>对不起，证件类型不能为空。</li>");
			result = false;
		}
		if($.trim($("#a_idCard").val()) == "" || $("#a_idCard").val() == null){
			$("#add_formtip").css("color","red");
			$("#add_formtip").append("<li>对不起，证件号码不能为空。</li>");
			result = false;
		}else{
			if($("#a_idCard").val().length < 6){
				$("#add_formtip").css("color","red");
				$("#add_formtip").append("<li>对不起，证件号码长度必须超过6位。</li>");
				result = false;
			}
		}
		if($.trim($("#a_mobile").val()) == "" || $("#a_mobile").val() == null){
			$("#add_formtip").css("color","red");
			$("#add_formtip").append("<li>对不起，联系电话不能为空。</li>");
			result = false;
		}
		if($.trim($("#a_bankName").val()) == "" || $("#a_bankName").val() == null){
			$("#add_formtip").css("color","red");
			$("#add_formtip").append("<li>对不起，开户行不能为空。</li>");
			result = false;
		}
		if($.trim($("#a_bankAccount").val()) == "" || $("#a_bankAccount").val() == null){
			$("#add_formtip").css("color","red");
			$("#add_formtip").append("<li>对不起，开户卡号不能为空。</li>");
			result = false;
		}
		if($.trim($("#a_accountHolder").val()) == "" || $("#a_accountHolder").val() == null){
			$("#add_formtip").css("color","red");
			$("#add_formtip").append("<li>对不起，开户人不能为空。</li>");
			result = false;
		}
		if($.trim($("#a_email").val()) != "" && $("#a_email").val() != null && $("#add_formtip").attr("email") == "1"){
			$("#add_formtip").css("color","red");
			$("#add_formtip").append("<li>email格式不正确</li>");
			result = false;
		}
		if(result == true)
			alert("添加成功 ^_^");

		return result;
		alert("注册成功aaa");

	});
	

});
