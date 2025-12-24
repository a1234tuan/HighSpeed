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
	<!-- 页面基底网址，如果没有给绝对路径写的是相对路径，自动从base路径开始请求 -->>
	<base href="<%=basePath%>">
	<meta charset="UTF-8">
	<!--设置浏览器的布局视口，只在移动端浏览器起作用-->
	<meta name="viewport" content="width=width-device,initial-scale=1,user-scalable=no" />
	<!--引入bootstrap的核心css-->
	<link rel="stylesheet" href="js/bootstrap/css/bootstrap.css" />
	<title>查询员工列表</title>
	<!--判断如果是IE9以下，引入兼容h5标签的js文件，注意空格的位置-->		
	<!--[if lt IE 9]>
	
	<script src="js/bootstrap/js/respond.min.js"></script>
	<script src="js/bootstrap/js/html5shiv.min.js"></script>		
	<![end if] -->

	<style type="text/css">
		.pagination {
			margin: 0!important;
		}
	</style>
</head>
<body>	
	<div class="container">
		
		<ol class="breadcrumb">
			<li>站点管理</li>
		</ol>

		<h2 class="page-header">站点列表</h2>
        <div class="row">
			<div class="col-sm-offset-8 col-sm-4">
				<a href="AddStation.html" class="btn btn-success btn-block">增加新站点</a>
			</div>
		</div>
		<table class="table table-bordered table-striped" id="dataTable">
			<thead>
				<tr>
					<th>站号</th>
					<th>名称</th>
					<th>收费金额</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>				
				<c:forEach items="${LIST}" var="item">
				    <tr>
				        <td>${item.sid}</td>
				        <td>${item.name}</td>
				        <td>${item.price}</td>
				
				        <td>
				            <a href="UpdateStation.html" class="btn btn-primary btn-sm update-btn">修改</a>
				            <a href="javascript:del();" class="btn btn-danger btn-sm del-btn" data-id="6">删除</a>
				        </td>
				    </tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<!--引入jquery-->
	<script src="js/jquery.js"></script>
	<!-- 引入全局公共js文件 -->
	<script type="text/javascript" src="js/global.js"></script>
	<!--引入bootstrap的js功能-->
	<script src="js/bootstrap/js/bootstrap.js"></script>
	<!-- 引入layer弹出层js功能 -->
	<script type="text/javascript" src="js/layer/layer.js"></script>
	<script>
	
	      function del(){
			  var result = confirm("确认删除吗");
			  if(result){
				  alert("删除成功");
			  }else{
				  
			  }
		  }
	</script>
</body>
</html>