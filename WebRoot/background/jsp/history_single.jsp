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
<link href="<%=path %>/background/assets/css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path %>/background/assets/js/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/background/assets/js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="<%=path %>/background/assets/js/select-ui.min.js"></script>
<script type="text/javascript" src="<%=path %>/common/validate.js"></script>
<script language="javascript">
$(function(){
	validateButton();
	$("#more").click(function(){
		var currentPage="<s:property value='resultFlg'/>";
		var id=$(".id:first").attr("id");
		var pageSize=(++currentPage)*4;
		location.href="querySingleHistoryLhAction.action?loginHistory.manager.id="+id+"&pageBean.pageSize="+ pageSize+"&resultFlg="+currentPage;
	});
})

function validateButton()
  	{
	if(<s:property value="pageBean.currentPage"/>>=<s:property value="pageBean.totalPage" />)
		{
		$("#more").attr("disabled","disabled");
		$("#more").val("没有更多了");
		}
  		
  	}

</script>




<script type="text/javascript">
$(document).ready(function(e) {
    $(".select1").uedSelect({
		width : 345			  
	});
	$(".select2").uedSelect({
		width : 167  
	});
	$(".select3").uedSelect({
		width : 100
	});
});
</script>

</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">用户管理</a></li>
    <li><a href="#">用户履历</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    
    <div id="usual1" class="usual"> 
    
  	<div id="tab2" class="tabson"><%--
    
    <form action="queryAllmanagerAction.action" method="post">
    <input  type="hidden" name="resultFlg" value=""/>
    <ul class="seachform">
    
    <li><label>用户名</label><input name="manager.username" type="text" value="<s:property value="manager.username"/>" class="scinput" /></li>
    <li><label>姓名</label><input name="manager.realName" type="text" value="<s:property value="manager.realName"/>" class="scinput" />
    </li>
    
    <li><label>&nbsp;</label>
    <input name="" type="submit" class="scbtn" value="查询"/></li>
    <li><label>&nbsp;</label>
    <input name="" type="button" class="scbtn" id="queryAll" value="查询全部"/></li>
    </ul>
</form>    
    
    --%><table class="tablelist">
    	<thead>
    	<tr>
        <th>用户名<i class="sort"><img src="<%=path %>/background/assets/images/px.gif" /></i></th>
        <th>姓名</th>
        <th>性别</th>
        <th>电话</th>
        <th>电子邮箱</th>
        <th>登录时间</th>
        </tr>
        </thead>
        <tbody id="tbody">
       <s:iterator value="pageBean.list" var="history" status="index">
       <tr>
       <td class="id" id="<s:property value="#history.manager.id"/>"><s:property value="#history.manager.username"/></td>
        <td><s:property value="#history.manager.realName"/></td>
        <td><s:property value="#history.manager.sex"/></td>
        <td><s:property value="#history.manager.phone"/></td>
        <td><s:property value="#history.manager.email"/></td>
        <td><s:date name='#history.lastLogin' format='yyyy年MM月dd日  HH:mm:ss' /></td>
        </tr>
       </s:iterator>
        </tbody>
    </table>
     <div class="pagin" align="center">
    	<input type="button" value="更多" id="more" class="btn" />
    </div>
    
  
    
    </div>  
       
	</div> 
 
	<script type="text/javascript"> 
      $("#usual1 ul").idTabs(); 
    </script>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
    
    
    
    
    
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
    


</body>

</html>

