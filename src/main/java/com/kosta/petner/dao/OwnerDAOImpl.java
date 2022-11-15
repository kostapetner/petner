package com.kosta.petner.dao;

import java.util.List;

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

	//user_no에 맞는 pet정보를 가져옴
	@Override
	public List<PetInfo> getPetByUserNo(Integer user_no) {
		return sqlSession.selectList("mapper.owner.getPetByUserNo", user_no);
	}

	@Override
	public PetInfo getPetByPetNo(Integer pet_no) {
		return sqlSession.selectOne("mapper.owner.getPetByPetNo", pet_no);
	}

}
