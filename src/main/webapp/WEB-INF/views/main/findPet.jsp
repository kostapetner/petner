<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<c:import url='/WEB-INF/views/include/common_head.jsp' />
<title>${title}</title>
<style>
/* 	  .filter_feed{display:none}
	  .filter_feed .f_row{padding-bottom:5px;} */
</style>
</head>
<script>
  $(document).ready(function(){
	//air-datepicker
    var date = new Date();
	var dp = $('#date_start').datepicker({
	  //년-월-일
	  startDate: new Date(date.getFullYear(), date.getMonth(), date.getDate()),
	  language: 'ko',
	  autoClose: true,
	  //선택한 날짜를 가져옴
	  onSelect: function (date) {
	      var endNum = date;
	      //종료일 datepicker에 최소날짜를 방금 클릭한 날짜로 설정
	      $('#date_end').datepicker({
	          minDate: new Date(endNum),
	      });
	  }
	}).data('datepicker');
	var dp2 = $('#date_end').datepicker({
	  startDate: new Date(date.getFullYear(), date.getMonth(), date.getDate()),  // 시간, 분은 00으로 초기 설정
	  language: 'ko',
	  autoClose: true,
	  //선택한 날짜를 가져옴
	  onSelect: function (date) {
	      var startNum = date;
	      $('#date_start').datepicker({
	          //시작일 datepicker에 최대날짜를 방금 클릭한 날짜로 설정
	          maxDate: new Date(startNum),
	      });
	  }
	}).data('datepicker');
    
    
  })
