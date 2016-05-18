<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>后台登录</title>
<meta name="author" content="DeathGhost" />
<link rel="stylesheet" type="text/css" href="<%=path %>/background/css/style.css" />
<style>
body{height:100%;background:#16a085;overflow:hidden;}
canvas{z-index:-1;position:absolute;}
</style>
<script src="<%=path %>/background/js/jquery.js"></script>
<script src="<%=path %>/background/js/verificationNumbers.js"></script>
<script src="<%=path %>/background/js/Particleground.js"></script>
<script type="text/javascript" src="<%=path %>/common/validate.js"></script>
<script>
$(document).ready(function() {
	$("#username").focus();
  //粒子背景特效
  $('body').particleground({
    dotColor: '#5cbdaa',
    lineColor: '#5cbdaa'
  });
 
  //测试提交，对接程序删除即可
  $(".submit_btn").click(function(){
	  var code=$("#code").val();
	  var inputCode=$("#J_codetext").val().trim().toUpperCase();
	  if(inputCode.isNull())
		  {
		  alert("验证码不能为空！！");
		  }else{
			  if(isEquals(code,inputCode))
				  {
				  $("#submitForm").submit();
				  }else{
					  alert("验证码不正确！！");
				  }
		  }
	  });

});

$(function(){
	 //验证码
	   var code=createCode().toUpperCase();
		$("#code").val(code);
	$("#myCanvas").click(function(){
		code=createCode().toUpperCase();
		$("#code").val(code);
	});
	$("#checkButton").click(function(){
		code=createCode().toUpperCase();
		$("#code").val(code);
	});
})

/**
 *判断用户名和密码是否为空 
 */
function checkNull(obj)
{
	 var value=$(obj).val();
	 if(value.isNull())
		 {
		 $("#showInfo").html("登陆的关键信息不能为空！");
		 }else{
		 $("#showInfo").html("");
		 }
}
</script>
</head>
<body>
 <input type="hidden" id="code" value=""/>
<form action="validateLoginmanagerAction.action" id="submitForm" method="post">
<input type="hidden" name="resultFlg" value="">
<dl class="admin_login">
 <dt>
  <strong>站点后台管理系统</strong>
  <em>Management System</em>
 </dt>
 <dd class="user_icon">
  <input type="text" placeholder="账号" id="username" onblur="checkNull(this)" name="manager.username" class="login_txtbx"/>
 </dd>
 <dd class="pwd_icon">
  <input type="password" placeholder="密码" onblur="checkNull(this)"  name="manager.password" class="login_txtbx"/>
 </dd>
 <dd class="val_icon">
  <div class="checkcode">
    <input type="text" id="J_codetext" placeholder="验证码" maxlength="4" class="login_txtbx">
    <canvas class="J_codeimg" id="myCanvas"  >对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas>
  </div>
  <input type="button" id="checkButton" value="验证码更换" class="ver_btn"><br />
 </dd>
 <dd>
 <div align="center">
  <input type="radio" value="0" name="manager.authorityRank" id="normal" checked="checked"/><font size=3><label for="normal">普通用户</label></font>
  &nbsp;&nbsp;&nbsp;
  <input type="radio" value="1" name="manager.authorityRank" id="admin"/><font size=3><label for="admin">管理员</label></font>
 </div>
 </dd>
 <dd>
  <input type="button" value="立即登陆" class="submit_btn"/>
 </dd>
 <dd>
  <p><span><font size="3" face="微软雅黑" id="showInfo" color="red">
  	<!-- 登录失败的提示 -->
	<s:property value="toFolder"/>
  </font></span><br />
  © 2016-2020 PetsOnline 版权所有</p>
 </dd>
</dl>
</form>
</body>
</html>
