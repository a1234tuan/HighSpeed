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
<link rel="stylesheet" href="css/style.css">
<title>添加驾驶员</title>
</head>
<body>
    <div class="container">
        <!-- 面包屑导航 -->
        <ol class="breadcrumb">
            <li><a href="#">驾驶员管理</a></li>
            <li>添加驾驶员</li>
        </ol>
        
        <h3 class="page-header">新增驾驶员 <small class="text-danger">${MSG}</small></h3>

        <!-- 
           【核心修改点1】：action路径改为绝对路径
           原来的 action="driver/add.action" 在你的环境下导致了重复路径 driver/driver
           使用 ${pageContext.request.contextPath}/driver/add.action 是最保险的写法
        -->
        <form id="addForm" action="${pageContext.request.contextPath}/driver/add.action" method="post" class="form-horizontal">
            
            <!-- 1. 驾驶证号 -->
            <div class="form-group">
                <label class="col-sm-2 control-label">驾驶证号</label>
                <div class="col-sm-6">
                    <input type="text" id="dno" name="dno" class="form-control" placeholder="请输入唯一驾驶证号">
                </div>
            </div>

            <!-- 2. 姓名 -->
            <div class="form-group">
                <label class="col-sm-2 control-label">姓名</label>
                <div class="col-sm-6">
                    <input type="text" id="name" name="name" class="form-control" placeholder="请输入驾驶员姓名">
                </div>
            </div>
            
            <!-- 【新增】 3. 身份证号 -->
            <div class="form-group">
                <label class="col-sm-2 control-label">身份证号</label>
                <div class="col-sm-6">
                    <input type="text" name="idcard" class="form-control" placeholder="请输入身份证号">
                </div>
            </div>

            <!-- 【新增】 4. 性别 -->
            <div class="form-group">
                <label class="col-sm-2 control-label">性别</label>
                <div class="col-sm-6">
                    <label class="radio-inline">
                        <input type="radio" name="sex" value="1" checked> 男
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="sex" value="0"> 女
                    </label>
                </div>
            </div>

            <!-- 【新增】 5. 电话 -->
            <div class="form-group">
                <label class="col-sm-2 control-label">联系电话</label>
                <div class="col-sm-6">
                    <input type="text" name="tel" class="form-control" placeholder="请输入联系电话">
                </div>
            </div>

            <!-- 【新增】 6. 初始积分 (默认12) -->
            <div class="form-group">
                <label class="col-sm-2 control-label">初始积分</label>
                <div class="col-sm-6">
                    <input type="number" name="score" class="form-control" value="12" placeholder="默认12分">
                </div>
            </div>

            <!-- 【新增】 7. 预存金额 (默认0) -->
            <div class="form-group">
                <label class="col-sm-2 control-label">预存金额</label>
                <div class="col-sm-6">
                    <div class="input-group">
                        <div class="input-group-addon">￥</div>
                        <input type="number" name="money" class="form-control" value="0">
                    </div>
                </div>
            </div>

            <!-- 【新增】 8. 备注 -->
            <div class="form-group">
                <label class="col-sm-2 control-label">备注</label>
                <div class="col-sm-6">
                    <textarea name="backup" class="form-control" rows="3" placeholder="可选填备注信息"></textarea>
                </div>
            </div>
            
            <!-- 按钮组 -->
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
                
                // 简单的非空校验
                if(dno == ""){
                    alert("驾驶证号不能为空！");
                    $("#dno").focus();
                    return;
                }
                if(name == ""){
                    alert("姓名不能为空！");
                    $("#name").focus();
                    return;
                }
                
                // 提交表单
                $("#addForm").submit();
            });
        });
    </script>
</body>
</html>