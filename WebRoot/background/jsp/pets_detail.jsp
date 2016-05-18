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
        <a href="modifyBeforePetsAction.action?dog.id=<s:property value="dog.id"/>&picture.refId=<s:property value="dog.id"/>">
        <span><img src="<%=path %>/background/assets/images//t02.png" /></span>修改
        </a>
        </li>
        </ul>
    	
    </div>
    
    
    <table class="tablelist" border="1px" width="60%">
    	<thead>
    	<tr>
        <th width="100px">宠物类型</th>
        <th width="100px">体型</th>
        <th width="100px">性别</th>
        <th width="100px">寿命</th>
        <th width="100px">身高</th> 
        </tr>
        </thead>
        <tbody>
          <tr>
         <td width="100px"><s:property value="dog.petsType.smallType"/></td>
        <td width="100px"><s:property value="dog.shape"/></td>
        <td width="100px"><s:property value="dog.sex"/></td>
        <td width="100px"><s:property value="dog.life"/>年</td>
        <td width="100px"><s:property value="dog.height"/>厘米</td>
        </tr> 
        
         <tr>
       <th width="100px">体重</th>
        <th width="100px">毛长</th>
        <th width="100px">颜色</th>
        <th width="100px">参考价格</th>
        <th >库存</th>
        </tr> 
        
         <tr>
        
        <td width="100px"><s:property value="dog.width"/>千克</td>
        <td width="100px"><s:property value="dog.woolLength"/></td>
        <td width="100px"><s:property value="dog.color"/></td>
        <td width="100px"><s:property value="dog.salePrice"/>元</td>
        <td ><s:property value="dog.count"/>只</td>
        </tr> 
        
         <tr>
       <th width="100px" ><b>宠物简介</b></th>
        <th colspan="4"></th>
        </tr> 
        
          <tr>
        
        <td width="100px" colspan="5">
        <p> <s:property value="dog.describe"/>
        </p>
        </td>
        </tr> 
        
          <tr>
       <th width="100px" ><b>宠物图片</b></th>
        <th colspan="4"></th>
        </tr> 
        
         <tr>
        
        <td width="100px" colspan="5">
          <ul class="imglist">
      <s:iterator value="listPicture" var ="pic">
       <li class="selected">
    <span><img src="<%=path %>/uploadFile/<s:property value="#pic.pictureName"/>"  width="164px" height="178px"/></span>
    </li>
      </s:iterator>
      </ul>
        </td>
        </tr> 
        
        
        </tbody>
    </table>
     
   
    
    <div class="tip" >
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        
      <div class="tipinfo">
        <span><img src="<%=path %>/background/assets/images/ticon.png" /></span>
        <div class="tipright">
        <p id="content">是否删除该条记录 ？</p>
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

