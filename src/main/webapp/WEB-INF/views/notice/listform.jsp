<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cssPath"
	value="${pageContext.request.contextPath}/resources/css" />
<c:set var="imgPath"
	value="${pageContext.request.contextPath}/resources/images" />
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<c:import url='/WEB-INF/views/include/common_head.jsp' />
<title>${title}</title>
<style>
.filter_feed {
	display: none
}

.filter_feed .f_row {
	padding-bottom: 5px;
}

.pagination li {
	padding: 0;
}
</style>
</head>

<body>
	<!-- 공지사항 리스트 -->
	<div id="wrapper">
		<!-- CONTAINER -->
		<div class="container w90">
			<div class="">
				<p class="list_title">공지사항</p>
				<c:choose>
					<c:when test="${articleList!=null && pageInfo.listCount>0 }">
						<section id="listForm" class="default_list_type pn_listForm">
							<table class="table table-hover">
								<tbody>
									<c:forEach var="article" items="${articleList }">
										<tr>
											<div>
												<td>
													<!-- 제목 -->
													<div class="row title_box">
														<c:choose>
															<c:when test="${article.notice_re_lev!=0}">
																<c:forEach var="i" begin="0"
																	end="${article.notice_re_lev*2}">
															&nbsp;
												</c:forEach>
																<!-- 답글 달릴때만-->
																<div class="re">
																	<img src="${imgPath}/re_arrow.png" alt="re_arrow">
																</div>
															</c:when>
															<c:otherwise></c:otherwise>
														</c:choose>
														<div class="title">
															<a
																href="./noticedetail?notice_no=${article.notice_no}&page=${pageInfo.page}">
																${article.notice_title}</a>
														</div>
													</div> <!-- 내용 -->
													<div class="row content">
														<p>${article.notice_content }</p>
													</div> <!-- 조회수, 날짜, 글쓴이 -->
													<div class="row source">
														<div class="col flex-end">
															<div>
																<i class="fa-regular fa-eye"></i> ${article.notice_hit }
																&nbsp;&nbsp; ${article.reg_date }
															</div>
															<div>
																<span>by</span> ${article.user_id }
															</div>
														</div>
													</div>
												</td>
											</div>
										</tr>
									</c:forEach>
							</table>
						</section>

						<section id="pageList">
							<nav aria-label="Page navigation example">
								<ul class="pagination admin_page">
									<li class="page-item"><c:choose>
											<c:when test="${pageInfo.page<=1}">
												<a class="page-link" href="#" aria-label="Previous">이전</a>
											</c:when>
											<c:otherwise>
												<a class="page-link"
													href="noticeList?page=${pageInfo.page-1}"
													aria-label="Previous">이전</a>
											</c:otherwise>
										</c:choose></li>
									<c:forEach var="i" begin="${pageInfo.startPage }"
										end="${pageInfo.endPage }">
										<c:choose>
											<c:when test="${pageInfo.page==i }">
												<a class="page-link">${i }</a>
											</c:when>

											<c:otherwise>

												<a class="page-link" href="noticeList?page=${i}">${i }</a>

											</c:otherwise>

										</c:choose>
									</c:forEach>
									<li class="page-item"><c:choose>
											<c:when test="${pageInfo.page>=pageInfo.maxPage }">
												<a class="page-link" href="#" aria-label="Next"> 다음 </a>
											</c:when>
											<c:otherwise>
												<a class="page-link"
													href="noticeList?page=${pageInfo.page+1}" aria-label="Next">다음</a>
											</c:otherwise>
										</c:choose></li>
								</ul>
							</nav>
						</section>

					</c:when>
				</c:choose>
			</div>
		</div>
	</div>
</body>
</html>
