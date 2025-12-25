<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>添加驾驶员</title>
</head>
<body>
    <div class="container">
        <ol class="breadcrumb">
            <li><a href="#">驾驶员管理</a></li>
            <li>添加驾驶员</li>
        </ol>
        
        <h3 class="page-header">新增驾驶员 <small class="text-danger">${MSG}</small></h3>

        <form id="addForm" action="driver/add.action" method="post" class="form-horizontal">
            <div class="form-group">
                <label class="col-sm-2 control-label">驾驶证号</label>
                <div class="col-sm-6">
                    <input type="text" id="dno" name="dno" class="form-control" placeholder="请输入唯一驾驶证号">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">姓名</label>
                <div class="col-sm-6">
                    <input type="text" id="name" name="name" class="form-control" placeholder="请输入驾驶员姓名">
                </div>
            </div>
            
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
                var dno = $("#dno").val();
                var name = $("#name").val();
                
                if(dno == ""){
                    alert("驾驶证号不能为空！");
                    return;
                }
                if(name == ""){
                    alert("姓名不能为空！");
                    return;
                }
                $("#addForm").submit();
            });
        });
    </script>
</body>
</html>
