layui.use(['form','upload'], function () {
    var form = layui.form;
    var upload = layui.upload;

    // 上传
    var uploadInst = upload.render({
        elem: '#updateusercard' //绑定元素
        ,url: '/backend/upload.html' //上传接口
        ,field:"uploadFile"
        ,done: function(res){
            //上传完毕回调
            alert("成功")
        }
        ,error: function(){
            //请求异常回调
        }
    });

//监听提交
    form.on('submit(adduser)', function (data) {
        alert("添加成功");

    });

    form.on('submit(updateuser)', function (data) {
        alert("修改成功")

    });
    form.on('submit(searchforuser)', function (data) {


    });

    form.on("radio(chooseuserid)", function (data) {
        var userid = data.value;
      $.ajax({
             url: "/backend/getuser.html",
             dataType: "json",
             method: "post",
             data: {"id": userid},
             success: function (result) {
                 $("#loginCode2").val(result.loginCode)
                 $("#userName2").val(result.userName)
                 $("#idCard2").val(result.idCard)
                 $("#mobile2").val(result.mobile)
                 $("#email2").val(result.email)
                 $("#postCode2").val(result.postCode)
                 $("#bankName2").val(result.bankName)
                 $("#bankAccount2").val(result.bankAccount)
                 $("#accountHolder2").val(result.accountHolder)

             }
         });
    });

});





function adduser(){

        $("#addUserform").css('display','block');
        $("#foradduser").css('display','block');
}

function updateuser(){

    $("#updateUserform").css('display','block');
    $("#foradduser").css('display','block');
}


function deleteuser() {

    var deid = $("#formforuser input:radio:checked").val();
    alert("deid")
    $.ajax({
        url: "/backend/deluser.html",
        method: "post",
        data: {"id": deid},
        dataType: "json",
        success: function (result) {
            window.location.reload();
        }
    })
}

