<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 중복 확인</title>
<script src="resources/jsLib/jquery-3.2.1.min.js"></script>
<script src="resources/jsLib/inchk.js"></script>
<script>
	function idOk() {
		//joinForm(=parent window : opener)으로 id를 전달하고 창  내리기
		opener.document.getElementById('m_id').value = "${m_id}";
		/* opener.document.getElementById('sss').disabled=''; */ // disabled를 null로 만든다.
		
		opener.$('#m_id').prop("readonly", true);
		opener.$('#m_password').focus();
		// => attr()은 HTML의 속성 취급
		// => prop()은 JavaScript의 프로퍼티를 취급
		
		self.close();
		
	} //idOk

</script>
</head>
<body>
	<h3>ID 중복 확인</h3>
	<form action="idcheck" method="get">
	User ID :
	<input type="text" id="m_id" name="m_id" value="">
	<input type="submit" value="확인하기" onclick="return idCheck()"><br>
	<hr>
	
	<div>
		<c:if test="${idCheck=='A'}">
			${m_id}는 사용 가능한 계정명 입니다.
			<input type="button" value="사용하기" onclick="return idOk()">
		</c:if>
		
		<c:if test="${idCheck=='UA'}">
			${m_id}는 이미 존재하는 계정명 입니다.<br>
			다른 계정명을 선택해주세요.<br>
			<!-- 부모창의 id 값을 clear 하는 것은 js에서 가능 -->
			<script>
				opener.document.getElementById('m_id').value="";
			</script>
		<input type="button" value="중복 검사하기" onclick="return m_id">
		</c:if>
	</div>
	
	</form>
	
	

</body>
</html>