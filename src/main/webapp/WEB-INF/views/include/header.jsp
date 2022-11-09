<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cssPath" value="${pageContext.request.contextPath}/resources/css"/>
<c:set var="imgPath" value="${pageContext.request.contextPath}/resources/images"/>
<script>
  // common js 로 분리할 부분
  $(document).ready(function(){
  
    $(document)
    .on("click", ".login_menu .mypage", function(){
      $(".float_mymenu").css({        
        "left" : $(".login_menu").offset().left + 10 + "px",
        "top":$(this).offset().top + $(this).height()+ 16 + "px",
        "transform" : "translateX(-50%)"
      })
      $(".float_mymenu").fadeToggle("200");
    })

   
   
  }) // jquery ENDS
  
  // resize
  $(window).resize(function(){
    $(".float_mymenu").hide();
  })
</script>


<!-- HEADER BASIC -->
<header id="header">
  <div class="header_inner">
    <h1><img src="${imgPath}/header_logo.png" alt="logo"></h1>
    <nav id="gnb">
      <ul>
        <li><a href="/petner/findSitter">펫시터 찾기</a></li>
        <li><a href="/petner/findAnimal">돌봐줄 동물 찾기</a></li>
        <li><a href="/petner/notice">공지사항</a></li>
      </ul>
    </nav>
    <div class="login_menu">
      <ul>
        <!-- 세션있을때  -->
        <li class="in_session"><a class="heart transition02" href="#"><i class="fa-solid fa-comment-dots"></i></a></li>
        <li class="in_session"><a class="alert transition02" href="#"><i class="fa-solid fa-bell"></i></a></li>
        <li class="in_session mypage"><a a class="my transition02" href="#"><i class="fa-solid fa-user"></i> </a></li>

        <!-- 세션없을때 로그인 -->
        <li><a class="login" href="#">로그인</a></li>
      </ul>
    </div>
    <!-- 마이페이지 플로트메뉴 / 로그아웃 -->
    <div class="float_mymenu">
      <div>
        <p class="pb10"><b >petpetid123</b></pc>
        <p class="flex_between">
          <span class="second">pet1234@gmail.com</span>
          <a style="font-weight: 300;" class="second" href="#">마이페이지</a>
        </p>
      </div>

      <div class="flex_between">
        <div>
          <p class="second pb4">닉네임</p>
          <p>코스타펫스타</p>
        </div>
        <div>
          <p class="second pb4">등급</p>
          <p>VIP</p>
        </div>
      </div>
      <div><a href="#">로그아웃</a></div>
    </div>
  </div>
</header>