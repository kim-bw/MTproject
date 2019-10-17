<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!-- header.jsp 연결하기 -->
<%@include file="../includes/header.jsp" %>

<script type="text/javascript">
	$(document).ready(function(){
		
		//컨트롤러에서 넘어온 result att값을 저장
		var insert = '<c:out value="${insert}"/>';
		var remove = '<c:out value="${remove}"/>';
		
		history.replaceState({}, null, null);
		
		//함수 실행
		checkModal(remove,insert);
		
		function checkModal(insert,remove){
			
			//컨트롤러에서 넘어온 값이 없거나 redirect 1회성 파라미터로 새로고침했을 경우는 값이 없음
			if(insert==='' && remove===''){
				return;
			}
			
		$(document).ready(function(){
			
		
			//컨트롤러에서 넘긴 게시글 숫자가 0이상이면 html로 해당 내용을 바꿈
			if(parseInt(insert) > 0){
				alert(insert);
				alert(remove);
				$(".modal-body").html("게시글  "+parseInt(insert)+"번이 등록되었습니다.");
			}else if(parseInt(remove) > 0){
				alert(insert);
				alert(remove);
				$(".modal-body").html("게시글  "+parseInt(remove)+"번이 삭제되었습니다.");
			}
			$(document).ready(function(){
			//모달창 열기
			$("#myModal").modal("show");
	
		}); //fun end
		
		//해당 id버튼을 눌렀을 경우 함수실행
		//현재 창을 바꾼다
		$("#regBtn").on("click", function() {
			self.location ="/board/insertForm";
		
		}); // onclick end
		
		var actionForm = $('#actionForm');
		
		$('.paginate_button a').on('click',function(e){
			
			e.preventDefault();
			
			//name으로 접근할 때
			actionForm.find('input[name="p_curpage"]').val($(this).attr("href"));
			actionForm.submit();
		});//page end
		
		//글제목을 눌러서 해당 글을 read 할때
		$('.move').on('click',function(e){
			
			e.preventDefault();
			
			var p_seq = $(this).attr('href');
			var p_savePage = $(this).data('page');
			
			actionForm.append('<input type="hidden" name="p_seq" value="'+p_seq+'">')
			actionForm.append('<input type="hidden" name="p_savePage" value="'+p_savePage+'">')
			actionForm.attr('action','/board/read.do');
			actionForm.submit();
			
		});//move end
	}); //ready end

</script>


            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Tables</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        
                        
                        <!-- 추가 -->
                        <div class="panel-heading">
                            Board List Page<button id="regBtn" type="button" class="btn btn-xs pull-right">Register New Board</button>
                        </div>
                        
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>글 번호</th>
                                        <th>글 제목</th>
                                        <th>작성자</th>
                                        <th>작성일</th>
                                        <th>글 내용</th>
                                        <th>조회수</th>
                                        <th>댓글수</th>
                                    </tr>
                                </thead>
                                <c:forEach items="${list}" var="board">
                                	<tr>
                                		<td><c:out value="${board.b_seq}"/></td>
                                		<td><a class="move" data-page="${pvo.p_curpage}" href="${board.b_seq}">${board.b_title}</a></td>
                                		<td><c:out value="${board.b_id}"/></td>
                                		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.b_date}"/></td>
                                		<td><c:out value="${board.b_content}"/></td>
                                		<td><c:out value="${board.b_cnt}"/></td>
                                		<td><c:out value="${board.b_reply}"/></td>
                                	</tr>
                                </c:forEach>
                            </table>
							
						<!-- pagination -->	
								<div class="pull-right">
									<ul class="pagination">
										<!-- 이전버튼. startPage > 1이면 true -->
										<c:if test="${pvo.p_pre}">
											<li class="paginate_button previous"><a href="${pvo.p_startPage-1}">Previous</a></li>
										</c:if>
										
										<c:forEach var="num" begin="${pvo.p_startPage}" end="${pvo.p_endPage}">
											<li class='paginate_button ${pvo.p_curpage==num ? "active":""} '><a href="${num}">${num}</a></li>
										</c:forEach>
										
										<c:if test="${pvo.p_next}">
											<li class="paginate_button next"><a href="${pvo.p_endPage+1 }">Next</a></li>
										</c:if>
			                         </ul>
			                      </div>
			                      
			                      <form id="actionForm" action="/board/selectBoard" method="post">
			                      	<input type="hidden" name="p_curpage" value="${pvo.p_curpage}">
			                      	<input type="hidden" name="p_city" value="${pvo.p_city}">
			                      	<input type="hidden" name="p_select" value="1">
			                      	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			                      </form>
			                      
                            <!-- end pagination -->	
                            
                            
                            
                            <!-- Modal -->
                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabel">알림</h4>
                                        </div>
                                        <div class="modal-body">모달 내용</div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                          <!--  <button type="button" class="btn btn-primary">Save changes</button> -->
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                             <!-- /.modal -->
                            
                            
                            <div class="well">
                                <h4>DataTables Usage Information</h4>
                                <p>DataTables is a very flexible, advanced tables plugin for jQuery. In SB Admin, we are using a specialized version of DataTables built for Bootstrap 3. We have also customized the table headings to use Font Awesome icons in place of images. For complete documentation on DataTables, visit their website at <a target="_blank" href="https://datatables.net/">https://datatables.net/</a>.</p>
                                <a class="btn btn-default btn-lg btn-block" target="_blank" href="https://datatables.net/">View DataTables Documentation</a>
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Kitchen Sink
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>First Name</th>
                                            <th>Last Name</th>
                                            <th>Username</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>Mark</td>
                                            <td>Otto</td>
                                            <td>@mdo</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>Jacob</td>
                                            <td>Thornton</td>
                                            <td>@fat</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>Larry</td>
                                            <td>the Bird</td>
                                            <td>@twitter</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Basic Table
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>First Name</th>
                                            <th>Last Name</th>
                                            <th>Username</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>Mark</td>
                                            <td>Otto</td>
                                            <td>@mdo</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>Jacob</td>
                                            <td>Thornton</td>
                                            <td>@fat</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>Larry</td>
                                            <td>the Bird</td>
                                            <td>@twitter</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Striped Rows
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>First Name</th>
                                            <th>Last Name</th>
                                            <th>Username</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>Mark</td>
                                            <td>Otto</td>
                                            <td>@mdo</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>Jacob</td>
                                            <td>Thornton</td>
                                            <td>@fat</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>Larry</td>
                                            <td>the Bird</td>
                                            <td>@twitter</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Bordered Table
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive table-bordered">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>First Name</th>
                                            <th>Last Name</th>
                                            <th>Username</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>Mark</td>
                                            <td>Otto</td>
                                            <td>@mdo</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>Jacob</td>
                                            <td>Thornton</td>
                                            <td>@fat</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>Larry</td>
                                            <td>the Bird</td>
                                            <td>@twitter</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Hover Rows
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>First Name</th>
                                            <th>Last Name</th>
                                            <th>Username</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>Mark</td>
                                            <td>Otto</td>
                                            <td>@mdo</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>Jacob</td>
                                            <td>Thornton</td>
                                            <td>@fat</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>Larry</td>
                                            <td>the Bird</td>
                                            <td>@twitter</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Context Classes
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>First Name</th>
                                            <th>Last Name</th>
                                            <th>Username</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="success">
                                            <td>1</td>
                                            <td>Mark</td>
                                            <td>Otto</td>
                                            <td>@mdo</td>
                                        </tr>
                                        <tr class="info">
                                            <td>2</td>
                                            <td>Jacob</td>
                                            <td>Thornton</td>
                                            <td>@fat</td>
                                        </tr>
                                        <tr class="warning">
                                            <td>3</td>
                                            <td>Larry</td>
                                            <td>the Bird</td>
                                            <td>@twitter</td>
                                        </tr>
                                        <tr class="danger">
                                            <td>4</td>
                                            <td>John</td>
                                            <td>Smith</td>
                                            <td>@jsmith</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
            </div>
            <!-- /.row -->

<%@include file="../includes/footer.jsp" %>
