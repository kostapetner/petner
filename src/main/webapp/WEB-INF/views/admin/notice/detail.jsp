<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="cssPath"
	value="${pageContext.request.contextPath}/resources/css" />
<c:set var="imgPath"
	value="${pageContext.request.contextPath}/resources/images" />


<!-- 세션있을때  -->
<c:if test="${not empty authUser}">
	<!-- 관리자 일때 -->
	<c:if test="${authUser.user_type >= 9}">

		<!-- 공지사항 리스트 -->
		<div class="card ad_card mb-4">
			<div class="card-body">
				<h2 class="card-title">공지사항 detail</h2>
				<div class="formbox">
					<div class="pn_view">
						<div class="title">
							<h1>${vo.title }</h1>
						</div>
						<div class="source">
							<div>
								<span>by</span>${vo.name }
							</div>
							<div class="data_box d-flex">
								<div>
									<div colspan="5" class="left">
										첨부파일 <span class="by">${vo.filename }</span>
										<c:if test="${!empty vo.filename }">
											<a class="by" href="download_notice?id=${vo.id }"
												style='margin-left: 5px'>
												<i class="fa-solid fa-file"></i></a>
										</c:if>
									</div>
									<%-- <c:if test="${article.file_no!=null }">
										<!-- 첨부파일 다운로드 -->
										첨부파일 <a href="qna_download?qnaNum=${article.qna_no}">
											${article.file_no}
											<i class="fas fa-download font-img"></i>
										</a>
								</c:if> --%>
								</div>
								&nbsp;&nbsp;&nbsp;
								<div>
									<!-- day -->
									${vo.writedate  }&nbsp;&nbsp; <i class="fa-regular fa-eye"></i> ${vo.readcnt }
								</div>
							</div>
						</div>

						<hr class="hr">

						<span id="preview"></span>
						
						<div class="content">
						<!-- 첨부된 이미지 보여주기 -->
						<img src="resources/${vo.filepath }" class="img3" style="width: 100%;">
							<div class="txt">
							${fn:replace(vo.content, crlf, '<br>') }
							</div>
						
						</div>

						<hr class="hr">

						<div class="btnSet">
							<a class="pet_btn"
								href="list_notice">목록으로</a>
							<!-- 관리자인 경우 수정/삭제 가능 -->
							<c:if test="${authUser.user_type >= 9}">
								<a class="pet_btn" href='ad_modify_notice?id=${vo.id }'>수정</a>
								<a class="pet_btn"
									onclick="if(confirm('정말 삭제하시겠습니까?')) {href='ad_delete_notice?id=${vo.id }' }">삭제</a>
							</c:if>
							<!-- 로그인이 된 경우 답글 쓰기 가능 -->
							<c:if test="${!empty authUser}">
								<a class="pet_btn" href="ad_reply_notice?id=${vo.id }">답글 쓰기</a>
							</c:if>
						</div>
					</div>
				</div>
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
