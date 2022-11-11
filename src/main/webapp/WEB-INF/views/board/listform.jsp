<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cssPath"
	value="${pageContext.request.contextPath}/resources/css" />
<c:set var="imgPath"
	value="${pageContext.request.contextPath}/resources/images" />

<!-- 공지사항 리스트 -->
<div class="card ad_card mb-4">
	<div class="card-body">
		<h2 class="card-title">공지사항 글 목록</h2>
		<a href="writeform">공지사항글쓰기</a>
		<c:choose>
			<c:when test="${articleList!=null && pageInfo.listCount>0 }">
				<section id="listForm">
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">제목</th>
								<th scope="col">작성자</th>
								<th scope="col">날짜</th>
								<th scope="col">조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="article" items="${articleList }">
								<tr>
									<div class="row">
										<td class="col-2">${article.board_num }</td>
										<td class="col-2"><c:choose>
												<c:when test="${article.board_re_lev!=0}">
													<c:forEach var="i" begin="0"
														end="${article.board_re_lev*2}">
													&nbsp;
												</c:forEach>
													▶
											</c:when>
												<c:otherwise>▶</c:otherwise>
											</c:choose> <a
											href="./boarddetail?board_num=${article.board_num}&page=${pageInfo.page}">
												${article.board_subject} </a></td>
										<td class="col-2">${article.board_name }</td>
										<td class="col-2">${article.board_date }</td>
										<td class="col-1">${article.board_readcount }</td>
									</div>
								</tr>
							</c:forEach>
					</table>
				</section>

				<section id="pageList">
					<nav aria-label="Page navigation example">
						<ul class="pagination">
							<li class="page-item"><c:choose>
									<c:when test="${pageInfo.page<=1}">
										<a class="page-link" href="#" aria-label="Previous">이전</a>
									</c:when>
									<c:otherwise>
										<a class="page-link" href="boardlist?page=${pageInfo.page-1}"
											aria-label="Previous">이전</a>
									</c:otherwise>
								</c:choose></li>
							<li class="page-item"><a class="page-link" href="#"> <c:forEach
										var="i" begin="${pageInfo.startPage }"
										end="${pageInfo.endPage }">
										<c:choose>
											<c:when test="${pageInfo.page==i }">${i }</c:when>
											<c:otherwise>
												<a href="boardlist?page=${i}">${i }</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
							</a></li>
							<li class="page-item"><c:choose>
									<c:when test="${pageInfo.page>=pageInfo.maxPage }">
										<a class="page-link" href="#" aria-label="Next"> 다음 </a>

									</c:when>

									<c:otherwise>
										<a class="page-link" href="boardlist?page=${pageInfo.page+1}"
											aria-label="Next">다음</a>
									</c:otherwise>
								</c:choose></li>
						</ul>
					</nav>
				</section>

			</c:when>
		</c:choose>
	</div>
</div>

