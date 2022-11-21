package com.kosta.petner.service;

import java.util.List;

import com.kosta.petner.bean.Qna;
import com.kosta.petner.bean.QnaPage;

public interface QnaService {
	//CRUD
	void qna_insert(Qna qna); 		//글 저장
	List<Qna> qna_list();			//목록 조회
	QnaPage qna_list(QnaPage page);	//페이지 처리 된 공지글 목록 조회
	Qna qna_detail(int id);		//상세 조회
	void qna_update(Qna qna);		//글 수정
	void qna_delete(int id);		//글 삭제
	void qna_read(int id);			//조회수 증가 처리
	void qna_reply_insert(Qna qna);//답글 저장
}
