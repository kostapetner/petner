<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="imgPath" value="${pageContext.request.contextPath}/resources/images"/>

<script>
$(document).ready(function(){
	//자기소개
	let str = '${data.pet_info}';
	$("textarea[name=pet_info").text(str);
	//제출
	$(".submit_btn").click(function(){
		$(".edit_form").submit();
	})
	// 이미지미리보기
	$('#file').change(function(event) {
		let reader = new FileReader();
		reader.onload = function(e) {
			$('#rep2').attr('src', e.target.result);
		};
		reader.readAsDataURL(event.target.files[0]);	
	});
})
		
</script>

<style>
form{max-width:480px;}
.profile_upload{
    width: 500px;
    display: flex;
    align-items: center;
    justify-content: center;
 }
 .profile_upload .prof_img{margin:0;}
</style>
<div class="content">
  <p class="menu_title">반려동물 정보 수정</p>
  <form action="${pageContext.request.contextPath}/mypage/myPetInfoEdit" method="POST" class="data edit_form">
		<input type="hidden" value="" name=""/>
		<!-- 동물사진 -->
		<div class="f_row profile_upload">
			<div class="profile_upload">
				<div class="prof_img">
					<img id="rep2" class="img_wrap img" src="${pageContext.request.contextPath}/getImg/${data.file_no}"/> <br>
					<label for="file" class="pet_btn edit_btn">
						<i class="fa-solid fa-pen" id="pen"></i>
					</label>
					<input type="file" id="file" name="imageFile" hidden="hidden"></input>
				</div>
			</div>
		</div>
		<!-- 정보 -->
		<div>
      <span class="key">반려동물이름</span>
      <span class="value"><input type="text" value="${data.pet_name}" disabled></span>
    </div>
    <div>
      <span class="key">반려동물성별</span>
      <span class="value"><input type="text" value="${data.pet_gender}" name="nickname"></span>
    </div>
    <div>
      <span class="key">중성화여부</span>
      <span class="value"><input type="text" value="${data.pet_name}" name="email"></span>
    </div>
    <div class="f_row">
			<p class="fc_title">특이사항</p>
			<textarea name="pet_info" id="" class="fcc_textarea"></textarea>
		</div>
    
    <div class="btn_area">
    	<span class="pet_btn del_btn btn_auto transition02">반려동물정보 삭제</span>
    	<span class="pet_btn submit_btn btn_auto transition02">반려동물정보 수정</span>
    </div>
    
	</form>
</div>
