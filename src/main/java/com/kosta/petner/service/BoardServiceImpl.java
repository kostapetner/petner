package com.kosta.petner.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.petner.bean.Board;
import com.kosta.petner.bean.PageInfo;
import com.kosta.petner.dao.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDAO boardDAO;
	@Override
	public void resistBoard(Board board) throws Exception {
		Integer boardNum = boardDAO.selectMaxBoardNum();
		if(boardNum==null) boardNum = 1;
		else boardNum = boardNum+1; 
		board.setBoard_num(boardNum);
		board.setBoard_re_ref(boardNum);
		board.setBoard_re_lev(0);
		board.setBoard_re_seq(0);
		board.setBoard_readcount(0);
		boardDAO.insertBoard(board);
	}
	@Override
	public List<Board> getBoardList(int page, PageInfo pageInfo) throws Exception {
		int listCount = boardDAO.selectBoardCount();  // 전체 게시글 수
		int maxPage = (int)Math.ceil((double)listCount/10);  //전체 페이지 수, 올림처리
		int startPage = page/10 * 10 + 1; //현재 페이지에 보여줄 시작 페이지 버튼(1,11,21 등...) 
		int endPage = startPage + 10 - 1; //현제 페이지에 보여줄 마지막 페이지 버튼(10,20,30 등...) 
		if(endPage>maxPage) endPage = maxPage;
		
		pageInfo.setPage(page);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		
		int row = (page-1)*10+1;		
		return boardDAO.selectBoardList(row);
	}
	@Override
	public Board getBoard(Integer boardNum) throws Exception {
		return boardDAO.selectBoard(boardNum);
	}
	@Override
	public void modifyBoard(Board board) throws Exception {
		String password = boardDAO.selectBoard(board.getBoard_num()).getBoard_pass();
		if(!password.equals(board.getBoard_pass())) {
			throw new Exception("수정 권한 없음");
		}
		boardDAO.updateBoard(board);
	}
	@Override
	public void boardReply(Board board) throws Exception {
		Board srcBoard = getBoard(board.getBoard_num());  //원글정보
		boardDAO.updateBoardReReq(srcBoard);
		Integer boardNum = boardDAO.selectMaxBoardNum()+1;
		board.setBoard_num(boardNum);
		board.setBoard_re_ref(srcBoard.getBoard_re_ref());
		board.setBoard_re_lev(srcBoard.getBoard_re_lev()+1);
		board.setBoard_re_seq(srcBoard.getBoard_re_seq()+1);
		boardDAO.insertBoard(board);
	}
	@Override
	public void deleteBoard(Integer boardNum) throws Exception {
		Board board = getBoard(boardNum);
		System.out.println("Service:"+boardNum);
		System.out.println("Service:"+board);
		// if(!board.getBoard_pass().equals(password)) throw new Exception("삭제 권한 없음");
		boardDAO.deleteBoard(boardNum);
	}
}