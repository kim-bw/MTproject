<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>

</script>
</head>
<body>
<h3>food detail 화면</h3>
<table width = "800" border = "-1">
	<tr>
		<td>f_city</td>
		<td><input type = "text" name = "f_city" value = "${Rvo.f_city}" readonly = "readonly"></td>
		<td>f_seq</td>
		<td><input type = "text" name = "f_seq" value = "${Rvo.f_seq}" readonly = "readonly"></td>
		<td>f_select</td>
		<td><input type = "title" name = "f_title" value = "${Rvo.f_select}"></td>
		<td>f_name</td>
		<td><input type = "content" name = "f_id" value = "${Rvo.f_name}"></td>
		<td>f_address</td>
		<td><input type = "content" name = "f_date" value = "${Rvo.f_address}"></td>
		<td>f_detailaddress</td>
		<td><input type = "text" name = "f_content" value = "${Rvo.f_detailaddress}"></td>
		<td>f_areacode</td>
		<td><input type = "text" name = "f_cnt" value = "${Rvo.f_areacode}"></td>
		<td>f_location</td>
		<td><input type = "text" name = "f_cnt" value = "${Rvo.f_location}"></td>
		<td>f_good</td>
		<td><input type = "text" name = "f_cnt" value = "${Rvo.f_good}"></td>
		<td>f_bad</td>
		<td><input type = "text" name = "f_cnt" value = "${Rvo.f_bad}"></td>
		<td>f_point</td>
		<td><input type = "text" name = "f_cnt" value = "${Rvo.f_point}"></td>
		<td>f_rank</td>
		<td><input type = "text" name = "f_cnt" value = "${Rvo.f_rank}"></td>
		
	</tr>
</table>
<hr>
<hr>
<c:if test="${pvo.p_totrow==0}">
<h3>댓글이 없습니다.</h3><br>
</c:if>

<form action="insertReply" method="get">
	<input type="text" name="r_content">
	<input type="hidden" id="city" name="r_city" value="${Rvo.f_city}">
	<input type="hidden" id="select" name="r_select" value="${Rvo.f_select}">
	<input type="hidden" id="num" name="r_num" value="${Rvo.f_seq}">
	<input type="submit" value="댓글등록">
	<!-- 원댓글이므로 r_step은 기본값인 0이 들어가 야함 -->
</form>

<c:if test="${pvo.p_totrow>0}">
		<table>
	<c:forEach var="rr" items="${list}">
			<tr>
				<td>${rr.r_id}</td>				
				<td>${rr.r_content}	
				<!-- 댓댓글이므로 r_step이 1의 값으로 전달되어야 함-->
				<!-- r_step이 0이면 원댓글로 인식-->
				<td></td>
			</tr>
			<tr>
				<td id="resultarea"></td>
			<tr>		
	</c:forEach>
		</table>
</c:if>






	
</table>



</body>
</html>