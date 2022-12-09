<%@ page language="java" contentType="text/html; charset=UTF-8" 	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cssPath"
	value="${pageContext.request.contextPath}/resources/css" />
<c:set var="imgPath"
	value="${pageContext.request.contextPath}/resources/images" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reply JSP</title>
</head>
<body>
<h3>답글 쓰기</h3>
<div class="formbox">

<!-- 
 - 파일 첨부 시 form 반드시 갖고 있어야 할 속성 
	1. 반드시 method는 post이어야만 한다.
	2. enctype을 지정한다. ▶ enctype='multipart/form-data'

-->
<form action="reply_insert_notice" method="post" enctype="multipart/form-data">
	<input type="hidden" name="root" value="${vo.root }" />
	<input type="hidden" name="step" value="${vo.step }" />
	<input type="hidden" name="indent" value="${vo.indent }" />
	
	<table>
		<tr>
			<th class="w-px160">제목</th>
			<td><input type="text" name="title" class="need"/></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${authUser.name }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" class="need"></textarea></td>
		</tr>
		<tr>
			<th>파일 첨부</th>
			<td class="left">
				<label>
					<input type="file" name="file" id="attach-file"/>
					<img src='img/select.png' class="file-img" />
				</label>
				<span id="file-name"></span>
				<span id="delete-file" style="color: red; margin-left: 20px;" ><i class="fas fa-times font-img"></i></span>
			</td>
		</tr>
	</table>
</form>
<div class="btnSet">
	<button class="btn-fill" onclick="if(necessary()) $('form').submit()">저장</button>
	<a class="btn-empty" href="list_notice">취소</a>
</div>

</div>
</body>
</html>

<!-- 실시간 갱신을 위해 getTime을 붙여준다 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/reply.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/need_check.js?v=<%=new java.util.Date().getTime() %>"></script>
<script type="text/javascript" src="js/file_attach.js"></script>
