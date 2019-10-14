<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<html>
<head>
	<title>Home</title>
		<script src="resources/jsLib/jquery-3.2.1.min.js"></script>
	
	<script>
		function pJoin() {
			window.open("joinf", "_blank", "toolbar=no,menubar=yes,scrollbars=yes,resizable=yes,width=500,height=300");
		} // pJoin
	</script>
</head>
<body>
<h1>
	HOME 입니다.<BR>
</h1>

<P>  The time on the server is ${serverTime}. </P>

<a href="test-home">test page</a>
<h1>완료된 작업</h1><br>
<a href="showJoinForm">1.회원가입</a><br>
<a href="showAllBoard?p_city=1">2.게시판 보기[기본값:1]</a><br>
<a href="jidohome">지도홈-[최건영]</a>
<a href="test-home">내가쓴글보기[김병우]</a>
<a href="/member/test-inter">테스트 클래스 테스트</a>


</body>
</html>
