<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>高速管理系统</title>
</head>
<frameset cols="260,*" frameborder="no" framespacing="0">
    <frame src="${pageContext.request.contextPath}/userController/preMenu.action?username=${USERNAME}">
    <frame src="" name="content">
</frameset>
</html>