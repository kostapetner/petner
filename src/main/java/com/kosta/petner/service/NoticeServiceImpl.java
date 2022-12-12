package com.kosta.petner.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.petner.bean.Notice;
import com.kosta.petner.bean.NoticePage;
import com.kosta.petner.dao.NoticeDAO;


@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired private NoticeDAO dao;
	
	@Override
	public void notice_insert(Notice vo) {
		dao.notice_insert(vo);
	}

	@Override
	public List<Notice> notice_list() {
		return dao.notice_list();
	}

	@Override
	public Notice notice_detail(int id) {
		return dao.notice_detail(id);
	}

	@Override
	public void notice_update(Notice vo) {
		dao.notice_update(vo);
	}

	@Override
	public void notice_delete(int id) {
		dao.notice_delete(id);
	}

	@Override
	public void notice_read(int id) {
		dao.notice_read(id);
	}

	@Override
	public NoticePage notice_list(NoticePage page) {
		return dao.notice_list(page);
	}

	@Override
	public void notice_reply_insert(Notice vo) {
		dao.notice_reply_insert(vo);
	}
}