layui.use(['form', 'upload'], function () {
    var form = layui.form;
    var upload = layui.upload;

    // 上传身份证
    var uploadidcard = upload.render({
        elem: '#updateusercard' //绑定元素
        , url: '/backend/upload.html' //上传接口
        , field: "uploadFile"
        , before: function (obj) {
            //预读本地文件示例，不支持ie8
            obj.preview(function (index, file, result) {
                $('#idcardview').attr('src', result); //图片链接（base64）
            });
        }
        , done: function (res) {
            //上传完毕回调
            alert("成功")
            $("#idCardPicPath").val(res.file)
        }
        , error: function () {
            //请求异常回调
        }
    });
    //上传银行卡
    var uploadbankcard = upload.render({
        elem: '#updateuserbankcard' //绑定元素
        , url: '/backend/upload.html' //上传接口
        , field: "uploadFile"
        , before: function (obj) {
            //预读本地文件示例，不支持ie8
            obj.preview(function (index, file, result) {
                $('#bankcardview').attr('src', result); //图片链接（base64）
            });
        }
        , done: function (res) {
            //上传完毕回调
            alert("成功")
            $("#bankCardPicPath").val(res.file)
        }
        , error: function () {
            //请求异常回调
        }
    });



    // 上传身份证2
    var uploadidcard2 = upload.render({
        elem: '#updateusercard2' //绑定元素
        , url: '/backend/upload.html' //上传接口
        , field: "uploadFile"
        , before: function (obj) {
            //预读本地文件示例，不支持ie8
            obj.preview(function (index, file, result) {
                $('#idcardview2').attr('src', result); //图片链接（base64）
            });
        }
        , done: function (res) {
            //上传完毕回调
            alert("成功")
            $("#idCardPicPath2").val(res.file)
        }
        , error: function () {
            //请求异常回调
        }
    });
    //上传银行卡2
    var uploadbankcard2 = upload.render({
        elem: '#updateuserbankcard2' //绑定元素
        , url: '/backend/upload.html' //上传接口
        , field: "uploadFile"
        , before: function (obj) {
            //预读本地文件示例，不支持ie8
            obj.preview(function (index, file, result) {
                $('#bankcardview2').attr('src', result); //图片链接（base64）
            });
        }
        , done: function (res) {
            //上传完毕回调
            alert("成功")
            $("#bankCardPicPath2").val(res.file)
        }
        , error: function () {
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
                $("#useridhidden").val(result.id)

            }
        });
    });

});


function adduser() {

    $("#addUserform").css('display', 'block');
    $("#foradduser").css('display', 'block');
}

function updateuser() {

    $("#updateUserform").css('display', 'block');
    $("#foradduser").css('display', 'block');
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

