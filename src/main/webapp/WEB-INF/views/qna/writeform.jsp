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
<body>
	<!-- QNA 글 등록 -->
	<div id="wrapper">
		<!-- CONTAINER -->
		<div class="container w90">
			<div class="">
				<p class="list_title">QNA 글 등록</p>
			
			<form action="./qnawrite" method="post" enctype="multipart/form-data"
				name="qnawriteform" class="pn_write">

				<div class="row">
					<span id="addon-wrapping">글쓴이</span> 
					<input
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

				<div class="row">
					<input
						type="text" name="qna_title" id="qna_title"
						required="required" placeholder="제목을 입력하세요" aria-label="제 목"
						aria-describedby="addon-wrapping">
				</div>

				<div class="">
					<textarea id="qna_content" name="qna_content" cols="40" rows="15"
						required="required">
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
	</div>


	
	</body>
	</html>