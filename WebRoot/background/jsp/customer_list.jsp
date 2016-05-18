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


	<script type="text/javascript">
  	$(function(){
  		validateButton();
  		$(".pageButton").click(function(){
  			goPage(this);
  		});
  	});
  	
  	function validateButton()
  	{
   		if(<s:property value="pageBean.currentPage"/><=1)
		{
		$("#firstPage").attr("disabled","disabled");
		$("#prePage").attr("disabled","disabled");
		}
	if(<s:property value="pageBean.currentPage"/>>=<s:property value="pageBean.totalPage" />)
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
    <li><a href="#">客户管理</a></li>
    <li><a href="#">查询客户</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    
    <div id="usual1" class="usual"> 
    
   
    
    
    
  	<div id="tab2" class="tabson">
    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th>用户姓名<i class="sort"><img src="<%=path %>/background/assets/images/px.gif" /></i></th>
        <th>年龄</th>
        <th>性别</th>
        <th>手机号码</th>
        <th>电子邮箱</th>
        <th>注册日期</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator value="pageBean.list" var="customer">
        <tr>
        <td><s:property value="#customer.realName"/></td>
        <td><s:property value="#customer.sex"/></td>
        <td><s:property value="#customer.age"/></td>
        <td><s:property value="#customer.phone"/></td>
        <td><s:property value="#customer.email"/></td>
        <td><s:date name="#customer.registDate" format="yyyy年MM月dd日" /> </td>
        </tr> 
        </s:iterator>
    
        </tbody>
    </table>
    
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
    
      <div class="clear">
     <form action="queryAllCustomerAction.action" id="form1" method="post">
  <input type="hidden" name="pageBean.currentPage" id="currentPage" value="<s:property value="pageBean.currentPage"/>" />
  <input type="hidden" name="resultFlg"   value="" />
  </form>
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


</body>

</html>

