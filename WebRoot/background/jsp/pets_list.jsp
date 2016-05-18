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
<script type="text/javascript" src="<%=path %>/background/assets/js/jquery.js"></script>
<script language="javascript">
$(function(){	
	//导航切换
	$(".imglist li").click(function(){
		$(".imglist li.selected").removeClass("selected")
		$(this).addClass("selected");
	})	
})	
</script>

<script type="text/javascript">
$(function(){
	$(".delete").click(function(){
		var location=$(this).attr("id");
		  $(".tip").fadeIn(200);
		  $(".sure").attr("id",location);
		
	})
	$(".cancel").click(function(){
		  $(".tip").fadeOut(100);
		});
	
	$(".sure").click(function(){
		var id=$(this).attr("id");
		 $(".tip").fadeOut(100);
		location.href="<%=path%>/deletePetsPetsAction.action?dog.id="+id;
	});
});

</script>
<script language="javascript">
$(function(){
var resultFlg="<s:property value='resultFlg'/>";
if(resultFlg=="addSuccess"){
	alert("添加成功！！！");
}
if(resultFlg=="deleteSuccess"){
	alert("删除成功！！！");
}
})
</script>



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

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">模块设计</a></li>
    <li><a href="#">图片</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    
    	<ul class="toolbar">
        <li class="click">
        <a href="queryPetsTypeptAction.action?resultFlg=">
        <span>
        <img src="<%=path %>/background/assets/images/t01.png" /></span>添加
        </a>
        </li>
        </ul>
        
        
        <ul class="toolbar1">
        <li><span><img src="<%=path %>/background/assets/images/t05.png" /></span>设置</li>
        </ul>
    
    </div>
    
    <ul class="classlist">
    <s:iterator value="pageBean.list" var="dog" status="stat">
    
    <li>
    <span><img src="<%=path %>/uploadFile/<s:property value="#dog.defaultPicture"/>" width="106px" height="126px"/></span>
    <div class="lright">
    <h2><s:property value="#dog.petsType.smallType" /></h2>
    <p>发源地：<s:property value="#dog.petsType.home" /><br />
    	寿命：<s:property value="#dog.life" />年<br />
    	</p>
    <a class="enter" href="detailPetInfoPetsAction.action?dog.id=<s:property value="#dog.id" />&picture.refId=<s:property value="#dog.id" />">了解更多</a>
    <a class="enter delete" id="<s:property value="#dog.id" />">删除</a>
    </div>
    </li>
    </s:iterator>
    
   
    
    </ul>
    
    <div class="clear">
     <form action="queryPetsPetsAction.action" id="form1" method="post">
  <input type="hidden" name="pageBean.currentPage" id="currentPage" value="<s:property value="pageBean.currentPage"/>" />
  <input type="hidden" name="resultFlg"   value="" />
  </form>
    </div>
   
    <div class="pagin">
    	<div class="message">共<i class="blue"><s:property value="pageBean.total"/></i>条记录，当前显示第&nbsp;<i class="blue"><s:property value="pageBean.currentPage"/>&nbsp;</i>页</div>
        <ul class="paginList">
        <li class="paginItem">
       <input type="button" value="首页"  id="firstPage" class="pageButton btn" />
    			<input type="button" value="上一页" id="prePage" class="pageButton btn" />
    			<s:property  value="pageBean.currentPage"/>/
    			<s:property value="pageBean.totalPage" />
    			<input type="button" value="下一页" id="nextPage" class="pageButton btn" />
    			<input type="button" value="尾页" id="lastPage" class="pageButton btn" />
        </li>
        </ul>
    </div>
    
    
    <div class="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        
      <div class="tipinfo">
        <span><img src="<%=path %>/background/assets/images/ticon.png" /></span>
        <div class="tipright">
        <p>是否删除该条信息 ？</p>
        <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
        </div>
        </div>
        
        <div class="tipbtn">
        <input name="" type="button"  class="sure" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
        </div>
    
    </div>
    
    </div>
    

</body>

</html>

