<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cssPath"
	value="${pageContext.request.contextPath}/resources/css" />
<c:set var="imgPath"
	value="${pageContext.request.contextPath}/resources/images" />
<style type="text/css">
h2 {
	text-align: center;
}

table {
	margin: auto;
	width: 950px;
}

#tr_top {
	background: orange;
	text-align: center;
}

#pageList {
	margin: auto;
	width: 1000px;
	text-align: center;
}

#emptyArea {
	margin: auto;
	width: 950px;
	text-align: center;
}
</style>
	
<!-- ********** 권한관리 ********** -->
<div class="card ad_card mb-4">
	<div class="card-body">
		<h2 class="card-title">권한관리</h2>
		<nav class="nav ad_card_nav">
			<a class="nav-link active" aria-current="page" href="#">신고접수처리</a> <a
				class="nav-link" href="#">1:1문의</a>
		</nav>
		
		
		
		
		
		
		
		<!-- ----------------- -->
		
		<section id="listForm">
		<table>
			<tr id="tr_top">
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>날짜</td>
				<td>조회수</td>
			</tr>
			
			<c:forEach var="article" items="${articleList }">
				<tr>
				<td>${article.board_num }</td>
				<td>
				<c:choose> 
					<c:when test="${article.board_re_lev!=0}">
						<c:forEach var="i" begin="0" end="${article.board_re_lev*2}">
							&nbsp;
						</c:forEach>
						▶
					</c:when>
					<c:otherwise>▶</c:otherwise>
				</c:choose>
				<a href="./boarddetail?board_num=${article.board_num}&page=${pageInfo.page}">
					${article.board_subject} 
				</a>
				</td>
				<td>${article.board_name }</td>
				<td>${article.board_date }</td>
				<td>${article.board_readcount }</td>
				</tr>
			</c:forEach>
		</table>
		</section>
		
		<!-- ----------------- -->
		
		
		
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">회원번호</th>
					<th scope="col">이름</th>
					<th scope="col">신고대상</th>
					<th scope="col">내용</th>
					<th scope="col" style="text-align: end;">상태</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<div class="row">
						<td class="col-2">2022.11.09
						</th>
						<td class="col-2">Mark</td>
						<td class="col-2">Otto</td>
						<td class="col-4">@mdo</td>
						<td class="col-2" style="text-align: end;">@mdo</td>
					</div>
				</tr>
				<tr>
					<div class="row">
						<td class="col-2">2022.11.09
						</th>
						<td class="col-2">Mark</td>
						<td class="col-2">Otto</td>
						<td class="col-4">@mdo</td>
						<td class="col-2" style="text-align: end;">@mdo</td>
					</div>
				</tr>
				<tr>
					<div class="row">
						<td class="col-2">2022.11.09
						</th>
						<td class="col-2">Mark</td>
						<td class="col-2">Otto</td>
						<td class="col-4">@mdo</td>
						<td class="col-2" style="text-align: end;">@mdo</td>
					</div>
				</tr>
			</tbody>
		</table>
	</div>
</div>	