<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="imgPath" value="${pageContext.request.contextPath}/resources/images"/>

<style>
  .cont_view{padding:100px 0}
  .cont_view .menu_title{
    padding-bottom:30px; 
    font-size:1.8rem; 
    display:flex;
    align-items: center;
  }
  .cont_view .menu_title a{margin-left:40px; color:#888}
  .cont_view .data .key{display:inline-block; min-width: 140px; padding-bottom:20px}
</style>

<div class="content">
  <p class="menu_title">
  	나의정보보기
  	<a href="#" class="icon"><i class="fa-solid fa-pen-to-square"></i></a>
  </p>
  <div class="data">
    <p><span class="key">이름</span><span class="value">${member.name}</span></p>
    <p><span class="key">별명</span><span class="value">${member.id}</span></p>
    <p><span class="key">이메일</span><span class="value">${member.email}</span></p>
    <p><span class="key">주소</span><span class="value">${member.address}</span></p>
  </div>   
</div>