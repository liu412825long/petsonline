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
var resultFlg="<s:property value='resultFlg'/>";
if(resultFlg=="addSuccess"){
	alert("添加成功！！！");
}
if(resultFlg=="deleteSuccess"){
	alert("删除成功！！！");
}

if(resultFlg=="updateSuccess"){
	alert("修改成功！！！");
}

$(".update").click(function(){
	var password=$(this).attr("id");
	var id=$(this).attr("name");
	location.href="<%=path%>/background/jsp/user_confirm.jsp?password="+password+"&id="+id;
});
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
		location.href="deleteUsermanagerAction.action?manager.id="+id;
	});
	
	var sex="<s:property value='manager.sex'/>";
	$(".select3 option").each(function(){
		var value=$(this).val();
		if(sex==value){
			$(this).attr("selected","selected");
		}
	});
	$("#queryAll").click(function(){
		location.href="queryAllmanagerAction.action?manager.username=&manager.realName=&resultFlg=&manager.sex=";
		
	});
	
});

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
    <li><a href="#">用户管理</a></li>
    <li><a href="#">查询用户</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    
    <div id="usual1" class="usual"> 
    
  	<div id="tab2" class="tabson">
    
    <form action="queryAllmanagerAction.action" method="post">
    <input  type="hidden" name="resultFlg" value=""/>
    <ul class="seachform">
    
    <li><label>用户名</label><input name="manager.username" type="text" value="<s:property value="manager.username"/>" class="scinput" /></li>
    <li><label>姓名</label><input name="manager.realName" type="text" value="<s:property value="manager.realName"/>" class="scinput" />
    </li>
    
    <li><label>性别</label>  
    <div class="vocation">
    <select class="select3" name="manager.sex">
    <option value="">--</option>
    <option value="男" >男</option>
    <option value="女" >女</option>
    </select>
    </div>
    </li>
    <li><label>&nbsp;</label>
    <input name="" type="submit" class="scbtn" value="查询"/></li>
    <li><label>&nbsp;</label>
    <input name="" type="button" class="scbtn" id="queryAll" value="查询全部"/></li>
    </ul>
</form>    
    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th>用户名<i class="sort"><img src="<%=path %>/background/assets/images/px.gif" /></i></th>
        <th>密码</th>
        <th>姓名</th>
        <th>性别</th>
        <th>年龄</th>
        <th>电话</th>
        <th>电子邮箱</th>
        <th>身份证号</th>
        <th width="20%">家庭住址</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator value="pageBean.list" var="user">
        <tr>
        <td><s:property value="#user.username"/></td>
        <td>******</td>
        <td><s:property value="#user.realName"/></td>
        <td><s:property value="#user.sex"/></td>
        <td><s:property value="#user.age"/></td>
        <td><s:property value="#user.phone"/></td>
        <td><s:property value="#user.email"/></td>
        <td><s:property value="#user.idcard"/></td>
        <td width="20%"><s:property value="#user.address"/></td>
        <td><a href="javascript:void(0)" name="<s:property value="#user.id"/>" id="<s:property value="#user.password"/>"  class="tablelink update">修改</a>  
           <a href="javascript:void(0)" id="<s:property value="#user.id"/>" class="tablelink delete"> 删除</a></td>
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
     <form action="queryAllmanagerAction.action" id="form1" method="post">
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

