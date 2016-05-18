<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
    <form action="test.action">
    	名字：<input type="text" name="test.name" /><br />
    	<input type="submit" value="提交" /><br /><%--
    	取得配置文件中的对应的语言
    	--%><s:property value="%{getText('NAME')}"/>
    	<s:property value="request_locale"/>
    	<a href="changeLanAction.action?currentPage=test.jsp&request_locale=en_GB"><s:property value="%{getText('CHANGELAN')}"/></a>
    	<s:property value="currentPage"/>
    </form>
  </body>
</html>
