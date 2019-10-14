<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>Detail 화면</h3>
<table width = "800" border = "-1">
	<tr>
		<td>b_city</td>
		<td><input type = "text" name = "b_city" value = "${bvo.b_city}" readonly = "readonly"></td>
		<td>b_seq</td>
		<td><input type = "text" name = "b_seq" value = "${bvo.b_seq}" readonly = "readonly"></td>
		<td>b_title</td>
		<td><input type = "title" name = "b_title" value = "${bvo.b_title}"></td>
		<td>b_id</td>
		<td><input type = "content" name = "b_id" value = "${bvo.b_id}"></td>
		<td>b_date</td>
		<td><input type = "content" name = "b_date" value = "${bvo.b_date}"></td>
		<td>b_content</td>
		<td><input type = "text" name = "b_content" value = "${bvo.b_content}"></td>
		<td>b_cnt</td>
		<td><input type = "text" name = "b_cnt" value = "${bvo.b_cnt}"></td>
	</tr>
</table>
<hr>
<td>
<c:if test = "${name>0}">
	<c:forEach begin = "1" end = "${name}">
		<span> </span>
	</c:forEach>
	<span style = "...">re -</span>
</c:if>
</body>
</html>