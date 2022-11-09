<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="content">
<h3 class="form_title fs24">나의 반려동물 정보</h3>
<form action="/petner/petForm/register" method="POST" id="petForm" class="mypage_form" enctype="multipart/form-data">
	<div class="tip tip1 mb25">
		펫시터를 구하기 위해 보호자님의<br>소중한 반려동물의 정보가 필요해요.<br /> 딱맞는 펫시터를 찾아드릴게요
	</div>
	<!-- 사진등록 -->
	<div class="f_row profile_upload">
		<p class="fc_title">프로필 사진을 올려주세요</p>
		<p class="tip">프로필 사진이 있으면 펫시터에게 연락올 확률이 높아져요</p>
		<div class="profile_upload">
			<div class="prof_img">
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
		<p class="fc_title">반려동물의 종류를 알려주세요</p>
		<label class="fcRadio1 mr12"> 
			<input type="radio" name="pet_kind" value="dog">
			<span>강아지</span>
		</label>
		<label class="fcRadio1 mr12"> 
			<input type="radio" name="pet_kind" value="cat">
			<span>고양이</span>
		</label> 
		<label class="fcRadio1 mr12"> 
			<input type="radio" name="pet_kind" value="fish">
			<span>관상어</span>
		</label> 
		<label class="fcRadio1 mr12"> 
			<input type="radio" name="pet_kind" value="bird">
			<span>새</span>
		</label> 
		<label class="fcRadio1"> 
			<input type="radio" name="pet_kind" value="reptile">
			<span>파충류</span>
		</label>
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
		<input type="text" name="pet_name"/>
	</div>
	<!-- 나이 -->
	<div class="f_row">
		<p class="fc_title">반려동물의 나이를 알려주세요</p>
		<input type="number" name="pet_age"/>
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
		<label class="fcRadio1 mr12"><input type="radio" name="pet_sex" value="w"><span>암컷</span></label>
		<label class="fcRadio1 mr12"><input type="radio" name="pet_sex" value="m"><span>수컷</span></label>
	</div>

	<!-- 중성화 -->
	<div class="f_row">
		<p class="fc_title">중성화 여부를 알려주세요</p>
		<label class="fcRadio1 mr12"><input type="radio" name="pet_neutral" value="y"><span>O</span></label>
		<label class="fcRadio1 mr12"><input type="radio" name="pet_neutral" value="n"><span>X</span></label>
	</div>

	<div class="f_row">
		<p class="fc_title">펫시터가 알아야할 정보를 알려주세요</p>
		<p class="tip">예) 노견이라 산책을 짧게해주세요, 다른 강아지를 좋아하지 않아요</p>
		<textarea class="fcc_textarea" name="info"></textarea>
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