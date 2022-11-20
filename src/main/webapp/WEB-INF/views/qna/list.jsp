<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="cssPath"
	value="${pageContext.request.contextPath}/resources/css" />
<c:set var="imgPath"
	value="${pageContext.request.contextPath}/resources/images" />
<c:set var="pluginsPath"
	value="${pageContext.request.contextPath}/resources/plugins" />

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- CSS -->
<link rel="stylesheet" href="${cssPath}/common.css">
<!--  <link rel="stylesheet" href="${pluginsPath}/bootstrap/css/bootstrap.min.css"> -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="${cssPath}/admin_page.css">

<!-- font-awesome -->
<link rel="stylesheet" href="${pluginsPath}/font-awesome/all.min.css">
<script src="${pluginsPath}/font-awesome/all.min.js"></script>

<!-- JS -->
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css"
	rel="stylesheet">
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.2/examples/dashboard/">
<title>${title}</title>
<script>
    /* global bootstrap: false */
    (() => {
      'use strict'
      const tooltipTriggerList = Array.from(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
      tooltipTriggerList.forEach(tooltipTriggerEl => {
        new bootstrap.Tooltip(tooltipTriggerEl)
      })
    })()

    var collapseElementList = [].slice.call(document.querySelectorAll('.collapse'))
    var collapseList = collapseElementList.map(function (collapseEl) {
      return new bootstrap.Collapse(collapseEl)
    })
    </script>
<style>
.position_in {
	position: inherit
}
</style>


<!-- Custom styles for this template -->
<link href="dashboard.css" rel="stylesheet">
</head>
<body>
	<div id="wrapper">
		<!-- HEADER BASIC -->
		<c:import url='/WEB-INF/views/include/admin_header.jsp' />

		<!-- SIDEBAR BASIC -->
		<c:import url='/WEB-INF/views/include/admin_sidebar.jsp' />


		<!-- CONTAINER -->
		<div class="container-fluid">
			<div class="row">
				<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">




					<!-- 공지사항 리스트 -->
					<div class="card ad_card mb-4">
						<div class="card-body">
							<h2 class="card-title">공지사항 글 목록</h2>
							<form method="post" action="list.qna" id="list">
								<input type="hidden" name="curPage" value="1" />

								<div id="list-top">

									<form class="navbar-form pull-left" role="search">

										<div class="ad_seach_top">
											<ul>
												<li><select name="search"
													class="btn btn-secondary ad_dropdown dropdown-toggle">
														<option value="all" class=""
															${page.search eq 'all' ? 'selected' : '' }>전체</option>
														<option value="title"
															${page.search eq 'title' ? 'selected' : '' }>제목</option>
														<option value="content"
															${page.search eq 'content' ? 'selected' : '' }>내용</option>
														<option value="writer"
															${page.search eq 'writer' ? 'selected' : '' }>작성자</option>
												</select></li>
												<li>
													<div class="input-group admin_search">
														<input type="text" class="form-control"
															placeholder="Search" value="${page.keyword }"
															name="keyword">
														<div class="input-group-btn admin_btn">
															<button type="submit" class="btn btn-default">
																<a class="btn-fill" onclick="$('form').submit()"> <i
																	class="fa-solid fa-magnifying-glass"></i>
																</a>
															</button>
														</div>
													</div>
												</li>
												<li>
													<button type="button" class="col btn btn-outline-secondary">
														<core:if test="${login_info.admin eq 'Y' }">
															<a class="btn-fill" href="new.qna">글쓰기</a>
														</core:if>
													</button>
												</li>
											</ul>
										</div>

									</form>
								</div>
							</form>
						






						<section id="listForm">
							<table class="table table-hover">
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">제목</th>
										<th scope="col">작성자</th>
										<th scope="col">작성일자</th>
										<th scope="col">첨부파일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${page.list }" var="vo">
										<tr>
											<div class="row">
												<td>${vo.no }</td>
												<td class="left"><c:forEach var="i" begin="1"
														end="${vo.indent }">
														${i eq vo.indent ? "<img src='img/re.gif' />" : "&nbsp;&nbsp;" }
													</c:forEach> <a href="detail.qna?id=${vo.id }"> ${vo.title } </a></td>
											<td>${vo.writer }</td>
											<td>${vo.writedate }</td>
											<td><c:if test="${!empty vo.filename }">
													<a href="download.qna?id=${vo.id }"> <img
														title="${vo.filename }" class="file-img"
														src="img/attach.png" />
													</a>
												</c:if></td>
											</div>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="row">
								<div class="col-2"></div>
								<div class="col">
									<div class="btnSet col">
										<jsp:include page="/WEB-INF/views/include/page.jsp" />
									</div>
								</div>
								<div class="col-2 justify-content-end">
									<button type="button" class="col btn btn-outline-secondary">
										<core:if test="${login_info.admin eq 'Y' }">
											<a class="btn-fill" href="new.qna">글쓰기</a>
										</core:if>
									</button>
								</div>




							</div>

						</section>
						</div>
					</div>
			</div>





			<!-- <script src="../assets/dist/js/bootstrap.bundle.min.js"></script> -->

			<script
				src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"
				integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE"
				crossorigin="anonymous"></script>
			<script
				src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"
				integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha"
				crossorigin="anonymous"></script>
			<script src="dashboard.js"></script>
</body>
</html>

