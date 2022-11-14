package com.kosta.petner.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.petner.bean.Board;


@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public void insertBoard(Board board) throws Exception {
		sqlSession.insert("mapper.board.insertBoard", board);
	}

	@Override
	public Integer selectMaxBoardNum() throws Exception {
		return sqlSession.selectOne("mapper.board.selectMaxBoardNum");
	}

	@Override
	public List<Board> selectBoardList(Integer row) throws Exception {
		return sqlSession.selectList("mapper.board.selectBoardList", row);
	}

	@Override
	public Integer selectBoardCount() throws Exception {
		return sqlSession.selectOne("mapper.board.selectBoardCount");
	}

	@Override
	public Board selectBoard(Integer board_num) throws Exception {
		return sqlSession.selectOne("mapper.board.selectBoard", board_num);
	}

	@Override
	public void updateBoard(Board board) throws Exception {
		sqlSession.update("mapper.board.updateBoard", board);
	}

	@Override
	public void updateBoardReReq(Board board) throws Exception {
		sqlSession.update("mapper.board.updateBoardReReq", board);
	}

	@Override
	public void deleteBoard(Integer boardNum) throws Exception {
		sqlSession.update("mapper.board.deleteBoard", boardNum);
	}
}