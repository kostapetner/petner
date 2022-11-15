<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cssPath"
	value="${pageContext.request.contextPath}/resources/css" />
<c:set var="imgPath"
	value="${pageContext.request.contextPath}/resources/images" />

<style>
textarea {
	width: 100%;
	border: 1px solid #ced4da;
	border-radius: 0.375rem;
	max-height: 150px;
}
</style>
<!-- 게시판 등록 -->
<div class="card ad_card mb-4">
	<div class="card-body">
		<h2 class="card-title">공지사항 글수정</h2>
		<form action="boardmodify" method="post" name="modifyform">
			<input type="hidden" name="board_num" value="${article.board_num}" />

			<div class="input-group flex-nowrap">
				<span class="input-group-text" id="addon-wrapping">글쓴이</span> <input
					type="text" class="form-control" name="board_name" id="board_name"
					required="required" placeholder="${article.board_num}"
					aria-label="이름" aria-describedby="addon-wrapping">
			</div>

			<!-- <div class="input-group flex-nowrap">
				<span class="input-group-text" id="addon-wrapping">비밀번호</span> <input
					type="password" class="form-control" name="board_pass"
					id="board_pass" required="required" placeholder="****"
					aria-label="****" aria-describedby="addon-wrapping">
			</div> -->

			<div class="input-group flex-nowrap">
				<span class="input-group-text" id="addon-wrapping">제 목</span> <input
					type="text" class="form-control" name="board_subject"
					id="board_subject" required="required"
					placeholder="${article.board_subject}" aria-label="제 목"
					aria-describedby="addon-wrapping" value="${article.board_subject}">
			</div>

			<div class="input-group flex-nowrap">
				<textarea id="board_content" name="board_content" cols="40"
					rows="15" required="required">
					${article.board_content}
				</textarea>
			</div>

			<div class="input-group flex-nowrap">
				<span class="input-group-text" id="addon-wrapping">글쓴이</span> <input
					type="text" class="form-control" name="board_name" id="board_name"
					required="required" placeholder="${article.board_num}"
					aria-label="이름" aria-describedby="addon-wrapping">
			</div>


			<section id="commandCell">
				<div class="d-grid gap-2 d-md-block">
					<button type="submit" class="btn btn-outline-secondary">
						<a href="javascript:modifyboard()">수정</a>
					</button>
					<button type="reset" class="btn btn-outline-secondary">
						<a href="javascript:history.go(-1)">뒤로</a>
					</button>
				</div>
			</section>
		</form>
	</div>
</div>
