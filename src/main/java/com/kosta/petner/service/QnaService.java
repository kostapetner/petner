package com.kosta.petner.service;

import java.util.List;

import com.kosta.petner.bean.PageInfo;
import com.kosta.petner.bean.Qna;
import com.kosta.petner.bean.SitterInfo;

public interface QnaService {
	void resistQna(Qna qna) throws Exception;
	List<Qna> getQnaList(int page, PageInfo pageInfo) throws Exception;
	Qna getQna(Integer qnaNum) throws Exception;
	void modifyQna(Qna qna) throws Exception;
	void qnaReply(Qna qna) throws Exception;
	void deleteQna(Integer qnaNum) throws Exception;
	void qna_read(int qna_id) throws Exception; // 조회수 증가
	
	void updateFileNoToQna(Qna qna);
}
