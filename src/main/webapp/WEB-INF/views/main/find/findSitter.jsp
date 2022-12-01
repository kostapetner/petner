<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script>
	$(document).ready(function() {
		
		$(document)
		    .on("click", ".see_info", function(){
		    	var infoStr = $(this).parents("li").find(".row4").text();
		      showModal(infoStr);
		    })
		    .on("click", ".modal_mask", function(){
		      deleteModal();
		    })  
		    .on("click", ".go_top", function(){
		    	$('html, body').animate({scrollTop:0}, '200');
		    }) 
		    
		
	})
	
	
	$(window).scroll(function(){  
		//var scrollValue = $(document).scrollTop(); 
		//console.log(scrollValue);
    if ($(this).scrollTop() > 400) {
      $('.go_top').fadeIn();
    }else {$('.go_top').fadeOut(); }
  });  
  
  
	
	
  function showModal(infoStr){
    $("body").prepend("<div class='modal_mask'></div>");
    $(".modal_mask").after("<div class='modal_box'></div>");
    $(".modal_box").append("<div class='content'>"+infoStr+"</div>");
  }

  function deleteModal(){
    $(".modal_box, .modal_mask"). remove();
    // $(".modal_mask"). remove();
  }
</script>

<style>
	.search_form{display:none;}
	.card_list_type{box-shadow:none}
	.heart:hover{color:var(--red)}
	.follow:hover{color:#6198db}
	.chat:hover{color:var(--orange)}
	.row4{
		display:none;
	  max-width: 520px;
    line-height: 20px;
    overflow: hidden;
  }
  label.fcCbox1{margin-right:0;}
  /* MODAL COMMON */
   .modal_mask{
    display: block;
    position: fixed;
    inset: 0px;
    background-color: rgba(0, 0, 0, 0.5);
    z-index:11
  }
  .modal_box{
    position:fixed;
    left:50%;
    top:50%;
    z-index: 14;
    transform: translate(-50%, -50%);
    background-color: #fff;
    border-radius: 5px;
    padding:20px;
    line-height:24px;
    min-width: 500px;
    max-width: 520px;
    min-height: 300px
   
  }
</style>

<!-- CONTAINER -->
<div class="container w90">
	<p class="list_title">펫시터 찾기</p>

	<!-- 검색창 -->
	<div class="search_form">
		<form action="#">
			<input type="text" class="keyword" placeholder="펫시터를 검색해요" /> <span
				class="search_submit"><i class="fa-solid fa-magnifying-glass"></i></span>
		</form>
	</div>
	<!-- 시터성별, 요일, 서비스, 동물종류 필터 피드-->
	<div class="filter_feed">
		<!-- 펫시터성별  -->
		<div class="f_row">
			<p class="filter_title">펫시터 성별</p>
			<div class="select_box">
				<label class="fcCbox1"><input type="checkbox" name="sex"><span>여성펫시터</span></label>
				<label class="fcCbox1"><input type="checkbox" name="sex"><span>남성펫시터</span></label>
			</div>
		</div>
		<!-- 서비스  -->
		<div class="f_row">
			<p class="filter_title">필요한 서비스</p>
			<div class="select_box">
				<label class="fcCbox1"><input type="checkbox" name="service" value="1"><span>방문</span>
				<label class="fcCbox1"><input type="checkbox" name="service" value="walk"><span>산책</span></label>
				<label class="fcCbox1"><input type="checkbox" name="service" value="shower"><span>목욕</span></label>
				<label class="fcCbox1"><input type="checkbox" name="service" value="education"><span>교육</span></label>
			</div>
		</div>
		<!-- 동물종류 -->
		<div class="f_row">
			<p class="filter_title">동물종류</p>
			<div class="select_box">
				<label class="fcCbox1"><input type="checkbox" name="pet_kind"	value="dog"><span>강아지</span></label> 
				<label class="fcCbox1"><input type="checkbox" name="pet_kind"	value="cat"><span>고양이</span></label> 
				<label class="fcCbox1"><input type="checkbox" name="pet_kind"	value="fish"><span>관상어</span></label> 
				<label class="fcCbox1"><input type="checkbox" name="pet_kind"	value="bird"><span>새</span></label> 
				<label class="fcCbox1"><input type="checkbox" name="pet_kind"	value="reptile"><span>파충류</span></label> 
			</div>
		</div>
		<!-- 요일 -->
		<div class="f_row">
			<p class="filter_title">가능한 요일</p>
			<div class="select_box">
				<label class="fcCbox1"><input type="checkbox" name="day" value="mon"><span>월</span></label>
				<label class="fcCbox1"><input type="checkbox" name="day" value="tue"><span>화</span></label> 
				<label class="fcCbox1"><input type="checkbox" name="day" value="wed"><span>수</span></label> 
				<label class="fcCbox1"><input type="checkbox" name="day" value="thu"><span>목</span></label> 
				<label class="fcCbox1"><input type="checkbox" name="day" value="fri"><span>금</span></label> 
				<label class="fcCbox1"><input type="checkbox" name="day" value="sat"><span>토</span></label> 
				<label class="fcCbox1"><input type="checkbox" name="day" value="sun"><span>일</span></label>  
			</div>
		</div>
		
	</div>

	<!-- 카드형 리스트 -->
	<div class="card_list_type">
		<ul>
			<c:forEach items="${dataList}" var="data">
				<li uno="${data.USER_NO}">
					<div class="data">
						<!-- 이미지영역 -->
						<div class="img_area">
							<img src="${pageContext.request.contextPath}/getImg/${data.FILE_NO}" alt="프로필이미지">
						</div>
						<!-- 텍스트정보 영역 -->
						<div class="text_area">
							<div class="row1">
								<p>
									<span class="nick">${data.NICKNAME}</span>
								</p>
							<!-- 	<p>
									<span class="badge">최강기요미</span>
								</p> -->
							</div>
							<div class="row2">
								<p>
									<a href="#">팔로워<span class="f_val">122</span></a>
								</p>
								<p>
									<a href="#">팔로잉<span class="f_val">122</span></a>
								</p>
							</div>
							<div class="row3">
								<span>${data.WORK_DAY}</span>
								<span class="see_info">펫시터자기소개</span>
							</div>
							<div class="row4">${data.SITTER_INFO}</div>
							
						</div>
					</div>
					<div class="icons">
						<a href="#" title="저장하기" class="transition02 heart"><i class="fa-solid fa-heart"></i></a> 
						<a href="#" title="팔로우하기" class="transition02 follow"><i class="fa-solid fa-user-plus"></i></a>
						<a href="#" title="펫시터에게 메시지 보내기" class="transition02 chat"><i class="fa-solid fa-comment-dots"></i></a>
					</div>
				</li>
		</c:forEach>
		</ul>
	</div>
	
</div>

<div class="go_top"><i class="fa-solid fa-arrow-up-long"></i></div>
