<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath(); String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<link rel="stylesheet" href="js/bootstrap/css/bootstrap.css">
</head>
<body>
<div class="container">
    <h3>新增收费记录</h3>
    <form action="feerecord/add.action" method="post" class="form-horizontal">
        
        <!-- 1. 选择车辆 (衔接 Car模块) -->
        <div class="form-group">
            <label class="col-sm-2 control-label">选择车辆</label>
            <div class="col-sm-6">
                <select name="cno" class="form-control">
                    <option value="">--请选择车辆--</option>
                    <c:forEach items="${carList}" var="c">
                        <option value="${c.cno}">${c.cno} - ${c.name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <!-- 2. 选择入口站 (衔接 Station模块) -->
        <div class="form-group">
            <label class="col-sm-2 control-label">入口站</label>
            <div class="col-sm-6">
                <select name="beginid" class="form-control">
                     <c:forEach items="${stationList}" var="s">
                        <option value="${s.sid}">${s.name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <!-- 3. 选择出口站 -->
        <div class="form-group">
            <label class="col-sm-2 control-label">出口站</label>
            <div class="col-sm-6">
                <select name="endid" class="form-control">
                     <c:forEach items="${stationList}" var="s">
                        <option value="${s.sid}">${s.name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">产生费用</label>
            <div class="col-sm-6">
                <input type="number" name="price" class="form-control" placeholder="输入金额">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">状态</label>
            <div class="col-sm-6">
                <select name="state" class="form-control">
                    <option value="0">未缴费</option>
                    <option value="1">已缴费</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary">提交</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>
