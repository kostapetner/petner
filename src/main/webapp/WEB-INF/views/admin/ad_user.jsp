<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cssPath"
	value="${pageContext.request.contextPath}/resources/css" />
<c:set var="imgPath"
	value="${pageContext.request.contextPath}/resources/images" />


<!-- ********** 회원정보 관리 ********** -->
<div class="card ad_card mb-4">
	<div class="card-body">
		<h2 class="card-title">회원정보관리</h2>
		<nav class="nav ad_card_nav">

			<a class="nav-link active" aria-current="page" href="#">일반회원</a> <a
				class="nav-link" href="#">관리자</a>

		</nav>
		<form name="admin_user" action="ad_usersdelete" method="post">
			<table class="table table-hover user_table">
				<thead>
					<tr>
						<th scope="col">회원번호</th>
						<th scope="col">이름</th>
						<th scope="col">email</th>
						<th scope="col">회원구분</th>
						<th scope="col">주소</th>
						<th scope="col" style="text-align: end;">탈퇴</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="users" items="${list}">
						<tr>
							<div class="row">
								<td class="col">
									<p>
										<span class="value">${users.user_no}</span>
									</p>
								</td>
								<td class="col">
									<p>
										<span class="value">
										<%-- <a href="./ad_authorityForm">
										${users.name}
										</a> --%>
										<a href="./ad_detailForm?user_no=${users.user_no}">
										${users.name}
										</a>
										</span>
									</p>
								</td>
								<td class="col">
									<p>
										<span class="value">${users.email}</span>
									</p>
								</td>
								<td class="col type_box">
									<!-- 관리자 분류 -->
								    <c:if test="${users.user_type == 10}">
										<div class="admin10"><span class="value">최고관리자</span></div>
								    </c:if>
									<c:if test="${users.user_type == 9}">
										<div class="admin9"><span class="value">관리자</span></div>
								    </c:if>
								    <c:if test="${users.user_type < 9}">
										<div class="admin1"><span class="value">일반</span></div>
								    </c:if>
								</td>
								<td class="col">
									<p>
										<span class="value">${users.addr}</span>
									</p>
								</td>
								<td class="col" style="text-align: end;"><label><input
										type="checkbox" name="user_no" value="${users.user_no}"></label>
								</td>
							</div>
						</tr>
					</c:forEach>
				</tbody>
			</table>
				<button type="submit" class="btn btn-outline-secondary">
				탈퇴시키기
				</button>
		</form>
	</div>
</div>