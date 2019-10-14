<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.areaimage {
	max-width: 100%;
	max-height: 100%;
	left : 0;
	right :0;
	top : 0;
	bottom : 0;
	margin : auto;
	overflow : auto;
	position: fixed;
}
</style>

<title>${svo.s_name} 지역 페이지 입니다.</title>
</head>
<body>
<div class="areaimage">
	<img src="${svo.s_image01}" class="areaimage">
	${svo.s_name} 페이지 입니다.<br>
	자유게시판 -><a href="selectBoard?p_city=${svo.s_city}&p_select=1&p_curpage=1">보기</a><br>
	맛집 -><a href="selectBoard?p_city=${svo.s_city}&p_select=2&p_curpage=1">보기</a><br>
	여행지 -><a href="selectBoard?p_city=${svo.s_city}&p_select=3&p_curpage=1">보기</a><br>
</div>
</body>
</html>