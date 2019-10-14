<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
1. 로그인을 하지 않고 접근제한 페이지를 요청했을 때 이 페이지로 온다.<br>

/customLogin<br>
에러가 있다면 밑에 나타납니다.<br>
<h1><c:out value="${error}"/></h1><br>
로그아웃이라면 밑에 나타납니다.<br>
<h1><c:out value="${logout}"/></h1><br>
<!-- 실제로 로그인을 처리하는 url. 반드시 post로 보내야 한다 : CSRF토큰을 이용. 별도의 설정이 없다면 모든 스프링 시큐리티의 post방식에는 CSRF토큰 사용-->
<!-- 사이트간 위조 방지-->
<form method="post" action="security_check">
<div>
	<input type="text" name="m_id" value="admin">
</div>
<div>
	<input type="password" name="m_password" value="admin">
</div>
<div>
	<input type="submit">
</div>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>


</body>
</html>