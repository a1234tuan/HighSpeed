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
<!-- 省略头部引用，保留你原有的... -->
<div class="panel-body">
    <!-- 提交给 controller 的 in.action -->
    <form action="feerecord/in.action" method="post" class="form-horizontal">
        
        <!-- 车辆下拉框 -->
        <div class="form-group">
            <label class="col-sm-2 control-label">车牌号</label>
            <div class="col-sm-6">
                <select name="cno" class="form-control" required>
                    <option value="">-- 请选择进站车辆 --</option>
                    <!-- 循环 Controller 传来的 carList (这是已经过滤过，只有不在高速上的车) -->
                    <c:forEach items="${carList}" var="c">
                        <option value="${c.cno}">${c.cno} - ${c.name}</option>
                    </c:forEach>
                </select>
                <!-- 如果列表为空，提示用户 -->
                <c:if test="${empty carList}">
                    <span style="color:red; font-size:12px;">没有可用的车辆（所有车辆都在行驶中或无数据）</span>
                </c:if>
            </div>
        </div>

        <!-- 进站点下拉框 -->
        <div class="form-group">
            <label class="col-sm-2 control-label">进站口</label>
            <div class="col-sm-6">
                <select name="beginid" class="form-control" required>
                    <c:forEach items="${stationList}" var="s">
                        <option value="${s.sid}">${s.name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <!-- 进站时不需要填价格、出站口、状态，后台自动设为1和null -->
        
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-success">确认进站</button>
                <button type="button" class="btn btn-default" onclick="history.back()">返回</button>
            </div>
        </div>
    </form>
</div>

</body>
</html>