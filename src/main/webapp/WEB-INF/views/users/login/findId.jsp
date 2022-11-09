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
	 function checkId() {
		 var name =$("#name").val();
		 var email =$("#email").val();
		 var result = ${result}
		 if(!email || !name){
			  	$('#check-msg').text("!정확한 이름과 메일주소를 입력해주세요").css("color", "red");
			  	$("#name").focus();
			  	
			    return false;
	 		} if(result==0){
	 			$('#success-msg').text("당신의 ID는" + ${userInfo.id} +"입니다.").css("color", "gray");
			}
		 		return false;
	 }
	 </script>
</head>
<body>
  <div id="wrapper">
    <!-- HEADER BASIC -->
    <c:import url='/WEB-INF/views/include/header.jsp'/>
    <!-- CONTAINER -->
    
    <div class="container">
     <form action="./findId" method="POST" id="findId" class="findId" onsubmit="return checkId()" >
    <p>*회원가입시 작성한 이름과 이메일을 기입해주세요*</p>
    <div class="f_row">
      <input type="text" placeholder="이름" name="name" id="name"/>
      <input type="text" placeholder="E-mail" name="email" id="email">
        
    </div>
     <input type="submit" class="pet_btn" value= "아이디 찾기"/>
  	<small id="check-msg" class="form-error"></small>
     <small id="success-msg" class="form-error"></small>
     
  </form>
     	
    </div>
		
		
	
		<!-- FOOTER BASIC -->
    <c:import url='/WEB-INF/views/include/footer.jsp'/>
    
  </div>
</body>
</html>