package com.kosta.petner.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.petner.bean.Member;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override 
	public Member getMyinfo(String id){		
		return sqlSession.selectOne("mapper.member.getMyinfo", id);
	}
	
	
}
