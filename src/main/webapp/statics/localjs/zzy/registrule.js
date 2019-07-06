/*

function agreerule(){

	if($(".agreerule").attr("checked") == 'checked')
		$(".nextbtn").removeAttr("disabled");
	
	else
		$(".nextbtn").attr("disabled","disabled");
}
*/

/*
$(".nextbtn").click(function(){
	window.location.href="/member/registrule.html";
});

*/

$(function () {
	var nextt = $("#next");
	$("#readme").change(function(){
		var checkedValue = $("#readme").prop("checked");
		if(checkedValue){
			nextt.prop("disabled",false);
			nextt.css("background","#078E18");
		}else{
			nextt.prop("disabled",true);
			nextt.css("background","#909090");
		}
	});
})


function nextbtn() {
	window.location.href="/member/registrule.html";
}


$(".closebtn").click(function(){
	window.close();
});