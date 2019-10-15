<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>


<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Home</title>
<script src="resources/jsLib/jquery-3.2.1.min.js"></script>
<script src="resources/jsLib/jidomapping.js"></script>
<script src="resources/jsLib/randomplace.js"></script>
<link rel="stylesheet" href="resources/jsLib/style.css" type="text/css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<script>
$(function(){

});
	
</script>


</head>
<body>

<div class="header" style="z-index:2;">DIV class header
	<div class="menubar">
		<ul><!-- 이렇게만 하면 출력시 세로로 나옴 -->
			<li>메뉴1
				<ul>
					<li><a href="logout">로그아웃</a></li>
					<li><a href="#"> 1-2</a></li>
					<li><a href="#"> 1-3</a></li>
					<li><a href="#"> 1-4</a></li>
				</ul>					
			</li>
			<li>메뉴2
				<ul>
					<li><a href="#"> 2-1</a></li>
					<li><a href="#"> 2-2</a></li>
					<li><a href="#"> 2-3</a></li>
					<li><a href="#"> 2-4</a></li>
				</ul>	
			</li>
			<li>메뉴3
				<ul>
					<li><a href="#"> 3-1</a></li>
					<li><a href="#"> 3-2</a></li>
					<li><a href="#"> 3-3</a></li>
					<li><a href="#"> 3-4</a></li>
				</ul>					
			</li>
			<li>팔도
				<ul>
					<li><a href="/board/areaMain?s_city=1">서울/경기</a></li>
					<li><a href="/board/areaMain?s_city=2">강원도</a></li>
					<li><a href="/board/areaMain?s_city=3">충청도</a></li>
					<li><a href="/board/areaMain?s_city=4">전라도</a></li>
					<li><a href="/board/areaMain?s_city=5">경상도</a></li>
					<li><a href="/board/areaMain?s_city=6">제주도</a></li>
				</ul>
			</li>
		</ul>
	</div>
