<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>修改车辆</title>
</head>
<body>
    <div class="container">
        <ol class="breadcrumb">
            <li><a href="#">车辆管理</a></li>
            <li>修改车辆</li>
        </ol>
        
        <h3 class="page-header">修改车辆信息</h3>

        <form action="car/update.action" method="post" class="form-horizontal">
            <!-- 车牌号 (主键只读) -->
            <div class="form-group">
                <label class="col-sm-2 control-label">车牌号</label>
                <div class="col-sm-6">
                    <input type="text" name="cno" value="${car.cno}" class="form-control" readonly="readonly">
                </div>
            </div>
            
            <!-- 品牌 -->
            <div class="form-group">
                <label class="col-sm-2 control-label">车辆品牌</label>
                <div class="col-sm-6">
                    <input type="text" name="name" value="${car.name}" class="form-control">
                </div>
            </div>

            <!-- 驾驶员下拉框 (核心难点：回显选中状态) -->
            <div class="form-group">
                <label class="col-sm-2 control-label">所属驾驶员</label>
                <div class="col-sm-6">
                    <select name="dno" class="form-control">
                        <option value="">-- 请选择驾驶员 --</option>
                        <c:forEach items="${driverList}" var="d">
                            <!-- 如果遍历到的 dno 等于当前这辆车的 dno，则选中 -->
                            <option value="${d.dno}" <c:if test="${d.dno == car.dno}">selected</c:if>>
                                ${d.name} (证号:${d.dno})
                            </option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <!-- 备注 -->
            <div class="form-group">
                <label class="col-sm-2 control-label">备注信息</label>
                <div class="col-sm-6">
                    <input type="text" name="backup" value="${car.backup}" class="form-control">
                </div>
            </div>
            
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-primary">保存修改</button>
                    <button type="button" class="btn btn-default" onclick="history.back()">返回</button>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
