<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<!-- 页面基底网址，如果没有给绝对路径写的是相对路径，自动从base路径开始请求 -->
	<base href="<%=basePath%>">
	<meta charset="UTF-8">
	<!--设置浏览器的布局视口，只在移动端浏览器起作用-->
	<meta name="viewport" content="width=width-device,initial-scale=1,user-scalable=no" />
	<!--引入bootstrap的核心css-->
	<link rel="stylesheet" href="js/bootstrap/css/bootstrap.css" />
	<link rel="stylesheet" href="css/style.css">
	<title>修改站点</title>
	<!--判断如果是IE9以下，引入兼容h5标签的js文件，注意空格的位置-->		
	<!--[if lt IE 9]>
	
	<script src="js/bootstrap/js/respond.min.js"></script>
	<script src="js/bootstrap/js/html5shiv.min.js"></script>		
	<![end if] -->
</head>
<body>	
	<div class="container">
		
		<ol class="breadcrumb">
			<li><a href="#">站点管理</a></li>
				<li>修改站点</li>
		</ol>

		<h2 class="page-header">修改新站点
			<font color="red">${MSG}</font>
		</h2>
		<form id="form1" class="form-horizontal" method="get" action="stationController/update.action">
			<input type="hidden" name="sid" value="${STATION.sid }">
			<div class="form-group">
				<label for="" class="col-sm-2">站点名称</label>
				<div class="col-sm-10">
					<input type="text" id="name" name="name" value="${STATION.name }" placeholder="请输入站点名称" class="form-control"/>
				</div>					
			</div>	
			<div class="form-group">
				<label for="" class="col-sm-2">收费金额</label>
				<div class="col-sm-10">
					<input type="number" id="price" name="price" value="${STATION.price }" placeholder="请输入收费金额" class="form-control"/>
				</div>					
			</div>
			<div class="form-group">					
				<div class="col-sm-10 col-sm-offset-2">
					<input type="button" id="addBtn" value="修改提交" class="btn btn-success" />
					<input type="button"  value="取消" class="btn btn-danger" onclick="history.back();"/>
				</div>
			</div>		
		</form>
	</div>

	<!--引入jquery-->
	<script src="js/jquery.js"></script>
	<!--引入bootstrap的js功能-->
	<script src="js/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript">
		
		$(document).ready(function() {
			$("#addBtn").click(function(){
				//校验输入的值是否合法
				var nameObj = $("#name");
				var priceObj = $("#price");
				if(nameObj.val().trim().length==0){
					alert("请输入站点名称");
					nameObj.focus();//让id为name的元素光标移入
				}else if(priceObj.val().trim().length==0){
					alert("请输收费金额");
					priceObj.focus();//让id为name的元素光标移入
				}else{
					$("#form1").submit();
				}
			});
			

		});		

	</script>
</body>
</html>