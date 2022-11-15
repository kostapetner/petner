package com.kosta.petner.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.petner.bean.Notice;
import com.kosta.petner.bean.PageInfo;
import com.kosta.petner.dao.NoticeDAO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeDAO noticeDAO;
	@Override
	public void resistNotice(Notice notice) throws Exception {
		Integer noticeNum = noticeDAO.selectMaxNoticeNum();
		if(noticeNum==null) noticeNum = 1;
//		else boardNum = boardNum+1; 
//		board.setBoard_num(boardNum);
//		board.setBoard_re_ref(boardNum);
//		board.setBoard_re_lev(0);
//		board.setBoard_re_seq(0);
		notice.setNotice_readcount(0);
		noticeDAO.insertNotice(notice);
	}
	@Override
	public List<Notice> getNoticeList(int page, PageInfo pageInfo) throws Exception {
		int listCount = noticeDAO.selectNoticeCount();  // 전체 게시글 수
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
		return noticeDAO.selectNoticeList(row);
	}
	@Override
	public Notice getNotice(Integer noticeNum) throws Exception {
		return noticeDAO.selectNotice(noticeNum);
	}
	@Override
	public void modifyNotice(Notice notice) throws Exception {
		String password = noticeDAO.selectNotice(notice.getNotice_no()).getNotice_pass();
		if(!password.equals(notice.getNotice_pass())) {
			throw new Exception("수정 권한 없음");
		}
		noticeDAO.updateNotice(notice);
	}
	@Override
	public void noticeReply(Notice notice) throws Exception {
		Notice srcNotice = getNotice(notice.getNotice_no());  //원글정보
		noticeDAO.updateNoticeReReq(srcNotice);
		Integer noticeNum = noticeDAO.selectMaxNoticeNum()+1;
		notice.setNotice_no(noticeNum);
		notice.setNotice_re_ref(srcNotice.getNotice_re_ref());
		notice.setNotice_re_lev(srcNotice.getNotice_re_lev()+1);
		notice.setNotice_re_seq(srcNotice.getNotice_re_seq()+1);
		noticeDAO.insertNotice(notice);
	}
	@Override
	public void deleteNotice(Integer noticeNum) throws Exception {
		Notice notice = getNotice(noticeNum);
		System.out.println("Service:"+noticeNum);
		System.out.println("Service:"+notice);
		noticeDAO.deleteNotice(noticeNum);
	}
}