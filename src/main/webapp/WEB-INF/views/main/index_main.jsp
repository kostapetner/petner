<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cssPath"
	value="${pageContext.request.contextPath}/resources/css" />
<c:set var="imgPath"
	value="${pageContext.request.contextPath}/resources/images" />

<!DOCTYPE html>
<html>
<head>
<c:import url='/WEB-INF/views/include/common_head.jsp' />
<title>Petner index 화면</title>
</head>
<body>
	<div id="wrapper">
		<!-- HEADER BASIC -->
		<c:import url='/WEB-INF/views/include/header.jsp' />
		<!-- CONTAINER -->
		<c:if test="${empty authUser}">
			<div class="container">
				로그인 전 화면(No 세션)

				<!-- Container.1 -->
				<div class="container_1">
					<!-- video -->
					<video autoplay controls loop muted poster="" preload="auto"
						width="100%" height="auto" src="${imgPath}/petner_main_video.mp4">
						<source src="xxx" type="yyy">
						<!-- 동영상 -->
					</video>
					<div class="section">
						<h1>
							펫시터 도움이<br>지금 필요해요
						</h1>
						<button class="main_btn">
							<a href="./join">가입하기</a>
						</button>
					</div>

				</div>

				<!-- Container.2 -->
				<div class="container_2">
					<div class="section">
						<div>
							<h1>
								<span>오늘은</span><br> 펫트너와 함께
							</h1>
							<p>가나다라 마바사 어쩌고 저쩌고 샬라샬라<br>
							rksksadlfjafeㅁ니아러미ㅏㅓㄹㅁㄷ리ㅏㅓ
							</p>
						</div>

					</div>
					<img src="${imgPath}/main_img1.png">
				</div>

			</div>
		</c:if>

		<c:if test="${not empty authUser}">
			<div class="container">로그인 후 화면 (with 세션) 
			<p>자동 로그인(${authUser.sessionlimit})까지</p></div>
		</c:if>
		

		<!-- FOOTER BASIC -->
		<c:import url='/WEB-INF/views/include/footer.jsp' />

	</div>
</body>
</html>