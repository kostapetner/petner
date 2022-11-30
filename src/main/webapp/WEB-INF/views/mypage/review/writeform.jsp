<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cssPath"
	value="${pageContext.request.contextPath}/resources/css" />
<c:set var="imgPath"
	value="${pageContext.request.contextPath}/resources/images" />


<style type="text/css">
table {
	margin: auto;
	width: 450px;
}

.td_left {
	width: 150px;
	background: orange;
}

.td_right {
	width: 300px;
	background: skyblue;
}

#commandCell {
	text-align: center;
}

textarea {
    border: 1px solid #ced4da;
    border-radius: 0.375rem;
	width : 80%;
    max-height: 400px;
    resize: none;
}

.star_rating {
	font-size: 0;
	letter-spacing: -4px;
}

.star_rating a {
	font-size: 22px;
	letter-spacing: 0;
	display: inline-block;
	margin-left: 5px;
	color: #ccc;
	text-decoration: none;
}

.star_rating a:first-child {
	margin-left: 0;
}

.star_rating a.on {
	color: #777;
}

.input-group{
 padding-bottom:40px
}
</style>

<!-- 공지사항 글 등록 -->
<div class="card ad_card mb-4">
	<div class="card-body">
		<form action="./reviewwrite" method="post"
			enctype="multipart/form-data" name="reviewwrite">


			<div class="input-group flex-nowrap">
				<span class="input-group-text" id="addon-wrapping">제 목</span> <br>
				<br> <input type="text" class="form-control"
					name="review_title" id="review_title" required="required"
					aria-label="제 목"
					aria-describedby="addon-wrapping">
			</div>


			<div class="input-group flex-nowrap">
				<span class="input-group-text" id="addon-wrapping">내 용</span> <br>
				<br>
				<textarea id="review_content" class="fcc_textarea form-control"
					name="review_content" cols="40" rows="15" required="required">
				</textarea>
				<br>
				<span class="input-group-text" id="addon-wrapping">파일첨부</span> <input
					type="file" class="form-control" name="file" id="file_no"
					placeholder="Username" aria-label="파일첨부"
					aria-describedby="addon-wrapping">
			</div>

			


			<div input-group flex-nowrap>
				<span class="input-group-text" id="addon-wrapping">별 점</span><br>
				<span class="star_rating">
					<a href="#" class="on">★</a> <a href="#" class="on">★</a> <a
						href="#" class="on">★</a> <a href="#">★</a> <a href="#">★</a>
				</span>


			</div>

			<section id="commandCell">
				<div class="d-grid gap-2 d-md-block">
				
					<button type="submit" class="pet_btn btn-outline-secondary">등록</button>
					<button type="reset" class="pet_btn btn-outline-secondary">다시쓰기</button>
				</div>
			</section>
		</form>
	</div>
</div>

<script>
	$(".star_rating a").click(function() {
		$(this).parent().children("a").removeClass("on");
		$(this).addClass("on").prevAll("a").addClass("on");
		return false;
	});
</script>