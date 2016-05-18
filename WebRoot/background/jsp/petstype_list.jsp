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
<script type="text/javascript" src="<%=path %>/common/validate.js"></script>
<script type="text/javascript">
$(document).ready(function(){
  $(".sure").click(function(){
  	$(".tip").fadeOut(100);
	 var id=$(".tip").attr("id");
	 if(id=="manyDel"){
  		var ids="";
		 $(".selectSingle").each(function(){
			 if(this.checked){
				ids=ids+$(this).val()+",";
			 }
			});
  	location.href="<%=path%>/deleteManyptAction.action?resultFlg="+ids;
	 }else{
  	location.href="<%=path%>/deletePetsTypeptAction.action?petsType.id="+id;
	 }
});

  $(".cancel").click(function(){
  $(".tip").fadeOut(100);
});
  
var deleteFlg="<s:property value="resultFlg"/>";
if(!deleteFlg.isNull()&&deleteFlg=="delete"){
	alert("删除成功！");
}

if(!deleteFlg.isNull()&&deleteFlg=="add"){
	alert("添加成功！");
}

if(!deleteFlg.isNull()&&deleteFlg=="update"){
	alert("修改成功！");
}

});

function deleteWarr(obj)
{
	var id=$(obj).attr("id");
	$("#content").html("是否删除该条记录 ？");
	$(".tip").attr("id",id);
	$(".tip").fadeIn(200);
}
</script>

<script type="text/javascript">
$(function(){
	$("#selectAll").click(function(){
		if(this.checked){
		$(".selectSingle").attr("checked","checked");
		}else{
		$(".selectSingle").attr("checked","");
		}
	});
	$(".selectSingle").click(function(){
		if(!this.checked){
			$("#selectAll").attr("checked","");
		}
	});
	
	$("#manyClick").click(function(){
		var checkedFlg=false;
		$(".selectSingle").each(function(){
			if(this.checked){
				checkedFlg=true;
			}
		});
		if(checkedFlg){
		$(".tip").attr("id","manyDel");
		$("#content").html("是否批量删除所选记录？");
		$(".tip").fadeIn(200);
		}else{
			alert("请选择要删除的记录！！");
		}
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
   		if(<s:property value="pageBean.currentPage"/>==1)
		{
		$("#firstPage").addClass("current");
		$("#prePage").addClass("current");
		$("#nextPage").removeClass("current");
		$("#lastPage").removeClass("current");
		}
	if(<s:property value="pageBean.currentPage"/>>=<s:property value="pageBean.totalPage" />)
		{
		$("#firstPage").removeClass("current");
		$("#prePage").removeClass("current");
		$("#nextPage").addClass("current");
		$("#lastPage").addClass("current");
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
  	
<script type="text/javascript">
$(function(){
	$(".more").mouseover(function(e){
		var content=$(this).attr("id");
		if(content.length>250){
		$("#showMore").css({"top":(e.pageY)+"px","left":(e.pageX-450)+"px","width":400});
		}else{
		$("#showMore").css({"top":(e.pageY)+"px","left":(e.pageX-250)+"px","width":200});
		}
		$("#showMore p").html(content);
		 display();
	});
	
	$(".more").mouseout(function(e){
		//setTimeout(disappear, 1000);
		disappear();
	});
	
	
});
function display(){
	$("#showMore").css("display","block");
	
}

function disappear(){
	$("#showMore").css("display","none");
}

</script>
  	

</head>


<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">菜单管理</a></li>
    <li><a href="#">宠物管理</a></li>
    <li><a href="#">宠物类型</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    
    	<ul class="toolbar">
        <li class=""><a href="queryBigTypeptAction.action"><span><img src="<%=path %>/background/assets/images/t01.png" /></span>添加</a></li>
        <%--<li class="click"><span><img src="<%=path %>/background/assets/images/t02.png" /></span>修改</li>
        --%><li class="click" id="manyClick"><span><img src="<%=path %>/background/assets/images/t03.png" /></span>批量删除</li>
        <li><span><img src="<%=path %>/background/assets/images/t04.png" /></span>统计</li>
        </ul></div>
    
    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th width="90px"><input name="" type="checkbox" id="selectAll" value="" /></th>
        <th width="100px">大分类<i class="sort"><img src="<%=path %>/background/assets/images/px.gif" /></i></th>
        <th width="130px">小分类</th>
        <th width="180px">原产地</th>
        <th>宠物档案</th>
        <th width="100px">操作</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator var="pt" value="pageBean.list" status="stat">
          <tr>
        <td><input name="" type="checkbox" class="selectSingle" value="<s:property value="#pt[0]" />" /></td>
        <td ><s:property value="#pt.bigType" /></td>
        <td><s:property value="#pt.smallType" /></td>
        <td><s:property value="#pt.home" /></td>
        <td>
        <s:if test="#pt.typeIntroduce.length()>36">
        <s:property value="#pt.typeIntroduce.substring(0,36)" />
        </s:if>
        <s:else>
        <s:property value="#pt.typeIntroduce" />
        </s:else>
        ...<a href="javascript:void(0)" class="tablelink more" id="<s:property value="#pt.typeIntroduce" />" >更多>></a>
        </td>
        <td><a href="queryOneptAction.action?petsType.id=<s:property value="#pt.id" />" class="tablelink">修改</a>     <a href="#" id="<s:property value="#pt[0]" />" class=" click tablelink" onclick="deleteWarr(this);"> 删除</a></td>
        </tr> 
        </s:iterator>
        </tbody>
    </table>
    <div class="pagin">
    	<div class="message">共<i class="blue"><s:property value="pageBean.total"/></i>条记录，
    	共<i class="blue"><s:property value="pageBean.totalPage"/></i>页，
    	当前显示第&nbsp;<i class="blue"><s:property value="pageBean.currentPage" />&nbsp;</i>页</div>
        <ul class="paginList">
        <li class="paginItem  pageButton " id="firstPage"><a ><span >首页</span></a></li>
        <li class="paginItem pageButton" id="prePage">
        <a ><span class="pagepre"></span></a>
        </li> 
        <li class="paginItem pageButton" id="nextPage"><a ><span class="pagenxt"></span></a></li>
        <li class="paginItem pageButton" id="lastPage"><a ><span >尾页</span></a></li>
        </ul>
    </div>
    <form action="queryPageBeanptAction.action" id="form1" method="post">
  <input type="hidden" name="currentPage" id="currentPage" value="<s:property value="pageBean.currentPage"/>" />
  <input type="hidden" name="resultFlg" value="query"/>
  </form>
    
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
     <div id="showMore" style="padding:10px;position: absolute;width:200px;background-color:#CDC9C9;display:none" >
    	<p><font face="微软雅黑"></font></p>
    </div>
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>

</body>

</html>
