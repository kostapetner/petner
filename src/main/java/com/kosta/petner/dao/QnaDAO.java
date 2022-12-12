package com.kosta.petner.dao;

import java.util.List;

import com.kosta.petner.bean.Qna;
import com.kosta.petner.bean.SitterInfo;


public interface QnaDAO {
	void insertQna(Qna qna) throws Exception; // 게시판 추가
	Integer selectMaxQnaNum() throws Exception; // 전체글갯수
	List<Qna> selectQnaList(Integer row) throws Exception;
	Integer selectQnaCount() throws Exception;
	Qna selectQna(Integer qna_no) throws Exception;	
	void updateQna(Qna qna) throws Exception;
	void updateQnaReReq(Qna qna) throws Exception;
	void deleteQna(Integer qnaNum) throws Exception;
	void qna_read(int qna_no) throws Exception; // 조회수 증가
	void updateFileNoToQna(Qna qna);
}
