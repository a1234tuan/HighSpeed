<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="js/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="css/style.css">
    <title>车辆进站登记</title>
</head>
<body>
<div class="container">
    <ol class="breadcrumb">
        <li>收费管理</li>
        <li>进站管理</li>
    </ol>
    
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-info">
                <div class="panel-heading">车辆进站登记</div>
                <div class="panel-body">
                    <!-- 提交到 in.action -->
                    <form action="feerecord/in.action" method="post" class="form-horizontal">
                        
                        <!-- 选择车辆 -->
                        <div class="form-group">
                            <label class="col-sm-3 control-label">车辆车牌</label>
                            <div class="col-sm-9">
                                <select name="cno" class="form-control" required>
                                    <option value="">请选择车辆</option>
                                    <c:forEach items="${carList}" var="car">
                                        <option value="${car.cno}">${car.cno} - ${car.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <!-- 选择入口站 -->
                        <div class="form-group">
                            <label class="col-sm-3 control-label">入口站点</label>
                            <div class="col-sm-9">
                                <select name="beginid" class="form-control" required>
                                    <option value="">请选择入口站</option>
                                    <c:forEach items="${stationList}" var="st">
                                        <option value="${st.sid}">${st.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <!-- 按钮 -->
                        <div class="form-group">
                            <div class="col-sm-offset-3 col-sm-9">
                                <button type="submit" class="btn btn-info">确认进站</button>
                                <a href="feerecord/list.action" class="btn btn-default">返回</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>