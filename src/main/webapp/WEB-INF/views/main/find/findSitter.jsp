<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e2d6fc6008c147d8c5d81603f2166c5d&libraries=services"></script>
<script>
	$(document).ready(function() {
		
		var serviceArr = [];
		var petKindArr = []; 
		var genderArr = [];
		var dayArr = [];
		//펫시터 성별
		$(document).on("click", "input[name=gender]", function () {
			genderArr = [];
		    $("input[name='gender']:checked").each(function(e){
		        var value = $(this).val();
		        genderArr.push(value);        
			})
			console.log("genderArr:  "+genderArr);
		    searchAjax();
		});
		//필요한 서비스
		$(document).on("click", "input[name=service]", function () {
			serviceArr = [];
		    $("input[name='service']:checked").each(function(e){
		        var value = $(this).val();
		        serviceArr.push(value);        
			})
			console.log("serviceArr:  "+serviceArr);
		    searchAjax();
		});
		//동물 종류
		$(document).on("click", "input[name=pet_kind]", function () {
			petKindArr = [];
		    $("input[name='pet_kind']:checked").each(function(e){
		        var value = $(this).val();
		        petKindArr.push(value);        
			})
			console.log("petKindArr:  "+petKindArr);
		    searchAjax();
		});
		//가능한 요일
		$(document).on("click", "input[name=day]", function () {
			dayArr = [];
		    $("input[name='day']:checked").each(function(e){
		        var value = $(this).val();
		        dayArr.push(value);        
			})
			console.log("dayArr:  "+dayArr);
		    searchAjax();
		});
		
		function searchAjax(){
			// 성별, 서비스, 동물종류, 요일
			var gender = genderArr;
			var service = serviceArr;
			var pet_kind = petKindArr;
			var day = dayArr;
			var zipcode = $("#zipcode").val();
			
			/*console.log("st_date : "+st_date);
			console.log("end_date : "+end_date);
			console.log("service : "+service);
			console.log("pet_kind : "+pet_kind);
			console.log("gender : "+gender);
			console.log(zipcode);
			*/
			
			// contentType: "application/json" 꼭 써주기
	 		$.ajax({
				url : "${pageContext.servletContext.contextPath}/findSitter/findSitterSearch",
				type : "POST",
				dataType: "json",
				contentType: "application/json",
				data:JSON.stringify({
				    	 "gender":gender
				    	,"service":service
				    	,"pet_kind":pet_kind
				    	,"day":day
				    	,"zipcode":zipcode
				  }),
				success : function(data) {
					console.log(data);
					var str = '';
					$.each(data, function(i, item) { // 데이터 =item
						str +='<ul>';
						str +='<li>';
						str +='<div class="data">';
						<!-- 이미지영역 -->
						str +='<div class="img_area">';
						str +='<img src="${pageContext.request.contextPath}/getImg/'+ item.FILE_NO +'" alt="프로필이미지">';
						str +='</div>';
						<!-- 텍스트정보 영역 -->
						str +='<div class="text_area">';
						str +='<div class="row1">';
						str +='<p><span class="nick">'+ item.NICKNAME +'</span></p>';
						str +='</div>';
						str +='<div class="row2">';
						str +='<p><a href="#">팔로워<span class="f_val">122</span></a></p>';
						str +='<p><a href="#">팔로잉<span class="f_val">122</span></a></p>';
						str +='</div>';
						str +='<div class="row3">';	
						str +='<span>'+item.WORK_DAY+'</span>';
						str +='<span class="see_info">펫시터자기소개</span>';
						str +='</div>';
						str +='<div class="row4">'+item.SITTER_INFO+'</div>';
						str +='</div>';
						str +='</div>';
						str +='<div class="icons">';
						str +='<a href="#" title="저장하기" class="transition02 heart"><i class="fa-solid fa-heart"></i></a>';
						str +='<a href="#" title="팔로우하기" class="transition02 follow"><i class="fa-solid fa-user-plus"></i></a>';
						str +='<a href="#" title="펫시터에게 메시지 보내기" class="transition02 chat"><i class="fa-solid fa-comment-dots"></i></a>';
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
		
		$("#mapDiv").hide();
		//내주변찾기 버튼
		$("#findAreaBtn").click(function(){
			//---------------------지도--------------------------------
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = { 
			    center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			    level: 5 // 지도의 확대 레벨 
			}; 

			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			//------------- 지도 띄우기 시작 ------------------
			function curLocation(){
				/////////////////지도의 중심을 현재 위치로 변경///////////////////////
				// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
				if (navigator.geolocation) {
				    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
				    navigator.geolocation.getCurrentPosition(function(position) {
				        var lat = position.coords.latitude, // 위도
				            lon = position.coords.longitude; // 경도
				        var locPosition = new kakao.maps.LatLng(lat, lon) // geolocation으로 얻어온 좌표
				        var message = '<div style="padding:5px;">현위치(오차발생가능)</div>'; // 인포윈도우에 표시될 내용입니다
				       
				        //map.setCenter(locPosition);   
				        displayMarker(locPosition, message);// 마커와 인포윈도우를 표시합니다
				        var lng = lon;
				        //좌표 > 도로명주소
				        getAddr(lat,lng);
				        function getAddr(lat,lng){
				            let geocoder = new kakao.maps.services.Geocoder();

				            let coord = new kakao.maps.LatLng(lat, lng);
				            let callback = function(result, status) {
				                if (status === kakao.maps.services.Status.OK) {
				                    console.log(result[0].address.address_name);
				                    console.log(result[0].address.region_1depth_name);
				                    console.log(result[0].address.region_2depth_name);
				                    console.log(result[0].address.region_3depth_name);
				                    if(!result[0].road_address.zone_no){
				                    	alert("현재 위치의 정보를 불러올 수 없습니다.");
				                    }else{
				                    	console.log(result[0].road_address.zone_no);
				                    	 $("#zipcodeP").text("["+result[0].road_address.zone_no+"]");
						                 $("#zipcode").val(result[0].road_address.zone_no);
				                    }
				                    $("#addrP").text(result[0].address.address_name);
				                }
				               searchAjax();
				            }
				            geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
				        }
				      });
				    
				} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

					var locPosition = new kakao.maps.LatLng(37.4812845080678, 126.952713197762),
						message = '현재 위치를 알 수 없어 기본 위치로 이동합니다.'

					currentLatLon['lat'] = 33.450701
					currentLatLon['lon'] = 126.570667

					displayMarker(locPosition, message);
				}
				
				return true;
			}
			//------------- 지도 띄우기 끝 ------------------
			//------------- 마커 생성 시작 ------------------
			function displayMarker(locPosition, message) {
				var imageSize = new kakao.maps.Size(24, 35);
				var imageSrc ="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
				var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
					map: map, 
					position: locPosition, 
					image : markerImage
				});

				var iwContent = message, // 인포윈도우에 표시할 내용
					iwRemoveable = true;

				// 인포윈도우를 생성합니다
				var infowindow = new kakao.maps.InfoWindow({
					content : iwContent,
					removable : iwRemoveable
				});

				// 인포윈도우를 마커위에 표시합니다
				infowindow.open(map, marker);

				// 지도 중심좌표를 접속위치로 변경합니다
				map.setCenter(locPosition);
			}//마커 생성 끝
			
			//지도 불러오기
			setTimeout(function(){ map.relayout(); }, 0);
			$("#mapDiv").show();
			curLocation();
		});
		
		//ajax검색 실행
		var authUser = $("#authUser").val();
		if(!authUser){
			$("#findAreaBtn").trigger("click");
		}else{
			searchAjax();
		}
//----------------------------------------------------------------------------------------------------
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
  .map_wrap {position:relative;width:100%;height:350px;}
  .title {font-weight:bold;display:block;}
  .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
  #centerAddr {display:block;margin-top:2px;font-weight: normal;}
  .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
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
				<label class="fcCbox1"><input type="checkbox" name="gender" value="women"><span>여성펫시터</span></label>
				<label class="fcCbox1"><input type="checkbox" name="gender" value="male"><span>남성펫시터</span></label>
			</div>
		</div>
		<!-- 서비스  -->
		<div class="f_row">
			<p class="filter_title">필요한 서비스</p>
			<div class="select_box">
				<label class="fcCbox1"><input type="checkbox" name="service" value="visit"><span>방문</span>
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
		<!-- 위치 -->
		<div class="f_row">
			<div>
				<input type="hidden" value="${authUser.user_no}" id="authUser">
				<p class="filter_title">현재 위치</p>
				<p class="filter_title" id="zipcodeP">[${userInfo.zipcode }]</p>
				<input type="hidden" value="${userInfo.zipcode }" id="zipcode">
				<p class="filter_title" id="addrP">${userInfo.addr }</p>
				<input type="button" value="내주변찾기" class="filter_title" id="findAreaBtn">
				<div class="content" id="mapDiv">
					<h3 class="form_title fs24">지도</h3>
					<div class="map_wrap">
					    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
					     <div class="hAddr">
					        <span class="title">지도중심기준 행정동 주소정보</span>
					        <span id="centerAddr"></span>
					    </div>
					</div>
					<br>
				</div>
			</div>
		</div>
	</div>

	<!-- 카드형 리스트 -->
	<div class="card_list_type" id="card_list">
		<%-- <ul>
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
		</ul> --%>
	</div>
	
</div>

<div class="go_top"><i class="fa-solid fa-arrow-up-long"></i></div>
