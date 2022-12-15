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
		<form action="/petner/ad_noticewrite" method="POST" id="ad_noticewrite" enctype="multipart/form-data">
		
			<div class="input-group flex-nowrap">
				<span class="input-group-text" id="addon-wrapping">글쓴이</span>
				<input class="form-control" name="user_id" id="user_id" value="${authUser.id}">
			</div>

			<div class="input-group flex-nowrap">
				<span class="input-group-text" id="addon-wrapping">제 목</span>
				<input
					type="text" class="form-control" name="notice_title"
					id="notice_title" required="required" placeholder="title"
					aria-label="제 목" aria-describedby="addon-wrapping">
			</div>

			<div class="input-group flex-nowrap">
			
			<c:if test="${!empty ('#attach-file')}">
					<div id="image_preview">
					<img id="rep" class="img_wrap img"
									src="${pageContext.request.contextPath}/resources${article.filepath}"
									alt="사진영역" />
						</div>
					</c:if>
					
					
				<textarea id="notice_content" name="notice_content" cols="40"
					rows="15" required="required">
				</textarea>
				
				<div class="data_box d-flex">
							<p>파일첨부</p>
							<label> <input type="file" name="file" id="attach-file" />

							</label> <span id="file-name"></span> <span id="delete-file"
								style="color: red; margin-lefT: 20px;"><i
								class="fas fa-times font-img"></i></span>
						</div>
						
						
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
<script>
$(document).ready(function(){
	//이미지 미리보기
	$(function() {
		$('#attach-file').change(function(event) {
			let reader = new FileReader();
			reader.onload = function(e) {
				$('#rep').attr('src', e.target.result);
			};
			reader.readAsDataURL(event.target.files[0]);	
		});
	})
 
	//submit 
	/* $(".submit_btn").click(function(){
	  $("#ad_noticewriteform").submit();
	}) */
});
</script>