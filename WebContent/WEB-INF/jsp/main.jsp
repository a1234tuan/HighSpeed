<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>高速管理系统</title>
</head>
<frameset cols="260,*" frameborder="no" framespacing="0">
	<frame src="${pageContext.request.contextPath}/userController/preMenu.action?username=${USERNAME}">
	<frame src="" name="content">
</frameset>
</html>