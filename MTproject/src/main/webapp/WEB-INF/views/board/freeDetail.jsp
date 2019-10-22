<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- header.jsp 연결하기 -->
<%@include file="../includes/header.jsp" %>
<script type="text/javascript">
$(document).ready(function(){
	
	var formObj = $('form');
	
	//list를 눌렀을 때 이전에 기억된 페이지로 이동
	$('button').on('click',function(e){
		e.preventDefault();
		var operation = $(this).data('oper');
		var cityNum = $(this).data('city');
		var pageNum = $(this).data('page');
		if(operation==='list'){
			formObj.attr('action','/board/selectBoard?select=1&cityNum='+cityNum+'&pageNum='+pageNum);
		}
		formObj.submit();
	});//click end
});//end
//User Profile

</script>



	 <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">게시글 읽기</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        
                        <div class="panel-heading">게시글 읽기</div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                       		<form action="/board/modifyForm" method="post">
                        		<div class="form-group">
                        			<label>글 번호</label> <input class="form-control" name="seqNum" value='<c:out value="${result.b_seq}"/>' readonly="readonly"/>
                        		</div>
                        		
                        		<div class="form-group">
                        			<label>글 제목</label> <input class="form-control" name="b_title" value='<c:out value="${result.b_title}"/>' readonly="readonly"/>
                        		</div>
                        		
                        		<div class="form-group">
                        			<label>글 내용</label> <textarea rows="3" class="form-control" name="b_content" readonly="readonly"><c:out value="${result.b_content}"/></textarea>
                        		</div>
                        		
                        		<div class="form-group">
                     				<label>작성자</label><input readonly="readonly" class="form-control" name="b_id" value='<c:out value="${result.b_id}"/>'/>
                     			</div>
                     			
                     			<!-- csrf코인을 함께 보내야 403에러가 생기지 않는다. -->
                     			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                     			<input type="hidden" name="cityNum" value="${result.b_city}" />
                     			<input type="hidden" name="select" value="11" />
							
                     <!-- principal을 저장 -->	<sec:authentication property="principal" var="user"/>
                     			<sec:authorize access="isAuthenticated()">
                     				<c:if test="${user.mvo.m_id eq result.b_id}">
                     					<button type="submit" class="btn btn-default">Modify / Remove</button>
                     				</c:if>
                     			</sec:authorize>
                     			
                     			<button type="submit" data-page="${criteria.pageNum}" data-city="${result.b_city}" data-oper="list" class="btn btn-default">List</button>
                     			
                     			</form>
                     	</div>
                     </div>
                   </div>
                  </div>
<%@include file="../includes/footer.jsp" %>	