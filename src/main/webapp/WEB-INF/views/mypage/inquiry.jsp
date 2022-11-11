<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="imgPath" value="${pageContext.request.contextPath}/resources/images"/>

<div class="content">
 	<div id="talk_view" class="w60">      
	  <div class="talk_list">       
	    <div class="you">
	      <span class="datetime">10.15 10:00</span>
	      <div class="cont">안녕하세요</div>
	    </div>             
	    <div class="me" >
	      <span class="datetime">10:00:00</span>
	      <div class="cont">내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용</div>
	    </div>
	    <div class="me" >
	      <span class="datetime">10:00:00</span>
	      <div class="cont">내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용</div>
	    </div>
	    <div class="you">
	      <span class="datetime">10.15 10:00</span>
	      <div class="cont">안녕하세요</div>
	    </div> 
	  </div>          
	  <div class="type_here">
	    <span class="pet_btn photo_btn"><i class="fa-regular fa-image"></i>&nbsp;사진</span>
	    <p class="input">
	      <input name="content" type="text" />
	      <span class="send_icon">전송</span>
	    </p>
	  </div>
	</div>
</div>