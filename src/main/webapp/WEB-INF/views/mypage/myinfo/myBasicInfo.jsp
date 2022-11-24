<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="imgPath" value="${pageContext.request.contextPath}/resources/images"/>

<div class="content">
  <p class="menu_title">
  	<span>나의 정보</span>
  	<a href="${pageContext.request.contextPath}/mypage/myinfoEdit" class="icon"><i class="fa-solid fa-pen-to-square"></i></a>
  </p>
  <div class="data">
    <p><span class="key">이름</span><span class="value">${member.name}</span></p>
    <p><span class="key">별명</span><span class="value">${member.nickname}</span></p>
    <p><span class="key">이메일</span><span class="value">${member.email}</span></p>
    <p><span class="key">주소</span><span class="value">${member.addr} ${member.addr_detail} [${member.zipcode}]</span></p>
  </div>  
  
  <div class="">
  	<c:choose>
  		<c:when test="${authUser.user_type==2}">
  		<!-- 보호자일 일경우 동물정보없으면 동물등록버튼 / 시터로 일하기 버튼-->
  		ggg ${count.IS_MYPET}
  		</c:when>
  	</c:choose>
  </div> 
</div>