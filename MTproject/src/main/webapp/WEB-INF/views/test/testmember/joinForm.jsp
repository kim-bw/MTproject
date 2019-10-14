<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** Member Join Spring MVC **</title>
<script src="resources/jsLib/jquery-3.2.1.min.js"></script><!-- 기본 -->
<script src="resources/jsLib/inchk.js"></script>
<script src="resources/jsLib/axTest.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> <!--주소를 위한 우편 api  -->
<script src="resources/jsLib/juso.js"></script>



<script>
	
	function idDupCheck() {
		/* document.getElementById('sss').disabled = "disabled"; */

		if (idCheck() == false) {
			return;
		}

		var url = 'test-idcheck?m_id=' + $('#m_id').val();
		window.open(url, "_blank", "toolbar=no,menubar=yes,scrollbars=yes,resizable=yes,width=450,height=300");
	}; //idDupCheck

</script>
</head>
<body>
	<h3>회원가입 페이지</h3>
	<form id="myForm" action="test-joinMember" method="post" enctype="multipart/form-data">
		<table>
		
			<tr height="40">
				<td bgcolor="yellow">아이디</td>
				<td><input type="text" id="m_id" name="m_id" value=""> <input
					type="button" value="ID 중복 확인" onclick="idDupCheck()"></td>
			</tr>
			<tr height="40">
				<td bgcolor="yellow">비밀번호</td>
				<td><input type="password" id="m_password" name="m_password"
					value=""></td>
			</tr>
			<tr height="40">
				<td bgcolor="gray">비밀번호 확인</td>
				<td><input type="password" id="m_password2" name="m_password2"
					value=""></td>
			</tr>
			<tr height="40">
				<td bgcolor="yellow">이름</td>
				<td><input type="text" id="m_name" name="m_name" value=""></td>
			</tr>
			<tr height="40">
				<td bgcolor="yellow">전화번호</td>
				<td><input type="text" id="m_tel" name="m_tel" value=""></td>
			</tr>
			
			<tr height="40">
				<td bgcolor="yellow">주소</td>
				<td><input type="text" id="sample4_postcode" name="m_postcode" placeholder="우편번호">
					<input type="button" onclick="findjuso()" value="우편번호 찾기"><br>  <!-- sample4_execDaumPostCode()는 jsLib의 외부문서에 있는 function -->
					<input type="text" id="sample4_roadAddress" name="m_roadcode"placeholder="도로명주소"> 
					<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소"> 
					<span id="guide" style="color: #999; display: none"></span> 
					<input type="text" id="sample4_detailAddress" name="m_detailaddress" placeholder="상세주소">
					<input type="hidden" id="sample4_extraAddress" placeholder="참고항목"></td>
			</tr>
			<tr height="40">
				<td bgcolor="yellow">생일</td>
				<td><input type="date" id="m_birth" name="m_birth" value=""></td>
			</tr>
			<tr height="40">
				<td bgcolor="yellow">등급</td>
				<td><input type="text" id=m_grade name="m_grade" value=""></td>
			</tr>
			<tr height="40">
				<td bgcolor="yellow">레벨</td>
				<td><input type="text" id="m_level" name="m_level" value=""></td>
			</tr>
			
			<tr height="40">
				<td bgcolor="yellow">프로필 이미지</td>
				<td><input type="file" id=m_upimage name="m_upimage"></td>
			</tr>
			<tr>
				<td></td>
				<td><!-- <input type="submit" value="가입" onclick="return inputCheck()" disabled="disabled" id="sss">&nbsp;&nbsp; -->
					<input type="submit" value="가입" onclick="return inputCheck()">&nbsp;&nbsp;
					<input type="reset" value="초기화">
			</tr>
		</table>
	</form>

</body>
</html>