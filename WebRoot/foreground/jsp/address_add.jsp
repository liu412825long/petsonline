<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<title>添加地址</title>
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
<!--//fonts-->
<script src="<%=path %>/foreground/js/jquery.easydropdown.js"></script>
<script type="text/javascript" src="<%=path%>/background/js/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/common/validate.js"></script>
<script type="text/javascript">
var oldAddressId;
$(function(){
	oldAddressId=$("input:checked").attr("id");
	var result="<s:property value='result'/>";
	if(result=="addSuccess"){
		alert("新地址添加成功!!!");
		window.returnValue="success";
		window.close();
	}
	if(result=="modifySuccess"){
		alert("默认地址修改成功！！！");
		window.returnValue="success";
		window.close();
	}
});

function addNewAddress(){
	var value=$("#newAddress").val().trim();
	if(value.isNull()){
		var newAddressId=$("input:checked").attr("id");
		if(isEquals(oldAddressId,newAddressId)){
			window.close();
		}else{
			location.href="modifyDefaultAddressAddressAction.action?oldAddress="+oldAddressId+"&newAddress="+newAddressId;
		}
		return false;
	}else{
		return true;
	}
}

</script>

</head>
<body> 
	
		<!--content-->
		<div class="container">
			<div class="sign">
			<h3>用户地址</h3>
			<s:iterator value="addressList" var="address">
			<s:if test="#address.defaultAddress==1">
				<div>
					<label><input type="radio" class="myAddress" checked="checked" id="<s:property value="#address.id"/>" name="address.defaultAddress" value="1" />&nbsp;&nbsp;<s:property value="#address.address"/></label>
				</div>
				</s:if>
				<s:else>
					<div>
					<label><input type="radio" class="myAddress" name="address.defaultAddress" id="<s:property value="#address.id"/>"  value="0"/>&nbsp;&nbsp;<s:property value="#address.address"/></label>
				</div>
				</s:else>
				</s:iterator>
			<form action="addAddressAddressAction.action" onsubmit="return addNewAddress();" method="post" id="form1">
				<div>
					<label>新增地址</label>
					<input type="text" name="address.address" id="newAddress" >
				</div>
				<input type="hidden" name="address.defaultAddress" value="1" />
				<input type="hidden" name="address.customer.id" value="<s:property value="#session.customer.id"/>" />
					<input type="submit" id="submitAddress" value="确认地址">		
				</form>
				</div>
			</div>
				<!---->
		


</body>
</html>