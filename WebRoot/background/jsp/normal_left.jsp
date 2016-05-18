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
<title>宠物管理系统后台</title>
<link href="<%=path %>/background/assets/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="<%=path %>/background/assets/js/jquery.js"></script>

<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson li").click(function(){
		$(".menuson li.active").removeClass("active")
		$(this).addClass("active");
	});
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if($ul.is(':visible')){
			$(this).next('ul').slideUp();
		}else{
			$(this).next('ul').slideDown();
		}
	});
})	
</script>


</head>

<body style="background:#f0f9fd;">
	<div class="lefttop"><span></span>菜单管理</div>
    
    <dl class="leftmenu">
        
    <dd>
    <div class="title">
    <span><img src="<%=path %>/background/assets/images/leftico01.png" /></span>宠物管理
    </div>
    	<ul class="menuson">
        <li><cite></cite><a href="queryPageBeanptAction.action?petsType=&resultFlg=" target="rightFrame">宠物类型</a><i></i></li>
        <li><cite></cite><a href="queryPetsTypeptAction.action?resultFlg=" target="rightFrame">添加宠物</a><i></i></li>
        <li><cite></cite><a href="queryPetsPetsAction.action?resultFlg=" target="rightFrame">查看宠物</a><i></i></li><%--
        <li><cite></cite><a href="imgtable.html" target="rightFrame">图片数据表</a><i></i></li>
        <li><cite></cite><a href="form.html" target="rightFrame">添加编辑</a><i></i></li>
        <li><cite></cite><a href="imglist.html" target="rightFrame">图片列表</a><i></i></li>
        <li><cite></cite><a href="imglist1.html" target="rightFrame">自定义</a><i></i></li>
        <li><cite></cite><a href="tools.html" target="rightFrame">常用工具</a><i></i></li>
        <li><cite></cite><a href="filelist.html" target="rightFrame">信息管理</a><i></i></li>
        <li><cite></cite><a href="tab.html" target="rightFrame">Tab页</a><i></i></li>
        <li><cite></cite><a href="error.html" target="rightFrame">404页面</a><i></i></li>
        --%></ul>    
    </dd>
    
    
    <dd><div class="title"><span><img src="<%=path %>/background/assets/images/leftico03.png" /></span>领养统计</div>
    <ul class="menuson">
        <li><cite></cite><a href="queryAllHouShopCarAction.action" target="rightFrame" >查询订单</a><i></i></li>
    </ul>    
    </dd>  
    
    
    <dd><div class="title"><span><img src="<%=path %>/background/assets/images/leftico04.png" /></span>客户管理</div>
    <ul class="menuson">
        <li><cite></cite><a href="queryAllCustomerAction.action?customer=&pageBean=" target="rightFrame">查询客户</a><i></i></li>
    </ul>
    
    </dd>  
    
    <dd><div class="title"><span><img src="<%=path %>/background/assets/images/t05.png" width="16px" height="16px" /></span>高级设置</div>
    <ul class="menuson">
        <li><cite></cite><a href="beforeUpdatePassmanagerAction.action" target="rightFrame">修改密码</a><i></i></li>
        <li><cite></cite><a href="queryDetailmanagerAction.action?resultFlg=query&manager.id=<s:property value="#session.admin.id"/>" target="rightFrame">查询信息</a><i></i></li>
        <li><cite></cite><a href="queryDetailmanagerAction.action?resultFlg=update&manager.id=<s:property value="#session.admin.id"/>" target="rightFrame">修改信息</a><i></i></li>
    </ul>
    
    </dd>   
    
    </dl>
    
</body>
</html>

