<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** Member Detail, Update **</title>
</head>
<body>
<h3>** Member Detail Spring MVC **</h3>
<form action="updateMember" method="post" enctype="multipart/form-data">
<table>
<tr height="40"><td bgcolor="gray">I D</td>
	<td><input type="text" name="id" value="${Apple.id}" readonly="readonly"></td></tr>
<tr height="40"><td bgcolor="gray">비밀번호</td>
	<td><input type="password" name="password" value="${Apple.password}"></td></tr>
<tr height="40"><td bgcolor="gray">이름</td>
	<td><input type="text" name="name" value="${Apple.name}"></td></tr>
<tr height="40"><td bgcolor="yellow">전화번호</td>
	<td><input type="text" id="tel" name="tel" value="${Apple.tel}"></td></tr>
<tr height="40"><td bgcolor="yellow">주소</td>
				<td><input type="text" id="sample4_postcode" placeholder="우편번호">
					<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>  <!-- sample4_execDaumPostCode()는 jsLib의 외부문서에 있는 function -->
					<input type="text" id="sample4_roadAddress" placeholder="도로명주소"> 
					<input type="text" id="sample4_jibunAddress" placeholder="지번주소"> 
					<span id="guide" style="color: #999; display: none"></span> 
					<input type="text" id="sample4_detailAddress" placeholder="상세주소">
					<input type="text" id="sample4_extraAddress" placeholder="참고항목"></td></tr>
<tr height="40"><td bgcolor="yellow">등급</td>
				<td><input type="text" id=grade name="grade" value="${Apple.grade}"></td></tr>
<tr height="40"><td bgcolor="yellow">레벨</td>
				<td><input type="number" id=level name="level" value="${Apple.level}"></td></tr>
<tr height="40"><td bgcolor="yellow">미션 성공 횟수</td>
				<td><input type="number" id=suc name="suc" value="${Apple.suc}"></td></tr>
<tr height="40"><td bgcolor="yellow">미션 실패 횟수</td>
				<td><input type="number" id=fail name="fail" value="${Apple.fail}"></td></tr>
<tr height="40"><td bgcolor="yellow">미션 도전 성공률</td>
				<td><input type="text" id=ratio name="ratio" value="${Apple.ratio}"></td></tr>
<tr height="40"><td bgcolor="yellow">사진 주소</td>
				<td><input type="text" id=adrimage name="adrimage" value="${Apple.adrimage}"></td></tr>

<tr height="40"><td bgcolor="yellow">프로필 이미지</td>
				<td><input type="file" id=upimage name="upimage"></td></tr>


<tr><td></td>
<td>
<input type="submit" value="수정">
<input type="reset" value="초기화"></td></tr>
</table>
</form>
<br>

     
</body>
</html>