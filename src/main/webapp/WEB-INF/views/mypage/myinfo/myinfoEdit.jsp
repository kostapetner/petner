<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="imgPath" value="${pageContext.request.contextPath}/resources/images"/>


<div class="content">
  <p class="menu_title">나의정보보기 수정</p>
  <div class="data">
    <p><span class="key">이름</span><span class="value">${member.name}</span></p>
    <p><span class="key">별명</span><span class="value">${member.id}</span></p>
    <p><span class="key">이메일</span><span class="value">${member.email}</span></p>
    <p><span class="key">주소</span><span class="value">${member.address}</span></p>
  </div>   
</div>