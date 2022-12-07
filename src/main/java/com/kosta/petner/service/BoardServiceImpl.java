package com.kosta.petner.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.petner.bean.Board;
import com.kosta.petner.bean.BoardCommentVO;
import com.kosta.petner.bean.BoardPage;
import com.kosta.petner.dao.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired private BoardDAO dao;

	@Override
	public int board_insert(Board vo) {
		return dao.board_insert(vo);
	}

	@Override
	public BoardPage board_list(BoardPage page) {
		return dao.board_list(page);
	}

	@Override
	public Board board_detail(int id) {
		return dao.board_detail(id);
	}

	@Override
	public void board_read(int id) {
		dao.board_read(id);
	}

	@Override
	public int board_update(Board vo) {
		return dao.board_update(vo);
	}

	@Override
	public int board_delete(int id) {
		return dao.board_delete(id);
	}

	@Override
	public int board_comment_insert(BoardCommentVO vo) {
		return dao.board_comment_insert(vo);
	}

	@Override
	public List<BoardCommentVO> board_comment_list(int pid) {
		return dao.board_comment_list(pid);
	}

	@Override
	public int board_comment_update(BoardCommentVO vo) {
		return dao.board_comment_update(vo);
	}

	@Override
	public int board_comment_delete(int id) {
		return dao.board_comment_delete(id);
	}

}
