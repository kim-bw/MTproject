<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** Member Detail, Update **</title>
<script src="resources/jsLib/jquery-3.2.1.min.js"></script><!-- 기본 -->
<script src="resources/jsLib/inchk.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> <!--주소를 위한 우편 api  -->
<script src="resources/jsLib/juso.js"></script>
</head>
<body>
<h3>** Member Detail Spring MVC **</h3>
<form action="updateMember" method="post" enctype="multipart/form-data">
<table>
<tr height="40"><td bgcolor="gray">I D</td>
	<td><input type="text" name="m_id" value="${mvo.m_id}" readonly="readonly"></td></tr>
<tr height="40"><td bgcolor="gray">비밀번호</td>
	<td><input type="password" name="m_password" value="${mvo.m_password}"></td></tr>
<tr height="40"><td bgcolor="gray">이름</td>
	<td><input type="text" name="m_name" value="${mvo.m_name}"></td></tr>
<tr height="40">
	<td bgcolor="yellow">전화번호</td>
	<td><input type="text" name="m_tel" value="${mvo.m_tel}"></td></tr>
			
<tr height="40">
	<td bgcolor="yellow">주소</td>
	<td><input type="text" id="sample4_postcode" name="m_postcode" value="${mvo.m_postcode}">
	<input type="button" onclick="findjuso()" value="우편번호 찾기"><br>  <!-- sample4_execDaumPostCode()는 jsLib의 외부문서에 있는 function -->
	<input type="text" id="sample4_roadAddress" name="m_roadcode" value="${mvo.m_roadcode}"> 
	<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소"> 
	<span id="guide" style="color: #999; display: none"></span> 
	<input type="text" id="sample4_detailAddress" name="m_detailaddress" value="${mvo.m_detailaddress}">
	<input type="hidden" id="sample4_extraAddress" placeholder="참고항목"></td></tr>
	
<tr height="40">
	<td bgcolor="yellow">생일</td>
	<td><input type="date" name="m_birth" value="${mvo.m_birth}"></td></tr>
	
<tr height="40">
	<td bgcolor="yellow">등급</td>
	<td><input type="text" name="m_grade" value="${mvo.m_grade}"></td></tr>
	
<tr height="40">
	<td bgcolor="yellow">레벨</td>
	<td><input type="text" name="m_level" value="${mvo.m_level}"></td></tr>
			

<tr height="40"><td bgcolor="gray">프로필 이미지</td>
	<td><img src="${mvo.m_upimage}"/><br>
	<input type="text" name="m_adrimage" value="${mvo.m_adrimage}" hidden="true"><br>
	<input type="file" name="m_upimage">
	</td></tr>
	
	<input type="hidden" name="m_city" value="1">
	<input type="hidden" name="m_seq" value="1455">



<tr><td></td><td><input type="submit" value="수정">
                 <input type="reset" value="초기화"></td>	
</table>
</form>
<br>
<c:if test="${loginID=='admin'}">
	======><a href="mdelete?id=${Apple.id}">회원삭제</a>
</c:if>
     
</body>
</html>