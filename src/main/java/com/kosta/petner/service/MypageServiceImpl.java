package com.kosta.petner.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.petner.bean.ChatMessage;
import com.kosta.petner.bean.ChatRoom;
import com.kosta.petner.bean.PetInfo;
import com.kosta.petner.bean.SitterInfo;
import com.kosta.petner.bean.Users;
import com.kosta.petner.dao.OwnerDAO;
import com.kosta.petner.dao.SitterDAO;
import com.kosta.petner.dao.UsersDAO;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	UsersDAO usersDAO;
	
	@Autowired
	SitterDAO sitterDAO;
	
	@Autowired
	OwnerDAO ownerDAO;
	
	
	
	@Override
	public Users getMyinfo(String id) {
		return usersDAO.getMyinfo(id);
	}

	@Override
	public int updateMyinfo(Users users) {
		return usersDAO.updateMyinfo(users);
	}

	@Override
	public SitterInfo getMySitterinfo(int user_no) {
		return sitterDAO.getSitterInfo(user_no);
	}

	@Override
	public PetInfo getMyPetinfo(int user_no) {
		return ownerDAO.getPetInfo(user_no);
	}

	@Override
	public ChatRoom selectChatRoom(String roomId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertMessage(ChatMessage chatMessage) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ChatMessage> messageList(String roomId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int createChat(ChatRoom room) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ChatRoom searchChatRoom(ChatRoom room) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ChatRoom> chatRoomList(String userEmail) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectUnReadCount(ChatMessage message) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateCount(ChatMessage message) {
		// TODO Auto-generated method stub
		return 0;
	}

}
