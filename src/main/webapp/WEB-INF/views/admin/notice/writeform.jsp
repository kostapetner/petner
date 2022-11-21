<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cssPath"
	value="${pageContext.request.contextPath}/resources/css" />
<c:set var="imgPath"
	value="${pageContext.request.contextPath}/resources/images" />

<style type="text/css">
table {
	margin: auto;
	width: 450px;
}
.td_left {
	width: 150px;
	background: orange;
}

.td_right {
	width: 300px;
	background: skyblue;
}

#commandCell {
	text-align: center;
}

textarea {
	width: 100%;
	border: 1px solid #ced4da;
	border-radius: 0.375rem;
	max-height: 150px;
}
</style>

<!-- 공지사항 글 등록 -->
<div class="card ad_card mb-4">
	<div class="card-body">
		<h2 class="card-title">공지사항 글 등록</h2>
		<form action="./ad_noticewrite" method="post"
			enctype="multipart/form-data" name="ad_noticeform">

			<div class="input-group flex-nowrap">
				<span class="input-group-text" id="addon-wrapping">글쓴이</span> <input
					type="text" class="form-control" name="user_id" id="user_id"
					required="required" placeholder="Username" aria-label="이름"
					aria-describedby="addon-wrapping">
			</div>

			<!-- <div class="input-group flex-nowrap">
				<span class="input-group-text" id="addon-wrapping">비밀번호</span> <input
					type="password" class="form-control" name="board_pass"
					id="board_pass" required="required" placeholder="****"
					aria-label="****" aria-describedby="addon-wrapping">
			</div> -->

			<div class="input-group flex-nowrap">
				<span class="input-group-text" id="addon-wrapping">제 목</span> <input
					type="text" class="form-control" name="notice_title"
					id="notice_title" required="required" placeholder="title"
					aria-label="제 목" aria-describedby="addon-wrapping">
			</div>

			<div class="input-group flex-nowrap">
				<textarea id="notice_content" name="notice_content" cols="40"
					rows="15" required="required">
				</textarea>
			</div>

			<div class="input-group flex-nowrap">
				<span class="input-group-text" id="addon-wrapping">파일첨부</span> <input
					type="file" class="form-control" name="file" id="file_no"
					required="required" placeholder="Username" aria-label="파일첨부"
					aria-describedby="addon-wrapping">
			</div>

			<section id="commandCell">
				<div class="d-grid gap-2 d-md-block">
					<button type="submit" class="btn btn-outline-secondary">등록</button>
					<button type="reset" class="btn btn-outline-secondary">다시쓰기</button>
				</div>
			</section>
		</form>
	</div>
</div>
