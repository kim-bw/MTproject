<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>${svo.s_name} 지역 페이지 입니다.</title>
<script src="resources/jsLib/jquery-3.2.1.min.js"></script>
<script src="resources/jsLib/kim.js"></script>



</head>
<body>

<div class="areaimage">
	<img src="${svo.s_image01}" class="areaimage">
	${svo.s_name} 페이지 입니다.<br>
	자유게시판 -><a class="sel_Board" data-city="${cityNum}" href="freeBoard">보기</a><br>
	맛집 -><a class="sel_Board" data-city="${cityNum}" href="foodBoard">보기</a><br>
	여행지 -><a class="sel_Board" data-city="${cityNum}" href="placeBoard">보기</a><br>
</div>


</body>
</html>