<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>
</head>
<body>
<a href="showDetailMember">my info</a><br>
<a href="test-showMyMission">my mission</a><br>
<a href="test-showMyStatus">my status</a><br>
나의 활동 free board<br>
<table>
	<tr>
		<th>b_seq</th>
		<th>b_id</th>
		<th>b_title</th>
		<th>b_date</th>
		<th>b_cnt</th>
	</tr>
<c:forEach var="mm" items="${myBoard}">
	<tr>
		<td>${mm.b_seq}</td>
		<td>${mm.b_id}</td>
		<td><a href = "showDetailBoard?p_city=${mm.b_city}&p_select=${mm.b_select}&p_seq=${mm.b_seq}&p_curpage=1">${mm.b_title}</a></td>
		<td>${mm.b_date}</td>
		<td>${mm.b_cnt}</td>
	</tr>
	</c:forEach>
</table>
나의 활동 reply board<br>
<table>
	<tr>
		<th>r_id</th>
		<th>r_select</th>
		<th>r_content</th>
		<th>r_date</th>
	</tr>
<c:forEach var="pp" items="${myReply}">
	<tr>
		<td>${pp.r_seq}</td>
		<td>${pp.r_select}</td>
		<td>${pp.r_content}</td>
		<td>${pp.r_date}</td>
	</tr>
	</c:forEach>
</table>

</body>
</html>