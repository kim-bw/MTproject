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
<div class="container">
	<form id="replyListForm" name="replyListForm" method="post">
		<div id="replyList" style="width: 800px; height: 100%; background-color: WhiteSmoke;">
			<c:if test="${pvo.p_totrow>0}">		
				<table class="ReplyForm">
					<c:forEach var="rr" items="${list}" varStatus="rList">
					<tr>
						<td>${rr.r_id}</td>
					</tr>
					
					<tr>
						<td>&nbsp;&nbsp;&nbsp;${rr.r_content}<br></td>
					</tr>
					
					<tr>
						<td>${rr.r_seq}</td>
					</tr>
					
					<tr>
						<td>
							<c:if test="${rr.r_id==USERID}">
						
								<div id="updateReplyForm${rList.index}" style="display: none;">
									<textarea id="updateReply" name="reply" style="width: 600px; height: 50px; margin-left:20px; margin-top: 5px;"></textarea>							
									<input type="hidden" id="seq" value="${rr.r_seq}">
									<input type="button" value="댓글 수정" onclick="UdateReply();">                 
								</div>	
							
								
								<div id="up_del"${rList.index}>
									<input type="button" value="수정" onclick="goUpReplyForm('${rList.index}');">
									<input type="button" value="삭제" onclick="deleteReply();">
									<input type="button" id="seq" value="${rr.r_seq}">
									<a href="deleteReply?r_seq=${rr.r_seq}&r_city=${rr.r_city}">삭제</a>
								</div>

							</c:if>
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
		    <div>
                <span><strong>Comments</strong></span> <span id="cCnt"></span>
            </div>       
		<textarea id="reply" name="reply" placeholder="댓글을 입력하세요" style="width: 600px; height: 50px; margin-left:20px; margin-top: 5px;"></textarea>
		<input type="hidden" id="city" name="r_city" value="${Rvo.b_city}">
		<input type="hidden" id="select" name="r_select" value="${Rvo.b_select}">
		<input type="hidden" id="num" name="r_num" value="${Rvo.b_seq}">	
		<input type="button" value="리플등록" onclick="addReply();">
		</div>	
	</form>
</div>





</body>
</html>