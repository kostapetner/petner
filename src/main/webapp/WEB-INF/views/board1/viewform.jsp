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

#articleContentArea {
border: 1px solid #ced4da;
	border-radius: 0.375rem;
max-height: 150px;

	background: #ffffff;
	margin-top: 20px;
	min-height: 150px;
	text-align: center;
	overflow: auto;
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
			제 목 : ${article.board_subject }
			첨부파일 :
			<c:if test="${article.board_file!=null }">
				<a href="file_down?downFile=${article.board_file}"> ${article.board_file} </a>
			</c:if>
	</section>
	<section id="articleContentArea">
		${article.board_content }
	</section>
	</section>
	<section id="commandList">
		<a href="replyform?board_num=${article.board_num}"> [답변] </a> 
		<a href="modifyform?board_num=${article.board_num}"> [수정] </a> 
		<a href="deleteform?board_num=${article.board_num}"> [삭제] </a>
		<a href="./boardList"> [목록]</a>
		<a href="./boardList"> [목록]</a>&nbsp;&nbsp;
	</section>
	</div>
</div>