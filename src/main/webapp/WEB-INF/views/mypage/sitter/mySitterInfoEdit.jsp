<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="imgPath" value="${pageContext.request.contextPath}/resources/images"/>
<style>
	form.edit_form{}
	.edit_form > div{    
		display: flex;
    align-items: center;
    margin-bottom: 20px;}
</style>

<div class="content">
  <p class="menu_title">이거 sitterform 가져와서 해야됨</p>
  <form action="${pageContext.request.contextPath}/mypage/mySitterInfoEdit" method="POST" class="data edit_form">
		<input type="hidden" value="${member.id}" name="id"/>
		<div>
      <span class="key">돌봄가능동물</span>
      <span class="value"><input type="text" value="${data.pet_kind}"></span>
    </div>
    
    </div>
    <span class="pet_btn submit_btn btn_auto transition02">기본 정보 수정</span>
	</form>
</div>
<script>
	$(document).ready(function(){
		
		$(".submit_btn").click(function(){
			$(".edit_form").submit();
		})
	})
</script>