<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<title>宠物信息</title>
<link href="<%=path %>/foreground/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="<%=path %>/foreground/js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Vegetables Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--fonts-->
<link href="<%=path %>/foreground/css/style.css" rel="stylesheet" type="text/css" media="all" />	
<script src="<%=path %>/foreground/js/jquery.easydropdown.js"></script>
<script src="<%=path %>/foreground/js/jquery.min.js"></script>
<!--//fonts-->
<script type="text/javascript">
$(function(){
	$("#collection").click(function(){
		var petsId="<s:property value='dog.id'/>";
		var customerId="<s:property value='#session.customer.id'/>";
		var isExist=checkCollection();
		if(isExist){
			location.href="addCollectionCollectionAction.action?collection.customer.id="+customerId+"&collection.petsId="+petsId+"&collection.tableName=dog";
		}else{
			alert("您已经收藏过了!!!");
		}
	});
	
	
});

	function checkCollection(){
		var isExist;
		var petsId="<s:property value='dog.id'/>";
		var customerId="<s:property value='#session.customer.id'/>";
		$.ajax({
			url:"validateCollectionCollectionAction.action?collection.petsId="+petsId+"&collection.customer.id="+customerId,
			type:"post",
			success:function(data){
				var existResult=data;
				if(existResult=="exist"){
					isExist=false
				}else{
					isExist=true;
				}
			},
			dataType:"json",
			async:false
		});
		return isExist;
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
	<!---->
	<div class="banner-in">
		<div class="container">
		</div>
	</div>
<!---->
			<div class="container">
				<div class="single">
				<div class="blog-top-in">
					<div class="col-md-4 top-blog">
						<a href="#"><img class="img-responsive" src="<%=path %>/uploadFile/<s:property value="dog.defaultPicture"/>" alt=" " ></a><br /	><%--
						<s:iterator value="listPicture" var="pic">
						<a href="#"><img class="img-responsive" src="<%=path %>/uploadFile/<s:property value="#pic.pictureName"/>" width="100px" height="100px" alt=" " ></a>
						</s:iterator>
					--%></div>
					<div class="col-md-8 sed-in">
						<h4><s:property value="dog.petsType.smallType"/></h4>						
							<ul>
		  						 <li><span><i class="clock"> </i>发源地:&nbsp;<s:property value="dog.petsType.home"/></span></li>		  						 	
		  						 <li><span><i class="clock"> </i>体型:&nbsp;<s:property value="dog.shape"/></span></li>		  						 	
		  					</ul>	
							<ul>
		  						 <li><span><i class="hit"> </i>毛长:&nbsp;<s:property value="dog.woolLength"/></span></li>
		  						 <li><span><i class="hit"> </i>性别:&nbsp;<s:property value="dog.sex"/></span></li>
		  					</ul>	
							<ul>
		  						 <li><span><i class="clock"> </i>寿命:&nbsp;<s:property value="dog.life"/>年</span></li>
		  						 <li><span><i class="clock"> </i>身高:&nbsp;<s:property value="dog.height"/>厘米</span></li>
		  					</ul>	
		  					<ul>
		  						 <li><span><i class="hit"> </i>体重:&nbsp;<s:property value="dog.width"/>千克</span></li>
		  						 <li><span><i class="hit"> </i>颜色:&nbsp;<s:property value="dog.color"/></span></li>
		  					</ul>		  						
						<div class="col-md-3 look">
							<a href="javascript:void(0)" id="collection" class="btn  btn-1c">点击收藏</a>&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="confirmGetPetsAction.action?dog.id=<s:property value="dog.id"/>&address.customer.id=<s:property value="#session.customer.id"/>" class="btn  btn-1c">领&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;养</a>
						</div>
					</div>
					<div class="clearfix"> </div>
				</div>
				<p class="at-in">
				<b>宠物说明：</b><s:property value="dog.describe"/><br />
				<b>类别档案：</b><s:property value="dog.petsType.typeIntroduce"/> </p>						
						
				<div class="comment-grid-top">
			<h3>用户评价</h3>
			<s:iterator value="listComment" var="comment">
			<div class="comments-top-top">
				<div class="top-comment-left">
					<img class="img-responsive" src="<%=path %>/foreground/images/co.png" alt="" />
				</div>
				<div class="top-comment-right">
					<ul>
						<li><span class="left-at"><s:property value="#comment.customer.userName"/></span></li>
						<li><span class="right-at"><s:date name="#comment.commentDate" format="yyyy年MM月dd日  HH:mm:ss "/></span></li>
					</ul>
				<p><s:property value="#comment.comment"/> </p>
				</div>
				<div class="clearfix"> </div>
			</div>
			</s:iterator>
			<%--<div class="comments-top-top">
				<div class="top-comment-left">
					<img class="img-responsive" src="<%=path %>/foreground/images/co.png" alt="" />
				</div>
				<div class="top-comment-right">
					<ul>
						<li><span class="left-at"> Admin</span></li>
						<li><span class="right-at">12 July 2014 at 10.30am</span></li>
						<li><a class="reply" href="#">REPLY</a></li>
					</ul>
				<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.The point of using Lorem Ipsum is that it has a more-or-less </p>
				</div>
				<div class="clearfix"> </div>
			</div>
		--%></div>
		
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