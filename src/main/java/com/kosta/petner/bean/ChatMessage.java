package com.kosta.petner.bean;

/*
2022.11.11 홍시원
본격적인 메세지 VO
방번호와 메세지번호 PK
sessionCnt는 현재 1:1 채팅방에 들어와있는 유저 수이다.
sessionCnt가 2이면 unReadCnt는 0으로 DB에 집어넣을 수 있겠다.
[ => 2명이 들어와있으니 읽지않은 메세지는 없다.]
sessionCnt가 1이면 unReadCnt는 1이 되는 것이다.
*/
public class ChatMessage {
	private String roomId; // 방 번호
	private String messageId; // 메세지 번호
	private String message; // 메세지 내용
	private String name; // 보낸이 이름
	private String email; // 보낸이 이메일
	private int unReadCnt; // 안 읽은 메세지 수
	private int sessionCnt; // 현재 세션 수

	public ChatMessage() {
		super();
	}

	public ChatMessage(String roomId, String messageId, String message, String name, String email, int unReadCnt,
			int sessionCnt) {
		super();
		this.roomId = roomId;
		this.messageId = messageId;
		this.message = message;
		this.name = name;
		this.email = email;
		this.unReadCnt = unReadCnt;
		this.sessionCnt = sessionCnt;
	}

	public String getRoomId() {
		return roomId;
	}

	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}

	public String getMessageId() {
		return messageId;
	}

	public void setMessageId(String messageId) {
		this.messageId = messageId;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getUnReadCnt() {
		return unReadCnt;
	}

	public void setUnReadCnt(int unReadCnt) {
		this.unReadCnt = unReadCnt;
	}

	public int getSessionCnt() {
		return sessionCnt;
	}

	public void setSessionCnt(int sessionCnt) {
		this.sessionCnt = sessionCnt;
	}

	@Override
	public String toString() {
		return "ChatMessage [roomId=" + roomId + ", messageId=" + messageId + ", message=" + message + ", name=" + name
				+ ", email=" + email + ", unReadCnt=" + unReadCnt + ", sessionCnt=" + sessionCnt + "]";
	}
}