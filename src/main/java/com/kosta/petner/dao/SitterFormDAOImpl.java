package com.kosta.petner.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.petner.bean.SitterInfo;

@Repository
public class SitterFormDAOImpl implements SitterFormDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public void regist(SitterInfo sitterInfo) {
		sqlSession.insert("mapper.sitterForm.regist", sitterInfo);
	}

}
