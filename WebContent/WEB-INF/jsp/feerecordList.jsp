<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>收费管理列表</title>
    <link rel="stylesheet" href="js/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <ol class="breadcrumb">
            <li>收费管理</li>
            <li>车辆收费列表</li>
        </ol>

        <h2 class="page-header">车辆收费列表</h2>

        <!-- 搜索区域 -->
        <div class="row">
            <form action="feerecord/list.action" method="post" class="form-inline">
                <div class="form-group">
                    <label>车牌号：</label>
                    <!-- 回显查询条件 -->
                    <input type="text" name="cno" class="form-control" value="${vo.cno}" placeholder="请输入车牌号">
                </div>
                <button type="submit" class="btn btn-primary">搜索</button>
                <a href="feerecord/toIn.action" class="btn btn-success">车辆进站登记</a>
            </form>
        </div>
        <br/>

        <!-- 列表表格区域 -->
        <table class="table table-bordered table-striped table-hover">
            <thead>
                <tr>
                    <th>序号</th>
                    <th>车牌号</th>
                    <th>车辆品牌</th>
                    <th>进站站点</th>
                    <th>出站站点</th>
                    <th>进站时间</th>
                    <th>费用</th>
                    <th>状态</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <!-- 如果列表为空 -->
                <c:if test="${empty list}">
                    <tr><td colspan="9" class="text-center">暂无数据</td></tr>
                </c:if>

                <!-- 循环列表数据: Controller传过来的是 'list' -->
                <c:forEach items="${list}" var="item" varStatus="vs">
                    <tr>
                        <td>${vs.count}</td>
                        <td>${item.cno}</td>
                        <td>${item.carName}</td> <!-- 来自VO的关联查询 -->
                        <td>${item.beginStation}</td> <!-- 来自VO的关联查询 -->
                        
                        <!-- 出站可能为空 -->
                        <td>
                            <c:if test="${item.endStation == null}">-</c:if>
                            ${item.endStation}
                        </td>
                        
                        <td><fmt:formatDate value="${item.createtime}" pattern="yyyy-MM-dd HH:mm"/></td>
                        
                        <td>
                            <c:if test="${item.price == null}">0</c:if>
                            <c:if test="${item.price != null}">${item.price}</c:if>
                        </td>

                        <td>
                            <c:choose>
                                <c:when test="${item.state == 1}"><span class="label label-warning">行驶中</span></c:when>
                                <c:when test="${item.state == 2}"><span class="label label-success">已出站</span></c:when>
                                <c:otherwise>未知</c:otherwise>
                            </c:choose>
                        </td>

                        <td>
                            <!-- 只有行驶中的车才能点击出站 -->
                            <c:if test="${item.state == 1}">
                                <!-- 点击出站跳转到出站确认页面，带上记录ID -->
                                <a href="feerecord/toOut.action?fid=${item.fid}" class="btn btn-info btn-xs">出站结算</a>
                            </c:if>
                            <c:if test="${item.state == 2}">
                                <button class="btn btn-default btn-xs" disabled>已完成</button>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
