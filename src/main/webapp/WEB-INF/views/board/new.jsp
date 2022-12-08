<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cssPath"
	value="${pageContext.request.contextPath}/resources/css" />
<c:set var="imgPath"
	value="${pageContext.request.contextPath}/resources/images" />

<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<c:import url='/WEB-INF/views/include/common_head.jsp' />
<link rel="stylesheet" href="${cssPath}/table.css">
<style type="text/css">
textarea {
	width: 100%;
	border: 1px solid #ced4da;
	border-radius: 0.375rem;
	max-height: 150px;
}
</style>
</head>
<h3>방명록 글쓰기</h3>
<form action="insert_board" method="post" enctype="multipart/form-data">
	<div class="pn_view">
		<!-- title 제목 -->
		<div class="title">
			<div class="w-px160">제목</div>
			<div><input type="text" name="title" class="need" title="제목" /></div>
		</div>
		<div class="row user_id">
			<span class="by">by</span>
			<div>${authUser.name }</div>
		</div>
		<div>
			<div>내용</div>
			<div><textarea name="content" class="need" title="내용"></textarea></div>
		</div>
		<div>
			<div>첨부 파일</div>
			<div class="left"><label> <input type="file" name="file"
					id="attach-file" /> <img src="img/select.png" class="file-img" />
			</label> <span id="file-name"></span> <!-- 첨부파일 이미지 영역 --> <span id="preview"></span>
				<span id="delete-file" style="color: red; margin-left: 20px;">
					<i class="fas fa-times font-img"></i>
			</span></div>
		</div>
	</div>

	<div class="btnSet">
		<button type="submit"
			onclick="if( necessary() ){ $('form').submit() }">저장</button>
		<a class="btn-empty" href="list_board">취소</a>
	</div>
</form>
<script type="text/javascript">
		$('#attach-file')
				.on(
						'change',
						function() {
							var attach = this.files[0];
							if (attach) {
								if (isImage(attach.name)) {
									var img = "<img id='preview-img' class='file-img' src='' style='border-radius:50%'/>";
									$('#preview').html(img);

									var reader = new FileReader();
									reader.onload = function(e) {
										$('#preview-img').attr('src',
												e.target.result);
									}
									reader.readAsDataURL(attach);
								} else {
									$('#preview').html('')
								}
							}
						});

		$('#delete-file').on('click', function() {
			$('#preview').html('')
		});
	</script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/reply.js"></script>
