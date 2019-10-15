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
					<c:forEach var="rr"  items="${list}" varStatus="rList">
						<c:if test="${rr.r_select==1}">
							<tr>
								<td>	
									${rr.r_id}
								</td>
							</tr>
							<tr>
								<td>
									&nbsp;&nbsp;&nbsp;${rr.r_content}<br>
								</td>
							</tr>
	
					
							<c:if test="${rr.r_id==USERID}">
								<tr>
								<td>
									<div id="updateReplyForm${rList.index}" style="display: none;">
										<textarea id="updateReply${rList.index}" name="reply" style="width: 600px; height: 50px; margin-left:20px; margin-top: 5px;"></textarea>							
										<input type="hidden" id="r_city" value="${rr.r_city}">  
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
		    <div>
                <span><strong>Comments</strong></span> <span id="cCnt"></span>
            </div>       
		<textarea id="reply" name="reply" placeholder="댓글을 입력하세요" style="width: 600px; height: 50px; margin-left:20px; margin-top: 5px;"></textarea>
		<input type="hidden" id="b_city" name="r_city" value="${Rvo.b_city}">
		<input type="hidden" id="b_select" name="r_select" value="${Rvo.b_select}">
		<input type="hidden" id="b_num" name="r_num" value="${Rvo.b_seq}">	
		
		<input type="hidden" id="f_city" name="r_city" value="${Rvo.f_city}">
		<input type="hidden" id="f_select" name="r_select" value="${Rvo.f_select}">
		<input type="hidden" id="f_num" name="r_num" value="${Rvo.f_seq}">	
		
		<input type="hidden" id="l_city" name="r_city" value="${Rvo.l_city}">
		<input type="hidden" id="l_select" name="r_select" value="${Rvo.l_select}">
		<input type="hidden" id="l_seq" name="r_num" value="${Rvo.l_seq}">		
		
		
		<input type="button" value="리플등록" onclick="addReply();">
		</div>	
	</form>
</div>

<!-- 리플등록 -->



</body>
</html>