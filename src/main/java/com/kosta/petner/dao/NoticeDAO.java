package com.kosta.petner.dao;

import java.util.List;

import com.kosta.petner.bean.Board;
import com.kosta.petner.bean.Notice;


public interface NoticeDAO {
	void insertNotice(Notice notice) throws Exception; // 게시판 추가
	Integer selectMaxNoticeNum() throws Exception; // 전체글갯수
	List<Notice> selectNoticeList(Integer row) throws Exception;
	Integer selectNoticeCount() throws Exception;
	Notice selectNotice(Integer notice_no) throws Exception;	
	void updateNotice(Notice notice) throws Exception;
	void updateNoticeReReq(Notice notice) throws Exception;
	void deleteNotice(Integer noticeNum) throws Exception;
}
