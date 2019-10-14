<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<sec:authorize access="isAuthenticated()">
반갑습니다. <sec:authentication property="principal.mvo.m_name"/>님,<br>
사용자 정보가 표시됩니다.<br>
최근 접속 날짜를 넣으면 좋겠다<br> 
<p><sec:authentication property="principal.mvo.m_birth"/>
</sec:authorize>

<sec:authorize access="isAnonymous()">
메롱
</sec:authorize>
</body>
</html>