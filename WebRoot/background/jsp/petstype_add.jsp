<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="<%=path%>/background/assets/css/style.css" rel="stylesheet"
	type="text/css" />
<link href="<%=path%>/background/assets/css/select.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="<%=path %>/background/assets/js/jquery.js"></script>
<script type="text/javascript"
	src="<%=path %>/background/assets/js/jquery.idTabs.min.js"></script>
<script type="text/javascript"
	src="<%=path %>/background/assets/js/select-ui.min.js"></script>
<script type="text/javascript"
	src="<%=path %>/background/assets/editor/kindeditor.js"></script>
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
		$("#smallTypeInput").blur(function(){
			checkSmallType();
		});
		$("#homeInput").blur(function(){
			checkHome();
		});		
	});
	
	function checkSmallType(){
		var smallTypeInput=$("#smallTypeInput").val().trim();
		if(smallTypeInput.isNull()){
			$("#smallType").html("不能为空！！");
			return false;
		}else{
			$("#smallType").html("");
			return true;
		}
	}
	
	function checkHome(){
		var home=$("#homeInput").val().trim();
		if(home.isNull())
			{
			$("#home").html("不能为空！！");
			return false;
			}else{
				$("#home").html("");
				return true;
			}
	}
	
	function isSubmit(){
			return checkSmallType()&&checkHome();
	}
	
</script>
</head>

<body>

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">首页</a>
			</li>
			<li><a href="#">系统设置</a>
			</li>
		</ul>
	</div>

	<div class="formbody">


		<div id="usual1" class="usual">

			<div class="itab">
				<ul>
					<li><a href="#tab1" class="selected">新增宠物类型</a>
					</li>
				</ul>
			</div>

			<form action="addPetsTypeptAction.action"
				onsubmit="return isSubmit();" method="post">
				<div id="tab1" class="tabson">
					<ul class="forminfo">
						<li><label>大分类<b>*</b>
						</label>

							<div class="usercity">

								<div class="cityleft">
									<select class="select2" name="petsType.bigType">
										<s:iterator value="list" var="btl">
											<option>
												<s:property value="#btl.bigType" />
											</option>
										</s:iterator>
									</select>
								</div>
							</div></li>
						<li><label>小分类<b>*</b>
						</label><input type="text" name="petsType.smallType" class="dfinput "
							id="smallTypeInput" value="" style="width:518px;" /><font
							id="smallType" color="red"></font>
						</li>
						<li><label>原产地<b>*</b>
						</label><input type="text" name="petsType.home" class="dfinput"
							id="homeInput" value="" style="width:518px;" /><font id="home"
							color="red"></font>
						</li>

						<li><label>宠物档案<b>*</b>
						</label> <textarea class="textinput" name="petsType.typeIntroduce"></textarea>

						</li>
						<li><label>&nbsp;</label><input name="" type="submit"
							id="btn" class="btn" value="马上发布" />
						</li>
					</ul>

				</div>
			</form>
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
