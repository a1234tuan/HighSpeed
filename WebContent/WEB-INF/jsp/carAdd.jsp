<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>添加车辆</title>
</head>
<body>
    <div class="container">
        <ol class="breadcrumb">
            <li><a href="#">车辆管理</a></li>
            <li>添加车辆</li>
        </ol>
        
        <h3 class="page-header">新增车辆 <small class="text-danger">${MSG}</small></h3>

        <form id="addForm" action="car/add.action" method="post" class="form-horizontal">
            <!-- 车牌号 -->
            <div class="form-group">
                <label class="col-sm-2 control-label">车牌号</label>
                <div class="col-sm-6">
                    <input type="text" id="cno" name="cno" class="form-control" placeholder="请输入车牌号(如:辽A88888)">
                </div>
            </div>
            
            <!-- 品牌 -->
            <div class="form-group">
                <label class="col-sm-2 control-label">车辆品牌</label>
                <div class="col-sm-6">
                    <input type="text" id="name" name="name" class="form-control" placeholder="请输入品牌(如:奥迪)">
                </div>
            </div>

            <!-- 驾驶员下拉框 (关键点) -->
            <div class="form-group">
                <label class="col-sm-2 control-label">所属驾驶员</label>
                <div class="col-sm-6">
                    <select name="dno" class="form-control">
                        <option value="">-- 请选择驾驶员 --</option>
                        <!-- 循环遍历后台传来的driverList -->
                        <c:forEach items="${driverList}" var="d">
                            <!-- value存的是驾驶证号(存入数据库用)，中间显示的是姓名 -->
                            <option value="${d.dno}">${d.name} (证号:${d.dno})</option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <!-- 备注 -->
            <div class="form-group">
                <label class="col-sm-2 control-label">备注信息</label>
                <div class="col-sm-6">
                    <input type="text" name="backup" class="form-control" placeholder="选填">
                </div>
            </div>
            
            <!-- 按钮 -->
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="button" id="btnSubmit" class="btn btn-primary">提交保存</button>
                    <button type="button" class="btn btn-default" onclick="history.back()">返回</button>
                </div>
            </div>
        </form>
    </div>

    <script src="js/jquery.js"></script>
    <script>
        $(function(){
            $("#btnSubmit").click(function(){
                var cno = $("#cno").val();
                if(cno == ""){
                    alert("车牌号不能为空！");
                    return;
                }
                // 提交表单
                $("#addForm").submit();
            });
        });
    </script>
</body>
</html>
