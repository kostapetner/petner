package com.kosta.petner.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.petner.bean.Qna;
import com.kosta.petner.bean.QnaPage;
import com.kosta.petner.service.QnaService;

@Repository
public class QnaDAO implements QnaService {
	@Autowired private SqlSession sql;

	@Override
	public void qna_insert(Qna qna) {
		sql.insert("mapper.qna.insert", qna);
	}

	@Override
	public List<Qna> qna_list() {
		return sql.selectList("mapper.qna.list");
	}

	@Override
	public Qna qna_detail(int id) {
		return sql.selectOne("mapper.qna.detail", id);
	}

	@Override
	public void qna_update(Qna qna) {
		sql.update("mapper.qna.update", qna);
	}

	@Override
	public void qna_delete(int id) {
		sql.delete("mapper.qna.delete", id);
	}

	@Override
	public void qna_read(int id) {
		sql.update("mapper.qna.read", id);
	}

	@Override
	public void qna_reply_insert(Qna qna) {
		sql.insert("mapper.qna.reply_insert", qna);
	}

	@Override
	public QnaPage qna_list(QnaPage page) {
		page.setTotalList((Integer) sql.selectOne("mapper.qna.totalList", page));
		page.setList(sql.selectList("mapper.qna.list", page));
		
		return page;
	}

}
