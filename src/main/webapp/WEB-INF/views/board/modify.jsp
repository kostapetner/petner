<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<h3>방명록 수정</h3>
<form method="post" action="update_board" enctype="multipart/form-data">
	<table>
		<tr>
			<th class="w-px160">제목</th>
			<td><input type="text" name="title" value="${vo.title }" class="need" title="제목"/></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${vo.name }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" class="need" title="내용">${vo.content }</textarea></td>
		</tr>
		<tr>
			<th>첨부 파일</th>
			<td class="left">
				<label>
					<input type="file" name="file" id="attach-file" />
					<img src="img/select.png" class="file-img" />
				</label>
				<span id="file-name">${vo.filename }</span>
				<span id="preview"></span>
				<span id="delete-file" style="color:red"><i class="fas fa-times font-img"></i></span>
			</td>
		</tr>
	</table>
	<input type="hidden" name="attach"/>
	<input type="hidden" name="id" value="${vo.id }" />
</form>
<div class="btnSet">
	<a class="btn-fill" onclick="if( necessary() ) { $('[name=attach]').val( $('#file-name').text() ); $('form').submit(); }">저장</a>
	<a class="btn-empty" href="javascript:history.go(-1)">취소</a>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/reply.js"></script>
<script type="text/javascript">

if(${!empty vo.filename}) {
	$('#delete-file').css("display", "inline");
}

$('#attach-file').on('change', function() {
	var attach = this.files[0];
	if( attach ) {
		if( isImage(attach.name) ) {
			var img = "<img id='preview-img' class='file-img' src='' style='border-radius:50%'/>";
			$('#preview').html(img);

			var reader = new FileReader();
			reader.onload = function(e) {
				$('#preview-img').attr('src', e.target.result);
			}
			reader.readAsDataURL(attach);
		} else {
			$('#preview').html('')
		}
	}
});
</script>
