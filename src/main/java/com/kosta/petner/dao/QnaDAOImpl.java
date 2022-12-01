package com.kosta.petner.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.petner.bean.Qna;

@Repository
public class QnaDAOImpl implements QnaDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public void insertQna(Qna qna) throws Exception {
		sqlSession.insert("mapper.qna.insertQna", qna);
	}

	@Override
	public Integer selectMaxQnaNum() throws Exception {
		return sqlSession.selectOne("mapper.qna.selectMaxQnaNum");
	}

	@Override
	public List<Qna> selectQnaList(Integer row) throws Exception {
		return sqlSession.selectList("mapper.qna.selectQnaList", row);
	}

	@Override
	public Integer selectQnaCount() throws Exception {
		return sqlSession.selectOne("mapper.qna.selectQnaCount");
	}

	@Override
	public Qna selectQna(Integer qna_no) throws Exception {
		return sqlSession.selectOne("mapper.qna.selectQna", qna_no);
	}

	@Override
	public void updateQna(Qna qna) throws Exception {
		sqlSession.update("mapper.qna.updateQna", qna);
	}

	@Override
	public void updateQnaReReq(Qna qna) throws Exception {
		sqlSession.update("mapper.qna.updateQnaReReq", qna);
	}

	@Override
	public void deleteQna(Integer qnaNum) throws Exception {
		sqlSession.update("mapper.qna.deleteQna", qnaNum);
	}

	// 조회수 증가
	@Override
	public void qna_read(int qna_no) throws Exception {
		sqlSession.update("mapper.qna.read", qna_no);
		
	}

	@Override
	public void updateFileNoToQna(Qna qna) {
		sqlSession.update("mapper.qna.updateFileNoToQna", qna);
	}
}