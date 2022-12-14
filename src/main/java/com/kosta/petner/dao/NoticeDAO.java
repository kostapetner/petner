package com.kosta.petner.dao;

import java.util.List;

import com.kosta.petner.bean.Notice;
import com.kosta.petner.bean.NoticePage;


public interface NoticeDAO {
	
	void notice_insert(Notice notice);
	
	List<Notice> notice_list();

	Notice notice_detail(int id);

	void notice_update(Notice notice);

	void notice_delete(int id);

	void notice_read(int id);

	NoticePage notice_list(NoticePage noticePage);

	void notice_reply_insert(Notice notice);
	
	
}
