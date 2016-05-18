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
<script type="text/javascript" src="<%=path %>/common/My97DatePicker/WdatePicker.js"></script>
  
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
  		
  	/*	var status="<s:property value='shopCar.status'/>";
		$(".select3 option").each(function(){
			var value=$(this).html();
			if(isEquals(status,value)){
				$(this).attr("selected","selected");
			}
		});
		*/
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
  	<%--
  	function toSelectType(){
  		var selectObj=document.getElementById("selectedId"); 
  		for(var i=0;i<selectObj.lenght;i++){
  			if(selectObj[i].selected==true){
  				alert(selectObj[i].value);
  				//alert(selectObj[selectObj.selectedIndex].value);
  			} 
  		}
  		
  	}--%>
  	
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

<body >

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">领养统计</a></li>
    <li><a href="#">查询订单</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    
    <div id="usual1" class="usual"> 
    
  	<div id="tab2" class="tabson">
    <form action="queryAllHouShopCarAction.action" method="post">
    <ul class="seachform">
    
    <li><label>起始日期</label><input name="startDate" value="<s:property value="startDate"/>" type="text" class="scinput date"  maxId="dateMax" id="dateMin" /></li>
    <li><label>结束日期</label><input name="endDate" value="<s:property value="endDate"/>" type="text" class="scinput date"  minId="dateMin"  id="dateMax" /></li>
    <li><label>订单状态</label>  
    <div class="vocation">
    <%--<select class="select3 status" id="selectedId" name="shopCar.status" onclick="toSelectType()">
    <option value="" >--</option>
    <option value="1" >未发货</option>
    <option value="2" >已发货</option>
    <option value="3" >已收货</option>
    </select>
    
     list="{'--','未发货','已发货','已收货'}"
    --%>
    <s:select cssClass="select3" name="shopCar.status" value="shopCar.status" list="#{'':'--','未发货':'未发货','已发货':'已发货','已评价':'已评价'}">
    
    </s:select>
    </div>
    </li>
    
    <li><label>&nbsp;</label><input name="" type="submit" class="scbtn" value="查询"/></li>
    
    </ul>
    </form>
    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th>订单号<i class="sort"><img src="<%=path %>/background/assets/images/px.gif" /></i></th>
        <th>宠物类型</th>
        <th>剩余数量</th>
        <th>用户名</th>
        <th>下单日期</th>
        <th>订单状态</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator value="pageBean.list" var="order">
        <tr>
        <td><s:property value="#order[0].orderId"/></td>
        <td><s:property value="#order[1].petsType.smallType"/></td>
        <td><s:property value="#order[1].count"/></td>
        <td><s:property value="#order[0].customer.userName"/></td>
        <td><s:date name="#order[0].orderDate" format="yyyy年MM月dd日 HH:mm:ss" /> </td>
        <td><s:property value="#order[0].status"/></td>
        <td>
        <s:if test="#order[0].status=='未发货'">
        <a href="updateOrderShopCarAction.action?toJsp=queryAllHou&shopCar.id=<s:property value="#order[0].id"/>&shopCar.status=1" class="tablelink">去发货</a>
        </s:if>
        </td>
        </tr> 
        </s:iterator>
    
        </tbody>
    </table>
    
   
  
    
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
    
      <div class="clear">
     <form action="queryAllHouShopCarAction.action" id="form1" method="post">
  <input type="hidden" name="pageBean.currentPage" id="currentPage" value="<s:property value="pageBean.currentPage"/>" />
  </form>
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

