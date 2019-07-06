function saveloginpwd() {
	
	var tip = $("#modifyloginpwdtip");
	tip.html("");
	var oldpwd = $("#oldloginpwd").val();
	var newpwd = $("#newloginpwd").val();
	var aginpwd = $("#againloginpwd").val();
	if ("" == oldpwd) {
		tip.css("color", "red");
		tip.html("对不起，请输入原密码，谢谢。");
		$("#oldloginpwd").focus();
	} else if ("" == newpwd) {
		tip.css("color", "red");
		tip.html("对不起，请输入新密码，谢谢。");
		$("#newloginpwd").focus();
	} else if ("" == aginpwd) {
		tip.css("color", "red");
		tip.html("对不起，请再次输入新密码，谢谢。");
		$("#againloginpwd").focus();
	} else if (newpwd.length < 6) {
		tip.css("color", "red");
		tip.html("对不起，密码长度不能小于6位，谢谢。");
		$("#newloginpwd").focus();
	} else if (newpwd != aginpwd) {
		tip.css("color", "red");
		tip.html("对不起，您两次输入的密码不一致，请重新输入，谢谢。");
		$("#againloginpwd").focus();
	} else {
		//userJson
		user = new Object();
		user.password = oldpwd;
		user.password2 = newpwd;
		$.ajax({
			url: '/member/modifyPwd.html',
			type: 'POST',
			data: {"password":user.password2},
			dataType: "json",

			success: function (result) {
				if (result.code ==200) {
					alert("成功");
					tip.css("color", "green");
					tip.html("修改密码成功 ，下次登录记得使用新密码哦。^_^");
				} else if (result.code ==400) {
					tip.css("color", "red");
					tip.html("原密码不正确！请重试。");
				} else if (result.code ==500) {
					tip.css("color", "red");
					tip.html("修改密码失败！请重试。");
				}
			}
		});
	}

}
function savesecondpwd() {
	var tip = $("#modifysecondpwdtip");
	tip.html("");
	var oldpwd = $("#oldsecondpwd").val();
	var newpwd = $("#newsecondpwd").val();
	var aginpwd = $("#againsecondpwd").val();
	if ("" == oldpwd) {
		tip.css("color", "red");
		tip.html("对不起，请输入原密码，谢谢。");
		$("#oldsecondpwd").focus();
	} else if ("" == newpwd) {
		tip.css("color", "red");
		tip.html("对不起，请输入新密码，谢谢。");
		$("#newsecondpwd").focus();
	} else if ("" == aginpwd) {
		tip.css("color", "red");
		tip.html("对不起，请再次输入新密码，谢谢。");
		$("#againsecondpwd").focus();
	} else if (newpwd.length < 6) {
		tip.css("color", "red");
		tip.html("对不起，密码长度不能小于6位，谢谢。");
		$("#newloginpwd").focus();
	} else if (newpwd != aginpwd) {
		tip.css("color", "red");
		tip.html("对不起，您两次输入的密码不一致，请重新输入，谢谢。");
		$("#againsecondpwd").focus();
	} else {
		//userJson
		user = new Object();
		user.password = oldpwd;
		user.password2 = newpwd;
		$.ajax({
			url: '/member/savesecondpwd.html',
			type: 'POST',
			data: {"password2": user.password2},
			dataType: "json",

			success: function (result) {
				if (result.code ==200) {
					alert("成功");
					tip.css("color", "green");
					tip.html("修改密码成功 ，下次登录记得使用新密码哦。^_^");
				} else if (result.code ==400) {
					tip.css("color", "red");
					tip.html("原密码不正确！请重试。");
				} else if (result.code ==500) {
					tip.css("color", "red");
					tip.html("修改密码失败！请重试。");
				}
			}
		});
	}

}