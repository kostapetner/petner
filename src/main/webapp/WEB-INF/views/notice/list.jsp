<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="cssPath"
	value="${pageContext.request.contextPath}/resources/css" />
<c:set var="imgPath"
	value="${pageContext.request.contextPath}/resources/images" />
<head>
<link rel="stylesheet" href="${cssPath}/table.css">
</head>
<body>	
<!-- 공지사항 리스트 -->
	<div id="wrapper">
		<!-- CONTAINER -->
		<div class="container w90">
			<div class="">
<p class="list_title">공지사항</p>
<div class="formbox">
<form method="post" action="list_notice" id="list">
	<input type="hidden" name="curPage" value="1"/>
	
	<div class="table_top">
	<div>
		<!-- 검색 -->
			<ul class="search_box">
				<li>
					<select name="search" class="search">
						<option class="option_box" value="all" ${notice.search eq 'all' ? 'selected' : '' }>전체</option>
						<option class="option_box" value="title" ${notice.search eq 'title' ? 'selected' : '' }>제목</option>
						<option class="option_box" value="content" ${notice.search eq 'content' ? 'selected' : '' }>내용</option>
						<option class="option_box" value="writer" ${notice.search eq 'writer' ? 'selected' : '' }>작성자</option>
					</select>
				</li>
				<li><input value="${notice.keyword }" type="text" name="keyword" class="w-px300" /></li>
				<li><button class="pet_btn" onclick="$('form').submit()">검색</button></li>
			</ul>
			<ul>
				<c:if test="${authUser.user_type >= 9}">
					<li><a class="pet_btn" href="new_notice">글쓰기</a></li>
				</c:if>
			</ul>
			</div>
	</div>
</form>
<div class="user_table">
<table class="table table-hover">
	<!-- <tr>
		<th>번호</th>
		<th class="left">제목</th>
		<th>작성자</th>
		<th>작성일자</th>
		<th>첨부파일</th>
	</tr> -->
	<c:forEach items="${notice.list}" var="vo">
		<tr style="cursor:pointer;">
			<td>
				<!-- 1.box -->
				<div class="box1">
				<p class="user_by"><span class="by">by</span>&nbsp;${vo.name }</p>
					<p class="day">${vo.writedate }</p>
					<p><i class="fa-regular fa-eye"></i> ${vo.readcnt}</p>
				</div>
				<!-- 제목, 내용 -->
				<div class="box2">
					<h2>
						<c:forEach var="i" begin="1" end="${vo.indent }">
							<%-- ${i eq vo.indent ? "<img src = 'img/re.gif' />" : "&nbsp;&nbsp;" } --%>
							<span class="notice_indent">Re
							<c:if test="detail_notice?id=${vo.id }?${vo.title}=${vo.title}">${vo.title}</c:if></span>&nbsp;&nbsp;
						</c:forEach>
						<a href="detail_notice?id=${vo.id }&curPage=${notice.curPage }" >${vo.title }</a>
					</h2>
					<p class="content">${vo.content}</p>
				</div>
				<!-- 이미지 있을때 -->
				<div class="box3" id="box3">
					<c:if test="${!empty vo.filename }">
					<div class="preview">
						<img src="resources/${vo.filepath }" class="img3" />
					</div>
					</c:if>
					<!-- 업로드한 이미지 없을때 -->
					<c:if test="${empty vo.filename }">
					<div class="preview_no"></div>
					</c:if>
					
				</div>
			</td>
			<%-- <td>${vo.no }</td>
			<td>
				<c:forEach var="i" begin="1" end="${vo.indent }">
					${i eq vo.indent ? "<img src = 'img/re.gif' />" : "&nbsp;&nbsp;" }	
				</c:forEach>
				<a href="detail_notice?id=${vo.id }&curPage=${notice.curPage }" >${vo.title }</a>
			</td>
			<td>${vo.name }</td>
			<td>${vo.writedate }</td>
			<td>
				<c:if test="${!empty vo.filename }">
					<a href="download_notice?id=${vo.id }">
						<img title="${vo.filename }" class="file-img" src="img/attach.png" />
					</a>
				</c:if>
			</td> --%>
		</tr>
	</c:forEach>
</table>
</div>
<div class="btnSet">
	<div class="page_list">
		<button class="page_first" onclick="go_page(1)">처음</button>
		
	<!-- step : 지정하지 않아도 디폴트 1 -->
	<c:forEach var="no" begin="${notice.beginPage }" end="${notice.endPage }" step="1">
		<c:if test="${no eq notice.curPage}">
			<button class="page_on">${no }</button>
		</c:if>
		
		<c:if test="${no ne notice.curPage }">
			<button class="page_off" onclick="go_page(${no })">${no }</button>
		</c:if>
	</c:forEach>
		<button class="page_last" onclick="go_page(${notice.totalPage })">마지막</button>
</div>
</div>
</div>

</div>
</div>
</div>
</body>
<script type="text/javascript">
$(function(){
	$('#data-list ul').css('height', 
			( ( $('.grid li').length % 5 > 0 ? 1 : 0 ) + Math.floor($('.grid li').length / 5) )
			 * $('.grid li').outerHeight(true) - 20);
})

function go_detail(id) {
	$('[name=id]').val(id);
	$('form').attr('action', 'detail_notice');
	$('form').submit();	
}
</script>

<script>
function go_page(no) {
	$('[name=curPage]').val(no);
	$('[name=keyword]').val('${notice.keyword}');
	$('#list').submit();
}




</script>