<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cssPath"
	value="${pageContext.request.contextPath}/resources/css" />
<c:set var="imgPath"
	value="${pageContext.request.contextPath}/resources/images" />

<style>
.status_select {
	display: flex;
	justify-content: flex-end;
	padding-top: 30px;
}

.status_select select {
	min-width: auto;
}

.card_list_reveiw {
	margin-top: 20px;
}

.card_list_reveiw img {
	width: 100%;
	height: 100%;
}

.card_list_reveiw li {
	/* display:flex;
    align-items: center;
    justify-content: space-between;
    border-bottom:1px solid #ddd;
    padding:20px; */
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 28px;
	margin-top: 40px;
	border-radius: 5px;
	box-shadow: 1px 1px 5px 2px rgba(222, 222, 222, 0.75);
	-webkit-box-shadow: 1px 1px 5px 2px rgba(222, 222, 222, 0.75);
	-moz-box-shadow: 1px 1px 5px 2px rgba(222, 222, 222, 0.75);
}

.card_list_reveiw .col1 {
	width: 80%;
	display: flex;
	align-items: center;
}

.card_list_reveiw .col1 .img_area {
	margin-right: 30px;
}

.card_list_reveiw .col1 .pet_img {
	width: 45px;
	height: 45px;
	overflow: hidden;
	border-radius: 50%;
}

.card_list_reveiw .col1 .text_area .title {
	
}

.card_list_reveiw .col1 .text_area .cont {
	line-height: 2rem;
	color: var(- -fcc-font01);
	padding-bottom: 14px;
}

.status {
	margin-left: 10px;
	font-size: 1.2rem;
	padding: 4px;
	background-color: #3993397a;
	color: green;
	border-radius: 5px;
}

.card_list_reveiw .col2 {
	display: flex;
	flex-direction: column;
	justify-content: flex-end;
}

.review_btn {
	background: #e7e7e7;
	color: #6f6f6f;
	font-size: 1.4rem;
	text-align: center;
	font-weight: 500;
}

.card_list_reveiw .date {
	font-size: 1.4rem;
	color: #ddd;
	padding-top: 10px;
}

.card_list_reveiw {
	font-size: 1.4rem;
	color: #cacaca;
}

.rateon {
	font-size: 1.4rem;
	color: #ff9966;
}

.rateoff {
	font-size: 1.4rem;
	color: #dddddd;
}
</style>

<!-- ??? AJX ????????? ????????? -->
<div class="status_select">
	<select class="fcc_select " name="" id="">
		<option value="">????????????</option>
		<option value="">??????</option>
		<option value="">?????????</option>
	</select>
</div>


<!-- ????????? ????????? -->
<div class="card_list_reveiw">
	<ul>
		<c:if test="${empty data}">
			<li>
				<div>
					<p class="mb25">????????? ????????? ????????????.</p>
				</div>
			</li>
		</c:if>

		<c:if test="${not empty data}">
			<c:forEach items="${data }" var="data">
				<li>
					<div class="col1">
						<!-- ????????????????????? -->
						<div class="img_area">
							<p class="pet_img">
								<img
									src="https://img.wkorea.com/w/2022/10/style_634f9b4c8c907-500x354-1666161931.jpg"
									alt="?????????">
							</p>

						</div>
						<!-- ??????????????? ?????? -->
						<div class="text_area">
							<div class="flex_agn_center mb10">
								<p class="title">${pageContext.request.contextPath }/${data.title }</p>
								<!-- ???????????? ????????? span?????? ?????? -->
								<span class="status com">??????</span>
							</div>
							<p class="cont">${pageContext.request.contextPath }/${data.content }</p>

							<p class="rate">
								<i class="fa-solid fa-paw rateon"></i> <i
									class="fa-solid fa-paw rateon"></i> <i
									class="fa-solid fa-paw rateon"></i> <i
									class="fa-solid fa-paw rateoff"></i> <i
									class="fa-solid fa-paw rateoff"></i>
							</p>

						</div>
					</div>
					<div class="col2">
						<button type="submit" class="pet_btn review_btn">
							<a
								href="${pageContext.request.contextPath}/mypage/review/modifyform">????????????</a>
						</button>
						<p class="date">${pageContext.request.contextPath }/${data.reviewDate }</p>
					</div>
				</li>
			</c:forEach>

		</c:if>

	</ul>
</div>