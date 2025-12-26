<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>修改驾驶员</title>
</head>
<body>
    <div class="container">
        <ol class="breadcrumb">
            <li><a href="#">驾驶员管理</a></li>
            <li>修改信息</li>
        </ol>
        
        <h3 class="page-header">修改驾驶员</h3>

        <form action="driver/update.action" method="post" class="form-horizontal">
            <div class="form-group">
                <label class="col-sm-2 control-label">驾驶证号</label>
                <div class="col-sm-6">
                    <!-- dno设为只读，因为是主键，不能瞎改 -->
                    <input type="text" name="dno" value="${driver.dno}" class="form-control" readonly="readonly">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">姓名</label>
                <div class="col-sm-6">
                    <input type="text" name="name" value="${driver.name}" class="form-control">
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
