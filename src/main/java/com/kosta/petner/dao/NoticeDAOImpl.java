package com.kosta.petner.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.petner.bean.Notice;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public void insertNotice(Notice notice) throws Exception {
		sqlSession.insert("mapper.notice.insertNotice", notice);
	}

	@Override
	public Integer selectMaxNoticeNum() throws Exception {
		return sqlSession.selectOne("mapper.notice.selectMaxNoticeNum");
	}

	@Override
	public List<Notice> selectNoticeList(Integer row) throws Exception {
		return sqlSession.selectList("mapper.notice.selectNoticeList", row);
	}

	@Override
	public Integer selectNoticeCount() throws Exception {
		return sqlSession.selectOne("mapper.notice.selectNoticeCount");
	}

	@Override
	public Notice selectNotice(Integer notice_no) throws Exception {
		return sqlSession.selectOne("mapper.notice.selectNotice", notice_no);
	}

	@Override
	public void updateNotice(Notice notice) throws Exception {
		sqlSession.update("mapper.notice.updateNotice", notice);
	}

	@Override
	public void updateNoticeReReq(Notice notice) throws Exception {
		sqlSession.update("mapper.notice.updateNoticeReReq", notice);
	}

	@Override
	public void deleteNotice(Integer noticeNum) throws Exception {
		sqlSession.update("mapper.notice.deleteNotice", noticeNum);
	}

	// 조회수 증가
	@Override
	public void notice_read(int notice_no) throws Exception {
		sqlSession.update("mapper.notice.read", notice_no);
		
	}
}