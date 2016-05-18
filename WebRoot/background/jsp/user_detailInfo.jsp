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
<script type="text/javascript" src="<%=path%>/background/js/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/common/validate.js"></script>

</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">用户管理</a></li>
    <li><a href="#">添加用户</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>用户基本信息</span></div>
    <input name="manager.authorityRank" type="hidden" value="0" />
    <ul class="forminfo">
    <li><label>用户名:</label><label><s:property value="manager.username"/></label></li>
    <li><label>姓&nbsp;&nbsp;名:</label><label><s:property value="manager.realName"/></label></li>
    <li><label>性&nbsp;&nbsp;别:</label><label><s:property value="manager.sex"/></label><cite>
      </cite></li>
    <li><label>年&nbsp;&nbsp;龄:</label><label><s:property value="manager.age"/></label></li>
    <li><label>电话号码:</label><label><s:property value="manager.phone"/></label></li>
    <li><label>电子邮箱:</label><label><s:property value="manager.email"/></label></li>
    <li><label>身份证号:</label><label><s:property value="manager.idcard"/></label></li>
    <li><label>家庭住址:</label><label><s:property value="manager.address"/></label></li>
    </ul>
    </div>
</body>

</html>

