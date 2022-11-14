package com.kosta.petner.service;

import java.util.List;

import com.kosta.petner.bean.Board;
import com.kosta.petner.bean.PageInfo;

public interface BoardService {
	void resistBoard(Board board) throws Exception;
	List<Board> getBoardList(int page, PageInfo pageInfo) throws Exception;
	Board getBoard(Integer boardNum) throws Exception;
	void modifyBoard(Board board) throws Exception;
	void boardReply(Board board) throws Exception;
	void deleteBoard(Integer boardNum) throws Exception;
}
