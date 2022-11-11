<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cssPath" value="${pageContext.request.contextPath}/resources/css"/>
<c:set var="imgPath" value="${pageContext.request.contextPath}/resources/images"/>

<!DOCTYPE html>
<html>
<head>
	<c:import url='/WEB-INF/views/include/common_head.jsp'/>
	<title>아이디 찾기</title>

</head>
<body>
  <div id="wrapper">
    <!-- HEADER BASIC -->
    <c:import url='/WEB-INF/views/include/header.jsp'/>
    <!-- CONTAINER -->

		<div class="container">

			<div class="text-center">
				
				<br>
				<br>
				<c:choose>
					<c:when test="${empty searchId}">
					<p class="h4 text-gray-900 mb-2">이름과 이메일을 확인해주세요</p>
					</c:when>
					<c:otherwise>
					<p class="h4 text-gray-900 mb-2">회원님의 ID는 ${searchId.id} 입니다.<p>
					<a href="./findPass">비밀번호찾기</a>
					</c:otherwise>
				</c:choose>
			</div>

		</div>



		<!-- FOOTER BASIC -->
    <c:import url='/WEB-INF/views/include/footer.jsp'/>
    
  </div>
</body>
</html>