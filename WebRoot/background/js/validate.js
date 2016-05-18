document.write('<script type="text/javascript" src="jquery.js"></script>');
document.write('<script type="text/javascript" src="../../common/validate.js"></script>');
$(function(){
	require();
})
function require(){
	$(".require").blur(function(){
		var value=$(this).val();
		if(value.isNull()){
			addError($(this), "不能为空！", "require");
		}else{
			removeError($(this), "require");
		}
	});
}

/**
 * 添加错误信息
 * */
function addError($element, message, type){
	var $errorSpan = $element.next();
	if($errorSpan.hasClass("showError")){
		$errorSpan.html(message)
		//.css("display","inline")
		.css({display:"inline"})
		.attr("errorType", type);
	}else {
		$element.after("<span class='showError'  errorType='" + type + "'>" +  message + "</span>");
	}
}

/**
 * 移除错误信息
 * */
function removeError($element, type){
	var $errorSpan = $element.next();
	if($errorSpan.hasClass("showError") && ($errorSpan.attr("errorType") == type || type == "all")){
		$errorSpan.css("display","none");
	}
}