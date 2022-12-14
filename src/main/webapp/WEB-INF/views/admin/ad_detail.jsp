<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cssPath"
	value="${pageContext.request.contextPath}/resources/css" />
<c:set var="imgPath"
	value="${pageContext.request.contextPath}/resources/images" />

<style>
textarea {
	width: 100%;
	border: 1px solid #ced4da;
	border-radius: 0.375rem;
	max-height: 150px;
}
</style>
<script>
	/* user_type 이 9 일 경우에 체크박스 체크되어있게 */
	$(document)
			.ready(
					function() {
						var user_type = '${users.user_type}';

						if (user_type <= 8) {
							$("input:checkbox[name='user_type']:checkbox[value='1']")
							.attr("checked", true);
						} else {
							$("input:checkbox[name='user_type']:checkbox[value='9']")
							.attr("checked", true);
						}
					}
			);
	/* 체크박스 하나만 선택되게 하기 */
	function checkOnlyOne(element) {
		  
		  const checkboxes 
		      = document.getElementsByName("user_type");
		  
		  checkboxes.forEach((cb) => {
		    cb.checked = false;
		  })
		  
		  element.checked = true;
		}
	
	$(document).ready(function(){
		// 체크
		let tyep_kind = '${users.user_type}';
		tyep_kind = tyep_kind.split(',');
		console.log(tyep_kind);
		
		tyep_kind.forEach(function(e){
		    $("input[value="+e+"]").prop("checked", true);
		});
	})
</script>

<!-- 게시판 등록 -->
<div class="card ad_card mb-4">
	<div class="card-body">
		<h2 class="card-title">회원 상세정보</h2>
		<form action="ad_userupdate" method="post" enctype="multipart/form-data">
			<input type="hidden" name="user_no" value="${users.user_no}" />
			<!-- 회원상세정보 -->
			<ul class="user_detail">
				<li>
					<p>회원번호 :</p>
					<p>${users.user_no}</p>
				</li>
				<li>
					<p>회원구분 :</p>
					<p>${users.user_type}</p>
						<!-- user_type 체크박스 -->
					<div class="form-inline">
							<label>
								<input type="checkbox" name="user_type"
								value="1" onclick="checkOnlyOne(this)" placeholder="${users.user_type}">일반회원</label> 
							<label>
								<input
								type="checkbox" name="user_type" value="9"
								onclick="checkOnlyOne(this)"  placeholder="${users.user_type}">관리자</label>
					</div>
				</li>
				<li>
					<p>이름 :</p>
					<p>${users.name}</p>					
				</li>
				<li>
					<p>아이디 :</p>
					<p>${users.id}</p>				
				</li>
				<li>
					<p>닉네임 :</p>
					<p>${users.nickname}</p>
				</li>
				<li>
					<p>이메일 :</p>
					<p>${users.email}</p>
				</li>
				<li>
					<p>비밀번호 :</p>
					<p>${users.password}</p>
				</li>
				<li>
					<p>가입일 :</p>
					<p>${users.joindate}</p>
				</li>
				<li>
					<p>성별 :</p>
					<p>${users.gender}</p>
				</li>
				<li>
					<p>주소 :</p>
					<p>${users.addr}${users.addr_detail}</p>
				</li>
				<li>
					<p>등급 :</p>
					<p>${users.user_level}</p>
				</li>

			</ul>

			<button type="submit" class="btn btn-outline-secondary" style="display:inline-block;">
			<%-- <a href="javascript:ad_detailmodify?user_type=${users.user_type}">회원정보 변경</a> --%>
				회원정보 변경
				</button>
				<!-- 특정대상과 채팅방 만들기  -->
				</form>
				<form action= "createChat.do" method="post">
				<input type="hidden" name=user_nickname value= "${authUser.nickname}"/>
				<input type="hidden" name=user_id value= "${authUser.id}"/>			
				<input type="hidden" name=another_nickname value= "${users.nickname}"/>
				<input type="hidden" name=another_id value= "${users.id}"/>
			
				<button type="submit" class="btn btn-outline-secondary" value="채팅하기"><i class="fa-solid fa-comment-dots"></i></button>
				</form>
	</div>
</div>
