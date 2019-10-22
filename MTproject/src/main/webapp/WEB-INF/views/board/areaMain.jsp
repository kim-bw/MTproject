<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="/resources/jsLib/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//1. 클릭해서 게시판 넘어가기
	$('.board').on('click',function(e){
		e.preventDefault();
		var select = $(this).attr('href');
		var cityNum = $(this).data('city');
		var pageNum = 1;
		var amount = 10;
		var loca = '/board/selectBoard?cityNum='+cityNum+'&pageNum='+pageNum+'&amount='+amount+'&select='+select;
		alert(loca);
		self.location=loca;
		alert(loca);
	});//
});
</script>

<title>${svo.s_name} 지역 페이지 입니다.</title>
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


</head>

<body>
<div class="areaimage">
	<img src="${svo.s_image01}" class="areaimage">
	${svo.s_name} 페이지 입니다.<br>
	자유게시판 -><a class="board" data-city="${criteria.cityNum}" href="1">보기</a><br>
	맛집 -><a class="board" data-city="${criteria.cityNum}" href="2">보기</a><br>
	여행지 -><a class="board" data-city="${criteria.cityNum}" href="3">보기</a><br>
</div>

</body>
</html>