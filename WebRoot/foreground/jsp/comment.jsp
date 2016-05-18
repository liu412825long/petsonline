<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
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
<link href="<%=path %>/background/assets/css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path %>/background/assets/js/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/background/assets/js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="<%=path %>/background/assets/js/select-ui.min.js"></script>
<script type="text/javascript" src="<%=path %>/common/validate.js"></script>
<title>宠物信息</title>
<link href="<%=path %>/foreground/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="<%=path %>/foreground/js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link href="<%=path %>/foreground/css/style.css" rel="stylesheet" type="text/css" media="all" />	
<script src="<%=path %>/foreground/js/jquery.easydropdown.js"></script>	
<script type="text/javascript" src="<%=path %>/background/assets/js/jquery.js"></script>

</head>

<body>
  <form action="queryAllShopCarAction.action" id="form1" method="post">
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
				</div>	
				<div class="clearfix"> </div>
				</div>
		</div>
	</div>
    <div class="banner-in">
		<div class="container">
		</div>
	</div>
    <div class="formbody">
    
    
  <div class="container">
			<div class="contact">
			<h3>我的评价</h3>
			<form action="addCommentCommentAction.action" method="post" id="form1">
			<input type="hidden" name="comment.dog.id" value="<s:property value="dog.id"/>"/>
			<input type="hidden" name="shopCar.id" value="<s:property value="shopCar.id"/>"/>
			<input type="hidden" name="comment.customer.id" value="<s:property value="#session.customer.id"/>"/>
					<textarea cols="77" rows="6" onfocus="this.value='';" name="comment.comment" onblur=""></textarea>
					<div class="send ">
						<input type="submit" value="发表评价" />
					</div>
				</form>
				</div>
			</div>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
    
    
    
    
    
    </div>
    	<!--footer-->
			<div class="footer">
				<div class="container">
				 <p class="footer-grid">Copyright &copy; 2016.PetsOnline All rights reserved.</p>
			 	</div> 	
			</div>
      
    
  
    


</body>

</html>