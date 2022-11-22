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
<link rel="stylesheet" href="${cssPath}/table.css">
<title>${title}</title>

<style type="text/css">
h2 {
	text-align: center;
}

#basicInfoArea {
	height: 40px;
	text-align: center;
}

#commandList {
	margin: auto;
	width: 700px;
	text-align: center;
}
</style>
</head>

<body>
	<div id="wrapper">
		<!-- CONTAINER -->
		<div class="container w90">
			<div class="">
				<p class="list_title">QNA</p>
				<div class="pn_view">
					<div class="title">
						<h1>${article.qna_title }</h1>
					</div>
					<div class="source">
						<div>
							<span>by</span>${article.user_id }&nbsp;&nbsp;${article.reg_date }</div>
						<div class="file">
							첨부파일
							<section>
								<!-- 첨부파일 -->
								<c:if test="${article.file_no!=null }">
									<div>
										<a href="file_down?downFile=${article.file_no}">
											${article.file_no} </a>
									</div>
								</c:if>
							</section>
						</div>
					</div>
					<hr>
					<section id="articleForm">
						<section id="basicInfoArea">
						<!-- 첨부파일 -->
						<c:if test="${article.file_no!=null }">
							<div>
								<a href="file_down?downFile=${article.file_no}">
									${article.file_no} </a>
							</div>
						</c:if>
					</section>
						<section id="articleContentArea">
							<div class="content">${article.qna_content }</div>
						</section>
					</section>
					<hr>
					<section id="commandList">
						<div class="d-grid gap-2 d-md-block ad_button">
						<button class="btn btn-outline-secondary" type="button">
							<a class="admin_btn" href="qnamodifyform?qna_no=${article.qna_no}">수정</a>
						</button>
						<button class="btn btn-outline-secondary" type="button">
					<a class="admin_btn" href="qnadeleteform?qna_no=${article.qna_no}">삭제</a>
				</button>
							<button class="btn btn-outline-secondary" type="button">
								<a class="admin_btn" href="./qnaList">목록</a>
							</button>
						</div>
						<a href="qnareplyform?qna_no=${article.qna_no}"> [답변] </a>
					</section>
				</div>
			</div>
		</div>
	</div>
</body>
</html>