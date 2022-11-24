<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cssPath"
	value="${pageContext.request.contextPath}/resources/css" />
<c:set var="imgPath"
	value="${pageContext.request.contextPath}/resources/images" />

<style>
textarea {
	width: 100%;
	border: 1px solid #ced4da;
	border-radius: 0.375rem;
	max-height: 150px;
} 
</style>
<!-- 게시판 등록 -->
<div class="card ad_card mb-4">
	<div class="card-body">
		<h2 class="card-title">회원 상세정보</h2>
		<form action="ad_authority" method="post" name="ad_authority">
			<input type="hidden" name="user_no" value="${article.user_no}" />

			<ul class="user_detail">
				<li>
					<p>회원번호 :</p>
					<p>${users.user_no}</p>
				</li>
				<li>
					<p>타입 :</p>
					<p>${users.user_type}</p>
				</li>
				<li>
					<p>이름 :</p>
					<p>${users.name}</p>
				</li>
				<li>
					<p>아이디 :</p>
					<p>${users.id}</p>
				</li>
				<li>
					<p>닉네임 :</p>
					<p>${users.nickname}</p>
				</li>
				<li>
					<p>이메일 :</p>
					<p>${users.email}</p>
				</li>
				<li>
					<p>비밀번호 :</p>
					<p>${users.password}</p>
				</li>
				<li>
					<p>가입일 :</p>
					<p>${users.joindate}</p>
				</li>
				<li>
					<p>성별 :</p>
					<p>${users.gender}</p>
				</li>
				<li>
					<p>주소 :</p>
					<p>${users.addr} ${users.addr_detail}</p>
				</li>
				<li>
					<p>등급 :</p>
					<p>${users.user_level}</p>
				</li>
				
			</ul>
	</div>
</div>
