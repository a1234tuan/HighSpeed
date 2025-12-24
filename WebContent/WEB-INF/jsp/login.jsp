<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>
    <!--登陆主体开始-->
    <div id="main">
        <!-- 头像区开始-->
        <div id="header-border">
            <!-- 头像区内部开始-->
            <div id="header-pic">

            </div>
            <!-- 头像区内部结束-->
        </div>
        <!-- 头像区结束-->
        <!-- 账号密码区开始-->
        <div id="account">
            <form action="${pageContext.request.contextPath}/loginController/login.action" method="get" id="loginForm" name="loginForm">
                <div class="input">
                    <input type="text" id="name" name="name" placeholder="please input username"/>
                </div>
                <div class="input">
                    <input type="password" id="pwd" name="pwd" placeholder="please input password"/>
                </div>
            </form>
            ${MSG }
        </div>
        <!-- 账号密码区结束-->
        <!-- 登陆按钮开始-->
        <button id="login-btn">Sign In</button>
        <!-- 登陆按钮结束-->
        <!-- 登陆区底部开始-->
        <div id="footer">
            <a href="#">Forget Password?</a>
        </div>
        <!-- 登陆区底部结束-->
    </div>
    <!--登陆主体结束-->
    
    <!--引入jquery-->
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <!-- 引入全局公共js文件 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/global.js"></script>
    <!-- 引入layer弹出层js功能 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/layer/layer.js"></script>
   <script type="text/javascript">
    $(document).ready(function() {
        $('#login-btn').click(function(event) {
            var name = $("#name").val().trim();
            var pwd = $("#pwd").val().trim();
            if(name.length==0) {
                alert("请输入用户名");
            }else if(pwd.length==0) {
                alert("请输入密码");
            }else{
                $("#loginForm").submit();
            }

        });

    });
    </script>
</body>
</html>