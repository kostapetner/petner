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

<div class="card ad_card mb-4">
	<div class="card-body">
		<section id="articleForm">
			<h2 class="card-title">글 내용 상세보기</h2>
			<section id="basicInfoArea">
				제 목 : ${article.notice_title } 첨부파일 :
				<c:if test="${article.file_no!=null }">
					<a href="file_down?downFile=${article.file_no}">
						${article.file_no} </a>
				</c:if>
			</section>
			<section id="articleContentArea">${article.notice_content }
			</section>
		</section>
		<section id="commandList">
			<div class="d-grid gap-2 d-md-block ad_button">
				<button class="btn btn-outline-secondary" type="button">
					<a class="admin_btn" href="modifyform?notice_no=${article.notice_no}">수정</a>
				</button>
				<button class="btn btn-outline-secondary" type="button">
					<a class="admin_btn" href="deleteform?notice_no=${article.notice_no}">삭제</a>
				</button>
				<button class="btn btn-outline-secondary" type="button">
					<a class="admin_btn" href="./noticeList">목록</a>
				</button>
			</div>
			<!--  <a href="replyform?notice_no=${article.notice_no}"> [답변] </a>  -->
			 
		</section>
	</div>
</div>