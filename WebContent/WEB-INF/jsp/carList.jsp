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
<title>车辆列表</title>
</head>
<body>
    <div class="container">
        <ol class="breadcrumb">
            <li><a href="#">车辆管理</a></li>
            <li class="active">车辆列表</li>
        </ol>
        
        <!-- 搜索与添加 -->
        <div class="row" style="margin-bottom: 20px;">
            <div class="col-md-8">
                <form class="form-inline" action="car/list.action" method="post">
                    <div class="form-group">
                        <label>车牌号：</label>
                        <input type="text" name="cno" class="form-control" value="${searchCno}" placeholder="请输入车牌号">
                    </div>
                    <button type="submit" class="btn btn-primary">查询</button>
                </form>
            </div>
            <div class="col-md-4 text-right">
                <a href="car/toAdd.action" class="btn btn-success">添加车辆</a>
            </div>
        </div>

        <!-- 列表表格 -->
        <table class="table table-bordered table-striped table-hover">
            <thead>
                <tr>
                    <th>序号</th>
                    <th>车牌号 (主键)</th>
                    <th>车辆品牌</th>
                    <th>所属驾驶员证号</th>
                    <th>备注信息</th>
                    <th>入库时间</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="obj" varStatus="vs">
                    <tr>
                        <td>${vs.count}</td>
                        <td>${obj.cno}</td>
                        <td>${obj.name}</td>
                        <td>${obj.dno}</td> <!-- 这里显示关联的驾驶证号 -->
                        <td>${obj.backup}</td>
                        <td><fmt:formatDate value="${obj.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
