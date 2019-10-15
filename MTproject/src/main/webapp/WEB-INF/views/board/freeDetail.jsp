<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- header.jsp 연결하기 -->
<%@include file="../includes/header.jsp" %>

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
                       
                        		<div class="form-group">
                        			<label>글 번호</label> <input class="form-control" name="b_seq" value='<c:out value="${Rvo.b_seq}"/>' readonly="readonly"/>
                        		</div>
                        		
                        		<div class="form-group">
                        			<label>글 제목</label> <input class="form-control" name="b_title" value='<c:out value="${Rvo.b_title}"/>' readonly="readonly"/>
                        		</div>
                        		
                        		<div class="form-group">
                        			<label>글 내용</label> <textarea rows="3" class="form-control" name="b_content" readonly="readonly"><c:out value="${Rvo.b_content}"/></textarea>
                        		</div>
                        		
                        		<div class="form-group">
                     				<label>작성자</label><input readonly="readonly" class="form-control" name="b_id" value='<c:out value="${Rvo.b_id}"/>'/>
                     			</div>
                     			<!-- csrf코인을 함께 보내야 403에러가 생기지 않는다. -->
                     			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                     			
                     			<button data-oper='modify' class="btn btn-default">
                     				<a href="/board/modify?p_select=1&p_city=<c:out value="${Rvo.b_title}"/>">Modify</a>
                     			</button>
                     			
                     			<button data-oper='list' class="btn btn-default">
                     				<a href="/board/selectBoard?p_city=1&p_select=1">List</a>
                     			</button>
                     		
                     	</div>
                     </div>
                   </div>
                  </div>
<%@include file="../includes/footer.jsp" %>	