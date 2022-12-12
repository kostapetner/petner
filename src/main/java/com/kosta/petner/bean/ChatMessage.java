package com.kosta.petner.bean;

public class ChatMessage {
	
	    
	    private String roomId;            // 방 번호
	    private String messageId;        // 메세지 번호
	    private String message;            // 메세지 내용
	    private String name;            // 보낸이 이름
	    private String email;            // 보낸이 이메일
	    private int unReadCount;        // 안 읽은 메세지 수
	    private int sessionCount;        // 현재 세션 수
	    
	    public ChatMessage() {
	        super();
	    }
	 
	    public ChatMessage(String roomId, String messageId, String message, String name, String email, int unReadCount,
	            int sessionCount) {
	        super();
	        this.roomId = roomId;
	        this.messageId = messageId;
	        this.message = message;
	        this.name = name;
	        this.email = email;
	        this.unReadCount = unReadCount;
	        this.sessionCount = sessionCount;
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
	 
	    public int getUnReadCount() {
	        return unReadCount;
	    }
	 
	    public void setUnReadCount(int unReadCount) {
	        this.unReadCount = unReadCount;
	    }
	 
	    public int getSessionCount() {
	        return sessionCount;
	    }
	 
	    public void setSessionCount(int sessionCount) {
	        this.sessionCount = sessionCount;
	    }
	 
	    @Override
	    public String toString() {
	        return "ChatMessage [roomId=" + roomId + ", messageId=" + messageId + ", message=" + message + ", name=" + name
	                + ", email=" + email + ", unReadCount=" + unReadCount + ", sessionCount=" + sessionCount + "]";
	    }
	}



