

function checkEmail(str){
	var reg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	if(str == null || str == "" || reg.test(str))
		return true;
	else
		return false;
}


function  modifypersonalinfocancel(){
	$("#m_idPic").html('');
	$("#m_bankPic").html('');
	$("#modify_formtip").html('');
	
}
/*$('.modifypersonalinfocancel').click(function(e){
	$("#m_idPic").html('');
	$("#m_bankPic").html('');
	$("#modify_formtip").html('');
});*/

$("#m_uploadbtnID").click(function(){
	TajaxFileUpload($("#m_id").val(),'m_fileInputID','m_uploadbtnID','m_idPic','m_fileInputIDPath');
});
$("#m_uploadbtnID_h").click(function(){
	TajaxFileUpload($("#m_id").val(),'m_fileInputID','m_uploadbtnID_h','m_idPic','m_fileInputIDPath');
});

$("#m_uploadbtnBank").click(function(){
	TajaxFileUpload($("#m_id").val(),'m_fileInputBank','m_uploadbtnBank','m_bankPic','m_fileInputBankPath');
});
$("#m_uploadbtnBank_h").click(function(){
	TajaxFileUpload($("#m_id").val(),'m_fileInputBank','m_uploadbtnBank_h','m_bankPic','m_fileInputBankPath');
});




$("#m_email").blur(function(){
	var flag = checkEmail($("#m_email").val());
	if(flag == false){
		$("#modify_formtip").css("color","red");
		$("#modify_formtip").html("<li>email格式不正确</li>");
		$("#modify_formtip").attr("email","1");
	}else{
		$("#modify_formtip").html("");
		$("#modify_formtip").attr("email","0");
	}
		
});


layui.use(['form', 'upload'], function () {
	var form = layui.form;
	var upload = layui.upload;

	// 上传身份证
	var m_uploadidcard = upload.render({
		elem: '#m_updateusercard' //绑定元素
		, url: '/member/upload.html' //上传接口
		, field: "uploadFile"
		, before: function (obj) {
			//预读本地文件示例，不支持ie8
			obj.preview(function (index, file, result) {
				$('#m_idcardview').attr('src', result); //图片链接（base64）
			});
		}
		, done: function (res) {
			//上传完毕回调

			$("#idCardPicPath").val(res.file)
		}
		, error: function () {
			//请求异常回调
		}
	});
	//上传银行卡
	var uploadbankcard = upload.render({
		elem: '#m_updateuserbankcard' //绑定元素
		, url: '/member/upload.html' //上传接口
		, field: "uploadFile"
		, before: function (obj) {
			//预读本地文件示例，不支持ie8
			obj.preview(function (index, file, result) {
				$('#m_bankcardview').attr('src', result); //图片链接（base64）
			});
		}
		, done: function (res) {
			//上传完毕回调

			$("#bankCardPicPath").val(res.file)
		}
		, error: function () {
			//请求异常回调
		}
	});



//监听提交


	form.on('submit(modifyuser)', function (data) {
		$("#modify_formtip").html("");
		var result = true;

		if($.trim($("#m_username").val()) == "" || $("#m_username").val() == null){
			$("#modify_formtip").css("color","red");
			$("#modify_formtip").append("<li>对不起，真实姓名不能为空。</li>");
			result = false;
		}
		if($("#m_cardtype").val() == ""){
			$("#modify_formtip").css("color","red");
			$("#modify_formtip").append("<li>对不起，证件类型不能为空。</li>");
			result = false;
		}
		if($.trim($("#m_idcard").val()) == "" || $("#m_idcard").val() == null){
			$("#modify_formtip").css("color","red");
			$("#modify_formtip").append("<li>对不起，证件号码不能为空。</li>");
			result = false;
		}
		if($.trim($("#m_mobile").val()) == "" || $("#m_mobile").val() == null){
			$("#modify_formtip").css("color","red");
			$("#modify_formtip").append("<li>对不起，联系电话不能为空。</li>");
			result = false;
		}
		if($.trim($("#m_bankname").val()) == "" || $("#m_bankname").val() == null){
			$("#modify_formtip").css("color","red");
			$("#modify_formtip").append("<li>对不起，开户行不能为空。</li>");
			result = false;
		}
		if($.trim($("#m_bankaccount").val()) == "" || $("#m_bankaccount").val() == null){
			$("#modify_formtip").css("color","red");
			$("#modify_formtip").append("<li>对不起，开户卡号不能为空。</li>");
			result = false;
		}
		if($.trim($("#m_accountholder").val()) == "" || $("#m_accountholder").val() == null){
			$("#modify_formtip").css("color","red");
			$("#modify_formtip").append("<li>对不起，开户人不能为空。</li>");
			result = false;
		}
		if($.trim($("#m_email").val()) != "" && $("#m_email").val() != null && $("#modify_formtip").attr("email") == "1"){
			$("#modify_formtip").css("color","red");
			$("#modify_formtip").append("<li>email格式不正确</li>");
			result = false;
		}
		if(result == true) alert("修改成功 ^_^");
		return result;
		alert("修改成功")

	});

});