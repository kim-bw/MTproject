<!-- 1. 인풋 파라미터 : ArrayList<lvo> from testcontroller/test-gomission -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>


<html>
<head>
	<title>Home</title>
<script src="resources/jsLib/jquery-3.2.1.min.js"></script>
<script src="resources/jsLib/jidomapping.js"></script>
<link rel="stylesheet" href="resources/jsLib/style.css" type="text/css">
<script>
	
$(function(){//함수만 있으면 무조건 먼저 실행



});

	function showhwa() {
		var x = [100,200,300];
		var y = [100,200,300];

		var a ="";

		
		for (i=0; i<x.length; i++){
			
			var b =	"<div style='left:"+x[i]+"px; top:"+y[i]+"px; width: 40px; height: 50px; position: absolute;z-index: 1;'>"
						+"<img id='hwasal' src='resources/image/hwa1.png' width='100%' height='100%'>"
					+"</div>"
			a +=b;		
		};

		$(".hwa").append(a);	
	};

</script>


</head>
<body>

<div class="header" style="z-index: 2;">DIV class header

</div>
<div class="lside">

	<input type="button" value="나와라" onclick="showhwa();">
</div>	
	
	<div class="center">

		<div style="position: absolute; background-color: yellow; width: 647px; height: 850px;">
			
			<div class="jidomap"  >
	 			<img id="jido" src="resources/image/jido.png" usemap="#map">
	 		</div>
	 		
	 		<div class='hwa' style="position: absolute;">
				
	 		</div>	
	 		
	 	</div>
	 	
	 	 


	 	
		
			
		
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
		<area class="map07" shape="poly" coords="" href="http://www.naver.com"
		>	
		</map>
		
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<br><br><br><br><br><br><br><br><br><br><br><br>asdfasdfasdf<br><br><br><br><br><br><br><br><br><br>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

	</div>
	
	

	

</body>
</html>