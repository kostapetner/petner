package com.kosta.petner.bean;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Component
public class ChatRoom {

	    
	    private String room_id;        // 방 번호
	    
	    private String user_id;    // 사용자 이메일
	    private String user_name;    // 사용자 이름
	    private String user_pic;        // 사용자 사진
	    
	    private String master_id; // 상대방 이메일
	    private String master_name;    // 상대방 이름
	    private String master_pic;    // 상대방 사진
	    
	    private int unReadCount;    // 안 읽은 메세지 수
	    
	 
	}
