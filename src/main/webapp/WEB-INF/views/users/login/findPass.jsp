<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cssPath" value="${pageContext.request.contextPath}/resources/css"/>
<c:set var="imgPath" value="${pageContext.request.contextPath}/resources/images"/>

<!DOCTYPE html>
<html>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		$("#findBtn").click(function(){
			$.ajax({
				url : "http://localhost:8088/petner/findPass",
				type : "POST",
				data : {
					id : $("#id").val(),
					email : $("#email").val()
				},
				success : function(result) {
					alert(result);
				},
			})
		});
	});
</script>

<head>
<style>
	#findId input[type=text]{width:100%;}
	.desc{text-align:center; margin-bottom:35px;}
	.find_id{width:120px !important; text-align:center;}
	.flex_between{flex-wrap:nowrap}
</style>
	<c:import url='/WEB-INF/views/include/common_head.jsp'/>
	<title>비밀번호 찾기</title>
</head>
<body>
  <div id="wrapper">
    <!-- HEADER BASIC -->
    <c:import url='/WEB-INF/views/include/header.jsp'/>
    <!-- CONTAINER -->
    
    <div class="container">
			<div class="w45">
				<h3 class="form_title">비밀번호 찾기</h3>
				<div class="desc">
					<p class="mb10">가입한 아이디와 이메일로 임시비밀번호를 받을 수 있습니다.</p>
					<p class="tip">아이디와 이메일 정보를 입력해주세요.</p>
				</div>
				
				<div class="f_row">
					<p class="fc_title">아이디</p>
					<input type="text" placeholder="아이디" name="id" id="id" />
				</div>
				<div class="f_row">
					<p class="fc_title">이메일</p>
					<div class="flex_between">
						<input type="text" placeholder="E-mail" name="email" id="email" class="mr12"/>
						
					</div>
				</div>
				<div class="f_row" style="text-align:center; margin-top:20px">
					<button type="button" id="findBtn" class="pet_btn submit_btn transition02">이메일 전송</button>
					
				</div>				
			
			
			</div>

	</div>
	

		
	
		<!-- FOOTER BASIC -->
    <c:import url='/WEB-INF/views/include/footer.jsp'/>
    
  </div>
</body>
</html>