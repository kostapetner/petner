<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e2d6fc6008c147d8c5d81603f2166c5d&libraries=services"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/064a55beb6.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="/resources/css/form_component.css">
<link rel="stylesheet" href="/resources/css/mypage_form.css">
<title>시터정보입력</title>
 <style>
    .map_wrap {position:relative;width:100%;height:350px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
</style>
</head>

<body>
	<div id="wrapper">
		<div class="login_form w50">
			<h3 class="form_title fs24">펫시터 정보 등록</h3>

			<form action="/sitterForm/register" method="POST" id="sitterForm" class="mypage_form" enctype="multipart/form-data">
				<div class="tip tip1 mb25">펫시터 활동을 위한 추가 정보 등록이 필요해요</div>
				<!-- 사진등록 -->
				<div class="f_row profile_upload">
					<p class="fc_title">프로필 사진을 올려주세요</p>
					<p class="tip">프로필 사진이 있으면 보호자에게 연락올 확률이 높아져요</p>

					<div class="profile_upload">
						<div class="prof_img">
							<!-- <p class="img">
								<img src="#" alt="사진이없을경우 이미지" name="imageFile">
							</p> -->
							<img id="rep" class="img_wrap img"/> <br>
							<label for="file" class="pet_btn edit_btn">
								<i class="fa-solid fa-pen" id="pen"></i>
							</label>
							<input type="file" id="file" name="imageFile" hidden="hidden"></input>
						</div>
					</div>
				</div>

				<!-- 동물체크 -->
				<div class="f_row">
					<p class="fc_title">케어가능한 반려동물의 종류를 선택해주세요</p>
					<label class="fcCbox2 mr12"> 
						<input type="checkbox" name="pet_kind" value="dog">
						<span>강아지</span>
					</label> 
					<label class="fcCbox2 mr12"> 
						<input type="checkbox" name="pet_kind" value="cat">
						<span>고양이</span>
					</label> 
					<label class="fcCbox2 mr12"> 
						<input type="checkbox" name="pet_kind" value="fish">
						<span>관상어</span>
					</label> 
					<label class="fcCbox2 mr12"> 
						<input type="checkbox" name="pet_kind" value="bird">
						<span>새</span>
					</label> 
					<label class="fcCbox2"> 
						<input type="checkbox" name="pet_kind" value="reptile">
						<span>파충류</span>
					</label>
					<p class="fc_title">종을 입력해주세요</p>
					<input type="text" name="pet_specie">
				</div>

				<!-- 가능한 요일 -->
				<div class="f_row days">
					<p class="fc_title">펫시터 활동이 가능한 요일을 알려주세요</p>
					<p class="pb12 select_all">
						<label class="fcCbox1"><input type="checkbox" id="day_chkAll"><span>전체선택</span></label>
					</p>
					<label class="fcCbox2 mr12">
						<input type="checkbox" name="work_day" value="mon"><span>월</span>
					</label>
					<label class="fcCbox2 mr12">
						<input type="checkbox" name="work_day" value="tue"><span>화</span>
					</label> 
					<label class="fcCbox2 mr12">
						<input type="checkbox" name="work_day" value="wed"><span>수</span>
					</label> 
					<label class="fcCbox2 mr12">
						<input type="checkbox" name="work_day" value="thu"><span>목</span>
						</label> 
					<label class="fcCbox2 mr12">
						<input type="checkbox" name="work_day" value="fri"><span>금</span>
					</label> 
					<label class="fcCbox2 mr12">
						<input type="checkbox" name="work_day" value="sat"><span>토</span>
					</label> 
					<label class="fcCbox2">
						<input type="checkbox" name="work_day" value="sun"><span>일</span>
					</label>
				</div>

				<!-- 제공가능서비스 -->
				<div class="f_row">
					<p class="fc_title">제공가능한 서비스를 알려주세요</p>
					<p class="pb12 select_all">
						<label class="fcCbox1"><input type="checkbox" id="service_chkAll"><span>전체선택</span></label>
					</p>
					<label class="fcCbox2 mr12">
						<input type="checkbox" name="service" value="visit"><span>방문관리</span>
					</label> 
					<label class="fcCbox2 mr12">
						<input type="checkbox" name="service" value="walk"><span>산책</span>
					</label>
					<label class="fcCbox2 mr12">
						<input type="checkbox" name="service" value="shower"><span>목욕</span>
					</label>
					<label class="fcCbox2">
						<input type="checkbox" name="service" value="education"><span>교육</span>
					</label>
				</div>

				<div class="f_row">
					<p class="fc_title">활동가능한 지역을 알려주세요</p>
					<select class="fcc_select" name="" id="">
						<option value="">셀렉트옵션</option>
						<option value="">셀렉트옵션</option>
						<option value="">셀렉트옵션</option>
					</select>
				</div>

				<div class="f_row">
					<p class="fc_title">자기소개를 간단하게 해주세요. 펫시터 경험을 써주셔도 좋아요</p>
					<textarea name="info" id="" class="fcc_textarea"></textarea>
				</div>

				<span class="pet_btn submit_btn transition02">펫시터정보등록하기</span>
			</form>
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
</body>
<script>
var sel_file = [];
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
	        var message = '<div style="padding:5px;">현위치</div>'; // 인포윈도우에 표시될 내용입니다
	       
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
	                }
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
}
//------------- 마커 생성 끝 ------------------

$(document).ready(function() {
	//지도 불러오기
	curLocation();
	
	//이미지 미리보기
	$(function() {
		$('#file').change(function(event) {
			let reader = new FileReader();
			reader.onload = function(e) {
				$('#rep').attr('src', e.target.result);
			};
			reader.readAsDataURL(event.target.files[0]);	
		});
	})
	
	//------------- 체크박스 전체선택 시작 ---------------
	//활동가능 요일
	$("#day_chkAll").click(function() {
		if($("#day_chkAll").is(":checked")) {
			$("input[name=work_day]").prop("checked", true);
		}else{
			$("input[name=work_day]").prop("checked", false);
		}
	});
	
	$("input[name=work_day]").click(function() {
		var total = $("input[name=work_day]").length;
		var checked = $("input[name=work_day]:checked").length;
		
		if(total != checked){
			$("#day_chkAll").prop("checked", false);
		}else $("#day_chkAll").prop("checked", true); 
	});
	
	//제공가능서비스
	$("#service_chkAll").click(function() {
		if($("#service_chkAll").is(":checked")) {
			$("input[name=service]").prop("checked", true);
		}else{
			$("input[name=service]").prop("checked", false);
		}
	});
	
	$("input[name=service]").click(function() {
		var total = $("input[name=service]").length;
		var checked = $("input[name=service]:checked").length;
		
		if(total != checked){
			$("#service_chkAll").prop("checked", false);
		}else $("#service_chkAll").prop("checked", true); 
	});
	//------------- 체크박스 전체선택 끝 ----------------
	$(".submit_btn").click(function() {
		$("#sitterForm").submit();
	})
})
</script>