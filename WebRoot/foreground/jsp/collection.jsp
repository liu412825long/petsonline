<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<title>Services</title>
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
<link href="<%=path %>/background/assets/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/background/js/jquery.js"></script>
<!--//fonts-->
<script type="text/javascript">
$(function(){
	var result="<s:property value='result'/>";
	if(result=="deleteSuccess"){
		alert("移除成功！！！");
	}
});
</script>

<script type="text/javascript">
  	$(function(){
  		$(".pageButton").click(function(){
  			goPage(this);
  			
  		});
  		
  		
  	});
  	
  	
  	function goPage(button)
  	{
  		var id=$(button).attr("id");
  		var curr=Number(<s:property value="pageBean.currentPage" />);
  		switch(id)
  		{
  		case "prePage":
  			$("#currentPage").val(--curr+"");
  			break;
  		case "nextPage":
  			$("#currentPage").val(++curr+"");
  			break;
  		} 	
  		$("#form1").submit();
			
  	}
  	
  	</script>
</head>
<body> 
<form action="queryAllCollectionAction.action" id="form1" method="post">
  <input type="hidden" name="pageBean.currentPage" id="currentPage" value="<s:property value="pageBean.currentPage"/>" />
  </form>
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
    <div class="banner-in">
		<div class="container">
		</div>
	</div>
<!---->
 <div class="">
<h3> 我的收藏</h3>
	</div>
		 <div class="rightinfo" align="center">
    <ul class="imglist">
   <s:iterator value="pageBean.list" var="cd">
    <li class="selected">
    <span><a href="queryOneQianPetsAction.action?comment.dog.id=<s:property value="#cd[1].id"/>&dog.id=<s:property value="#cd[1].id"/>&picture.refId=<s:property value="#cd[1].id"/>">
    <img src="<%=path %>/uploadFile/<s:property value="#cd[1].defaultPicture"/>" width="167px" height="127px"/>
    </a>
    </span>
    <h2><a href="queryOneQianPetsAction.action?comment.dog.id=<s:property value="#cd[1].id"/>&dog.id=<s:property value="#cd[1].id"/>&picture.refId=<s:property value="#cd[1].id"/>"><s:property value="#cd[1].petsType.smallType"/></a></h2>
    <p><a href="deleteCollectionAction.action?collection.id=<s:property value="#cd[0].id"/>">移除收藏</a></p>
    </li>
    
   </s:iterator>
    
    </ul>
   
    <div class="pagin">
    	<div class="message">共<i class="blue"><s:property value="pageBean.total"/></i>条记录，当前显示第&nbsp;<i class="blue"><s:property value="pageBean.currentPage"/>&nbsp;</i>页</div>
        <ul class="paginList">
        <li class="paginItem pageButton" id="prePage"><a href="javascript:;"><span class="pagepre"></span></a></li>
        <li class="paginItem pageButton" id="nextPage"><a href="javascript:;"><span class="pagenxt"></span></a></li>
        </ul>
    </div>
    	</div>
    	<br/><br/><br/>
		<!--footer-->
			<div class="footer">
				<div class="container">
				 <p class="footer-grid">Copyright &copy; 2016.PetsOnline All rights reserved.</p>
			 	</div> 	
			</div>
      
    

</body>
</html>