package com.kosta.petner.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.petner.bean.PageInfo;
import com.kosta.petner.bean.Qna;
import com.kosta.petner.dao.QnaDAO;
	
@Service
public class QnaServiceImpl implements QnaService {
	@Autowired
	QnaDAO qnaDAO;
	@Override
	public void resistQna(Qna qna) throws Exception {
		Integer qnaNum = qnaDAO.selectMaxQnaNum();
		if(qnaNum==null) qnaNum = 1;
		else qnaNum = qnaNum+1; 
		qna.setQna_no(qnaNum);
		qna.setQna_re_ref(qnaNum);
		qna.setQna_re_lev(0);
		qna.setQna_re_seq(0);
		qna.setQna_hit(0);
		qnaDAO.insertQna(qna);
	}
	@Override
	public List<Qna> getQnaList(int page, PageInfo pageInfo) throws Exception {
		int listCount = qnaDAO.selectQnaCount();  // 전체 게시글 수
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
		return qnaDAO.selectQnaList(row);
	}
	@Override
	public Qna getQna(Integer qnaNum) throws Exception {
		return qnaDAO.selectQna(qnaNum);
	}
	@Override
	public void modifyQna(Qna qna) throws Exception {
//		String password = qnaDAO.selectQna(qna.getQna_no()).getQna_pass();
//		if(!password.equals(qna.getQna_pass())) {
//			throw new Exception("수정 권한 없음");
//		}
		qnaDAO.updateQna(qna);
	}
	@Override
	public void qnaReply(Qna qna) throws Exception {
		Qna srcQna = getQna(qna.getQna_no());  //원글정보
		qnaDAO.updateQnaReReq(srcQna);
		Integer qnaNum = qnaDAO.selectMaxQnaNum()+1;
		qna.setQna_no(qnaNum);
		qna.setQna_re_ref(srcQna.getQna_re_ref());
		qna.setQna_re_lev(srcQna.getQna_re_lev()+1);
		qna.setQna_re_seq(srcQna.getQna_re_seq()+1);
		qnaDAO.insertQna(qna);
	}
	@Override
	public void deleteQna(Integer qnaNum) throws Exception {
		Qna qna = getQna(qnaNum);
		System.out.println("Service:"+qnaNum);
		System.out.println("Service:"+qna);
		qnaDAO.deleteQna(qnaNum);
	}
	
	// 조회수 증가
	@Override
	public void qna_read(int qna_id) throws Exception {
		qnaDAO.qna_read(qna_id);
	}

}
