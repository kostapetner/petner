<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cssPath" value="${pageContext.request.contextPath}/resources/css"/>
<c:set var="imgPath" value="${pageContext.request.contextPath}/resources/images"/>

<!DOCTYPE html>
<html>
<head>
	<c:import url='/WEB-INF/views/include/common_head.jsp'/>
	<title>아이디 찾기</title>
	<script src= "https://code.jquery.com/jquery-3.4.1.js"></script>
	 <script>
	 $(function () {
		 			
		 	 	$('#findId').submit(function() {
		 	 		
		 	 	});
		   		
		});//function ready 끝
	  
	 </script>
</head>
<body>
  <div id="wrapper">
    <!-- HEADER BASIC -->
    <c:import url='/WEB-INF/views/include/header.jsp'/>
    <!-- CONTAINER -->
    
    <div class="container">
     <form action="./findId" id = "findId" method="POST">
    <p>*회원가입시 작성한 이름과 이메일을 기입해주세요*</p>
    <p></p>
    <div class="f_row">
      <input type="text" placeholder="이름" name="name" id="name"/>
      <input type="text" placeholder="E-mail" name="email" id="email">
      <input type= "submit" class="pet_btn second_btn transition02" id="findId" value="아이디 찾기">
    </div>

  </form>
  
    </div>
		
		
	
		<!-- FOOTER BASIC -->
    <c:import url='/WEB-INF/views/include/footer.jsp'/>
    
  </div>
</body>
</html>