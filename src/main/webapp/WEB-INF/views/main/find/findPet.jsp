<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="imgPath" value="${pageContext.request.contextPath}/resources/images" />
<!DOCTYPE html>
<html>
<head>
<c:import url='/WEB-INF/views/include/common_head.jsp' />
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e2d6fc6008c147d8c5d81603f2166c5d&libraries=services"></script>
<title>${title}</title>
<style>
    .map_wrap {position:relative;width:100%;height:350px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
</style>
</head>
<script>
$(document).ready(function() {
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
			    	,"zipcode":zipcode
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
					str +='<img src="${imgPath}/noimg.webp" alt="노프로필"/>';
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
			                    console.log(result[0].road_address.zone_no);
			                    $("#zipcodeP").text("["+result[0].road_address.zone_no+"]");
			                    $("#zipcode").val(result[0].road_address.zone_no);
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
	})
	
	//ajax검색 실행
	searchAjax();
	
});//ready
</script>
<body>
	<div id="wrapper">
		<!-- CONTAINER -->
		<div class="container w90">
			<form id="findPetSearchForm" action="/petner/findPet/viewForm/findPetSearch" method="POST">
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
							<c:if test="${empty authUser}">
								<input type="button" value="내주변찾기">
							</c:if>
							<c:if test="${not empty authUser}">
								<p class="filter_title">현재 위치</p>
								<p class="filter_title" id="zipcodeP">[${userInfo.zipcode }]</p>
								<input type="hidden" value="${userInfo.zipcode }" id="zipcode">
								<p class="filter_title" id="addrP">${userInfo.addr }</p>
								<input type="button" value="내주변찾기" class="filter_title" id="findAreaBtn">
							</c:if>
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
		</form>
		<!-- 카드형 리스트 펫찾기 -->
		<div class="card_list_type find_pet_list" id="card_list"></div>
	</div>
	</div>
</body>
</html>