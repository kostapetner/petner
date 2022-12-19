<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="cssPath"
	value="${pageContext.request.contextPath}/resources/css" />
<c:set var="imgPath"
	value="${pageContext.request.contextPath}/resources/images" />


<!-- 세션있을때  -->
<c:if test="${not empty authUser}">
	<!-- 관리자 일때 -->
	<c:if test="${authUser.user_type >= 9}">

		<!-- 공지사항 리스트 -->
		<div class="card ad_card mb-4">
			<div class="card-body">
				<h2 class="card-title">게시판 글 목록</h2>
				<form id="list" method="post" action="">
					<input type="hidden" name="curPage" value="1" /> <input
						type="hidden" name="id" />
					<div class="table_top">
							<!-- 검색 -->
							<ul class="search_box">
								<li><select name="search" class="search form-select form-select-sm">
										<option class="option_box" value="all"
											${board.search eq 'all' ? 'selected' : '' }>전체</option>
										<option class="option_box" value="title"
											${board.search eq 'title' ? 'selected' : '' }>제목</option>
										<option class="option_box" value="content"
											${board.search eq 'content' ? 'selected' : '' }>내용</option>
										<option class="option_box" value="writer"
											${board.search eq 'writer' ? 'selected' : '' }>작성자</option>
								</select></li>
								<li><input type="search" name="keyword" class="form-control me-2" /></li>
								<li>
									<button class="btn btn-outline-secondary" onclick="$('form').submit()">검색</button>
								</li>
							</ul>

							<ul class="option_box">
								<li><select name="pageList" class="w-px80"
									onchange="$('[name=curPage]').val(1); $('form').submit()">
										<option value="10" ${board.pageList eq 10 ? 'selected' : '' }>10개씩</option>
										<option value="20" ${board.pageList eq 20 ? 'selected' : '' }>20개씩</option>
										<option value="30" ${board.pageList eq 30 ? 'selected' : '' }>30개씩</option>
								</select></li>
								<li><select name="viewType" class="w-px100"
									onchange="$('form').submit()">
										<option value="list"
											${board.viewType eq 'list' ? 'selected' : '' }>리스트
											형태</option>
										<option value="grid"
											${board.viewType eq 'grid' ? 'selected' : '' }>바둑판
											형태</option>
								</select></li>
								<!-- 로그인되어 있으면 글쓰기 가능 -->
								<c:if test="${!empty authUser}">
									<li>
										<!-- 글쓰기 버튼 --> <a class="btn btn-outline-secondary" href="ad_new_board">글쓰기</a>
									</li>
								</c:if>
							</ul>
					</div>
				</form>



				<div class="user_table_list">
					<c:if test="${board.viewType eq 'list' }">
						<table class="table table-hover">
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">제목</th>
									<th scope="col">작성자</th>
									<th scope="col">작성일자</th>
									<th scope="col">첨부 파일</th>
									<th scope="col">조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${board.list }" var="vo">
									<tr style="cursor: pointer;">
										<td class="col-1">${vo.no }</td>
										<td class="col-4"><a onclick="go_detail(${vo.id})">${vo.title }</a></td>
										<td class="col-2">${vo.name }</td>
										<td class="col-2">${vo.writedate }</td>
										<td class="col-1"><c:if test="${!empty vo.filename }">
												<img src="img/attach.png" class="file-img" />
											</c:if></td>
										<td class="col-1">${vo.readcnt}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:if>

					<%-- <c:if test="${board.viewType eq 'grid' }">
						<ul class="grid row" style="-bs-gap: .25rem 1rem;">
							<c:forEach items="${board.list }" var="vo">
								<li class="col-4 card">
									<div>
										<a onclick="go_detail(${vo.id})">${vo.title }</a>
									</div>
									<div>${vo.name }</div>
									<div>
										${vo.writedate } <span>${empty vo.filename ? '' : '<img src="img/attach.png" class="file-img" />' }</span>
									</div>
									<div>${vo.readcnt}</div>
								</li>
							</c:forEach>
						</ul>
					</c:if> --%>
				</div>


<div class="btnSet">
	<div class="page_list">
		<button class="page_first" onclick="go_page(1)">처음</button>

		<!-- step : 지정하지 않아도 디폴트 1 -->
		<c:forEach var="no" begin="${board.beginPage }"
			end="${board.endPage }" step="1">
			<c:if test="${no eq board.curPage}">
				<button class="page_on">${no }</button>
			</c:if>

			<c:if test="${no ne board.curPage }">
				<button class="page_off" onclick="go_page(${no })">${no }</button>
			</c:if>
		</c:forEach>
		<button class="page_last" onclick="go_page(${board.totalPage })">마지막</button>
	</div>
</div>




			</div>
		</div>


		<!-- 관리자 일때.end -->
	</c:if>

	<!-- 관리자 아닐때 -->
	<c:if test="${authUser.user_type < 9}">
		<c:import url='/WEB-INF/views/include/not_admin.jsp' />
	</c:if>
</c:if>

<!-- 세션없을때 -->
<c:if test="${empty authUser}">
	<c:import url='/WEB-INF/views/include/not_users.jsp' />
</c:if>

<!--  -->

<script type="text/javascript">
$(function(){
	$('#data-list ul').css('height', 
			( ( $('.grid li').length % 5 > 0 ? 1 : 0 ) + Math.floor($('.grid li').length / 5) )
			 * $('.grid li').outerHeight(true) - 20);
})

function go_detail(id) {
	$('[name=id]').val(id);
	$('form').attr('action', 'ad_detail_board');
	$('form').submit();	
}
</script>

<script>
function go_page(no) {
	$('[name=curPage]').val(no);
	$('[name=keyword]').val('${board.keyword}');
	$('#list').submit();
}
</script>
