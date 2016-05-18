<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="<%=path %>/background/assets/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/background/js/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/common/validate.js"></script>
<script type="text/javascript">

$(function(){
	var password="${param.password}";
	var id="${param.id}";
	$(".btn").click(function(){
		var value=$("#password").val().trim();
		var result=checkNull($("#password")[0]);
		if(result){
			if(isEquals(password,value)){
			showMessage($("#password")[0],"");
			location.href="queryOnemanagerAction.action?manager.id="+id;
			}else{
			showMessage($("#password")[0],"密码不正确！！！");
			}
		}
		
	});
});


//验证是否为空，姓名和家庭住址
function checkNull(obj){
	var value=$(obj).val().trim();
	 isExistFont(obj);
	if(value.isNull()){
		showMessage(obj,"不能为空！！！");
		return false;
	}else{
		showMessage(obj,"");
		return true;
	}
}


function isExistFont(obj){
	var font=$(obj).next("font").attr("class");
	if(font==null){
	$(obj).after("<font class='info' color='red'></font>");
	}
}

function showMessage(obj,message){
	$(obj).next(".info").html(message);
}
</script>
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">用户管理</a></li>
    <li><a href="#">添加用户</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>确认用户信息</span></div>
    <ul class="forminfo">
    <li><label>请输入密码：</label><input name="manager.password" id="password" onblur="checkNull(this)" type="password" class="dfinput  checkUP" /></li>
    <li><label>&nbsp;</label><input name="" type="button" class="btn" value="下一步"/>
    
    </li>
    </ul>
    </div>
</body>

</html>

