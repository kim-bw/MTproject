<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<h2>board List</h2>
<form action = "showBoardWriting">
<table width = "800" border = "-1">
	<tr align = "center" height = "30">
		<td>b_city</td>
		<td>b_seq</td>
		<td>b_title</td>
		<td>b_id</td>
		<td>b_date</td>
		<td>b_content</td>
		<td>b_cnt</td>
	</tr>
	<c:forEach var = "bl" items = "${list}">
		<tr align = "left" height = "30">
			<td>${bl.b_city}</td>
			<td>${bl.b_seq}</td>
			<td><a href = "test-showDetailBoard?b_city=${bl.b_city}&b_seq=222&p_curPage=1">${bl.b_title}</a></td>
			<td>${bl.b_id}</td>
			<td>${bl.b_date}</td>
			<td>${bl.b_content}</td>
			<td>${bl.b_cnt}</td>
		</tr>
	</c:forEach>
</table>
<br><br><br>
	<c:forEach var = "i" begin = "1" end = "${totalPage}">
		<c:choose>
			<c:when test = "${i == currPage}">
				<font size = "5" color = "Orange">${i}</font>
			</c:when>
		<c:otherwise>
			<a href = "showMyBoard?currPage=${i}">${i}</a>
		</c:otherwise>
		</c:choose>
	</c:forEach>
<input type = "submit" value = "글쓰기">
</form>
</body>
</html>