<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/jsLib/jquery-3.2.1.min.js"></script>
<script src="resources/jsLib/reply.js"></script>
 <style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>
</head>
<body>
<h3>여행지 화면</h3>
<table width = "800" border = "-1">
	<tr>
		<td>l_city</td>
		<td><input type = "text" name = "l_city" value = "${Rvo.l_city}" readonly = "readonly"></td>
		<td>l_seq</td>
		<td><input type = "text" name = "l_seq" value = "${Rvo.l_seq}" readonly = "readonly"></td>
		<td>l_select</td>
		<td><input type = "title" name = "l_select" value = "${Rvo.l_select}"></td>
		<td>l_name</td>
		<td><input type = "content" name = "l_name" value = "${Rvo.l_name}"></td>
		<td>l_address</td>
		<td><input type = "content" name = "l_address" value = "${Rvo.l_address}"></td>
		<td>l_detailaddress</td>
		<td><input type = "text" name = "l_detailaddress" value = "${Rvo.l_detailaddress}"></td>
		<td>l_areacode</td>
		<td><input type = "text" name = "l_areacode" value = "${Rvo.l_areacode}"></td>
		<td>l_location</td>
		<td><input type = "text" name = "l_location" value = "${Rvo.l_location}"></td>
		<td>l_good</td>
		<td><input type = "text" name = "l_good" value = "${Rvo.l_good}"></td>
		<td>l_bad</td>
		<td><input type = "text" name = "l_bad" value = "${Rvo.l_bad}"></td>
		<td>l_point</td>
		<td><input type = "text" name = "l_point" value = "${Rvo.l_point}"></td>
		<td>l_rank</td>
		<td><input type = "text" name = "l_rank" value = "${Rvo.l_rank}"></td>
		
	</tr>
</table>
<hr>
	<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                   정보 : <input type="text" value="${Rvo.l_address}" id="keyword" size="15"> 
                    <button type="submit">검색하기</button> 
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6c2372d881cc7a49a6eed2481ee6cc90&libraries=services"></script>
<script src="resources/jsLib/foodmap.js"></script>
	

<hr>
<c:if test="${pvo.p_totrow==0}">
<h3>댓글이 없습니다.</h3><br>
</c:if>

<div class="container">
	<form id="replyListForm" name="replyListForm" method="post">
		<div id="replyList" style="width: 800px; height: 100%; background-color: WhiteSmoke;">
			<c:if test="${pvo.p_totrow>0}">		
				<table class="ReplyForm">
					<c:forEach var="rr"  items="${list}" varStatus="rList">
							<tr>
								<td>${rr.r_id}</td>
							</tr>
							<tr>
								<td>&nbsp;&nbsp;&nbsp;${rr.r_content}<br></td>
							</tr>
	
					
							<c:if test="${rr.r_id==USERID}">
								<tr>
								<td>
									<div id="updateReplyForm${rList.index}" style="display: none;">
										<textarea id="updateReply${rList.index}" name="reply" style="width: 600px; height: 50px; margin-left:20px; margin-top: 5px;"></textarea>
										<input type="button" value="댓글 수정" onclick="UdateReply('${rr.r_seq}');">                 
									</div>	
							
									<div id="up_del${rList.index}">
										<input type="button" value="수정" onclick="goUpReplyForm('${rList.index}');">
										<input type="button" value="삭제" onclick="deleteReply('${rr.r_seq}');">
									</div>
									<hr style='border-style: dotted; width: 750px;'>
								</td>			
							</tr>
							</c:if>	
					</c:forEach>	
				</table>
			</c:if>
		</div>
	</form>
</div>






<div class="container">
	<form id="replyForm" name="replyForm" method="post">
	
		<div class="test-reply" style="width: 800px; height: 100%; background-color: WhiteSmoke;">
      
		<textarea id="reply" name="reply" placeholder="댓글을 입력하세요" style="width: 600px; height: 50px; margin-left:20px; margin-top: 5px;"></textarea>
			<input type="hidden" id="city" name="r_city" value="${Rvo.l_city}">
			<input type="hidden" id="select" name="r_select" value="${Rvo.l_select}">
			<input type="hidden" id="num" name="r_num" value="${Rvo.l_seq}">		
		<input type="button" value="리플등록" onclick="addReply();">
		</div>	
	</form>
</div>
</body>
</html>