<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="cssPath"
	value="${pageContext.request.contextPath}/resources/css" />
<c:set var="imgPath"
	value="${pageContext.request.contextPath}/resources/images" />
<head>
<link rel="stylesheet" href="${cssPath}/table.css">
</head>
<style>
.q_list {
	background: #f1f1f1;
	border-bottom: 1px solid #ccc;
}

.q_list .text {
	cursor: pointer;
	background: #fff;
	height: 40px;
	padding: 20px;
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.q_list .hide {
	display: none;
	padding: 30px 20px;
}

.q_list .text svg {
	transform: rotate(180deg);
}
</style>
<body>
	<!-- 공지사항 리스트 -->
	<div id="wrapper">
		<!-- CONTAINER -->
		<div class="container w90">
				<p class="list_title">QNA</p>
<div class="formbox">
				<!-- Questions list -->
				<h3>자주하는 질문</h3>

				<div class="questions_list">
					<ul>
						<li class="q_list">
							<div class="text">
								어떻게 가입하나요?<i class="fa-solid fa-chevron-up"></i>
							</div>
							<ul class="hide">
								<li>홈페이지에서 오른쪽 상단 로그인 버튼 클릭후<br> 로그인화면에서 하단의 회원가입을 클릭해
									회원가입 할수있습니다
								</li>
							</ul>
						</li>

						<li class="q_list">
							<div class="text">
								비밀번호를 잃어버렸어요.<i class="fa-solid fa-chevron-up"></i>
							</div>
							<ul class="hide">
								<li>마이페이지 - 나의정보 에서 비밀번호 변경하기 버튼을 클릭후 비밀번호를 변경하실수있습니다.</li>
							</ul>
						</li>
						<li class="q_list">
							<div class="text">
								펫시터 찾는 방법을 알고싶어요!<i class="fa-solid fa-chevron-up"></i>
							</div>
							<ul class="hide">
								<li>메인상단 펫시터 찾기 메뉴를 클릭후<br> 원하시는 펫시터 조건들을 클릭후 채팅하시면
									됩니다 :)
								</li>
							</ul>
						</li>
					</ul>
				</div>


				<div class="formbox">
					<form method="post" action="list_qna" id="list">
						<input type="hidden" name="curPage" value="1" />

						<div class="table_top">
							<div>
								<!-- 검색 -->
								<ul class="search_box">
									<li><select name="search" class="search">
											<option class="option_box" value="all"
												${qna.search eq 'all' ? 'selected' : '' }>전체</option>
											<option class="option_box" value="title"
												${qna.search eq 'title' ? 'selected' : '' }>제목</option>
											<option class="option_box" value="content"
												${qna.search eq 'content' ? 'selected' : '' }>내용</option>
											<option class="option_box" value="writer"
												${qna.search eq 'writer' ? 'selected' : '' }>작성자</option>
									</select></li>
									<li><input value="${qna.keyword }" type="text"
										name="keyword" class="w-px300" /></li>
									<li><button class="pet_btn" onclick="$('form').submit()">검색</button></li>
								</ul>
								<ul>
									<c:if test="${authUser.user_type >= 9}">
										<li><a class="pet_btn" href="new_qna">글쓰기</a></li>
									</c:if>
								</ul>
							</div>
						</div>
					</form>
					<div class="qna_table">
						<table class="table table-hover" style='width: 100%;'>

							<c:forEach items="${qna.list}" var="vo">
								<tr style="cursor: pointer;" onClick="location.href='detail_qna?id=${vo.id }&curPage=${qna.curPage }'">
									<td class="qna_list d-flex">
										<!-- 1.box -->
										<div class="box1">
											<p class="user_by">
												<span class="by">by</span>&nbsp;${vo.name }
											</p>
											<p>${vo.writedate }</p>
										</div> <!-- 제목, 내용 -->
										<div class="box2">
											<h2>
												<c:forEach var="i" begin="1" end="${vo.indent }">
													<%-- ${i eq vo.indent ? "<img src = 'img/re.gif' />" : "&nbsp;&nbsp;" } --%>
													<span class="qna_indent">Re <c:if
															test="detail_qna?id=${vo.id }?${vo.title}=${vo.title}">${vo.title}</c:if></span>&nbsp;&nbsp;
						</c:forEach>
						${vo.title }
											</h2>
										</div>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="btnSet">
						<div class="page_list">
							<button class="page_first" onclick="go_page(1)">처음</button>

							<!-- step : 지정하지 않아도 디폴트 1 -->
							<c:forEach var="no" begin="${qna.beginPage }"
								end="${qna.endPage }" step="1">
								<c:if test="${no eq qna.curPage}">
									<button class="page_on">${no }</button>
								</c:if>

								<c:if test="${no ne qna.curPage }">
									<button class="page_off" onclick="go_page(${no })">${no }</button>
								</c:if>
							</c:forEach>
							<button class="page_last" onclick="go_page(${qna.totalPage })">마지막</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
<script>
    $(document).ready(function(){
        $(".q_list>.text").click(function(){
            var submenu = $(this).next("ul");
            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        });
    });
</script>
<script type="text/javascript">
$(function(){
	$('#data-list ul').css('height', 
			( ( $('.grid li').length % 5 > 0 ? 1 : 0 ) + Math.floor($('.grid li').length / 5) )
			 * $('.grid li').outerHeight(true) - 20);
})

function go_detail(id) {
	$('[name=id]').val(id);
	$('form').attr('action', 'detail_qna');
	$('form').submit();	
}
</script>

<script>
function go_page(no) {
	$('[name=curPage]').val(no);
	$('[name=keyword]').val('${qna.keyword}');
	$('#list').submit();
}




</script>