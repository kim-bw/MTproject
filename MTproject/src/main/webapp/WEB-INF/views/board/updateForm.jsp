<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정하기</title>
</head>
<body>

<table>
	<form action="updateBoard" method="get">
	<tr>
		<th>제목</th>
		<th>내용</th>
	</tr>
	<tr>
		<td><input type="text" value="${bvo.b_title}" name="b_title"></td>
		<td><input type="text" value="${bvo.b_content}" name="b_content"></td>
		<input type="hidden" value="${bvo.b_city}" name="b_city"/>
		<input type="hidden" value="${bvo.b_select}" name="b_select"/>
		<input type="hidden" value="${bvo.b_seq}" name="b_seq"/>
		<input type="hidden" value="${bvo.b_adrimage}" name="b_adrimage"/>
		<input type="hidden" value="${USERID}" name="b_id"/>
		
	</tr>
	<tr>
		<td><input type="submit" value="수정하기"></td>
		<td><input type="reset" value="리셋하기" ></td>
	</tr>
	</form>
</table>
	




</body>
</html>