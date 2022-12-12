package com.kosta.petner.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.petner.bean.Notice;
import com.kosta.petner.bean.NoticePage;
import com.kosta.petner.service.NoticeService;

@Repository
public class NoticeDAO implements NoticeService {
	@Autowired private SqlSession sql;
	
	@Override
	public void notice_insert(Notice vo) {
		sql.insert("mapper.notice.insert", vo);
	}

	@Override
	public List<Notice> notice_list() {
		return sql.selectList("mapper.notice.list");
	}

	@Override
	public Notice notice_detail(int id) {
		return sql.selectOne("mapper.notice.detail",id);
	}

	@Override
	public void notice_update(Notice vo) {
		sql.update("mapper.notice.update", vo);
	}

	@Override
	public void notice_delete(int id) {
		sql.delete("mapper.notice.delete", id);
	}

	@Override
	public void notice_read(int id) {
		sql.update("mapper.notice.read", id);
	}

	@Override
	public NoticePage notice_list(NoticePage page) {
		page.setTotalList((Integer) sql.selectOne("mapper.notice.totalList", page));
		page.setList(sql.selectList("mapper.notice.list", page));
		
		return page;
	}

	@Override
	public void notice_reply_insert(Notice vo) {
		sql.insert("mapper.notice.reply_insert", vo);
	}
}
