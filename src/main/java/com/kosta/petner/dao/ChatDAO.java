package com.kosta.petner.dao;



import java.util.List;

import com.kosta.petner.bean.Chat;

public interface ChatDAO {

		public List<Chat> list();
		public void insert(Chat chat);
		public void delete(int chat_no);
		public int last();
	}
