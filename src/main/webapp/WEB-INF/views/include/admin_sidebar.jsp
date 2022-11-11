<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cssPath"
	value="${pageContext.request.contextPath}/resources/css" />
<c:set var="imgPath"
	value="${pageContext.request.contextPath}/resources/images" />


		<!-- ********** side bar menu ********** -->
		<nav id="sidebarMenu"
			class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
			<div class="flex-shrink-0 p-3">


				<ul class="list-unstyled ps-0">
					<li class="mb-2">
						<button
							class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
							data-bs-toggle="collapse" data-bs-target="#home-collapse"
							aria-expanded="false">
							<span data-feather="home" class="align-text-bottom"></span> Home
						</button>
					</li>
					<li class="mb-2">
						<button
							class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
							data-bs-toggle="collapse" aria-expanded="false">
							<span data-feather="layers" class="align-text-bottom"></span> 
							<!-- <a href="./admin_authority">권한관리</a>
							 -->
							권한관리
						</button>
					</li>
					<li class="mb-2">
						<button
							class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
							data-bs-toggle="collapse" aria-expanded="false">
							<span data-feather="layers" class="align-text-bottom"></span> 현황
						</button>
					</li>
					<li class="mb-2">
						<button
							class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
							data-bs-toggle="collapse" data-bs-target="#user-collapse"
							aria-expanded="false">
							<span data-feather="layers" class="align-text-bottom"></span>
							회원정보관리
						</button>
						<div class="collapse" id="user-collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li><a href="./admin_user"
									class="link-dark d-inline-flex text-decoration-none rounded">회원정보관리</a></li>
								<li><a href="#"
									class="link-dark d-inline-flex text-decoration-none rounded">블랙리스트</a></li>
							</ul>
						</div>
					</li>
					<li class="mb-2">
						<button
							class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
							data-bs-toggle="collapse" data-bs-target="#orders-collapse"
							aria-expanded="false">
							<span data-feather="layers" class="align-text-bottom"></span>
							미처리현황
						</button>
						<div class="collapse" id="orders-collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li><a href="#"
									class="link-dark d-inline-flex text-decoration-none rounded">신고접수처리</a></li>
								<li><a href="#"
									class="link-dark d-inline-flex text-decoration-none rounded">1:1문의</a></li>
							</ul>
						</div>
					</li>

					<!-- <li class="border-top my-3"></li> -->
					<li class="mb-2">
						<button
							class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
							data-bs-toggle="collapse" data-bs-target="#table-collapse"
							aria-expanded="false">
							<span data-feather="layers" class="align-text-bottom"></span>
							게시판관리
						</button>
						<div class="collapse" id="table-collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li><a href="./boardList"
									class="link-dark d-inline-flex text-decoration-none rounded">공지사항관리</a></li>
								<li><a href="#"
									class="link-dark d-inline-flex text-decoration-none rounded">리뷰관리</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
		</nav>
		<!-- --------- side bar menu --------- -->