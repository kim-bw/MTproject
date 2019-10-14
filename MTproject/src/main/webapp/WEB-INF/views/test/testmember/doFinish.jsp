<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** Member DoFinish Spring MVC **</title>
</head>
<body>
<h3>** Member DoFinish Spring MVC **</h3>
<c:if test="${code=='login-fail'}">
	<h3> 당신의 정보는 없습니다~~~</h3>
	<a href="loginf">로그인 하기</a>
</c:if>

<br>
<a href="home">HOME</a>
</body>
</html>