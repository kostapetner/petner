<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="cssPath"
	value="${pageContext.request.contextPath}/resources/css" />
<c:set var="imgPath"
	value="${pageContext.request.contextPath}/resources/images" />
<head>
<link rel="stylesheet" href="${cssPath}/table.css">
</head>
<p class="list_title">board</p>
<form id="list" method="post" action="">
	<input type="hidden" name="curPage" value="1" />
	<input type="hidden" name="id" />
	<div id="list-top" class="table_top">
		<div>
			<!-- 검색 -->
			<ul class="search_box">
				<li>
					<select name="search" class="w-px80">
						<option value="all" ${board.search eq 'all' ? 'selected' : '' }>전체</option>
						<option value="title" ${board.search eq 'title' ? 'selected' : '' }>제목</option>
						<option value="content" ${board.search eq 'content' ? 'selected' : '' }>내용</option>
						<option value="writer" ${board.search eq 'writer' ? 'selected' : '' }>작성자</option>
					</select>
				</li>
				<li>
					<input type="text" name="keyword" class="w-px300"/>
				</li>
				<li>
					<button class="pet_btn" onclick="$('form').submit()">검색</button>
				</li>
			</ul>
			
			<ul class="option_box">
				<li>
					<select name="pageList" class="w-px80" onchange="$('[name=curPage]').val(1); $('form').submit()">
						<option value="10" ${board.pageList eq 10 ? 'selected' : '' }>10개씩</option>
						<option value="20" ${board.pageList eq 20 ? 'selected' : '' }>20개씩</option>
						<option value="30" ${board.pageList eq 30 ? 'selected' : '' }>30개씩</option>
					</select>
				</li>
				<li>
					<select name="viewType" class="w-px100" onchange="$('form').submit()">
						<option value="list" ${board.viewType eq 'list' ? 'selected' : '' }>리스트 형태</option>
						<option value="grid" ${board.viewType eq 'grid' ? 'selected' : '' }>바둑판 형태</option>
					</select>
				</li>
				<!-- 로그인되어 있으면 글쓰기 가능 -->
				<c:if test="${!empty authUser}">
					<li>
						<!-- 글쓰기 버튼 -->
						<a class="pet_btn" href="new_board">글쓰기</a>
					</li>
				</c:if>			
			</ul>
		</div>
	</div>
</form>

<div class="user_table">
	<c:if test="${board.viewType eq 'list' }">
		<table class="table">
			<tr>
				<th>번호</th>
				<th class="left">제목</th>
				<th>작성자</th>
				<th>작성일자</th>
				<th>첨부 파일</th>
				<th>조회수</th>
			</tr>
			<c:forEach items="${board.list }" var="vo">
				<tr>
					<td>${vo.no }</td>
					<td class="left"><a onclick="go_detail(${vo.id})">${vo.title }</a></td>
					<td>${vo.name }</td>
					<td>${vo.writedate }</td>
					<td>
						<c:if test="${!empty vo.filename }">
							<img src="img/attach.png" class="file-img"/>
						</c:if>
					</td>
					<td>${vo.readcnt}</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	
	<c:if test="${board.viewType eq 'grid' }">
		<ul class="grid row" style="--bs-gap: .25rem 1rem;">
			<c:forEach items="${board.list }" var="vo">
				<li class="col-4 card">
					<div><a onclick="go_detail(${vo.id})">${vo.title }</a></div>
					<div>${vo.name }</div>
					<div>
						${vo.writedate }
						<span>${empty vo.filename ? '' : '<img src="img/attach.png" class="file-img" />' }</span>
					</div>
					<div>${vo.readcnt}</div>
				</li>
			</c:forEach>
		</ul>
	</c:if>
</div>

<div class="btnSet">
	<div class="page_list">
		<button class="page_first" onclick="go_page(1)">처음</button>
		
	<!-- step : 지정하지 않아도 디폴트 1 -->
	<c:forEach var="no" begin="${board.beginPage }" end="${board.endPage }" step="1">
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

<script type="text/javascript">
$(function(){
	$('#data-list ul').css('height', 
			( ( $('.grid li').length % 5 > 0 ? 1 : 0 ) + Math.floor($('.grid li').length / 5) )
			 * $('.grid li').outerHeight(true) - 20);
})

function go_detail(id) {
	$('[name=id]').val(id);
	$('form').attr('action', 'detail_board');
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
