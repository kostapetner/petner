package com.kosta.petner.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.petner.bean.Qna;
import com.kosta.petner.bean.QnaPage;
import com.kosta.petner.dao.QnaDAO;
	
@Service
public class QnaServiceImpl implements QnaService {
	@Autowired private QnaDAO qnadao;
	
	@Override
	public void qna_insert(Qna qna) {
		qnadao.qna_insert(qna);
	}

	@Override
	public List<Qna> qna_list() {
		return qnadao.qna_list();
	}

	@Override
	public Qna qna_detail(int id) {
		return qnadao.qna_detail(id);
	}

	@Override
	public void qna_update(Qna qna) {
		qnadao.qna_update(qna);
	}

	@Override
	public void qna_delete(int id) {
		qnadao.qna_delete(id);
	}

	@Override
	public void qna_read(int id) {
		qnadao.qna_read(id);
	}

	@Override
	public void qna_reply_insert(Qna qna) {
		qnadao.qna_reply_insert(qna);
	}

	@Override
	public QnaPage qna_list(QnaPage page) {
		return qnadao.qna_list(page);
	}

}
