<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cssPath" value="${pageContext.request.contextPath}/resources/css"/>
<c:set var="imgPath" value="${pageContext.request.contextPath}/resources/images"/>

<!DOCTYPE html>
<html>
<head>
	<c:import url='/WEB-INF/views/include/common_head.jsp'/>
	<title>비밀번호수정 성공!</title>
</head>
<body>
  <div id="wrapper">
    <!-- HEADER BASIC -->
    <c:import url='/WEB-INF/views/include/header.jsp'/>
    <!-- CONTAINER -->
    
    <div class="container">
    
    
    <p>회원님의 비밀번호가 성공적으로 수정되었습니다. 새로운 비밀번호로 로그인해주세요!</p>
     	
    </div>
		
		
	
		<!-- FOOTER BASIC -->
    <c:import url='/WEB-INF/views/include/footer.jsp'/>
    
  </div>
</body>
</html>