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
</head>
<body>
<h3>Detail 화면</h3>
<table width = "800" border = "-1">
	<tr>
		<td>b_city</td>
		<td><input type = "text" id="b_city" name = "b_city" value = "${Rvo.b_city}" readonly = "readonly"></td>
		<td>b_seq</td>
		<td><input type = "text" id="b_seq" name = "b_seq" value = "${Rvo.b_seq}" readonly = "readonly"></td>
		<td>b_title</td>
		<td><input type = "title" id="b_title" name = "b_title" value = "${Rvo.b_title}"></td>
		<td>b_id</td>
		<td><input type = "content" id="b_id" name = "b_id" value = "${Rvo.b_id}"></td>
		<td>b_date</td>
		<td><input type = "content" id="b_date" name = "b_date" value = "${Rvo.b_date}"></td>
		<td>b_content</td>
		<td><input type = "text" id="b_content" name = "b_content" value = "${Rvo.b_content}"></td>
		<td>b_cnt</td>
		<td><input type = "text" id="b_cnt" name = "b_cnt" value = "${Rvo.b_cnt}"></td>
	</tr>
</table>
<hr>
<c:if test="${Rvo.b_id==USERID}">
	<a href="/board/delete.do?p_city=${p_city}&p_select=${p_select}&p_seq=${p_seq}">글 삭제</a>
</c:if>
<c:if test="${Rvo.b_id==USERID}">
	<a href="/board/showUpdateBoardForm?p_city=${Rvo.b_city}&p_select=1&p_seq=${Rvo.b_seq}">글 수정</a>
</c:if>
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
							<c:if test="${rr.r_step==0}">
							<tr>
								<td>${rr.r_id}&nbsp;<input type="button"value="답글" onclick="goAddReply_ReplyForm('${rList.index}');"><br></td>
							</tr>
							</c:if>
							
							<c:if test="${rr.r_step==1}">
							<tr>
								<td>&nbsp;<span style="color:red">ㄴ>re:</span> ${rr.r_id}<br></td>
							</tr>
							</c:if>								
							
							
							
							<c:if test="${rr.r_step==0}">
							<tr>
								<td>${rr.r_content}</td>
							</tr>	
							</c:if>	
							
							<c:if test="${rr.r_step==1}">
							<tr>
								<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${rr.r_content}</td>
							</tr>	
							</c:if>	
								
														

							<tr>
								<td>
									<div id="addReply-ReplyForm${rList.index}" style="display: none;">
										<textarea id="reply_reply${rList.index}" placeholder="댓글을 입력하세요" name="reply" style="width: 600px; height: 50px; margin-left:20px; margin-top: 5px;"></textarea>
										<input type="button" value="댓글 등록" onclick="addReply_Reply('${rr.r_seq}','${rr.r_root}');">  	
									</div>
								</td>
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
									
								</td>			
								</tr>
							</c:if>
						<tr>
							<td>	
								<hr style='border-style: dotted; width: 750px;'>		
							</td>
						</tr>	
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
			<input type="hidden" id="city" name="r_city" value="${Rvo.b_city}">
			<input type="hidden" id="select" name="r_select" value="${pvo.p_select}">
			<input type="hidden" id="num" name="r_num" value="${Rvo.b_seq}">	
			<input type="hidden" id="id" name="r_id" value="${Rvo.b_id}">	
		<input type="button" value="리플등록" onclick="addReply();">
		</div>	
	</form>
</div>

</body>
</html>