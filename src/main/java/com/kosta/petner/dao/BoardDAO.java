package com.kosta.petner.dao;

import java.util.List;

import com.kosta.petner.bean.Board;


public interface BoardDAO {
	void insertBoard(Board board) throws Exception;
	Integer selectMaxBoardNum() throws Exception;
	List<Board> selectBoardList(Integer row) throws Exception;
	Integer selectBoardCount() throws Exception;
	Board selectBoard(Integer board_num) throws Exception;	
	void updateBoard(Board board) throws Exception;
	void updateBoardReReq(Board board) throws Exception;
	void deleteBoard(Integer boardNum) throws Exception;
}
