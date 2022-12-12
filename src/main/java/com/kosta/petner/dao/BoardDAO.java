package com.kosta.petner.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.petner.bean.Board;
import com.kosta.petner.bean.BoardCommentVO;
import com.kosta.petner.bean.BoardPage;
import com.kosta.petner.service.BoardService;

@Repository
public class BoardDAO implements BoardService {
	@Autowired private SqlSession sql;
	
	@Override
	public int board_insert(Board vo) {
		return sql.insert("mapper.board.insert", vo);
	}

	@Override
	public BoardPage board_list(BoardPage page) {
		page.setTotalList((Integer) sql.selectOne("mapper.board.total", page));
		page.setList(sql.selectList("mapper.board.list", page));
		return page;
	}

	@Override
	public Board board_detail(int id) {
		return sql.selectOne("mapper.board.detail", id);
	}

	@Override
	public void board_read(int id) {
		sql.update("mapper.board.read", id);
	}

	@Override
	public int board_update(Board vo) {
		return sql.update("mapper.board.update", vo);
	}

	@Override
	public int board_delete(int id) {
		return sql.delete("mapper.board.delete", id);
	}

	@Override
	public int board_comment_insert(BoardCommentVO vo) {
		return sql.insert("mapper.board.comment_insert", vo);
	}

	@Override
	public List<BoardCommentVO> board_comment_list(int pid) {
		return sql.selectList("mapper.board.comment_list", pid);
	}

	@Override
	public int board_comment_update(BoardCommentVO vo) {
		return sql.update("mapper.board.comment_update", vo);
	}

	@Override
	public int board_comment_delete(int id) {
		return sql.delete("mapper.board.comment_delete", id);
	}
}