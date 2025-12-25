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
		<h2 class="page-header">站点列表
			<font color="red">${MSG }</font>
		</h2>
		<div class="row">
		    <div class="col-sm-offset-0 col-sm-2">
		        <input type="text" id="searchname" name="searchname" value="${param.searchname }" placeholder="请输入站点名称">
		    </div>
		    <div class="col-sm-offset-1 col-sm-2">
		        <a href="javascript:myquery()" class="btn btn-success btn-block">查询</a>
		    </div>
		    <div class="col-sm-offset-5 col-sm-2">
		    
		        <a href="stationController/preAdd.action" class="btn btn-success btn-block">增加新站点</a>
		    </div>
		</div>
		<br/>
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
				<form action="stationController/batchDel.action" method="get" id="myform">		
				<c:forEach items="${PAGE.list }" var="item">
				    <tr>
				        <td>${item.sid}</td>
				        <td>${item.name}</td>
				        <td>${item.price}</td>
				
				        <td>
				            <a href="stationController/preUpdate.action?sid=${item.sid }" class="btn btn-primary btn-sm update-btn">修改</a>
				            <a href="javascript:del(${item.sid });" class="btn btn-danger btn-sm del-btn" data-id="6">删除</a>
				        </td>
				    </tr>
				</c:forEach>
			</tbody>
		</table>
		 <div class="row">
	    	一共查询到${PAGE.total}条记录，共${PAGE.pages}页，当前是第${PAGE.pageNum}页
	   	 <button id="btn1" onclick="jump(-1)">上一页</button>
	   	 <button id="btn2" onclick="jump(1)">下一页</button>
</div>
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
		function myquery() {
		    // 得到输入的站点名称
		    var searchname = $("#searchname").val();
		    // 提交请求到后台
		    location.href = "stationController/list.action?pageno=1&searchname=" + searchname;
		}
		function jump(i) {
		    var currentPageNum = ${PAGE.pageNum};
		    // 当当前页是1, i是-1, 直接返回; 当前页是最后一页, i是1, 直接返回; 否则请求后台
		    currentPageNum += i;
		    // 请求后台
		    // 3. 获取查询输入框站点名称的值 (确保分页时带着搜索条件)
    		var searchname = $("#searchname").val();
		    location.href = "stationController/list.action?pageno=" + currentPageNum+"&searchname=" + searchname;
		}
	
		$(function() { // 页面加载完后执行, jquery
		    // 判断当前页如果是第一页, 上一页按钮不可用; 如果当前页是最后一页, 下一页按钮不可用
		    var currentPageNum = ${PAGE.pageNum};
		    var pages = ${PAGE.pages};
		    if (currentPageNum == 1) {
		        $("#btn1").prop("disabled", true);
		    }
		    if (currentPageNum == pages) {
		        $("#btn2").prop("disabled", true);
		    }
		})
		function del(sid) {
	    	// 1. 弹出浏览器标准确认框
		    var result = confirm("确认删除吗？"); // 点击取消返回 false，确定返回 true
		    
		    // 2. 如果用户确认删除，则发起跳转请求
		    if (result) {
		        location.href = "stationController/delete.action?sid=" + sid;
		    }
		}
	</script>
</body>
</html>