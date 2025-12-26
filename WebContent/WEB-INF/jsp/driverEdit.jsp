<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
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
        <!-- 面包屑导航 -->
        <ol class="breadcrumb">
            <li><a href="#">驾驶员管理</a></li>
            <li>修改信息</li>
        </ol>
        
        <h3 class="page-header">修改驾驶员</h3>

        <!-- 修改 action 为绝对路径，防止 404 -->
        <form action="${pageContext.request.contextPath}/driver/update.action" method="post" class="form-horizontal">
            
            <!-- 1. 驾驶证号 (不可修改) -->
            <div class="form-group">
                <label class="col-sm-2 control-label">驾驶证号</label>
                <div class="col-sm-6">
                    <!-- readonly: 提交时会带过去，但用户不能改 -->
                    <input type="text" name="dno" value="${driver.dno}" class="form-control" readonly="readonly">
                </div>
            </div>

            <!-- 2. 姓名 -->
            <div class="form-group">
                <label class="col-sm-2 control-label">姓名</label>
                <div class="col-sm-6">
                    <input type="text" name="name" value="${driver.name}" class="form-control">
                </div>
            </div>

            <!-- 【新增】 3. 身份证号 -->
            <div class="form-group">
                <label class="col-sm-2 control-label">身份证号</label>
                <div class="col-sm-6">
                    <input type="text" name="idcard" value="${driver.idcard}" class="form-control">
                </div>
            </div>

            <!-- 【新增】 4. 性别 (需要判断哪个被选中) -->
            <div class="form-group">
                <label class="col-sm-2 control-label">性别</label>
                <div class="col-sm-6">
                    <label class="radio-inline">
                        <!-- 如果 driver.sex == 1，输出 checked -->
                        <input type="radio" name="sex" value="1" ${driver.sex == 1 ? 'checked' : ''}> 男
                    </label>
                    <label class="radio-inline">
                        <!-- 如果 driver.sex == 0，输出 checked -->
                        <input type="radio" name="sex" value="0" ${driver.sex == 0 ? 'checked' : ''}> 女
                    </label>
                </div>
            </div>

            <!-- 【新增】 5. 电话 -->
            <div class="form-group">
                <label class="col-sm-2 control-label">联系电话</label>
                <div class="col-sm-6">
                    <input type="text" name="tel" value="${driver.tel}" class="form-control">
                </div>
            </div>

            <!-- 【新增】 6. 积分 -->
            <div class="form-group">
                <label class="col-sm-2 control-label">当前积分</label>
                <div class="col-sm-6">
                    <input type="number" name="score" value="${driver.score}" class="form-control">
                </div>
            </div>

            <!-- 【新增】 7. 余额 -->
            <div class="form-group">
                <label class="col-sm-2 control-label">账户余额</label>
                <div class="col-sm-6">
                    <div class="input-group">
                        <div class="input-group-addon">￥</div>
                        <input type="number" name="money" value="${driver.money}" class="form-control">
                    </div>
                </div>
            </div>

            <!-- 【新增】 8. 备注 -->
            <div class="form-group">
                <label class="col-sm-2 control-label">备注</label>
                <div class="col-sm-6">
                    <!-- textarea 的回显是把值放在标签中间，而不是 value 属性 -->
                    <textarea name="backup" class="form-control" rows="3">${driver.backup}</textarea>
                </div>
            </div>
            
            <!-- 按钮 -->
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-primary">保存修改</button>
                    <button type="button" class="btn btn-default" onclick="history.back()">返回</button>
                    <!-- 提示：只读的主键方便用户确认 -->
                </div>
            </div>
        </form>
    </div>
</body>
</html>