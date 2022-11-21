<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="imgPath"	value="${pageContext.request.contextPath}/resources/images" />

<div class="content">

	<c:if test="${empty data}">
		<div>
			<p class="mb25">등록된 반려동물 정보가 없어요.</p>
			<a href="${pageContext.request.contextPath}/petForm" class="pet_btn">반려동물 정보 등록하기</a>
		</div>
	</c:if>

	<c:if test="${not empty data}">
		<p class="menu_title">
			<span>나의 반려동물</span> <a
				href="${pageContext.request.contextPath}/petForm" class="icon">
				<i class="fa-solid fa-square-plus"></i>
			</a>
		</p>
		
		<ul>
		<c:forEach items="${data}" var="data">
			<li>
				<a class="article" href="#"> <b>${data.pet_name}</b>
				 <span	class="date">${data.pet_kind}</span>
				</a>
			</li>
		</c:forEach>
		</ul>
		

	</c:if>

</div>