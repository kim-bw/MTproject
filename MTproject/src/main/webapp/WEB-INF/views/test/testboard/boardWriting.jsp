<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<body>
<h3>글쓰기</h3>
<form>
	<table>
		<tr>
			<td>I D</td>
			<td><input type = "text" name = "id" value = "로그인ID"></td>
		</tr>
		<tr>
			<td>title</td>
			<td><input type = "text" name = "title" value = ""></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name = "content" rows = "10" cols = "40"></textarea>
		</tr>
		<tr>
			<td></td>
			<td><input type = "submit" value = "등록"></td>
		</tr>
	</table>
</form>
</body>
</html>