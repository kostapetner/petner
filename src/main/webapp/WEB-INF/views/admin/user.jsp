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
			<a class="nav-link active" aria-current="page" href="#">신고접수처리</a> <a
				class="nav-link" href="#">1:1문의</a>
		</nav>
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">회원번호</th>
					<th scope="col">이름</th>
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