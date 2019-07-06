function reviseuser(){

    $("#modifyUserDiv").css('display','block');
    $("#foradduser").css('display','block');

}


function checkEmail(str){
    var reg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
    if(str == null || str == "" || reg.test(str))
        return true;
    else
        return false;
}

var pageSize=4;
var starNum=0;


$(function () {
    searchin()
});


function firstpage() {
    starNum=1;
    searchin();
}

function nextpage(){
    starNum+=4;

    searchin();
}

function viewRequest(id) {
    $.cookie="invid="+id;
}
function searchin() {
    var loginCode = $("#sousuo").val();
    $.ajax({
        url:"/member/getlist.html",
        type: "post",
        data:{"loginCode":loginCode,"pageSize":pageSize,"starNum":starNum},
        dataType: "json",
        success:function (result) {
            console.log(result.data.list)
            if(result.code==400){
                starNum-=1;
                searchin()
            }
            var list=result.data.list;

            var str="";
            for(var i=0;i<list.length;i++){
                var obj=list[i];
                str+="<tr>" +
                    "<td>"+obj.loginCode+"</td>" +
                    "<td>"+obj.userName+"</td>" +
                    "<td>"+obj.mobile+"</td>" +
                    "<td>"+obj.referCode+"</td>" +
                    "<td>"+obj.createTime+"</td>+" +
                    "<td><input type='radio' onclick=''  name='checkbox' id='"+obj.id+"' value='"+obj.userType+"'></td>" +
                    "</tr>"
            }
            $("#list").html(str);
        }
    })
}



$('.modifyusercancel').click(function(e){
    $("#m_idPic").html('');
    $("#m_bankPic").html('');
    $("#modify_formtip").html('');
    $("#m_isstart").html('');
});


