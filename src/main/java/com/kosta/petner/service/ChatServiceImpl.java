package com.kosta.petner.service;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.petner.bean.ChatMessage;
import com.kosta.petner.bean.ChatRoom;

import com.kosta.petner.dao.ChatDAO;


@Service
public class ChatServiceImpl implements ChatService {
	
	@Autowired
	ChatDAO chatDAO;

	@Override
	public ChatRoom selectChatRoom(String roomId) {
		return chatDAO.selectChatRoom(roomId);
	}

	@Override
	public int insertMessage(ChatMessage chatMessage) {
		return chatDAO.insertMessage(chatMessage);
	}

	@Override
	public List<ChatMessage> messageList(String roomId) {
		return chatDAO.messageList(roomId);
	}

	@Override
	public int createChat(ChatRoom room) {
		return chatDAO.createChat(room);
	}

	@Override
	public ChatRoom searchChatRoom(ChatRoom room) {
		return chatDAO.searchChatRoom(room);
	}

	@Override
	public List<ChatRoom> chatRoomList(String userEmail) {
		return chatDAO.chatRoomList(userEmail);
	}

	@Override
	public int selectUnReadCount(ChatMessage message) {
		return chatDAO.selectUnReadCount(message);
	}

	@Override
	public int updateCount(ChatMessage message) {
		return chatDAO.updateCount(message);
	}


}
			




	
	
	


	
