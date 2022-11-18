<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cssPath" value="${pageContext.request.contextPath}/resources/css"/>
<c:set var="imgPath" value="${pageContext.request.contextPath}/resources/images"/>



<style>
  .login_wr .logo{text-align: center; padding:30px 0;}
  .login_form{margin-bottom:12px;}
  .login_form .f_row{border:1px solid #e4e4e4; padding-bottom: 0; margin-bottom:28px; border-radius: 5px; overflow: hidden;}
  .login_form input{width:100%; height:52px; border:none; border-radius: 0;;}
  .login_form input:focus{border:none; outline:none;}
  .login_form input:nth-child(1){border-bottom: 1px solid #e4e4e4;}
  .login_form .login_btn{background-color: #e4e4e4; color:var(--black); height:52px; }  
  
  .login_wr .info_are label.fcCbox1 > span:before{color:var(--fcc-font01) !important}
  .login_wr .info_area label.fcCbox1 span{color:#e4e4e4}
  .login_wr p:nth-child(1){
    display:flex; 
    justify-content: space-between; 
    padding-bottom: 10px;
    color:#e4e4e4;
  }
  .login_wr p:nth-child(3){text-align: center; text-decoration: underline; padding-top:20px;}
  .kakao_btn{background-color:#FAE100; color:#3B1E1E; font-size:1.4rem; height:52px;}
  .login_option{
    padding-top: 30px;
    border-top: 1px solid #e4e4e4;
    margin-top: 30px;
  }

</style>
<script src= "https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
$('#myModal').on('shown.bs.modal', function () {
	  $('#myInput').trigger('focus')
	})
	
	function login() {
		loginForm.submit();
	}

</script>

<div class="w45 login_wr">      
  <div class="logo"><img src="./images/logo3.svg" alt=""></div>
  <form action="./login" method="POST" id="loginForm" class="login_form">
    
    <div class="f_row">
      <input type="text" placeholder="ID" name="id" id="id" >
      <input type="password" placeholder="비밀번호" name="password" id="password">
    </div>
     <input type ="submit" class="pet_btn login_btn transition02" value= "로그인" onsubmit="login()"/>
  </form>

	<div class="form-label-group">
		<c:if test="${check == 1}">
		<script>
			alert("${message}");
			</script>
		</c:if>
	</div>
	<div class="info_area">
    <p>
      <label class="fcCbox1"><input type="checkbox" id="remember-me" name="remember-me" ><span>로그인 유지하기</span></label>
      <span>
      	<a href="./findId" >아이디</a>&nbsp;/&nbsp;<a href="./findPass">비밀번호찾기</a>
      </span>
    </p>
    <a class="p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=7d545fe4f1b025d4ae839deae7232c74&redirect_uri=http://localhost:8088/petner/kakaoLogin&response_type=code">
		<p class="login_option"><span class="pet_btn login_btn kakao_btn">카카오톡계정으로 로그인하기</span></p>
    </a>		
    <p class="login_option"><a href="./join">펫트너회원가입</a></p>
  </div>
</div>