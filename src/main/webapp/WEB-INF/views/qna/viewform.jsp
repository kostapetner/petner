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
					</div>
					<hr>
					<section id="articleForm">
						<section id="basicInfoArea">
						<div class="source">
							<!-- 첨부파일 다운로드 -->
							첨부파일
							<c:if test="${article.file_no!=null }">
									<a href="qna_download?qnaNum=${article.qna_no}">
										${article.file_no}
										<i class="fas fa-download font-img"></i>
										</a>
										<div id="image_preview">
								<img src="/img.png" alt="사진영역"  style="width:126px; height:165px;">
							</div>
							</c:if>
							
							<li class="photo">
								<img src="/loadImage.do?file_no=${article.file_no}"/>
								<img src="/loadImage.do?file_no=${article.file_no}"/>
							</li>

							
							</div>
						</section>
						<section id="articleContentArea">
							<div class="content">${article.qna_content }</div>
						</section>
					</section>
					<hr>
					<section id="commandList">
						<div class="d-grid gap-2 d-md-block ad_button">
							<button class="btn btn-outline-secondary" type="button">
								<a class="admin_btn"
									href="qnamodifyform?qna_no=${article.qna_no}">수정</a>
							</button>
							<button class="btn btn-outline-secondary" type="button">
								<a href="qnareplyform?qna_no=${article.qna_no}">답변</a>
							</button>


							<button class="btn btn-outline-secondary" type="button">
								<a class="admin_btn"
									href="qnadeleteform?qna_no=${article.qna_no}">삭제</a>
							</button>
							<button class="btn btn-outline-secondary" type="button">
								<a class="admin_btn" href="./qnaList">목록</a>
							</button>
						</div>
					</section>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

<script>
$(document).ready(function() {
	//이미지 미리보기
	$(function() {
		$('#file').change(function(event) {
			let reader = new FileReader();
			reader.onload = function(e) {
				$('#rep').attr('src', e.target.result);
			};
			reader.readAsDataURL(event.target.files[0]);	
		});
	})
	
	/* $(function() {
	// 이미지 업로드
    $('${article.file_no}').on('change', function() {
    ext = $(this).val().split('.').pop().toLowerCase(); //확장자
    //배열에 추출한 확장자가 존재하는지 체크
    if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
        resetFormElement($(this)); //폼 초기화
        window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
    } else {
        file = $('${article.file_no}').prop("files")[0];
        blobURL = window.URL.createObjectURL(file);
        $('#image_preview img').attr('src', blobURL);
        $('#image_preview').slideDown(); //업로드한 이미지 미리보기 
        $(this).slideUp(); //파일 양식 감춤
    }
    });
	}) */
	
});
</script>