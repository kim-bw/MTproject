$(document).ready(function(){
	
	//지역 페이지로 이동하기
	$('.area').on('click',function(e){
		e.preventDefault();
		var cityNum = $(this).attr('href');
		self.location ='/board/areaMain?cityNum='+cityNum;
	});//지역페이지 이동
	
	//자유게시판
	$('.free').on('click',function(e){
		e.preventDefault()
		var cityNum = $(this).attr('href');
		self.location='/board/freeBoard?cityNum='+cityNum;
	})//자유끝
	
	//맛집
	$('.food').on('click',function(e){
		e.preventDefault()
		var cityNum = $(this).attr('href');
		self.location='/board/foodBoard?cityNum='+cityNum;
	})//맛집끝
	
	//여행지
	$('.place').on('click',function(e){
		e.preventDefault()
		var cityNum = $(this).attr('href');
		self.location='/board/placeBoard?cityNum='+cityNum;
	})//여행지끝
	
	
	
	
});