<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기</title>
</head>
<body>
<form action="insertBoard" method="get">
<input type="hidden" id="city" name="b_city" value="${pvo.p_city}"><br>
<input type="text" id="title" name="b_title"><br>
<input type="text" id="content" name="b_content"><br>
<input type="hidden" id="id" name="b_id" value="${USERID}"><br>
<input type="hidden" id="select" name="b_select" value="${pvo.p_select}"><br>
<input type="hidden" id="adrimage" name="b_adrimage" value="emt"><br>
<input type="submit" value="글 등록">
</form>


</body>
</html>