<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- header.jsp 연결하기 -->
<%@include file="../includes/header.jsp" %>

	 <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Board Register</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        
                        <div class="panel-heading">Board Register</div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                       
                        	<form role="form" action="/board/insert.do" method="post">
                        		<div class="form-group">
                        			<label>Title</label><input class="form-control" name="b_title"></div>
                        		
                        		<div class="form-group">
                        			<label>Text Area</label>
                        			<textarea class="form-control" name="b_content" rows="3"></textarea>
                        		</div>
                        		
                        		<div class="form-group">
                     				<label>Writer</label><input class="form-control" name="b_id">
                     			</div>
                     			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                     			<input type="hidden" name="b_city" value="1" />
                     			<button type="submit" class="btn btn-default">Submit Button</button>
                     			<button type="reset" class="btn btn-default">Reset Button</button>
                     		
                     		</form>
                     	</div>
                     </div>
                   </div>
                  </div>
<%@include file="../includes/footer.jsp" %>	