layui.use(['form','upload'], function () {
 
    var form = layui.form;
    var upload = layui.upload;


    var uploadidcard = upload.render({
        elem: '#updateusercard' //绑定元素
        , url: '/member/upload.html' //上传接口
        , field: "uploadFile"
        , before: function (obj) {
            alert("upload2")
            //预读本地文件示例，不支持ie8
            obj.preview(function (index, file, result) {
                $('#idcardview').attr('src', result); //图片链接（base64）
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
        elem: '#updateuserbankcard' //绑定元素
        , url: '/member/upload.html' //上传接口
        , field: "uploadFile"
        , before: function (obj) {
            //预读本地文件示例，不支持ie8
            obj.preview(function (index, file, result) {
                $('#bankcardview').attr('src', result); //图片链接（base64）
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


    // 上传身份证2
    var uploadidcard2 = upload.render({
        elem: '#updateusercard2' //绑定元素
        , url: '/member/upload.html' //上传接口
        , field: "uploadFile"
        , before: function (obj) {
            //预读本地文件示例，不支持ie8
            obj.preview(function (index, file, result) {
                $('#idcardview2').attr('src', result); //图片链接（base64）
            });
        }
        , done: function (res) {
            //上传完毕回调

            $("#idCardPicPath2").val(res.file)
        }
        , error: function () {
            //请求异常回调
        }
    });
    //上传银行卡2
    var uploadbankcard2 = upload.render({
        elem: '#updateuserbankcard2' //绑定元素
        , url: '/member/upload.html' //上传接口
        , field: "uploadFile"
        , before: function (obj) {
            //预读本地文件示例，不支持ie8
            obj.preview(function (index, file, result) {
                $('#bankcardview2').attr('src', result); //图片链接（base64）
            });
        }
        , done: function (res) {
            //上传完毕回调

            $("#bankCardPicPath2").val(res.file)
        }
        , error: function () {
            //请求异常回调
        }
    });
        form.on('submit(mupdateuser)', function (data) {
            $("#modify_formtip").html("");
            var result = true;
            if($("#m_roleId").val() == ""){
                $("#modify_formtip").css("color","red");
                $("#modify_formtip").append("<li>对不起，角色不能为空。</li>");
                result = false;
            }
            if($.trim($("#m_logincode").val()) == "" || $("#m_logincode").val() == null){
                $("#modify_formtip").css("color","red");
                $("#modify_formtip").append("<li>对不起，用户名不能为空。</li>");
                result = false;
            }else{
                if($("#modify_formtip").attr("key") == "1"){
                    $("#modify_formtip").append("<li>对不起，该用户名已存在。</li>");
                    result = false;
                }
            }
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
            }else{
                if($("#m_idcard").val().length < 6){
                    $("#modify_formtip").css("color","red");
                    $("#modify_formtip").append("<li>对不起，证件号码长度必须超过6位。</li>");
                    result = false;
                }
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
            if(result == true) 
                alert("修改成功 ^_^");
            return result;   
                alert("修改成功")

    });
      

});



/*获取修改数据*/
function revuser() {

    var obj = document.getElementsByName("checkbox");
    var checkVal = [];//获取选中的id
    for (var k in obj) {
        if (obj[k].checked) {
            checkVal.push(obj[k].id);
        }
    }
    var m_id = checkVal[0];
    alert("id="+ m_id);
    $("#useridhiddenm").val(m_id)
    /*var m_id = $(this).attr('id');*/
    $.ajax({
        url: "/member/finduser.html",
        type: 'POST',
        data: {"id": m_id},
        dataType: "json",
/*        method: "post",*/
        success: function (result) {
            
               $("#m_id").val(m_id)
            $("#m_rolename").val(result.m_rolename)
                $("#m_logincode").val(result.loginCode)
                $("#m_username").val(result.userName)
            
                $("#m_idcard").val(result.idCard)
                $("#m_mobile").val(result.mobile)
                $("#m_email").val(result.email)
                $("#m_postcode").val(result.postCode)
            
                $("#m_bankname").val(result.bankName)
                $("#m_bankaccount").val(result.bankAccount)
                $("#m_accountholder").val(result.accountHolder)
            $("#m_refercode").val(result.referCode)
            $("#m_createtime").val(result.createTime)
            $("#m_useraddress").val(result.userAddress)
            $("#idcardview2").val(result.idCardPicPath)
            $("#bankcardview2").val(result.bankPicPath)
            
            }
        
    });

}




/*删除*/
function deluser( ){

    var obj = document.getElementsByName("checkbox");
    var checkVal = [];//获取选中的id
    var userType=[];
    for (var k in obj) {
        if (obj[k].checked) {
            userType.push(obj[k].value);
            checkVal.push(obj[k].id);
        }
    }
    var d_id = checkVal[0];
    // alert("id="+ d_id);
    var userType1=userType[0]//证件类型id
    // alert(userType1)


    if(confirm("您确定要删除这个用户吗？")){

        $.ajax({
            url: "/member/delet.html",
            type: "post",
            data: {"id":d_id,"userType":userType1},
            async: true,
            dataType: "json",
            success: function (result) {
                if(result.code==200){
                    searchin()
                alert("删除成功！");
                }else if(result.code==400){
                    searchin()
                    alert("该用户不允许被删除！");
                }else{
                    alert("删除失败！");
                }
                
            }
        });
      
    }
}




$("#m_logincode").blur(function(){
    var mlc = $("#m_logincode").val();
    if(mlc != ""){
        $.post("/member/logincodeisexit.html",{'loginCode':mlc,'id':$("#m_id").val()},function(result){
            if(result == "repeat"){
                $("#modify_formtip").css("color","red");
                $("#modify_formtip").html("<li>对不起，该用户名已存在。</li>");
                $("#modify_formtip").attr("key","1");
                result = false;
            }else if(result == "failed"){
                alert("操作超时!");
            }else if(result == "only"){
                $("#modify_formtip").css("color","green");
                $("#modify_formtip").html("<li>该用户名可以正常使用。</li>");
                $("#modify_formtip").attr("key","0");
            }
        },'html');
    }
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

/*
//修改用户信息验证
function modifyUserFunction(){
    $("#modify_formtip").html("");
    var result = true;
    if($("#m_roleId").val() == ""){
        $("#modify_formtip").css("color","red");
        $("#modify_formtip").append("<li>对不起，角色不能为空。</li>");
        result = false;
    }
    if($.trim($("#m_logincode").val()) == "" || $("#m_logincode").val() == null){
        $("#modify_formtip").css("color","red");
        $("#modify_formtip").append("<li>对不起，用户名不能为空。</li>");
        result = false;
    }else{
        if($("#modify_formtip").attr("key") == "1"){
            $("#modify_formtip").append("<li>对不起，该用户名已存在。</li>");
            result = false;
        }
    }
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
    }else{
        if($("#m_idcard").val().length < 6){
            $("#modify_formtip").css("color","red");
            $("#modify_formtip").append("<li>对不起，证件号码长度必须超过6位。</li>");
            result = false;
        }
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
}*/

function delpic(id,closeSpan,uploadBtn,obj,picpath,picText,fileinputid){
    //delete
    $.post("/delet.html",{'id':id,'picpath':picpath},function(result){
        if("success" == result){
            alert("删除成功！");
            $('#'+picText).val('');
            $("#uniform-"+fileinputid+" span:first").html('无文件');
            document.getElementById(closeSpan).removeChild(obj.parentElement);$('#'+uploadBtn).show();
        }else
            alert("删除失败！");
    },'html');

}

    