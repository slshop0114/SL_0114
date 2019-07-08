function searchuserreferlistfxc(user) {
    var userreid=user
    $.ajax({
        url:"/backend/getuser.html",
        method:"post",
        data:{"id":userreid},
        dataType:"json",
        success:function (result) {
            var str="";
          str+="<li>申请日期："+result.createTime+"</li>" +
              "<li>用户名:"+result.loginCode+"</li>" +
              "<li>姓名:"+result.userName+"</li>" +
              "<li>证件号:"+result.idCard+"</li>" +
              "<li>收货地："+result.country+"</li>" +
              "<li>电话:"+result.mobile+"</li>" +
              "<li>邮箱:"+result.email+"</li>" +
              "<li>地址:"+result.userAddress+"</li>" +
              "<li>邮编号:"+result.postCode+"</li>" +
              "<li>推荐人:"+result.referCode+"</li>"
            $("#userreferinfo").html(str);

        }
    });
}