<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="imgPath" value="${pageContext.request.contextPath}/resources/images" />
<style>
.card_list_type_B li {
	padding: 28px;
	margin-top: 40px;
	border-radius: 5px;
	box-shadow: 1px 1px 5px 2px rgba(222, 222, 222, 0.75);
	-webkit-box-shadow: 1px 1px 5px 2px rgba(222, 222, 222, 0.75);
	-moz-box-shadow: 1px 1px 5px 2px rgba(222, 222, 222, 0.75);
}

.data1 {
	display: flex;
	align-items: flex-start;
	margin-bottom: 20px;;
}

.card_list_type_B .pet_img {
	width: 100px;
	height: 100px;
	overflow: hidden;
	border-radius: 50%;
	margin-right: 20px
}

.card_list_type_B img {
	width: 100%;
	height: 100%;
}

/* text-area */
.card_list_type_B .matching_status {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 20px
}

.card_list_type_B .matching_status .status {
	padding: 2px 4px;
	margin-right: 10px;
	background-color: orange;
	border-radius: 5px;
}

.card_list_type_B .hire_detail {
	
}

.card_list_type_B .hire_detail p:nth-child(1) {
	font-size: 1.8rem;
	margin-bottom: 15px;
}

.card_list_type_B .hire_detail p:nth-child(2) {
	
}

.card_list_type_B .data2 {
	display: flex;
	align-items: center;
}

.card_list_type_B .date_info {
	margin-right: 20px;
}

.card_list_type_B .icons span {
	background-color: pink;
	padding: 2px 13px;
	border-radius: 20px;
	margin-right: 5px;
	font-size: 1.4rem;
}
.list_count{
	padding-top: 40px;
	text-align: end;
}
</style>
<div class="content_view">
	<p class="list_title">신청한서비스보기</p>
	<div class="list_count">${csListCount}개</div>
	<c:forEach var="csList" items="${csList}">
		<!-- 카드형 리스트 B : 보호자가 신청한 서비스  -->
		<div class="card_list_type_B">
			<ul>
				<li>
					<div class="data1">
						<!-- 이미지영역 -->
						<div class="pet_img">
							<img src="https://img.wkorea.com/w/2022/10/style_634f9b4c8c907-500x354-1666161931.jpg" alt="이미지">
						</div>
						<!-- 텍스트정보 영역 -->
						<div class="text_area">
							<div class="matching_status">
								<div>
								<c:if test="${csList.status == '매칭중' }">
									<span class="status">매칭중</span>
								</c:if>
								<c:if test="${csList.status == '매칭완료' }">
									<span class="status">매칭완료</span>
									<span class="sitter_name">매칭된 시터 : 열정의 펫시터</span>
								</c:if>
									
								</div>
								<div>금액부분</div>
							</div>
							<div class="hire_detail">
								<p>${csList.request_title }</p>
								<p>${csList.request_detail }</p>
							</div>
						</div>
					</div>
					<div class="data2">
						<p class="date_info">신청한 날짜</p>
						<div class="icons">
							<span class="pet">강아지</span> <span class="service">강아지</span> <span
								class="coconut">강아지</span>
						</div>
					</div>
	
				</li>
			</ul>
		</div>
	</c:forEach>
	
	

</div>