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
  <p class="menu_title">나의정보수정</p>
  <form action="${pageContext.request.contextPath}/mypage/myinfoEdit" method="POST" class="data edit_form">
		<input type="hidden" value="${member.id}" name="id"/>
		<div>
      <span class="key">이름</span>
      <span class="value"><input type="text" value="${member.name}" disabled></span>
    </div>
    <div>
      <span class="key">별명</span>
      <span class="value"><input type="text" value="${member.nickname}" name="nickname"></span>
    </div>
    <div>
      <span class="key">이메일</span>
      <span class="value"><input type="text" value="${member.email}" name="email"></span>
    </div>
    <div>
      <span class="key flex_start">주소</span>
      <div class="value flex_col">
      	<p class="mb10">
      		<input class="mr12" type="text" id="add1" name="zipcode" value="${member.zipcode}" readonly/>
      		<input type="button" class="pet_btn second_btn transition02" onclick="Zipcode()" value= "주소찾기"/>
      	</p>      	
      	<input class="mb10" type="text" id ="add2" name="addr" value="${member.addr}" readonly/>
      	<input class="mb10" type="text" id ="add3" name="addr_detail" value="${member.addr_detail}" />
      	<input type="hidden" id="add4"/>
      	
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