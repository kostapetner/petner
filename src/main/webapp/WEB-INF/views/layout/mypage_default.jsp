<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cssPath" value="${pageContext.request.contextPath}/resources/css"/>
<c:set var="imgPath" value="${pageContext.request.contextPath}/resources/images"/>

<!DOCTYPE html>
<html>
<head>
	<c:import url='/WEB-INF/views/include/common_head.jsp'/>
	<title>${title}</title>
</head>
<body>
  <div id="wrapper">
    <!-- HEADER BASIC -->
    <c:import url='/WEB-INF/views/include/header.jsp'/>
    <!-- CONTAINER -->
    <div class="container">
      <div class="mypage_wr w100">

        <div class="my_profile">
          <div class="">
            <!-- 이미지영역 -->
            <div class="prof_img">
              <img src="https://img.wkorea.com/w/2022/10/style_634f9b4c8c907-500x354-1666161931.jpg" alt="이미지">
            </div>
            <!-- 텍스트정보 영역 -->
            <div class="prof_text">
              <div class="row1">                
                <p >idid1234</p>
                <p><a href="#"><i class="fa-solid fa-gear"></i></a></p>
              </div> 
              <div class="row2">
                <p><a href="#">팔로워<span class="f_val">122</span></a></p>
                <p><a href="#">팔로잉<span class="f_val">122</span></a></p>
                <p><span class="badge">최강기요미</span></p>
              </div>            
            </div>
          </div>
        </div>

        <div class="my_view">
          <div class="side_menu">
            <!-- 조건 둘다일경우만 토글 출력 -->
            <div class="toggle">
              <label class="switch">
                <input type="checkbox">        
                <span class="slider round"></span>
                <span class="texts">
                  <span class="text1 active">펫시터</span>
                  <span class="text2">보호자</span>
                </span>
              </label>
            </div>
            <!-- 둘다일경우 시터가 default -->
            <ul>
              <li>
                <p class="first_menu">내정보</p>
                <div class="second_menu">
                  <a href="#">나의정보보기</a>
                  <a href="#" class="coconut">나의 시터정보 관리</a>
                  <!-- 보호자일경우
                    <a href="#">나의펫정보관리</a>
                  -->
                </div>
              </li>

              <li>
                <p class="first_menu">나의 서비스</p>
                <div class="second_menu">
                  <a href="#">내가 받은 요청</a>
                  <a href="#">내가 찜한 요청</a>
                  <!-- 보호자일경우
                    <a href="#">서비스 요청하기</a>
                    <a href="#">신청한 서비스 보기</a>
                  -->
                </div>
              </li>
              
              <li>
                <p class="first_menu">리뷰관리</p>
                <div class="second_menu">
                  <a href="#">리뷰 쓰기</a>
                  <a href="#">내가 쓴 리뷰</a>
                  <a href="#">내가 받은 리뷰</a>
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
          	<c:import url='/WEB-INF/views/${page}.jsp'/>
          </div>
        </div>
      </div>
    </div>
		
		<!-- FOOTER BASIC -->
    <c:import url='/WEB-INF/views/include/footer.jsp'/>
    
  </div>
</body>
</html>