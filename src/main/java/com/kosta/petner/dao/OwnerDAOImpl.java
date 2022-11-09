package com.kosta.petner.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.petner.bean.PetInfo;

@Repository
public class OwnerDAOImpl implements OwnerDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public void regist(PetInfo petInfo) throws Exception {
		sqlSession.insert("mapper.owner.regist", petInfo);

	}

}
