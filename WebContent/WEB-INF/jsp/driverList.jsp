<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="js/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="css/style.css">
<title>驾驶员列表</title>
</head>
<body>
    <div class="container">
        <!-- 导航路径 -->
        <ol class="breadcrumb">
            <li><a href="#">驾驶员管理</a></li>
            <li class="active">驾驶员列表</li>
        </ol>
        
        <!-- 顶部搜索栏与添加按钮 -->
        <div class="row" style="margin-bottom: 20px;">
            <div class="col-md-8">
                <form class="form-inline" action="driver/list.action" method="post">
                    <div class="form-group">
                        <label>姓名：</label>
                        <input type="text" name="name" class="form-control" value="${searchName}" placeholder="请输入驾驶员姓名">
                    </div>
                    <button type="submit" class="btn btn-primary">查询</button>
                </form>
            </div>
            <div class="col-md-4 text-right">
                <a href="driver/toAdd.action" class="btn btn-success">添加驾驶员</a>
            </div>
        </div>

        <!-- 数据表格 -->
        <table class="table table-bordered table-striped table-hover">
            <thead>
                <tr>
                    <th>序号</th>
                    <th>驾驶证号 (DNO)</th>
                    <th>姓名</th>
                    <th>创建时间</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="obj" varStatus="vs">
                    <tr>
                        <td>${vs.count}</td>
                        <td>${obj.dno}</td>
                        <td>${obj.name}</td>
                        <td><fmt:formatDate value="${obj.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td>
						    <!-- 新增的修改按钮 -->
						    <a href="driver/toUpdate.action?dno=${obj.dno}" class="btn btn-info btn-xs">修改</a>
						    &nbsp;
						    <!-- 原有的删除按钮 -->
						    <a href="javascript:void(0)" onclick="delDriver('${obj.dno}')" class="btn btn-danger btn-xs">删除</a>
						</td>
                    </tr>
                </c:forEach> 
            </tbody>
        </table>
	    </div>
	    <script type="text/javascript">
	    function delDriver(dno){
	        if(confirm("确定要删除驾驶员 " + dno + " 吗？\n删除后，该驾驶员名下的车辆将变为无主状态。")){
	            location.href = "driver/delete.action?dno=" + dno;
	        }
	    }
</script>
</body>
</html>
