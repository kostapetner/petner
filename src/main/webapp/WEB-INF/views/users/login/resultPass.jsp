<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cssPath" value="${pageContext.request.contextPath}/resources/css"/>
<c:set var="imgPath" value="${pageContext.request.contextPath}/resources/images"/>

<!DOCTYPE html>
<html>
<head>
<c:import url='/WEB-INF/views/include/common_head.jsp' />
<title>아이디 찾기</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
	 function onDisplay() {
		 $('#noneDiv').show();
	 }
	 
	 $(function() {
		 $('#onDisplay').click(function(){
			 if($("noneDiv").css("display") == "none") {
				 $('#noneDiv').show();
			 }
		 });
	 });
	
	</script>


</head>
<body>
	<div id="wrapper">
		<!-- HEADER BASIC -->
		<c:import url='/WEB-INF/views/include/header.jsp' />
		<!-- CONTAINER -->
		<div class="container">

			<div class="text-center">
				<c:choose>

					<c:when test="${empty searchPass}">
						<p class="h4 text-gray-900 mb-2">아이디,이름,이메일을 확인해주세요</p>
					</c:when>

					<c:otherwise>
						<p class="h4 text-gray-900 mb-2">회원정보가 확인되었습니다.</p>

						<input type="button" class="pet_btn second_btn transition02"
							onclick="onDisplay()" value="비밀번호를 변경해주세요">
					</c:otherwise>
				</c:choose>
				<br>
				<form action="./modifyPass" id="modifyPass" method="POST">
				<div class="col-md-5" id="noneDiv" style="display: none;">
				<p>새비밀번호</p>
				<input type="password"  name="password" id="password"/>
				<p>비밀번호확인</p>
				<input type="password"" name="ckpassword" id="ckpassword"/>
				<input type= "submit" class="pet_btn second_btn transition02" value="확인">
				</div>
				</form>
			</div>
		</div>

	</div>




	<!-- FOOTER BASIC -->
	<c:import url='/WEB-INF/views/include/footer.jsp' />


</body>
</html>