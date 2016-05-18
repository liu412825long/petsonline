<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	$("#form1").submit(function(){
		var array=new Array();
		$(".checkUP").each(function(){
			array.push(checkUP(this));
		});
		
		$(".checkNull").each(function(){
			array.push(checkNull(this));
		});
		
		$(".checkAge").each(function(){
			array.push(checkAge(this));
		});
		
		$(".checkPhone").each(function(){
			array.push(checkPhone(this));
		});
		$(".checkEmail").each(function(){
			array.push(checkEmail(this));
		});
		$(".checkIDCard").each(function(){
			array.push(checkIDCard(this));
		});
		return isSubmit(array);
	});
});

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

//验证年龄是否在18~60岁
function checkAge(obj){
	var value=$(obj).val().trim();
	var checkResult=checkNull(obj);
	if(checkResult){
		if(value.validateSignlessIntegral()){
			if(value>=18&&value<=60){
				showMessage(obj,"");
				return true;
			}else{
				showMessage(obj,"年龄必须是18~60之内！！！");
				return false;
			}
		}else{
			showMessage(obj,"年龄必须是正整数！！！");
			return false;
		}
	}else{
		return false;
	}
}
//验证电话号码
function checkPhone(obj){
	var value=$(obj).val().trim();
	var checkResult=checkNull(obj);
	if(checkResult){
		if(value.isMobile()||value.isTel()){
			showMessage(obj,"");
			return true;
		}else{
			showMessage(obj,"手机号码或电话号码不正确！！！");
			return false;
		}
	}else{
		return false;
	}
}
//验证电子邮箱
function checkEmail(obj){
	var value=$(obj).val().trim();
	var checkResult=checkNull(obj);
	if(checkResult){
		if(value.validateEmail()){
			showMessage(obj,"");
			return true;
		}else{
			showMessage(obj,"电子邮箱不正确！！！");
			return false;
		}
	}else{
		return false;
	}
}

//验证身份证号
function checkIDCard(obj){
	var value=$(obj).val().trim();
	var checkResult=checkNull(obj);
	if(checkResult){
		if(isEquals(checkIdcard(value),"合法")){
			showMessage(obj,"");
			return true;
		}else{
			showMessage(obj,checkIdcard(value));
			return false;
		}
	}else{
		return false;
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
    <form action="addmanagerAction.action" method="post" id="form1">
    <input name="manager.authorityRank" type="hidden" value="0" />
    <ul class="forminfo">
    <li><label>用户名:</label><input name="manager.username" type="text" onblur="checkUP(this)" class="dfinput checkUP" /></li>
    <li><label>密&nbsp;&nbsp;码:</label><input name="manager.password"  onblur="checkUP(this)" type="password" class="dfinput  checkUP" /></li>
    <li><label>姓&nbsp;&nbsp;名:</label><input name="manager.realName" type="text" onblur="checkNull(this)" class="dfinput checkNull" value="" /></li>
    <li><label>性&nbsp;&nbsp;别:</label><cite><input name="manager.sex" type="radio" value="男" checked="checked" />男&nbsp;&nbsp;&nbsp;&nbsp;<input name="manager.sex" type="radio" value="女" />女</cite></li>
    <li><label>年&nbsp;&nbsp;龄:</label><input name="manager.age" onblur="checkAge(this)" type="text" class="dfinput checkAge" /></li>
    <li><label>电话号码:</label><input name="manager.phone" type="text" onblur="checkPhone(this)" class="dfinput checkPhone" /></li>
    <li><label>电子邮箱:</label><input name="manager.email" type="text" onblur="checkEmail(this)" class="dfinput checkEmail" /></li>
    <li><label>身份证号:</label><input name="manager.idcard" type="text" onblur="checkIDCard(this)" class="dfinput checkIDCard" /></li>
    <li><label>家庭住址:</label><textarea name="manager.address" cols="" rows="" onblur="checkNull(this)" class="textinput checkNull"></textarea></li>
    <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="添加"/></li>
    </ul>
    </form>
    </div>
</body>

</html>

