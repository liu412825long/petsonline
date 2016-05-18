<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<link href="<%=path %>/foreground/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<script src="<%=path %>/foreground/js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link href="<%=path %>/foreground/css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Vegetables Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<!--fonts-->
<!--//fonts-->
<script src="<%=path %>/foreground/js/jquery.easydropdown.js"></script>
<script type="text/javascript" src="<%=path %>/background/assets/js/jquery.js"></script>
<script type="text/javascript">
	$(function(){
		validateButton();
		$(".pageButton").click(function(){
			goPage(this);
		});
	});
	
	function validateButton()
	{
		if(<s:property value="pageBean.currentPage"/>==1)
	{
	$("#firstPage").attr("disabled","disabled");
	$("#prePage").attr("disabled","disabled");
	}
if(<s:property value="pageBean.currentPage"/>==<s:property value="pageBean.totalPage" />)
	{
	$("#nextPage").attr("disabled","disabled");
	$("#lastPage").attr("disabled","disabled");
	}
		
	}
	
	function goPage(button)
	{
		var id=$(button).attr("id");
		var curr=Number(<s:property value="pageBean.currentPage" />);
		switch(id)
		{
		case "firstPage":
			$("#currentPage").val("1");
			break;
		case "prePage":
			$("#currentPage").val(--curr+"");
			break;
		case "nextPage":
			$("#currentPage").val(++curr+"");
			break;
		case "lastPage":
			$("#currentPage").val("<s:property value="pageBean.totalPage"/>");
			break;
		} 		
		$("#form1").submit();
	}
	
	</script>
