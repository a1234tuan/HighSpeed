<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    // 获取当前应用在服务器上的上下文路径（如 /HighwaySystem）
    String path = request.getContextPath();
    // 动态拼接协议、服务器名、端口号和路径，生成绝对路径根地址
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
	<meta charset="UTF-8">
	<!--设置浏览器的布局视口，只在移动端浏览器起作用-->
	<meta name="viewport" content="width=width-device,initial-scale=1,user-scalable=no" />
	<!--引入bootstrap的核心css-->
	<link rel="stylesheet" href="js/bootstrap/css/bootstrap.css" />
	<title>增加部门</title>
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
				<li>增加新站点</li>
		</ol>

		<h2 class="page-header">增加新站点
			<font color="red">${MSG}</font>
		</h2>
		<form id="form1" class="form-horizontal" method="get" action="stationController/add.action">
			<div class="form-group">
				<label for="" class="col-sm-2">站点名称</label>
				<div class="col-sm-10">
					<input type="text" id="name" name="name" placeholder="请输入站点名称" class="form-control"/>
				</div>					
			</div>	
			<div class="form-group">
	            <label class="col-sm-2">收费金额</label>
	            <div class="col-sm-10">
	                <input type="number" id="price" name="price" placeholder="请输入收费金额" class="form-control"/>
	            </div>
	        </div>
	
	        <div class="form-group">
	            <div class="col-sm-10 col-sm-offset-2">
	                <input type="button" id="addBtn" value="增加站点" class="btn btn-success" />
	                <input type="button" value="取消" class="btn btn-danger" onclick="history.back();" />
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
		    $("#addBtn").click(function() {
		        // 1. 获取输入框 jQuery 对象
		        var nameObj = $("#name");
		        var priceObj = $("#price");
	
		        // 2. 校验站点名称是否为空
		        if (nameObj.val().trim().length == 0) {
		            alert("请输入站点名称");
		            nameObj.focus(); // 让光标移入
		        } 
		        // 3. 校验收费金额是否为空
		        else if (priceObj.val().trim().length == 0) {
		            alert("请输入收费金额");
		            priceObj.focus();
		        } 
		        // 4. 校验通过，手动提交表单
		        else {
		            $("#form1").submit();
		        }
		    });
		});

	</script>
</body>
</html>