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

	@Override // 보호자의 반려동물 정보가져오기 221115_DSC
	public PetInfo getPetInfo(int user_no) {
		return sqlSession.selectOne("mapper.owner.getPetInfo", user_no);
	}

}
