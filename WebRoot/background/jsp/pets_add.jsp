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
  <link rel="stylesheet" type="text/css" href="<%=path %>/background/js/artDialog/skins/default.css" />
	<script src="<%=path %>/background/js/artDialog/artDialog.js" type="text/javascript"></script>
	<script src="<%=path %>/background/js/artDialog/plugins/iframeTools.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=path %>/background/assets/js/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/background/assets/js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="<%=path %>/background/assets/js/select-ui.min.js"></script>
<script type="text/javascript" src="<%=path %>/common/validate.js"></script>
  
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
	$("#addFileClick").click(function(){
		var $delete="<img src='<%=path %>/background/assets/images/t03.png' onclick='deleteFileInput(this)' />";
		var $input="<span><input type='file' name='files' onchange='showPic(this)' >"+$delete+"</span>";
		$("#addFile").append($input);
	});
	
	$("#money").blur(function(){
		checkMoney(this);
	});
	
	$("#describe").blur(function(){
		checkDes(this);
	});
	
	$("#tab1 #formSubmit").submit(function(){
		var array=new Array();
		$("#tab1 .check").each(function(){
			array.push(numberCheck(this));
		});
		$("#tab1  .money").each(function(){
			array.push(checkMoney(this));
		});
		$("#tab1  .des").each(function(){
			array.push(checkDes(this));
		});
		return isSubmit(array);
	});
});

function isSubmit(array){
	var flg=true;
	for(var i=0;i<array.length;i++){
		if(!array[i]){
			flg=false;
			break;
		}
	}
	return flg;
}

function deleteFileInput(obj){
	$(obj).parent().remove();
}

function showPic(obj)
{
	//关闭所有的dialog
	var list = art.dialog.list;
	for (var i in list) {
	    list[i].close();
	};
	   //获得图片的绝对路径，用于图片预览。
	var path=window.URL.createObjectURL(obj.files[0]);
	art.dialog({
		id:"photoId",
	    padding: 0,
	    content: "<img src='"+path+"' width='300px'  height='370px' />",
	    lock: true // 设定是否锁屏
	});
	art.dialog({id: "photoId"}).title("预览");//却定点击按钮只能打开一个dialog
}


function numberCheck(obj){
	isExistFont(obj);
	var value=$(obj).val().trim();
	if(value.isNull()){
		$(obj).next(".info").html("不能为空！！！");
		return false;
	}else{
		if(!value.validateSignlessIntegral()){
			$(obj).next(".info").html("必须为正整数！！！");
			return false;
		}else{
			$(obj).next(".info").html("");
			return true;
		}
	}
}

function isExistFont(obj){
	var font=$(obj).next("font").attr("class");
	if(font==null){
	$(obj).after("<font class='info' color='red'></font>");
	}
}



function checkMoney(obj){
	var value=$(obj).val().trim();
	if(value.isNull()){
		isExistFont(obj);
		$(obj).next(".info").html("不能为空！！！");
		return false;
	}else{
		if(!value.validateSignlessDecimal()){
		$(obj).next(".info").html("格式不正确！！！");
		return false;
		}else{
		$(obj).next(".info").html("");
		return true;
		}
	}
}

function checkDes(obj){
	var value=$(obj).val().trim();
	if(value.isNull()){
		isExistFont(obj);
		$(obj).next(".info").html("不能为空！！！");
		return false;
	}else{
		$(obj).next(".info").html("");
		return true;
	}
	
}

