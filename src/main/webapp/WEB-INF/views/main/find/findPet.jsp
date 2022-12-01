<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<c:import url='/WEB-INF/views/include/common_head.jsp' />
<title>${title}</title>
</head>
<script>
$(document).ready(function() {
	
	//air-datepicker
	var date = new Date();
	var dp = $('#date_start').datepicker( {
			//년-월-일
			startDate : new Date(date.getFullYear(), date.getMonth(), date.getDate()),
			language : 'ko',
			autoClose : true,
			//선택한 날짜를 가져옴
			onSelect : function(date) {
				var endNum = date;
				//종료일 datepicker에 최소날짜를 방금 클릭한 날짜로 설정
				$('#date_end').datepicker({
					minDate : new Date(endNum),
				});
				searchAjax();
			}
	}).data('datepicker');
	var dp2 = $('#date_end').datepicker({	
				startDate : new Date(date.getFullYear(), date .getMonth(), date.getDate()), // 시간, 분은 00으로 초기 설정
				language : 'ko',
				autoClose : true,
				//선택한 날짜를 가져옴
				onSelect : function(date) {
					var startNum = date;
					$('#date_start').datepicker({
						//시작일 datepicker에 최대날짜를 방금 클릭한 날짜로 설정
						maxDate : new Date(startNum),
					});
					searchAjax();
				}
	}).data('datepicker');
	
	var serviceArr = [];
	var petKindArr = []; 
	var genderArr = [];
	//서비스
	$(document).on("click", "input[name=service]", function () {
		serviceArr = [];
	    $("input[name='service']:checked").each(function(e){
	        var value = $(this).val();
	        serviceArr.push(value);        
		})
		//console.log("serviceArr:  "+serviceArr);
	    searchAjax();
	});
	//동물종류
	$(document).on("click", "input[name=pet_kind]", function () {
		petKindArr = [];
	    $("input[name='pet_kind']:checked").each(function(e){
	        var value = $(this).val();
	        petKindArr.push(value);        
		})
		//console.log("petKindArr:  "+petKindArr);
	    searchAjax();
	});
	//보호자 성별
	$(document).on("click", "input[name=gender]", function () {
		genderArr = [];
	    $("input[name='gender']:checked").each(function(e){
	        var value = $(this).val();
	        genderArr.push(value);        
		})
		//console.log("genderArr:  "+genderArr);
	    searchAjax();
	});
	
	function searchAjax(){
		//날짜, 서비스, 동물종류, 보호자성별, 위치, 펫이름 검색
		var st_date = $('#date_start').val();
		var end_date = $('#date_end').val();
		var service = serviceArr;
		var pet_kind = petKindArr;
		var gender = genderArr;
		
		/* console.log("st_date : "+st_date);
		console.log("end_date : "+end_date);
		console.log("service : "+service);
		console.log("pet_kind : "+pet_kind);
		console.log("gender : "+gender);
		*/
		
		// contentType: "application/json" 꼭 써주기
 		$.ajax({
			url : "${pageContext.servletContext.contextPath}/findPet/viewForm/findPetSearch",
			type : "POST",
			dataType: "json",
			contentType: "application/json",
			data:JSON.stringify({
					 "st_date":st_date
			    	,"end_date":end_date
			    	,"service":service
			    	,"pet_kind":pet_kind
			    	,"gender":gender
			  }),
			success : function(data) {
				var str = '';
				$.each(data, function(i, item) { // 데이터 =item
					str +='<ul class="flex_between" id="ulId">';
					str +='<li>';
					<!-- 글 간략정보 -->
					str +='<div class="info">';
					str +='<div class="flex_agn_center">';
					str +='<div class="owner_img">';
					str +='<img src="" alt="프로필">';
					str +='</div>';
					str +='<span id="nickname">'+item.NICKNAME+'</span>';
					str +='</div>';
					var status = $.trim(item.STATUS);
					if(status == '매칭중'){
						str +='<span class="status open" style="background-color: yellowgreen;">'+item.STATUS+'</span>';
					}else if(status == '매칭완료'){
						str +='<span class="status open" style="background-color: #c7c2c2;">'+item.STATUS+'</span>';
					}
					str +='</div>';
					<!-- 동물사진 -->
					str +='<div class="img_area" style="width: 357px; height: 200px">';
					str +='<a href="${pageContext.request.contextPath}/findPet/viewForm/'+item.SERVICE_NO+'?page=${pageInfo.page}">';
					if(item.FILE_NO == null){
						str +='<img src="/petner/resources/images/header_logo.png" alt="이미지">';  
					}else{
						str +='<img src="${pageContext.request.contextPath}/findPet/'+item.FILE_NO+'" id="rep" class="img_wrap img">';		
					}
					str +='</a>';	
					str +='</div>';
					<!-- 시팅요청사항디테일 -->
					str +='<div class="text_area">';
					str +='<div class="title ellipsis">'+item.REQUEST_TITLE+'</div>';
					str +='<div class="content ellipsis">'+item.REQUEST_DETAIL+'</div>';
					str +='<div class="view_info">';
					str +='<span class="date">'+item.ST_DATE+'&nbsp;~&nbsp;'+item.END_DATE+'</span>';
					str +='<p>';
					str +='<span class="mr12"> <i class="fa-solid fa-comment-dots"></i>20</span>';
					str +='<span><i class="fa-regular fa-eye"></i>13</span>';
					str +='</p>';
					str +='</div>';
					str +='</div>';
					str+='</li>';
					str+='</ul>';
				});
				$("#card_list").empty();
				$("#card_list").append(str);
				
			},
			error : function(xhr, error) {
				console.error("error : " + error);
			}
		});//ajax();
	}//searchAjax();
	
	searchAjax();
	
});//ready
</script>
<body>
	<div id="wrapper">
		<!-- CONTAINER -->
		<div class="container w90">
		<form id="findPetSearchForm" action="/petner/findPet/viewForm/findPetSearch" method="POST">
			<div class="">
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
								<input type="checkbox" name="pet_kind" value="고양이"> 
								<span>고양이</span>
							</label> 
							<label class="fcCbox1">
								<input type="checkbox" name="pet_kind" value="관상어"> 
								<span>관상어</span>
							</label> 
							<label class="fcCbox1"> 
								<input type="checkbox" name="pet_kind" value="새"> 
								<span>새</span>
							</label> 
							<label class="fcCbox1"> 
								<input type="checkbox" name="pet_kind" value="파충류"> 
								<span>파충류</span>
							</label>
							<label class="fcCbox1"> 
								<input type="checkbox" name="pet_kind" value="기타"> 
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
								<input type="checkbox" name="gender" value="남"> 
								<span>남성</span>
							</label>
						</div>
					</div>
					<div class="f_row">
						<div>
							<p class="filter_title">현재 위치</p>
							<p class="filter_title">**동</p>
							<input type="button" value="내주변찾기">
						</div>
					</div>
				</div>
			</div>
		</form>
			<!-- 카드형 리스트 펫찾기 -->
			<div class="card_list_type find_pet_list" id="card_list">
				<span id="nickname">item.NICKNAME</span>';
			</div>
		</div>
	</div>
</body>
</html>