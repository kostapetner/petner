package com.kosta.petner.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.petner.bean.SitterInfo;

@Repository
public class SitterDAOImpl implements SitterDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public void regist(SitterInfo sitterInfo) {
		sqlSession.insert("mapper.sitter.regist", sitterInfo);
	}

	@Override //221114-DSC 시터정보가져오기
	public SitterInfo getSitterInfo(int user_no) {
		return sqlSession.selectOne("mapper.sitter.getSitterInfo", user_no);		
	}

}
