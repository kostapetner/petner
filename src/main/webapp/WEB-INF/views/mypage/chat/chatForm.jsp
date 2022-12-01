<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/chat.css" />
<title>Petner 채팅방</title>
<style>
div.header {
	position: sticky;
	top: 0;
	background-color: blue;
}
</style>
</head>
<body>
	<div class="chat_wrap">
		<div class="header">
			<h3>채팅방(${authUser.id})</h3>
		</div>
		<div id="chat"></div>
		<script id="temp" type="text/x-handlebars-template">
 		<div class="{{printLeftRight sender}}">
          <div class="sender">{{sender}}</div>
          <div class="message">{{message}}</div>
          <div class="date">{{date}}</div>
       </div>
		
       </script>

   
		<div class="input-div">
			<textarea id="txtMessage" cols="30" rows="10"
				placeholder="메시지를 입력한 후에 엔터키를 누르세요."></textarea>
		</div>
	</div>
</body>
<!-- 메시지 입력시 오른쪽 왼쪽으로 기입되는 방식 지정 -->
	<script>
	var uid = "${authUser.id}";
	Handlebars.registerHelper("printLeftRight", function(sender) {
		if (uid != sender) {		
			return "left";
		} else {
			return "right";
		}
	});
	</script>
	<script>
		var uid = "${authUser.id}"
	$("#txtMessage").on("keypress", function(e) {
		if (e.keyCode == 13 && !e.shiftKey) {
			e.preventDefault();
			var message = $("#txtMessage").val();
			if (message == "") {
				alert("메시지를 입력하세요.");
				$("#txtMessage").focus();
				return;
			}

				// 서버로 메시지 보내기
			sock.send(uid + "|" + message);
			$("#txtMessage").val("");
	
		}
	})
	
	
		//웹소켓 생성
	let sock = new SockJS("http://localhost:8088/petner/echo/");
	sock.onmessage = onMessage;
	
	//서버로부터 메시지 받기
	function onMessage(msg) {
		var items = msg.data.split("|");
		var sender = items[0];
		var message = items[1];
		var date = items[2];
		var data = {
			"message" : message,
			"sender" : sender,
			"date" : date
		}
		var temp = Handlebars.compile($("#temp").html());
		$("#chat").append(temp(data));
		window.scrollTo(0, $("#chat").prop("scrollHeight"))
	}
	
	
	// 채팅 데이터 받아오기
	function getList() {
		$.ajax({
			type : 'get',
			url : '/chat.json',
			dataType : 'json',
			success : function(data) {
				var temp = Handlebars.compile($("#temp").html());
				$("#chat").append(temp(data));
			}
		});
	}



	
	
	// 서버로부터 메시지 받기
	function onMessage(msg) {
		var items = msg.data.split("|");
		var sender = items[0];
		var message = items[1];
		var date = items[2];
		var data = {
			"message" : message,
			"sender" : sender,
			"date" : date
		}
		var temp = Handlebars.compile($("#temp").html());
		$("#chat").append(temp(data));
		window.scrollTo(0, $("#chat").prop("scrollHeight"))
		
	}

</script>
</html>