</div>
<div class="lside">
	<div class="menubarleft">
		<ul><!-- 이렇게만 하면 출력시 세로로 나옴 -->
			<li>메뉴1
				<ul>
					<li><a href="test-showMyPage"> 마이페이지</a></li>
					<li><a href="#"> 1-2</a></li>
					<li><a href="#"> 1-3</a></li>
					<li><a href="#"> 1-4</a></li>
					
				</ul>					
			</li>
			<li>메뉴2
				<ul>
					<li><a href="#"> 2-1</a></li>
					<li><a href="#"> 2-2</a></li>
					<li><a href="#"> 2-3</a></li>
					<li><a href="#"> 2-4</a></li>
				</ul>	
			</li>
			<li>메뉴3
				<ul>
					<li><a href="#"> 3-1</a></li>
					<li><a href="#"> 3-2</a></li>
					<li><a href="#"> 3-3</a></li>
					<li><a href="#"> 3-4</a></li>
				</ul>					
			</li>
			<li>메뉴4
				<ul>
					<li><a href="#"> 4-1</a></li>
					<li><a href="#"> 4-2</a></li>
					<li><a href="#"> 4-3</a></li>
					<li><a href="#"> 4-4</a></li>
				</ul>
			</li>
		</ul>
	</div>
	</div>	
	
	<div class="center">
		<h1>DIV center<input type="button" value="랜덤 여행지 보기" onclick="randomPl();"></h1>

		<div class="jidomap">
		
		<img src="resources/image/jido.png" usemap="#map"><br>
		
		<map class="map" name="map">
		
		<area class="map01" shape="poly" coords="128,148,146,159,158,154,179,120,172,109,182,96,216,85,215,111,224,117,261,118,264,122,265,157,257,160,250,166,248,193,258,199,289,199,293,205,294,260,252,260,242,265,239,275,238,290,113,289,134,269,142,273,152,272,158,263,154,234,146,223,128,221,104,207,92,186,98,172,118,154"
		>
		
		<area class="map02" shape="poly" coords="219,84,220,111,269,113,268,163,254,169,256,193,292,194,298,203,298,260,394,261,404,272,401,281,504,282,382,45,372,41,363,44,359,60,356,63,346,56,329,73,330,81,322,88,276,85,272,72,249,76"
		>		
		
		<area class="map03" shape="poly" coords="400,287,508,288,512,330,512,342,500,409,526,432,514,503,366,503,354,491,353,471,336,465,306,465,306,441,340,440,342,399,334,393,322,393,318,387,318,333,324,330,394,329,401,321"
		>		

		<area class="map04" shape="poly" coords="253,264,392,267,399,275,398,317,389,322,325,322,317,328,314,330,312,391,322,400,334,402,338,435,271,436,270,361,261,352,251,352,244,346,244,274"
		>			
		
		<area class="map05" shape="poly" coords="109,294,240,298,239,350,250,361,262,362,265,436,150,436,137,411,90,328,90,312"
		>		

		<area class="map06" shape="poly" coords="148,436,303,439,304,467,338,468,352,482,352,494,363,507,514,506,525,424,499,409,514,318,503,280,376,39,365,42,359,54,354,64,348,57,342,56,330,72,329,79,318,90,282,85,269,73,177,100,173,109,174,128,157,157,145,160,128,149,96,179,94,191,101,208,123,224,145,227,156,243,156,271,146,275,135,271,129,271,88,315,87,327,111,418,111,378,130,404"
		>		
		</map>
		</div>
		
		<div class='hwa' style="position: absolute;">
				
	 	</div>	
	
		
		<div class="viewinfor" style="width: 270px; height: 300px; overflow: hidden;">

		<div class="mt" id="mt_A" style="overflow:scroll; display:none; width:300px; height:100%; padding-top :10px; padding-bottom:10px; background-color:gold;">
		<!-- class view width 값은 p1 보다 적게  (우측 스크롤 감추기용) overflow 크기가 넘어가느 부분은 숨김, height는 보이는 크기, 우리 맘대로 조절 -->
		<!-- class p1 overflow scroll 스크롤 실행, height 100% 는 내용이 더 늘어날수 있으니 그거 맞출라고. top, bottom 에서부터 10px 거리-->
		강원도 내용을 입력<br>
		<a href="test_gangwondo">강원도 게시판 가기</a>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>end
		</div>
		
		<div class="mt" id="mt_B" style="overflow:scroll; display:none; width:300px; height:100%; padding-top :10px; padding-bottom:10px; background-color:green;">
		경기도 내용을 입력<br>
		<a href="">경기도 게시판 가기</a>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>end
		</div>		
		

		<div class="mt" id="mt_C" style="overflow:scroll; display:none; width:300px; height:100%; padding-top :10px; padding-bottom:10px; background-color:yellow;">
		p3 start 내용을 입력
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>end
		</div>	
		
		<div class="mt" id="mt_D" style="overflow:scroll; display:none; width:300px; height:100%; padding-top :10px; padding-bottom:10px; background-color:pink;">
		p4 start 내용을 입력
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>end
		</div>		
		
		<div class="mt" id="mt_E" style="overflow:scroll; display:none; width:300px; height:100%; padding-top :10px; padding-bottom:10px; background-color:blue;">
		p5 start 내용을 입력
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>end
		</div>		

		<div class="mt" id="mt_F" style="overflow:scroll; display:none; width:300px; height:100%; padding-top :10px; padding-bottom:10px; background-color:blue;">
		p6 start 내용을 입력
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>end
		</div>	
			
		</div>			

		
		
	</div>	

	
<div class="rside">
<sec:authorize access="isAnonymous()">
<div class="loginForm">
<form action="/security_check" method="post">
	<label for="id" class="badge badge-pill badge-success">아이디</label>
	<input type="text" id="id" name="m_id" style="width: 100px"> <br>
	<label for="password" class="badge badge-pill badge-success">비밀번호</label>
	<input type="password" id="password" name="m_password" style="width: 100px"><br>
	<input type="submit" class="btn btn-primary" value="login">
</form>
</div>
 </sec:authorize>
 
<sec:authorize access="isAuthenticated()">
반갑습니다. <sec:authentication property="principal.mvo.m_name"/>님,<br>
사용자 정보가 표시됩니다.<br>
최근 접속 날짜를 넣으면 좋겠다<br> 
<p><sec:authentication property="principal.mvo.m_birth"/>
</sec:authorize>
 
<h1>rside Div</h1>
</div>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>



</body>
</html>