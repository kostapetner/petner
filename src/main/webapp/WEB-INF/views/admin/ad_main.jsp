<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cssPath"
	value="${pageContext.request.contextPath}/resources/css" />
<c:set var="imgPath"
	value="${pageContext.request.contextPath}/resources/images" />


<!-- 세션있을때  -->
<c:if test="${not empty authUser}">
	<!-- 관리자 일때 -->
	<c:if test="${authUser.user_type >= 9}">

		<c:import url='/WEB-INF/views/admin/notice/list.jsp' />
		<c:import url='/WEB-INF/views/admin/board/list.jsp' />
		<c:import url='/WEB-INF/views/admin/qna/list.jsp' />

		<!-- ********** 게시판 관리 ********** -->
		<div class="card ad_card mb-4">
			<div class="card-body">
				<h2 class="card-title">게시판 관리</h2>
				<nav class="nav ad_card_nav">
					<a class="nav-link active" aria-current="page" href="#">게시판</a> <a
						class="nav-link" href="#">게시판2</a>
				</nav>
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">날짜</th>
							<th scope="col">신고자</th>
							<th scope="col">신고대상</th>
							<th scope="col">내용</th>
							<th scope="col" style="text-align: end;">상태</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<div class="row">
								<td class="col-2">2022.11.09
								</th>
								<td class="col-2">Mark</td>
								<td class="col-2">Otto</td>
								<td class="col-4">@mdo</td>
								<td class="col-2" style="text-align: end;">@mdo</td>
							</div>
						</tr>
						<tr>
							<div class="row">
								<td class="col-2">2022.11.09
								</th>
								<td class="col-2">Mark</td>
								<td class="col-2">Otto</td>
								<td class="col-4">@mdo</td>
								<td class="col-2" style="text-align: end;">@mdo</td>
							</div>
						</tr>
						<tr>
							<div class="row">
								<td class="col-2">2022.11.09
								</th>
								<td class="col-2">Mark</td>
								<td class="col-2">Otto</td>
								<td class="col-4">@mdo</td>
								<td class="col-2" style="text-align: end;">@mdo</td>
							</div>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<!-- --------- 게시판 관리 --------- -->


		<h2>Section title</h2>
		<div class="table-responsive">
			<table class="table table-striped table-sm">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">Header</th>
						<th scope="col">Header</th>
						<th scope="col">Header</th>
						<th scope="col">Header</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1,001</td>
						<td>random</td>
						<td>data</td>
						<td>placeholder</td>
						<td>text</td>
					</tr>
					<tr>
						<td>1,002</td>
						<td>placeholder</td>
						<td>irrelevant</td>
						<td>visual</td>
						<td>layout</td>
					</tr>
					<tr>
						<td>1,003</td>
						<td>data</td>
						<td>rich</td>
						<td>dashboard</td>
						<td>tabular</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- --------- container --------- -->

		<!-- 관리자 일때.end -->
	</c:if>

	<!-- 관리자 아닐때 -->
	<c:if test="${authUser.user_type < 9}">
		<c:import url='/WEB-INF/views/include/not_admin.jsp' />
	</c:if>
</c:if>

<!-- 세션없을때 -->
<c:if test="${empty authUser}">
	<c:import url='/WEB-INF/views/include/not_users.jsp' />
</c:if>




