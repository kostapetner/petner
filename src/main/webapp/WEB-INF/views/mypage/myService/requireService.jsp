<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="content">
	<h3 class="form_title fs24">펫케어 서비스 신청</h3>
	<form action="/petner/petForm/register" method="POST" id="petForm" class="mypage_form" enctype="multipart/form-data">

		<!-- 펫 선택 -->
		<div class="f_row">
			<p class="fc_title">펫을 선택해주세요</p>
			<div class="profile_upload_small">
				<div class="prof_img_small">
					<img id="rep" class="img_wrap img"> <br> 
					<label for="rep" class="pet_btn check_btn"> 
					<i class="fa-solid fa-check" id="pen"></i>
					</label>
				</div>
				<div class="prof_img_small">
					<img id="rep" class="img_wrap img"> <br> 
					<label for="rep" class="pet_btn check_btn"> 
					<i class="fa-solid fa-check" id="pen"></i>
					</label>
				</div>
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
						<td class="td-inner">체다(고양이)</td>
					</tr>
					<tr class="tr-left">
						<td class="pdr40">성별</td>
						<td class="td-inner">암</td>
					</tr>
					<tr class="tr-left">
						<td class="pdr40">종류</td>
						<td class="td-inner">샴</td>
					</tr>
					<tr class="tr-left">
						<td class="pdr40">체중</td>
						<td class="td-inner">3kg</td>
					</tr>
					<tr class="tr-left" style="border-top:1px #777 dotted">
						<td class="pdr40">중성화</td>
						<td class="td-inner">x</td>
					</tr>
				</table>
				<div style="padding: 20px 0px;">
					<p class="p-style">특이사항</p>
					<P class="p-style-content">으아아아ㅏ앙 졸라귀여우어아아아아아ㅏ아</P>
				</div>
			</div>
		</div>
		
		<div class="f_row">
			<p class="tip">보호자가 펫시터에게 요청하고 싶은 사항을 입력해주세요</p>
		</div>
		
		<!-- 지역 -->
		<div class="f_row">
			<p class="fc_title">지역</p>
			<input type="text" name="zipcode" width="20%"/>
			<input type="text" name="addr" width="80%"/>
			<input type="text" name="addr_detail" width="10%"/>
		</div>
	
		<!-- 종류 -->
		<div class="f_row">
			<p class="fc_title">반려동물의 품종을 알려주세요</p>
			<P class="tip">반려동물의 특징을 잘아는 펫시터분을 찾을수 있어요</P>
			<input type="text" name="pet_specie" placeholder="치와와 / 샴 / 코숏" />
		</div>
	
		<!-- 이름 -->
		<div class="f_row">
			<p class="fc_title">반려동물의 이름을 입력해주세요</p>
			<input type="text" name="pet_name" />
		</div>
		<!-- 나이 -->
		<div class="f_row">
			<p class="fc_title">반려동물의 나이를 알려주세요</p>
			<input type="number" name="pet_age" />
		</div>
		<!-- 체중 -->
		<div class="f_row weight">
			<p class="fc_title">반려동물의 체중을 알려주세요</p>
			<input type="number" name="pet_weight" class="mr12" style="min-width: auto; width: 228.65px;" /> 
			<span>Kg</span>
		</div>
	
		<!-- 성별 -->
		<div class="f_row">
			<p class="fc_title">반려동물의 성별을 알려주세요</p>
			<label class="fcRadio1 mr12"><input type="radio"
				name="pet_gender" value="w"><span>암컷</span></label> <label
				class="fcRadio1 mr12"><input type="radio" name="pet_gender"
				value="m"><span>수컷</span></label>
		</div>
	
		<!-- 중성화 -->
		<div class="f_row">
			<p class="fc_title">중성화 여부를 알려주세요</p>
			<label class="fcRadio1 mr12"><input type="radio"
				name="pet_neutral" value="y"><span>O</span></label> <label
				class="fcRadio1 mr12"><input type="radio" name="pet_neutral"
				value="n"><span>X</span></label>
		</div>
	
		<div class="f_row">
			<p class="fc_title">펫시터가 알아야할 정보를 알려주세요</p>
			<p class="tip">예) 노견이라 산책을 짧게해주세요, 다른 강아지를 좋아하지 않아요</p>
			<textarea class="fcc_textarea" name="pet_info"></textarea>
		</div>
	
		<span class="pet_btn submit_btn transition02">나의 반려동물 정보 등록하기</span>
	</form>
</div>
<script>
$(document).ready(function(){
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
 
	//submit 
	$(".submit_btn").click(function(){
	  $("#petForm").submit();
	})
});
</script>