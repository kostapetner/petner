package com.kosta.petner.service;

import java.util.List;

import com.kosta.petner.bean.Notice;
import com.kosta.petner.bean.PageInfo;

public interface NoticeService {
	void resistNotice(Notice notice) throws Exception;
	List<Notice> getNoticeList(int page, PageInfo pageInfo) throws Exception;
	Notice getNotice(Integer noticeNum) throws Exception;
	void modifyNotice(Notice notice) throws Exception;
	void noticeReply(Notice notice) throws Exception;
	void deleteNotice(Integer noticeNum) throws Exception;
	void notice_read(int notice_id) throws Exception; // 조회수 증가
}