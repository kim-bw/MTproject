<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- header.jsp 연결하기 -->
<%@include file="../includes/header.jsp" %>
<script type="text/javascript">
	
	$(document).ready(function(){
		
		var formObj = $('form');
		
		$('button').on('click',function(e){
		
			e.preventDefault();
			
			var operation = $(this).data('oper');
			var city = $(this).data('city');
			var savePage = $(this).data('page');
		
			if(operation==='remove'){
				formObj.attr('action','/board/remove.do');
			}else if(operation==='list'){
				self.location = "/board/selectBoard?p_select=1&p_city="+city+"&p_savePage="+savePage;
				return;
			}
				formObj.submit();
		
		}); //onclick end
	});//end

</script>


	 <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">게시글 수정/삭제</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        
                        <div class="panel-heading">게시글 수정/삭제하기</div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                       
                       <form action="/board/modify.do" method="post">
                       
                        		<div class="form-group">
                        			<label>글 번호</label> <input class="form-control" name="b_seq" value='<c:out value="${Rvo.b_seq}"/>' readonly="readonly"/>
                        		</div>
                        		
                        		<div class="form-group">
                        			<label>글 제목</label> <input class="form-control" name="b_title" value='<c:out value="${Rvo.b_title}"/>'/>
                        		</div>
                        		
                        		<div class="form-group">
                        			<label>글 내용</label> <textarea rows="3" class="form-control" name="b_content"><c:out value="${Rvo.b_content}"/></textarea>
                        		</div>
                        		
                        		<div class="form-group">
                     				<label>작성자</label><input readonly="readonly" class="form-control" name="b_id" value='<c:out value="${Rvo.b_id}"/>'/>
                     			</div>
                     			<!-- csrf코인을 함께 보내야 403에러가 생기지 않는다. -->
                     			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                     			<input type="hidden" name="b_city" value="${Rvo.b_city}" />
                     			
                     			<button type="submit" data-oper="modify" data-city="${Rvo.b_city}" class="btn btn-default">수정완료</button>
                     			<button type="submit" data-oper="remove" data-city="${Rvo.b_city}" class="btn btn-default">글 삭제</button>
                     			<button type="submit" data-oper="list" data-page="${pvo.savePage}" data-city="${Rvo.b_city}" class="btn btn-default">List</button>
                     			
                     		</form>                     		
                     	</div>
                     </div>
                   </div>
                  </div>
<%@include file="../includes/footer.jsp" %>	