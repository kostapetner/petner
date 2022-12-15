<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cssPath"
	value="${pageContext.request.contextPath}/resources/css" />
<c:set var="imgPath"
	value="${pageContext.request.contextPath}/resources/images" />


<style type="text/css">
</style>

<!-- 세션있을때  -->
<c:if test="${not empty authUser}">
	<!-- 관리자 일때 -->
	<c:if test="${authUser.user_type >= 9}">
		<!-- viewForm -->
		<div class="card ad_card mb-4">
			<div class="card-body">

				<h2 class="card-title">글 내용 상세보기</h2>
				<div class="title">
					<h1>${article.notice_title }</h1>
					<div class="source">
					<div>
						<span>by</span>${article.user_id }
					</div>
					<div class="b">
					<div>
						<!-- day -->
						${article.reg_date }
					</div>
					<div>
					<!-- hit -->
					<i class="fa-regular fa-eye"></i> ${article.notice_hit }
					</div>
					</div>
					</div>

					<div class="data_box d-flex">

						<div>
							<c:if test="${article.file_no!=null }">
								<!-- 첨부파일 다운로드 -->
								첨부파일 <a href="ad_notice_download?noticeNum=${article.notice_no}">
									${article.file_no} <i class="fas fa-download font-img"></i>
								</a>
							</c:if>
						</div>
					</div>

					

				
				</div>
				
				<hr>
					<div id="image_preview">
						<img id="rep" class="img_wrap img"
							src="${pageContext.request.contextPath}/resources${article.filepath}"
							alt="사진영역" />

					</div>
				<section id="articleContentArea">${article.notice_content }
				</section>
				<section id="commandList">
					<div class="d-grid gap-2 d-md-flex ad_button">
						<button class="btn btn-outline-secondary" type="button">
							<a class="admin_btn"
								href="ad_noticereplyform?notice_no=${article.notice_no}">답변</a>
						</button>
						<button class="btn btn-outline-secondary" type="button">
							<a class="admin_btn"
								href="ad_noticemodifyform?notice_no=${article.notice_no}">수정</a>
						</button>
						<button class="btn btn-outline-secondary" type="button">
							<a class="admin_btn"
								href="ad_noticedeleteform?notice_no=${article.notice_no}">삭제</a>
						</button>
						<button class="btn btn-outline-secondary" type="button">
							<a class="admin_btn" href="./ad_noticeList">목록</a>
						</button>
					</div>


				</section>
			</div>
		</div>

		<!-- 관리자 일때.end -->
	</c:if>

	<!-- 관리자 아닐때 -->
	<c:if test="${authUser.user_type < 9}">
		<c:import url='/WEB-INF/views/include/not_admin.jsp' />
	</c:if>
</c:if>

<!-- 세션없을때 -->
<c:if test="${empty authUser}">
	<c:import url='/WEB-INF/views/include/not_users.jsp' />
</c:if>



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

		//submit 
		$(".submit_btn").click(function() {
			$("#petForm").submit();
		})
	});
</script>


