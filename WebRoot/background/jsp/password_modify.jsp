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
	var resultFlg="<s:property value='resultFlg'/>";
	if(resultFlg=="passwordSuccess"){
		alert("密码修改成功，请重新登录！！！");
		window.top.location.href="<%=path%>/background/login.jsp";
	}
	$("#form1").submit(function(){
		var array=new Array();
		
		$(".isRight").each(function(){
			array.push(isRight(this));
		});
		
		$(".checkUP").each(function(){
			array.push(checkUP(this));
		});
		
		$(".checkRPassword").each(function(){
			array.push(checkRPassword(this));
		});
		return isSubmit(array);
	});
});

function isRight(obj){
	var oldPassword="<s:property value='#session.admin.password'/>";
	if(checkNull(obj)){
		var newPassword=$(obj).val().trim();
		if(isEquals(newPassword,oldPassword)){
			showMessage(obj,"");
			$("#newPassword").removeAttr("readonly");
			$("#rnewPassword").removeAttr("readonly");
			return true;
		}else{
			showMessage(obj,"原密码不正确，不能修改新密码！！！");
			$("#newPassword").val("");
			$("#newPassword").attr("readonly","readonly");
			$("#rnewPassword").val("");
			$("#rnewPassword").attr("readonly","readonly");
			return false;
		}
	}else{
		return false;
	}
}

function checkRPassword(obj){
	var rpass=$(obj).val().trim();
	var pass=$("#newPassword").val().trim();
	if(isRight($("#oldPassword")[0])){
		if(!rpass.isNull()){
			if(isEquals(rpass,pass)){
				$("#showMess").html("");
				return true;
			}else{
				$("#showMess").html("确认密码不正确！！！");
				return false;
			}
			}else{
				$("#showMess").html("不能为空 ！！！");
				return false;
			}
	}else{
		return false;
	}
	
	
}

function isSubmit(array){
	var flg=true;
	for(var i=0;i<array.length;i++){
		if(!array[i]){
			flg=false;
			break;
		}
	}
	return flg;
}

//验证用户名和密码是否符合常用注册要求
function checkUP(obj){
	var value=$(obj).val().trim();
	var checkResult=checkNull(obj);
	if(isRight($("#oldPassword")[0])){
	 if(checkResult){
		 
		 if(isRegisterUserName(value)){
		showMessage(obj,"");
		return true;
		 }else{
		showMessage(obj,"字母、数字、下划线组成、字母开头、长度6-16之间");
		return false;
		 }
	 }else{
			return false;
	}
	}else{
		return false;
	}
}

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
    
    <div class="formtitle"><span>用户基本信息</span></div>
    <form action="updatePasswordmanagerAction.action" method="post" id="form1">
    <input name="manager.id" type="hidden" value="<s:property value="#session.admin.id"/>" />
    <ul class="forminfo">
    <li><label>原&nbsp;密&nbsp;&nbsp;码:</label><input name="" id="oldPassword"   onblur="isRight(this)" type="password" class="dfinput isRight" /></li>
    <li><label>新&nbsp;密&nbsp;&nbsp;码:</label><input name="" id="newPassword" onblur="checkUP(this)" type="password" class="dfinput  checkUP" /></li>
    <li><label>确认密码:</label><input name="manager.password"  onblur="checkRPassword(this)" id="rnewPassword" type="password" class="dfinput  checkRPassword" /><font color="red" id="showMess"></font></li>
    <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="修改密码"/></li>
    </ul>
    </form>
    </div>
</body>

</html>

