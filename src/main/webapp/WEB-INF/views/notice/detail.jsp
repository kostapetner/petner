<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail JSP</title>
</head>
<body>
	<div id="wrapper">
		<!-- CONTAINER -->
		<div class="container w90">
			<div class="">
				<p class="list_title">공지사항 detail</p>
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
										첨부파일 ${vo.filename } <i class="fa-solid fa-file"></i>
										<c:if test="${!empty vo.filename }">
											<a href="download_notice?id=${vo.id }"
												style='margin-left: 15px'>
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
									${vo.writedate  } ${vo.readcnt }
								</div>
							</div>
						</div>

						<hr class="hr">

						<span id="preview"></span>
						<div class="content">${fn:replace(vo.content, crlf, '<br>') }
						</div>

						<hr class="hr">

						<div class="btnSet">
							<a class="pet_btn"
								href="list.no?curPage=${notice.curPage }&search=${notice.search }&keyword=${notice.keyword }">목록으로</a>
							<!-- 관리자인 경우 수정/삭제 가능 -->
							<c:if test="${authUser.user_type >= 9}">
								<a class="pet_btn" href='modify_notice?id=${vo.id }'>수정</a>
								<a class="pet_btn"
									onclick="if(confirm('정말 삭제하시겠습니까?')) {href='delete_notice?id=${vo.id }' }">삭제</a>
							</c:if>
							<!-- 로그인이 된 경우 답글 쓰기 가능 -->
							<c:if test="${!empty authUser}">
								<a class="pet_btn" href="reply_notice?id=${vo.id }">답글 쓰기</a>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>