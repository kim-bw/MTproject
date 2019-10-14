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
<h2>placeBoard list</h2>
<table width = "800" border = "-1">
	<tr align = "center" height = "30">
		<td>l_city</td>
		<td>l_seq</td>
		<td>l_select</td>
		<td>l_name</td>
		<td>l_address</td>
		<td>l_detailaddress</td>
		<td>l_areacode</td>
		<td>l_location</td>
		<td>l_good</td>
		<td>l_bad</td>
		<td>l_point</td>
		<td>l_rank</td>
	</tr>
	<c:forEach var = "bl" items = "${list}">
		<tr align = "left" height = "30">
			<td>${bl.l_city}</td>
			<td>${bl.l_seq}</td>
			<td>${bl.l_select}</td>
			<td><a href = "showDetailBoard?p_city=${bl.l_city}&p_select=${bl.l_select}&p_seq=${bl.l_seq}&p_curpage=1">${bl.l_name}</a></td>
			<td>${bl.l_address}</td>
			<td>${bl.l_detailaddress}</td>
			<td>${bl.l_areacode}</td>
			<td>${bl.l_location}</td>
			<td>${bl.l_good}</td>
			<td>${bl.l_bad}</td>
			<td>${bl.l_point}</td>
			<td>${bl.l_rank}</td>
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