</head>
<body> 

 <div class="clear">
     <form action="queryPetsQianPetsAction.action" id="form1" method="post">
  <input type="hidden" name="pageBean.currentPage" id="currentPage" value="<s:property value="pageBean.currentPage"/>" />
  <input type="hidden" name="resultFlg"   value="" />
  </form>
    </div>
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
	<div class="banner">
	<!--slider-script-->
		<script src="<%=path %>/foreground/js/responsiveslides.min.js"></script>
			<script>
				$(function () {
				  $("#slider").responsiveSlides({
					auto: true,
					speed: 500,
					namespace: "callbacks",
					pager: true,
				  });
				});
			</script>
			<!--//slider-script-->
				<!-- Slideshow 4 -->
			    <div  id="top" class="callbacks_container">
			      <ul class="rslides" id="slider">
			        <li>
			          <img src="<%=path %>/foreground/images/banner.jpg" alt="" />
			        </li>
			        <li>
			          <img src="<%=path %>/foreground/images/banner2.jpg" alt="" />
			        </li>
			        <li>
			          <img src="<%=path %>/foreground/images/banner.jpg" alt="" />
			        </li>
			      </ul>
			    </div>
			</div>				
			<!-- //slider--><%--
            <div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >企业网站模板</a></div>
			--%><!--content-->
			<div class="content">
				<div class="container">
				<div class="top-content">
					<div class="content-top">
					<s:iterator value="pageBean.list" var="pets">
						<div class="col-md-3 look">
							<h4><a href="single.html"><s:property value="#pets.petsType.smallType"/></a></h4>
							<a href="queryOneQianPetsAction.action?comment.dog.id=<s:property value="#pets.id"/>&dog.id=<s:property value="#pets.id"/>&picture.refId=<s:property value="#pets.id"/>" >
							<img class="img-responsive" width="256px"  height="176px" src="<%=path %>/uploadFile/<s:property value="#pets.defaultPicture"/>" alt=" " ></a>
							<p>性别：<s:property value="#pets.sex"/><br />
							体型：<s:property value="#pets.shape"/><br /></p>
							<a href="queryOneQianPetsAction.action?comment.dog.id=<s:property value="#pets.id"/>&dog.id=<s:property value="#pets.id"/>&picture.refId=<s:property value="#pets.id"/>" class="btn  btn-1c">了解更多</a>
							<a href="confirmGetPetsAction.action?dog.id=<s:property value="#pets.id"/>&address.customer.id=<s:property value="#session.customer.id"/>" class="btn  btn-1c">领养</a>
						</div>
						</s:iterator>
						<%--<div class="col-md-3 look">
							<h4><a href="single.html">Internet tend to repeat </a></h4>
							<a href="single.html"><img class="img-responsive" src="<%=path %>/foreground/images/pi4.jpg" alt=" " ></a>
							<p>content here', making it look like readable English. Many desktop publishing packages </p>
							<a href="single.html" class="btn  btn-1c">Learn More</a>
						</div>
						<div class="col-md-3 look">
							<h4><a href="single.html">Internet tend to repeat </a></h4>
							<a href="single.html"><img class="img-responsive" src="<%=path %>/foreground/images/pi4.jpg" alt=" " ></a>
							<p>content here', making it look like readable English. Many desktop publishing packages </p>
							<a href="single.html" class="btn  btn-1c">Learn More</a>
						</div>
						<div class="col-md-3 look">
							<h4><a href="single.html">Internet tend to repeat </a></h4>
							<a href="single.html"><img class="img-responsive" src="<%=path %>/foreground/images/pi4.jpg" alt=" " ></a>
							<p>content here', making it look like readable English. Many desktop publishing packages </p>
							<a href="single.html" class="btn  btn-1c">Learn More</a>
						</div>
						<div class="col-md-3 look">
							<h4><a href="single.html">Internet tend to repeat </a></h4>
							<a href="single.html"><img class="img-responsive" src="<%=path %>/foreground/images/pi4.jpg" alt=" " ></a>
							<p>content here', making it look like readable English. Many desktop publishing packages </p>
							<a href="single.html" class="btn  btn-1c">Learn More</a>
						</div>
						<div class="col-md-3 look">
							<h4><a href="single.html">Internet tend to repeat </a></h4>
							<a href="single.html"><img class="img-responsive" src="<%=path %>/foreground/images/pi4.jpg" alt=" " ></a>
							<p>content here', making it look like readable English. Many desktop publishing packages </p>
							<a href="single.html" class="btn  btn-1c">Learn More</a>
						</div>
						<div class="col-md-3 look">
							<h4><a href="single.html">Internet tend to repeat </a></h4>
							<a href="single.html"><img class="img-responsive" src="<%=path %>/foreground/images/pi4.jpg" alt=" " ></a>
							<p>content here', making it look like readable English. Many desktop publishing packages </p>
							<a href="single.html" class="btn  btn-1c">Learn More</a>
						</div>
						<div class="col-md-3 look">
							<h4><a href="single.html">Internet tend to repeat </a></h4>
							<a href="single.html"><img class="img-responsive" src="<%=path %>/foreground/images/pi5.jpg" alt=" " ></a>
							<p>content here', making it look like readable English. Many desktop publishing packages </p>
							<a href="single.html" class="btn  btn-1c">Learn More</a>
						</div>
						<div class="col-md-3 look">
							<h4><a href="single.html">Internet tend to repeat </a></h4>
							<a href="single.html"><img class="img-responsive" src="<%=path %>/foreground/images/pi6.jpg" alt=" " ></a>
							<p>content here', making it look like readable English. Many desktop publishing packages </p>
							<a href="single.html" class="btn  btn-1c">Learn More</a>
						</div>
						<div class="col-md-3 look">
							<h4><a href="single.html">Internet tend to repeat </a></h4>
							<a href="single.html"><img class="img-responsive" src="<%=path %>/foreground/images/pi7.jpg" alt=" " ></a>
							<p>content here', making it look like readable English. Many desktop publishing packages </p>
							<a href="single.html" class="btn  btn-1c">Learn More</a>
						</div>
						--%><div class="clearfix"> </div>
					</div>
					<ul class="start">
					<li><a href="javascript:void(0)" id="firstPage" class="pageButton">首页</a></li>
					<li><a href="javascript:void(0)" id="prePage"   class="pageButton">上一页</a></li>
					<li><s:property value="pageBean.currentPage" />/</li>
					<li><s:property value="pageBean.totalPage" /></li>
					<li><a href="javascript:void(0)" id="nextPage"  class="pageButton">下一页</a></li>
					<li><a href="javascript:void(0)" id="lastPage"  class="pageButton">尾页</a></li>
				</ul>
					</div>
				</div>
			</div>
			<!--footer-->
			<div class="footer">
				<div class="container">
					   <p class="footer-grid">Copyright &copy; 2016.PetsOnline All rights reserved.</p>
			 	</div> 	
			</div>


</body>
</html>