<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
$(document).ready(function(){
	//datepicker
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

	//이미지 미리보기
	$(function() {
		$('#file').change(function(event) {
			let reader = new FileReader();
			reader.onload = function(e) {
				$('#rep').attr('src', e.target.result);
			};
			reader.readAsDataURL(event.target.files[0]);	
		});
	});
 
	//체크박스 전체선택 활동가능 요일
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
	//--------------------펫 선택시 정보 불러오기-------------------------
	
	$(document).on("click", "a[id='petImg']", function () {
		//pet_no가져오기
	    var pet_no = $(this).closest('div').children('input').attr('value');
	    console.log("clicked pet_no: "+pet_no);
		
		// contentType: "application/json" 꼭 써주기
 		$.ajax({
			url : "${pageContext.servletContext.contextPath}/getPetInfo",
			type : "POST",
			dataType: "json",
			contentType: "application/json",
		    data: JSON.stringify({
		    	"pet_no":pet_no
		    }),
			success : function(petInfo) {
				alert("abcv");
				console.log("petInfo : "+ petInfo.pet_no)
			/* $(".blog-list").empty(); // 해결!
	            var str = '<ul>';
	            $.each(results , function(i){
	            	// URL 주소에 존재하는 HTML 코드에서 <div>요소를 읽은 후에 id가 "container"인 요소에 배치한다.
			        $("#container").load("/jblog/"+id+"/admin/category div");
	            	
	            	
	            	
	             str += '<li id="나왔다li">';
	                str += '<input type="hidden" name="postNo" value="'+results[i].postNo+'\">';
	                str += '<a id="postTitle">' + results[i].postTitle + '</a>';
	                str += '<span>'+ results[i].regDate +'</span>';
	                str += '</li>';
	                str += '</ul>'; 
	           });*/
	           //$(".blog-list").append(str);
			},
			error : function(xhr, error) { //xmlHttpRequest?
				console.error("error : " + error);
			}
		});
	});
	
	
	
	
	
	//----------------------------------------------
	//submit 
	$(".submit_btn").click(function(){
	  $("#petForm").submit();
	});
});
</script>
<div class="content">
	<h3 class="form_title fs24">펫케어 서비스 신청</h3>
	<form action="/petner/petForm/register" method="POST" id="petForm" class="mypage_form" enctype="multipart/form-data">

		<!-- 펫 선택 -->
		<div class="f_row">
			<p class="fc_title">펫을 선택해주세요</p>
			<div class="profile_upload_small">
				<c:forEach var="petInfo" items="${petInfo}">
					<div class="prof_img_small">
						<a href="#" id="petImg"><img id="rep" class="img_wrap img"></a>
						<label for="rep" class="pet_btn check_btn"> 
						<i class="fa-solid fa-check" id="pen"></i>
						</label>
						<input type="text" value="${petInfo.pet_no}"> 
					</div>
				</c:forEach>
			</div>
		</div>
		
		<div class="f_row">
			<!-- 카드형 리스트 -->
			<div class="card_list_type">
				<table>
					<tr>
						<td colspan="2" style="text-align: right;">
							<i class="fa-solid fa-pen-to-square"></i>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="img_area">
								<img src="https://img.wkorea.com/w/2022/10/style_634f9b4c8c907-500x354-1666161931.jpg" alt="이미지">
							</div>
						</td>
					</tr>
					<tr class="tr-left">
						<td class="pdr40">이름</td>
						<%-- <td class="td-inner">${petInfo.pet_name}</td> --%>
					</tr>
					<tr class="tr-left">
						<td class="pdr40">성별</td>
						<%-- <td class="td-inner">${petInfo.pet_gender}</td> --%>
					</tr>
					<tr class="tr-left">
						<td class="pdr40">종류</td>
						<%-- <td class="td-inner">${petInfo.pet_specie}</td> --%>
					</tr>
					<tr class="tr-left">
						<td class="pdr40">체중</td>
						<%-- <td class="td-inner">${petInfo.pet_weight}kg</td> --%>
					</tr>
					<tr class="tr-left" style="border-top:1px #777 dotted">
						<td class="pdr40">중성화</td>
						<%-- <td class="td-inner">${petInfo.pet_neutral}</td> --%>
					</tr>
				</table>
				<div style="padding: 20px 0px;">
					<p class="p-style">특이사항</p>
					<%-- <P class="p-style-content">${petInfo.pet_info}</P> --%>
				</div>
			</div>
		</div>
		
		<div class="f_row">
			<p class="tip">보호자가 펫시터에게 요청하고 싶은 사항을 입력해주세요</p>
		</div>
		
		<!-- 지역 -->
		<div class="f_row">
			<p class="fc_title">지역</p>
			<input type="text" name="zipcode" style="width:100px; min-width: auto;" value="${userInfo.zipcode}"/>
			<input type="text" name="addr" style="width:356px; min-width: auto;" placeholder="주소" value="${userInfo.addr}"/>
			<input type="text" name="addr_detail" style="width:100%; min-width: auto; margin-top: 10px;" placeholder="상세주소" value="${userInfo.addr_detail}"/>
		</div>
	
		<!-- 날짜 -->
	 	<div class="f_row">
	 		<p class="fc_title">가능한 날짜를 선택해주세요</p>
            <input type="text" class="date-picker" id="date_start">&nbsp;~&nbsp;
            <input type="text" class="date-picker" id="date_end">
        </div>
	
		<!-- 서비스 -->
		<div class="f_row">
			<p class="fc_title">요청하실 서비스를 선택해 주세요</p>
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
		
		<!-- 요쳥사항 -->
		<div class="f_row">
			<p class="fc_title">요청하실 사항을 자세히 입력해주세요</p>
			<p class="tip">예) 노견이라 산책을 짧게해주세요, 다른 강아지를 좋아하지 않아요</p>
			<textarea class="fcc_textarea" name="pet_info"></textarea>
		</div>
		
		<span class="pet_btn submit_btn transition02">서비스 신청하기</span>
	</form>
</div>