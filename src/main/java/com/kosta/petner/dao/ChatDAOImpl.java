package com.kosta.petner.dao;


import java.util.List;


import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.petner.bean.Chat;

@Repository
public class ChatDAOImpl implements ChatDAO{


		@Autowired
		SqlSession session;


		@Override
		public List<Chat> list() {
			return session.selectList("mapper.chat.list");
		}


		@Override
		public void insert(Chat chat) {
			session.insert("mapper.chat.insert", chat);
			
		}

		
		@Override
		public void delete(int chat_no) {
			session.selectList("mapper.chat.delete", chat_no);
			
		}


		@Override
		public int last() {
			return session.selectOne("mapper.chat.last");
		}
}

	

