<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<title>用户注册</title>
<link href="<%=path %>/foreground/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="<%=path %>/foreground/js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link href="<%=path %>/foreground/css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Vegetables Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--fonts-->
<link href='http://fonts.useso.com/css?family=Exo:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
<!--//fonts-->
<script src="<%=path %>/foreground/js/jquery.easydropdown.js"></script>
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
		array.push(checkUserName($("#userName")));
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


function checkUserName(obj){
	var value=$(obj).val().trim();
	var checkResult=checkUP(obj);
	if(checkResult){
		if(userNameIsExist()){
			showMessage($("#userName")[0],"");
			return true;
		}else{
			showMessage($("#userName")[0],"该用户名已存在!!!");
			return false;
		}
	}else{
		return false;
	}
}
//验证 用户名是否已存在。
function userNameIsExist()
{
	var isExist;
	var userName=$("#userName").val().trim();
	$.ajax({
		url:"isExistCustomerAction.action?customer.userName="+userName,
		type:"post",
		success:function(data){
			var result=data.result;
			if(result=="exist")
				{
				isExist=false;
				}else{
				isExist=true;
				}
		},
		dataType:"json",
		async:false
	});
	return isExist;
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
			if(value>=5&&value<=100){
				showMessage(obj,"");
				return true;
			}else{
				showMessage(obj,"年龄必须是5~100之内！！！");
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
	  <!--header-->
	<div class="header" style="background-color:#F0F0F0">
		<div class="container" >
			<div class="header-top" >
			<a href="<%=path%>/login.jsp">
			<s:if test="#session.customer!=null">
			<s:property value="#session.customer.userName"/>
			</s:if>
			<s:else>
			登录
			</s:else>
			</a>&nbsp;&nbsp;
			<a href="<%=path%>/regist.jsp">注册</a>&nbsp;&nbsp;
			<a href="loginOutCustomerAction.action">退出</a>&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="<%=path%>/queryPetsQianPetsAction.action?dog=&pageBean.currentPage=1">首页</a>&nbsp;&nbsp;
			<a href="queryAllCollectionAction.action?collection.customer.id=<s:property value="#session.customer.id"/>">我的收藏</a>&nbsp;&nbsp;
			<a href="queryAllShopCarAction.action?shopCar.customer.id=<s:property value="#session.customer.id"/>">我的订单</a>&nbsp;&nbsp;
			</div>
			<div class="header-bottom-bottom">
				<div class="top-nav">
					<span class="menu"> </span>
				<script>
					$("span.menu").click(function(){
						$(".top-nav ul").slideToggle(500, function(){
						});
					});
				</script>			
				</div>	
				<div class="clearfix"> </div>
				</div>
		</div>
	</div>
	<!---->
	<div class="banner-in">
		<div class="container">
		</div>
	</div>
<!---->
		<!--content-->
		<div class="container">
			<div class="sign">
			<h3>用户注册</h3>
			<form action="addCustomerCustomerAction.action" method="post" id="form1">
				<div>
					<label>用户名</label>
					<input type="text"  name="customer.userName" class="checkUP" id="userName" onblur="checkUserName(this)">
				</div>
				<div>
					<label>密码</label>
					<input type="password" name="customer.password" class="checkUP" onblur="checkUP(this)">
				</div>
				<div>
					<label>姓名</label>
					<input type="text" name="customer.realName" class="checkNull" onblur="checkNull(this)">
				</div>
				<div>
					<label>性别:&nbsp;&nbsp; &nbsp;
					<input type="radio" name="customer.sex" checked="checked" value="男" >男&nbsp;&nbsp;&nbsp;
					<input type="radio" name="customer.sex" value="女">女
					</label>
					
				</div>
				<div>
					<label>年龄</label>
					<input type="text" name="customer.age" class="checkAge" onblur="checkAge(this)">
				</div>
				<div>
					<label>电话</label>
					<input type="text" name="customer.phone" class="checkPhone" onblur="checkPhone(this)">
				</div>
				<div>
					<label>电子邮箱</label>
					<input type="text" name="customer.email" class="checkEmail" onblur="checkEmail(this)">
				</div>
				<div>
					<label>身份证号</label>
					<input type="text" name="customer.idcard" class="checkIDCard" onblur="checkIDCard(this)">
				</div>
					<input type="submit" value="注册">		
				</form>
				</div>
			</div>
				<!---->
			 
			<!--footer-->
			<div class="footer">
				<div class="container">
					  <p class="footer-grid">Copyright &copy; 2016.PetsOnline All rights reserved.</p>
			 	</div> 	
			</div>


</body>
</html>