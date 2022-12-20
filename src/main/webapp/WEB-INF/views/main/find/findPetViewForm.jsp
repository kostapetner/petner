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
<script type="text/javascript">
$( document ).ready( function() {
	$("#golist").click(function(){
		$("#imform").submit();
	});
});

</script>
</head>

<body>
	<div id="wrapper">
		<!-- CONTAINER -->
		<div class="container w90">
			<div class="">
				<p class="list_title">돌봐줄 동물 찾기</p>
				<form id="imform" action="${pageContext.request.contextPath}/findPet" method="post">
				<div class="pn_view">
					<div class="title">
						<h1>${cs.request_title }</h1>
					</div>
					<div class="source">
						<span>${cs.nickname }</span>&nbsp;
					</div>
					<div class="source">
						<div>
							<span>요청서비스&nbsp;&nbsp;</span>
							${cs.service }
						</div>
						<div>
							<span>지역&nbsp;&nbsp;</span>
							${cs.addr }
						</div>
						<div>
							<span>금액</span>&nbsp;
							${cs.request_money }원
						</div>
						<div>
							<span>작성일&nbsp;&nbsp;</span>
							${cs.reg_date }
						</div>
					</div>
					<hr>
					<div id="articleForm">
						<!-- 게시글 내용 -->
						<div id="articleContentArea">
							<div class="content">${cs.request_detail }</div>
						</div>
						<!-- 첨부파일 -->
						<div id="basicInfoArea" style="width: 357px; height: 200px">
							<c:if test="${empty cs.file_no}">
								<img src="/petner/resources/images/header_logo.png" alt="이미지">
							</c:if>
							<c:if test="${not empty cs.file_no}">
								<img src="${pageContext.request.contextPath}/findPet/${cs.file_no}" id="rep" class="img_wrap img" style="width: 357px; height: 200px">
							</c:if>
						</div>
					</div>
					<br>
					<div id="commandList">
						<div class="d-grid gap-2 d-md-block ad_button">
							<a class="admin_btn" href="#" >
								<button class="btn btn-outline-secondary" type="button">채팅하기</button>
							</a>
						</div>
					</div>
					<hr>
				</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>