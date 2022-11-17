package com.kosta.petner.service;

import java.util.List;

import com.kosta.petner.bean.ChatMessage;
import com.kosta.petner.bean.ChatRoom;
import com.kosta.petner.bean.PetInfo;
import com.kosta.petner.bean.SitterInfo;
import com.kosta.petner.bean.Users;


public interface MypageService {
	// 나의 기본정보
	Users getMyinfo(String id);
	// 나의정보 수정
	int updateMyinfo(Users users);
	
	// 나의 시터정보 가져오기
	SitterInfo getMySitterinfo(int user_no);
	
	// 나의 반려동물 정보 가져오기
	PetInfo getMyPetinfo(int user_no);
	
	
	/* Chat Service 2022.11.16 홍시원 작성 */
	/*
     * 방 번호를 선택하는 메소드
     * @param roomId
     * @return
     */
    ChatRoom selectChatRoom(String roomId);
 
    /*
     * 채팅 메세지 DB 저장
     * @param chatMessage
     * @return 
     */
    int insertMessage(ChatMessage chatMessage);
 
    /*
     * 메세지 내용 리스트 출력
     * @param roomId
     * @return
     */
    List<ChatMessage> messageList(String roomId);
 
    /*
     * 채팅 방 DB 저장
     * @param room
     * @return
     */
    int createChat(ChatRoom room);
 
    /*
     * DB에 채팅 방이 있는지 확인
     * @param room
     * @return
     */
    ChatRoom searchChatRoom(ChatRoom room);
 
    /*
     * 채팅 방 리스트 출력
     * @param userEmail
     * @return
     */
    List<ChatRoom> chatRoomList(String userEmail);
 
    /*
     * 채팅 읽지 않은 메세지 수 출력
     * @param message
     * @return
     */
    int selectUnReadCount(ChatMessage message);
 
    /*
     * 읽은 메세지 숫자 0으로 바꾸기
     * @param message
     * @return
     */
    int updateCount(ChatMessage message);
 

}