</script>
<body>
	<div id="wrapper">
		<!-- CONTAINER -->
		<div class="container w90">
			<div class="">
				<p class="list_title">펫 찾기</p>
				<!-- 검색창 -->
				<div class="search_form">
					<form action="#">
						<input type="text" class="keyword" placeholder="펫을 검색해요" />
						<span class="search_submit">
							<i class="fa-solid fa-magnifying-glass"></i>
						</span>
					</form>
				</div>

				<!-- 검색조건 -->
				<div class="filter_feed">
					<!-- 날짜 -->
				 	<div class="f_row">
				 		<p class="filter_title">가능한 날짜를 선택해주세요</p>
				 		<div>
				 			<input type="text" class="date-picker" id="date_start" name="st_date" style="height: 29px;">&nbsp;~&nbsp;
			            	<input type="text" class="date-picker" id="date_end" name="end_date" style="height: 29px;">
				 		</div>
			        </div>
					<!-- 서비스 -->
					<div class="f_row">
						<p class="filter_title">서비스</p>
						<div class="select_box">
							<label class="fcCbox1">
								<input type="checkbox" name="service" value="방문관리">
								<span>방문관리</span>
							</label>
							<label class="fcCbox1">
								<input type="checkbox" name="service" value="산책">
								<span>산책</span>
							</label>
							<label class="fcCbox1">
								<input type="checkbox" name="service" value="목욕">
								<span>목욕</span>
							</label>
							<label class="fcCbox1">
								<input type="checkbox" name="service" value="교육">
								<span>교육</span>
							</label>
						</div>
					</div>
					<div class="f_row">
						<p class="filter_title">동물종류</p>
						<div class="select_box">
							<label class="fcCbox1">
								<input type="checkbox" name="pet_kind" value="개">
								<span>개</span>
							</label>
							<label class="fcCbox1">
								<input type="checkbox" name="pet_kind" value="고양이" >
								<span>고양이</span>
							</label>
							<label class="fcCbox1">
								<input type="checkbox" name="pet_kind" value="관상어" >
								<span>관상어</span>
							</label>
							<label class="fcCbox1">
								<input type="checkbox" name="pet_kind" value="새" >
								<span>새</span>
							</label>
							<label class="fcCbox1">
								<input type="checkbox" name="pet_kind" value="파충류" >
								<span>파충류</span>
							</label>
							<label class="fcCbox1">
								<input type="checkbox" name="pet_kind" value="기타" >
								<span>기타</span>
							</label>
						</div>
					</div>
					<div class="f_row">
						<p class="filter_title">보호자 성별</p>
						<div class="select_box">
							<label class="fcCbox1">
								<input type="checkbox" name="gender" value="여">
								<span>여성</span>
							</label>
							<label class="fcCbox1">
								<input type="checkbox" name="gender"  value="남">
								<span>남성</span>
							</label>
						</div>
					</div>
					<div class="f_row">
						<div>
							<p class="filter_title">현재 위치</p>
							<p class="filter_title">방배동</p>
							<input type="button" value="내주변찾기">
						</div>
					</div>
				</div>
			</div>

			<!-- 카드형 리스트 -->
			<div class="card_list_type">
				<ul class="findpet_ul">
					<li>
						<div class="data">
							<!-- 이미지영역 -->
							<div class="img_area">
								<img src="https://img.wkorea.com/w/2022/10/style_634f9b4c8c907-500x354-1666161931.jpg" alt="이미지">
							</div>
							<!-- 텍스트정보 영역 -->
							<div class="text_area">
								<div class="row1">
									<p>        
										<span class="nick">닉네임</span><span class="type">상태값</span>
									</p>
									<p>
										<span class="badge">최강기요미</span>
									</p>
								</div>
								<div class="row2">
									<p>
										<a href="#">팔로워<span class="f_val">122</span></a>
									</p>
									<p>
										<a href="#">팔로잉<span class="f_val">122</span></a>
									</p>
								</div>
								<div class="row3">2022-05-23~2022-05-24</div>
								<div class="row4">자기소개</div>
							</div>
						</div>
						<div class="icons">
							<a href="#"><i class="fa-regular fa-heart"></i></a>
							<a href="#"><i class="fa-solid fa-user-plus"></i></a>
							<a href="#"><i class="fa-solid fa-comment-dots"></i></a>
						</div>
					</li>
					<li>
						<div class="data">
							<!-- 이미지영역 -->
							<div class="img_area">
								<img src="https://img.wkorea.com/w/2022/10/style_634f9b4c8c907-500x354-1666161931.jpg" alt="이미지">
							</div>
							<!-- 텍스트정보 영역 -->
							<div class="text_area">
								<div class="row1">
									<p>
										<span class="nick">닉네임</span><span class="type">상태값</span>
									</p>
									<p>
										<span class="badge">최강기요미</span>
									</p>
								</div>
								<div class="row2">
									<p>
										<a href="#">팔로워<span class="f_val">122</span></a>
									</p>
									<p>
										<a href="#">팔로잉<span class="f_val">122</span></a>
									</p>
								</div>
								<div class="row3">2022-05-23~2022-05-24</div>
								<div class="row4">자기소개</div>
							</div>
						</div>
						<div class="icons">
							<a href="#"><i class="fa-regular fa-heart"></i></a>
							<a href="#"><i class="fa-solid fa-user-plus"></i></a>
							<a href="#"><i class="fa-solid fa-comment-dots"></i></a>
						</div>
					</li>
					
					<li>
						<div class="data">
							<!-- 이미지영역 -->
							<div class="img_area">
								<img src="https://img.wkorea.com/w/2022/10/style_634f9b4c8c907-500x354-1666161931.jpg" alt="이미지">
							</div>
							<!-- 텍스트정보 영역 -->
							<div class="text_area">
								<div class="row1">
									<p>
										<span class="nick">닉네임</span><span class="type">상태값</span>
									</p>
									<p>
										<span class="badge">최강기요미</span>
									</p>
								</div>
								<div class="row2">
									<p>
										<a href="#">팔로워<span class="f_val">122</span></a>
									</p>
									<p>
										<a href="#">팔로잉<span class="f_val">122</span></a>
									</p>
								</div>
								<div class="row3">2022-05-23~2022-05-24</div>
								<div class="row4">자기소개</div>
							</div>
						</div>
						<div class="icons">
							<a href="#"><i class="fa-regular fa-heart"></i></a>
							<a href="#"><i class="fa-solid fa-user-plus"></i></a>
							<a href="#"><i class="fa-solid fa-comment-dots"></i></a>
						</div>
					</li>
					
					<li>
						<div class="data">
							<!-- 이미지영역 -->
							<div class="img_area">
								<img src="https://img.wkorea.com/w/2022/10/style_634f9b4c8c907-500x354-1666161931.jpg" alt="이미지">
							</div>
							<!-- 텍스트정보 영역 -->
							<div class="text_area">
								<div class="row1">
									<p>
										<span class="nick">닉네임</span><span class="type">상태값</span>
									</p>
									<p>
										<span class="badge">최강기요미</span>
									</p>
								</div>
								<div class="row2">
									<p>
										<a href="#">팔로워<span class="f_val">122</span></a>
									</p>
									<p>
										<a href="#">팔로잉<span class="f_val">122</span></a>
									</p>
								</div>
								<div class="row3">2022-05-23~2022-05-24</div>
								<div class="row4">자기소개</div>
							</div>
						</div>
						<div class="icons">
							<a href="#"><i class="fa-regular fa-heart"></i></a>
							<a href="#"><i class="fa-solid fa-user-plus"></i></a>
							<a href="#"><i class="fa-solid fa-comment-dots"></i></a>
						</div>
					</li>
					
					<li>
						<div class="data">
							<!-- 이미지영역 -->
							<div class="img_area">
								<img src="https://img.wkorea.com/w/2022/10/style_634f9b4c8c907-500x354-1666161931.jpg" alt="이미지">
							</div>
							<!-- 텍스트정보 영역 -->
							<div class="text_area">
								<div class="row1">
									<p>
										<span class="nick">닉네임</span><span class="type">상태값</span>
									</p>
									<p>
										<span class="badge">최강기요미</span>
									</p>
								</div>
								<div class="row2">
									<p>
										<a href="#">팔로워<span class="f_val">122</span></a>
									</p>
									<p>
										<a href="#">팔로잉<span class="f_val">122</span></a>
									</p>
								</div>
								<div class="row3">2022-05-23~2022-05-24</div>
								<div class="row4">자기소개</div>
							</div>
						</div>
						<div class="icons">
							<a href="#"><i class="fa-regular fa-heart"></i></a>
							<a href="#"><i class="fa-solid fa-user-plus"></i></a>
							<a href="#"><i class="fa-solid fa-comment-dots"></i></a>
						</div>
					</li>
				</ul>
			</div>
			
			<!-- 페이징 -->
			<ul class="pagination">
				<c:choose>
					<c:when test="${pageInfo.page<=1}">
						<li class="prev"><a href="#"><i class="fa-solid fa-chevron-left"></i></a></li>
					</c:when>
					<c:otherwise>
						<li class="prev"><a href="${pageContext.request.contextPath}/mypage/myService/requireServiceList?page=${pageInfo.page-1}"><i class="fa-solid fa-chevron-left"></i></a></li>
					</c:otherwise>
				</c:choose>
			
				<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
					<c:choose>
						<c:when test="${pageInfo.page==i }"><li class="on"><a href="#">${i}</a></li></c:when>
						<c:otherwise>
							<li><a href="${pageContext.request.contextPath}/mypage/myService/requireServiceList?page=${i}">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			
				<c:choose>
					<c:when test="${pageInfo.page>=pageInfo.maxPage }">
						<li class="next"><a href="#"><i class="fa-solid fa-chevron-right"></i></a></li>
					</c:when>
					<c:otherwise>
						<li class="next"><a href="${pageContext.request.contextPath}/mypage/myService/requireServiceList?page=${pageInfo.page+1}"><i class="fa-solid fa-chevron-right"></i></a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</body>
</html>