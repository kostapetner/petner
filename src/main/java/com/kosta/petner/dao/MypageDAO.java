package com.kosta.petner.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.petner.bean.ChatMessage;
import com.kosta.petner.bean.ChatRoom;

@Repository
public class MypageDAO {
	
	@Autowired
    SqlSessionTemplate sqlSession;
 
    public ChatRoom selectChatRoom(String roomId) {
        return sqlSession.selectOne("mapper.chat.selectChatRoom", roomId);
    }
    
    public int insertMessage(ChatMessage chatMessage) {
        return sqlSession.insert("mapper.chat.insertMessage", chatMessage);
    }
    
    public List<ChatMessage> messageList(String roomId) {
        return sqlSession.selectList("mapper.chat.messageList", roomId);
    }
 
    public int createChat(ChatRoom room) {
        return sqlSession.insert("mapper.chat.createChat", room);
    }
 
    public ChatRoom searchChatRoom(ChatRoom room) {
        return sqlSession.selectOne("mapper.chat.searchChatRoom", room);
    }
 
    public List<ChatRoom> chatRoomList(String userEmail) {
        return sqlSession.selectList("mapper.chat.chatRoomList", userEmail);
    }
 
    public int selectUnReadCount(ChatMessage message) {
        return sqlSession.selectOne("mapper.chat.selectUnReadCount",message);
    }
 
    public int updateCount(ChatMessage message) {
        return sqlSession.update("mapper.chat.updateCount", message);
    };

}
