<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String path = request.getContextPath(); String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<link rel="stylesheet" href="js/bootstrap/css/bootstrap.css">
<title>收费记录</title>
</head>
<body>
<div class="container">
    <ol class="breadcrumb"><li>收费管理</li><li>收费明细</li></ol>
    
    <form action="feerecord/list.action" method="post" class="form-inline" style="margin-bottom:15px">
        <input type="text" name="cno" value="${searchCno}" class="form-control" placeholder="输入车牌号查询">
        <button type="submit" class="btn btn-primary">查询</button>
        <a href="feerecord/toAdd.action" class="btn btn-success pull-right">新增缴费</a>
    </form>

    <table class="table table-bordered table-striped">
        <thead>
            <tr>
                <th>FID</th>
                <th>车牌号</th>
                <th>车品牌</th>
                <th>驾驶员(关联)</th>
                <th>入口站</th>
                <th>出口站</th>
                <th>费用</th>
                <th>状态</th>
                <th>时间</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${list}" var="obj">
            <tr>
                <td>${obj.fid}</td>
                <td>${obj.cno}</td>
                <td>${obj.carName}</td>
                <td style="color:blue;font-weight:bold;">${obj.driverName}</td> <!-- 这里证明关联成功 -->
                <td>${obj.beginStation}</td>
                <td>${obj.endStation}</td>
                <td>${obj.price}</td>
                <td>
                    <c:if test="${obj.state==1}"><span class="label label-success">已缴费</span></c:if>
                    <c:if test="${obj.state==0}"><span class="label label-danger">未缴费</span></c:if>
                </td>
                <td><fmt:formatDate value="${obj.createtime}" pattern="yyyy-MM-dd HH:mm"/></td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
