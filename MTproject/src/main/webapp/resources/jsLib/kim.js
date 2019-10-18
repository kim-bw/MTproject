$(document).ready(function(){
	
	alert("ff");
	
	//지역 페이지로 이동하기
	$('.area').on('click',function(e){
		var cityNum = $(this).attr('href');
		e.preventDefault();
		self.location ='/board/areaMain?cityNum='+cityNum;
	});//지역페이지 이동

	});
	
