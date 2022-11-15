<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="imgPath" value="${pageContext.request.contextPath}/resources/images"/>

<div class="content">
  
  <c:if test="${empty data}"> 
  	<div>
  		<p class="mb25">등록된 반려동물 정보가 없어요.</p>
  		<a href="${pageContext.request.contextPath}/petForm" class="pet_btn">반려동물 정보 등록하기</a>
  	</div>
  	
	</c:if>
	
	<c:if test="${not empty data}"> 
		<p class="menu_title">
	  	<span>나의 반려동물 정보</span>
	  	<a href="${pageContext.request.contextPath}/mypage/mySitterInfoEdit" class="icon"><i class="fa-solid fa-pen-to-square"></i></a>
	  </p>
	  <div class="data">
	    <p><span class="key">돌봄가능동물</span><span class="value">${data.pet_kind}</span></p>
	    <p><span class="key">이메일</span><span class="value">${data.pet_specie}</span></p>
	    <p><span class="key">돌봄가능요일</span><span class="value">${data.work_day}</span></p>
	    <p><span class="key">활동가능지역</span><span class="value">${data.addr} ${data.addr_detail} [${data.zipcode}]</span></p>
	    <p><span class="key">나의소개</span><span class="value">${data.sitter_info}</span></p>
	  </div>   
	</c:if>
  
</div>