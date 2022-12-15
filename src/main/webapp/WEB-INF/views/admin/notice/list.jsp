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
				<h2 class="card-title">공지사항 글 목록</h2>
				<form method="post" action="ad_list_notice" id="list">
					<input type="hidden" name="curPage" value="1" />

					<div class="table_top">
						<div>
							<!-- 검색 -->
							<ul class="search_box">
								<li><select name="search"
									class="search form-select form-select-sm" style='width: 300px'>
										<option class="option_box" value="all"
											${notice.search eq 'all' ? 'selected' : '' }>전체</option>
										<option class="option_box" value="title"
											${notice.search eq 'title' ? 'selected' : '' }>제목</option>
										<option class="option_box" value="content"
											${notice.search eq 'content' ? 'selected' : '' }>내용</option>
										<option class="option_box" value="writer"
											${notice.search eq 'writer' ? 'selected' : '' }>작성자</option>
								</select></li>
								<li><input class="form-control me-2" type="search"
									placeholder="Search" aria-label="Search"
									value="${notice.keyword }" name="keyword"></li>
								<li><a type="button" class="btn btn-outline-secondary"
									onclick="$('form').submit()">검색</a></li>
							</ul>
							<ul>
								<c:if test="${authUser.user_type >= 9}">
									<a type="button" class="btn btn-outline-secondary"
										href="ad_new_notice">글쓰기</a>
								</c:if>
							</ul>
						</div>
					</div>
				</form>

				<div class="user_table">
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">제목</th>
								<th scope="col">작성자</th>
								<th scope="col">날짜</th>
								<th scope="col">조회수</th>
								<th scope="col">첨부파일</th>
								<th scope="col" style="text-align: end;">삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${notice.list}" var="vo">
								<tr style="cursor: pointer;">
									<div class="row">
										<td class="col-1">${vo.id}</td>
										<td class="col-4">${vo.title}</td>
										<td class="col-2">${vo.writer}</td>
										<td class="col-2">${vo.writedate}</td>
										<td class="col-1">${vo.root}</td>
										<td class="col-1"><c:if test="${!empty vo.filename }">
												<a href="ad_download_notice?id=${vo.id }"> <%-- <img
													title="${vo.filename }" class="file-img"
													src="img/attach.png" /> --%> file ok
												</a>
											</c:if></td>
										<td class="col-1 d-flex-end" style="text-align: end;"><input
											type="checkbox" name="notice_no" value="${vo.id}"></td>

									</div>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<div class="btnSet">
					<div class="page_list">
						<button class="page_first" onclick="go_page(1)">처음</button>

						<!-- step : 지정하지 않아도 디폴트 1 -->
						<c:forEach var="no" begin="${notice.beginPage }"
							end="${notice.endPage }" step="1">
							<c:if test="${no eq notice.curPage}">
								<button class="page_on">${no }</button>
							</c:if>

							<c:if test="${no ne notice.curPage }">
								<button class="page_off" onclick="go_page(${no })">${no }</button>
							</c:if>
						</c:forEach>
						<button class="page_last" onclick="go_page(${notice.totalPage })">마지막</button>
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





<script type="text/javascript">
$(function(){
	$('#data-list ul').css('height', 
			( ( $('.grid li').length % 5 > 0 ? 1 : 0 ) + Math.floor($('.grid li').length / 5) )
			 * $('.grid li').outerHeight(true) - 20);
})

function go_detail(id) {
	$('[name=id]').val(id);
	$('form').attr('action', 'ad_detail_notice');
	$('form').submit();	
}
</script>

<script>
function go_page(no) {
	$('[name=curPage]').val(no);
	$('[name=keyword]').val('${notice.keyword}');
	$('#list').submit();
}




</script>