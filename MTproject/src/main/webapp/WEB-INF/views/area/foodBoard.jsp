<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

</head>
<body>
<h2>foodboard list</h2>
<table width = "800" border = "-1">
	<tr align = "center" height = "30">
		<td>f_city</td>
		<td>f_seq</td>
		<td>f_select</td>
		<td>f_name</td>
		<td>f_address</td>
		<td>f_detailaddress</td>
		<td>f_areacode</td>
		<td>f_location</td>
		<td>f_good</td>
		<td>f_bad</td>
		<td>f_point</td>
		<td>f_rank</td>
	</tr>
	<c:forEach var = "bl" items = "${list}">
		<tr align = "left" height = "30">
			<td>${bl.f_city}</td>
			<td>${bl.f_seq}</td>
			<td>${bl.f_select}</td>
			<td><a href = "showDetailBoard?p_city=${bl.f_city}&p_select=${bl.f_select}&p_seq=${bl.f_seq}&p_curpage=1">${bl.f_name}</a></td>
			<td>${bl.f_address}</td>
			<td>${bl.f_detailaddress}</td>
			<td>${bl.f_areacode}</td>
			<td>${bl.f_location}</td>
			<td>${bl.f_good}</td>
			<td>${bl.f_bad}</td>
			<td>${bl.f_point}</td>
			<td>${bl.f_rank}</td>
		</tr>
	</c:forEach>
</table>
<hr>
<c:forEach var="i" begin="1" end="${pvo.p_totpage}">
	<c:choose>
		<c:when test="${pvo.p_curpage==i}">
			<font size="5" color="red"> ${i} </font>&nbsp;
		</c:when>
		
		<c:otherwise>
			<a href="selectBoard?p_curpage=${i}&p_select=${pvo.p_select}&p_city=${pvo.p_city}">${i}</a>&nbsp;
		</c:otherwise>
	</c:choose>
</c:forEach>
<c:if test="${USERID!=null}"><a href="showInsertForm?p_city=${pvo.p_city}&p_select=${pvo.p_select}">글쓰기</a></c:if>

</body>
</html>