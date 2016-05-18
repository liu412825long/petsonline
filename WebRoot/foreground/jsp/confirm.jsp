<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<title>Blog</title>
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
<script type="text/javascript" src="<%=path %>/background/assets/js/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/common/validate.js"></script>
<script type="text/javascript">
function addAddress(){
	var result=window.showModalDialog("queryAllAddressAddressAction.action?result=&address.customer.id=<s:property value='#session.customer.id'/>",window,"width:300px,height:200px,status:no");
	if(result=="success"){
		window.location.reload();
	}
}

$(function(){
	$("#confirmBuy").click(function(){
		var address=$("#address").html().trim();
		if(address.isNull()){
			alert("请填写收货地址！！！");
		}else{
		$("#form1").submit();
		}
	});
});

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
			<div class="container">
				<div class="blog">
				<div class="blog-top">
					<div class="col-md-4 top-blog">
						<a href="single.html"><img class="img-responsive" src="<%=path %>/uploadFile/<s:property value="dog.defaultPicture"/>" alt=" " ></a>
					</div>
					<div class="col-md-8 sed-in">
						<h4><a href="single.html">领养信息确认：</a></h4>				
							<ul>
								<li><a href="#"><span> <i class="clock"> </i>宠物类型：<s:property value="dog.petsType.smallType"/></span> </a> </li>
		  						 <li><span> <i class="clock"> </i>体型 ：<s:property value="dog.shape"/></span></li>		  						 	
		  						 <li><span><i class="clock"> </i>性别：<s:property value="dog.sex"/></span></li>
		  					</ul>		  						
							<ul>
								<li><a href="#"><span><i> </i>客户姓名：<s:property value="#session.customer.realName"/></span> </a> </li>
		  						 <li><span><i> </i>客户电话：<s:property value="#session.customer.phone"/></span></li>		  						 	
		  						 <li><span><i> </i>客户邮箱：<s:property value="#session.customer.email"/></span></li>
		  					</ul>
		  					<h4>寄送地址：<a  class="reply" onclick="addAddress()"  href="javascript:void(0)"><font size="2" color="orange">(修改地址)</font></a></h4>
		  					<ul>
								<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font id="address"><s:property value="address.address"/></font></li>
		  					</ul>
		  					<form action="addOrderShopCarAction.action" method="post" id="form1">
		  					<input type="hidden" name="shopCar.tableName" value="dog"/>
		  					<input type="hidden" name="shopCar.petsId" value="<s:property value="dog.id"/>"/>
		  					<input type="hidden" name="shopCar.customer.id" value="<s:property value="#session.customer.id"/>"/>
		  					<input type="hidden" name="shopCar.status" value="未发货"/>
		  					<input type="hidden" name="dog.id" value="<s:property value="dog.id"/>"/>
		  					<input type="hidden" name="shopCar.address" value="<s:property value="address.address"/>"/>
		  					 <a href="javascript:void(0)" id="confirmBuy" class="btn  btn-1c">确认领养</a>
		  					
		  					</form>
		  					<br />
		  					<br />
					</div>
					<div class="clearfix"> </div>
				</div>
				 <h4><a href="single.html">宠物介绍：</a></h4>				  						
						<p><s:property value="dog.describe"/></p>
				<%--<ul class="start">
					<li><span>Start</span></li>
					<li><span>Prev</span></li>
					<li><span>1</span></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">Next</a></li>
					<li><a href="#">End</a></li>
				</ul>
				--%></div>
				
				</div>
			 
				
			<!--footer-->
			<div class="footer">
				<div class="container">
				 <p class="footer-grid">Copyright &copy; 2016.PetsOnline All rights reserved.</p>
			 	</div> 	
			</div>



</body>
</html>