</script>
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">系统设置</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    <div id="usual1" class="usual"> 
    <div class="itab">
  	<ul> 
    <li><a href="#tab1" class="selected">犬类</a></li> 
    <li><a href="#tab2">猫类</a></li> 
    <li><a href="#tab3">兔类</a></li>
  	</ul>
    </div> 
    
  	<div id="tab1" class="tabson">
  	 <form action="addPetsPetsAction.action" enctype="multipart/form-data" id="formSubmit" method="post">
    <table border="2px" width="100%">
    <tr >
    	<td height="20px">
    	<label>宠物类别 : </label>
    	</td>
    	<td height="20px">
    	<select class="select1" name="dog.petsType.id">
    	<s:iterator value="map.dog" var="dogs">
	    <option value="<s:property value="#dogs.id"/>"><s:property value="#dogs.smallType"/></option>
	   </s:iterator>
	    </select>
	    <input type="hidden" name="" value="犬类"/>
    	</td>
    	<td height="20px">
    	<label>寿命 : </label>
    	</td>
    	<td height="20px">
    	<input name="dog.life" type="text" class="dfinput check" onblur="numberCheck(this)" />
    	</td>
    </tr>
     <tr >
    	<td height="10px" colspan="4">
    	</td>
    </tr>
    <tr >
    	<td height="20px">
    	<label>性别: </label>
    	</td>
    	<td height="20px">
    	<cite><input name="dog.sex" type="radio" value="雄性" checked="checked" />雄性&nbsp;&nbsp;&nbsp;&nbsp;<input name="dog.sex" type="radio" value="雌性" />雌性</cite>
    	</td>
    	<td height="20px">
    	<label>身高: </label>
    	</td>
    	<td height="20px">
    	<input name="dog.height" type="text" class="dfinput check" onblur="numberCheck(this)"/>
    	</td>
    </tr>
     <tr >
    	<td height="10px" colspan="4">
    	</td>
    </tr>
     <tr >
    	<td height="20px">
    	<label>体重: </label>
    	</td>
    	<td height="20px">
    	<input name="dog.width" type="text" class="dfinput check"  onblur="numberCheck(this)" />
    	</td>
    	<td height="20px">
    	<label>毛长: </label>
    	</td>
    	<td height="20px">
    	<select name="dog.woolLength" class="select1">
	    <option value="长毛">长毛</option>
	    <option value="短毛">短毛</option>
	    </select>
    	</td>
    </tr>
     <tr >
    	<td height="10px" colspan="4">
    	</td>
    </tr>
     <tr >
    	<td height="20px">
    	<label>颜色: </label>
    	</td>
    	<td height="20px">
    	<input type="checkbox" value="黑" checked="checked" name="dog.color" />&nbsp;黑色 &nbsp;&nbsp;
    	<input type="checkbox" value="棕" name="dog.color" />&nbsp;棕色 &nbsp;&nbsp;
    	<input type="checkbox" value="白" name="dog.color" />&nbsp;白色 &nbsp;&nbsp;
    	<input type="checkbox" value="黄" name="dog.color" />&nbsp;黄色 &nbsp;&nbsp;
    	</td>
    	<td height="20px">
    	<label>体型: </label>
    	</td>
    	<td height="20px">
    	<select name="dog.shape" class="select1">
	    <option value="大型">大型</option>
	    <option value="中型">中型</option>
	    <option value="小型">小型</option>
	    </select>
    	</td>
    </tr>
     <tr >
    	<td height="10px" colspan="4">
    	</td>
    </tr>
     <tr >
    	<td height="20px">
    	<label>参考价: </label>
    	</td>
    	<td height="20px">
    	<input name="dog.salePrice" type="text" id="money" class="dfinput money" />
    	</td>
    	<td height="20px">
    	<label>库存: </label>
    	</td>
    	<td height="20px">
    	<input name="dog.count" type="text" class="dfinput check"  onblur="numberCheck(this)" />
    	</td>
    </tr>
     <tr >
    	<td height="10px" colspan="4">
    	</td>
    </tr>
    
    <tr >
    	<td colspan="1">
    	描述：
    	</td>
    	<td  colspan="3" >
    	<textarea name="dog.describe" cols="" rows="" id="describe" class="textinput des"></textarea>
    	</td>
    	<%--<td  >
    	<input type="file"/>
    	</td>
    	<td  >
    	</td>
    --%></tr>
    
      <tr >
    <th colspan="1">
    	<a href="#" id="addFileClick"><span><img src="<%=path %>/background/assets/images/t01.png" /></span>添加图片</a>
    	</th>
    	<td  colspan="3" id="addFile">
    	<input type="file" name="photo" id="uploadFile" class="des"  onchange="showPic(this)" /><br />
    	</td>
    </tr>
    
     <tr >
    	<td colspan="4">
    	</td>
 
    </tr>
    
    <tr >
    	<td colspan="4">
    	<input name="" type="submit" class="btn" value="确认保存"/>
    	</td>
 
    </tr>
  
    </table>
   </form>
    </div> 
    
    
  	<div id="tab2" class="tabson">
    
   <form action="addPetsPetsAction.action" enctype="multipart/form-data" id="formSubmit" method="post">
    <table border="2px" width="100%">
    <tr >
    	<td height="20px">
    	<label>宠物类别 : </label>
    	</td>
    	<td height="20px">
    	<select class="select1" name="dog.petsType.id">
    	<s:iterator value="map.dog" var="dogs">
	    <option value="<s:property value="#dogs.id"/>"><s:property value="#dogs.smallType"/></option>
	   </s:iterator>
	    </select>
	    <input type="hidden" name="" value="犬类"/>
    	</td>
    	<td height="20px">
    	<label>寿命 : </label>
    	</td>
    	<td height="20px">
    	<input name="dog.life" type="text" class="dfinput check" onblur="numberCheck(this)" />
    	</td>
    </tr>
     <tr >
    	<td height="10px" colspan="4">
    	</td>
    </tr>
    <tr >
    	<td height="20px">
    	<label>性别: </label>
    	</td>
    	<td height="20px">
    	<cite><input name="dog.sex" type="radio" value="雄性" checked="checked" />雄性&nbsp;&nbsp;&nbsp;&nbsp;<input name="dog.sex" type="radio" value="雌性" />雌性</cite>
    	</td>
    	<td height="20px">
    	<label>身高: </label>
    	</td>
    	<td height="20px">
    	<input name="dog.height" type="text" class="dfinput check" onblur="numberCheck(this)"/>
    	</td>
    </tr>
     <tr >
    	<td height="10px" colspan="4">
    	</td>
    </tr>
     <tr >
    	<td height="20px">
    	<label>体重: </label>
    	</td>
    	<td height="20px">
    	<input name="dog.width" type="text" class="dfinput check"  onblur="numberCheck(this)" />
    	</td>
    	<td height="20px">
    	<label>毛长: </label>
    	</td>
    	<td height="20px">
    	<select name="dog.woolLength" class="select1">
	    <option value="长毛">长毛</option>
	    <option value="短毛">短毛</option>
	    </select>
    	</td>
    </tr>
     <tr >
    	<td height="10px" colspan="4">
    	</td>
    </tr>
     <tr >
    	<td height="20px">
    	<label>颜色: </label>
    	</td>
    	<td height="20px">
    	<input type="checkbox" value="黑" checked="checked" name="dog.color" />&nbsp;黑色 &nbsp;&nbsp;
    	<input type="checkbox" value="棕" name="dog.color" />&nbsp;棕色 &nbsp;&nbsp;
    	<input type="checkbox" value="白" name="dog.color" />&nbsp;白色 &nbsp;&nbsp;
    	<input type="checkbox" value="黄" name="dog.color" />&nbsp;黄色 &nbsp;&nbsp;
    	</td>
    	<td height="20px">
    	<label>体型: </label>
    	</td>
    	<td height="20px">
    	<select name="dog.shape" class="select1">
	    <option value="大型">大型</option>
	    <option value="中型">中型</option>
	    <option value="小型">小型</option>
	    </select>
    	</td>
    </tr>
     <tr >
    	<td height="10px" colspan="4">
    	</td>
    </tr>
     <tr >
    	<td height="20px">
    	<label>参考价: </label>
    	</td>
    	<td height="20px">
    	<input name="dog.salePrice" type="text" id="money" class="dfinput money" />
    	</td>
    	<td height="20px">
    	<label>库存: </label>
    	</td>
    	<td height="20px">
    	<input name="dog.count" type="text" class="dfinput check"  onblur="numberCheck(this)" />
    	</td>
    </tr>
     <tr >
    	<td height="10px" colspan="4">
    	</td>
    </tr>
    
    <tr >
    	<td colspan="1">
    	描述：
    	</td>
    	<td  colspan="3" >
    	<textarea name="dog.describe" cols="" rows="" id="describe" class="textinput des"></textarea>
    	</td>
    	<td  >
    	</td>
    	<td  >
    	</td>
    </tr>
    
      <tr >
    <th colspan="1">
    	<a href="#" id="addFileClick"><span><img src="<%=path %>/background/assets/images/t01.png" /></span>添加图片</a>
    	</th>
    	<td  colspan="3" id="addFile">
    	<input type="file" name="photo" id="uploadFile" class="des"  onchange="showPic(this)" /><br />
    	</td>
    </tr>
    
     <tr >
    	<td colspan="4">
    	</td>
 
    </tr>
    
    <tr >
    	<td colspan="4">
    	<input name="" type="submit" class="btn" value="确认保存"/>
    	</td>
 
    </tr>
  
    </table>
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

