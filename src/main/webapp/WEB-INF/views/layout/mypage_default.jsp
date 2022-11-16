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
<title>${title}</title>
</head>

<script>
	$(document).ready(function(){	
		$(".toggle input").click( function(){
			
				$(".text1").toggleClass("active");
				$(".text2").toggleClass("active");

				if ($(this).is(':checked')) { // check가 보호자임        
					var owner_menu1 = "";
					owner_menu1 += "<a href='${pageContext.request.contextPath}/mypage/myBasicInfo'>나의 정보</a>"
											+ "<a href='${pageContext.request.contextPath}/mypage/myPetInfo'>나의반려동물정보</a>";

					var owner_menu2 = "";
					owner_menu2 += "<a href='${pageContext.request.contextPath}/mypage/myService/requireServic'>서비스 요청하기</a>"
							+ "<a href='#'>요청한 서비스보기</a>";
					$(".toggle_menu1").html(
							owner_menu1);
					$(".toggle_menu2").html(
							owner_menu2);

				} else { // 시터일경우
					var sitter_menu1 = "";
					sitter_menu1 += "<a href='${pageContext.request.contextPath}/mypage/myBasicInfo'>나의 정보</a>"
							+ "<a href='#'>나의시터정보보기</a>";

					var sitter_menu2 = "";
					sitter_menu2 += "<a href='#'>나의펫시팅활동</a>"
							+ "<a href='#'>내가받은요청</a>"
							+ "<a href='#'>내가찜한요청</a>";
					$(".toggle_menu1").html(
							sitter_menu1);
					$(".toggle_menu2").html(
							sitter_menu2);
				}
		})
	})
</script>
<body>
	<div id="wrapper">
		<!-- HEADER BASIC -->
		<c:import url='/WEB-INF/views/include/header.jsp' />
		<!-- CONTAINER -->
		<div class="container">
			<div class="mypage_wr w100">	
				<div class="my_profile">
					<div class="">
						<!-- 이미지영역 -->
						<div class="prof_img">
							<c:if test="${empty authUser.file_no}">
								<img src="${imgPath}/noimg.webp"/>
							</c:if>
							<img
								src="https://img.wkorea.com/w/2022/10/style_634f9b4c8c907-500x354-1666161931.jpg"
								alt="이미지">
						</div>
						<!-- 텍스트정보 영역 -->
						<div class="prof_text">
							<div class="row1">
								<p>${authUser.nickname}</p>
								<p>
									<a href="#"><i class="fa-solid fa-gear"></i></a>
								</p>
							</div>
							<div class="row2">
								<p>
									<a href="#">팔로워<span class="f_val">122</span></a>
								</p>
								<p>
									<a href="#">팔로잉<span class="f_val">122</span></a>
								</p>
								<p>
									<span class="badge">최강기요미</span>
								</p>
							</div>
						</div>
					</div>
				</div>

				<div class="my_view">
					<div class="side_menu">
						<!-- 조건 둘다일경우만 user_type 3일 경우에만토글 출력 -->
						<c:if test="${authUser.user_type==3}">
							<div class="toggle">
								<label class="switch"> <input type="checkbox"> <span
									class="slider round"></span> <span class="texts"> <span
										class="text1 active">펫시터</span> <span class="text2">보호자</span>
								</span>
								</label>
							</div>
						</c:if>
						<ul>
							<c:choose>

								<c:when test="${authUser.user_type==1}">
									<!-- 시터일경우 -->
									<li>
										<p class="first_menu">내정보</p>
										<div class="second_menu toggle_menu1">
											<a href="${pageContext.request.contextPath}/mypage/myBasicInfo">나의 정보</a>
											<a href="${pageContext.request.contextPath}/mypage/mySitterInfo">나의 시터정보 관리</a>
										</div>
									</li>
									<li>
										<p class="first_menu">나의 서비스</p>
										<div class="second_menu toggle_menu2">
											<a href="#">나의펫시팅활동</a> <a href="#">내가 받은 요청</a> <a href="#">내가
												찜한 요청</a>
										</div>
									</li>
								</c:when>

								<c:when test="${authUser.user_type==2}">
									<!-- 보호자일경우 -->
									<li>
										<p class="first_menu">내정보</p>
										<div class="second_menu toggle_menu1">
											<a
												href="${pageContext.request.contextPath}/mypage/myBasicInfo">나의 정보</a>
											<a href="${pageContext.request.contextPath}/mypage/myPetInfo">나의반려동물정보</a>
										</div>
									</li>
									<li>
										<p class="first_menu">나의 서비스</p>
										<div class="second_menu toggle_menu2">
											<a href="${pageContext.request.contextPath}/mypage/myService/requireService">서비스 요청하기</a>
											<a href="#">요청한 서비스 보기</a>
										</div>
									</li>
								</c:when>
								<c:otherwise>
									<li>
										<p class="first_menu">내정보</p>
										<div class="second_menu toggle_menu1">
											<a
												href="${pageContext.request.contextPath}/mypage/myBasicInfo">나의 정보</a>
											<a href="${pageContext.request.contextPath}/mypage/mySitterInfo">나의 시터정보 관리</a>
										</div>
									</li>
									<li>
										<p class="first_menu">나의 서비스</p>
										<div class="second_menu toggle_menu2">
											<a href="#">나의펫시팅활동</a> <a href="#">내가 받은 요청</a> <a href="#">내가
												찜한 요청</a>
										</div>
									</li>
								</c:otherwise>

							</c:choose>
							<li>
								<p class="first_menu">리뷰관리</p>
								<div class="second_menu">
									<a href="#">리뷰 쓰기</a> <a href="#">내가 쓴 리뷰</a> <a href="#">내가
										받은 리뷰</a>
								</div>
							</li>
							<li>
								<p class="first_menu">고객센터</p>
								<div class="second_menu">
									<a href="#">1:1문의</a>
								</div>
							</li>
						</ul>
					</div>

					<div class="cont_view">
						<c:import url='/WEB-INF/views/${page}.jsp' />
					</div>
				</div>
			</div>
		</div>

		<!-- FOOTER BASIC -->
		<c:import url='/WEB-INF/views/include/footer.jsp' />

	</div>
</body>
</html>