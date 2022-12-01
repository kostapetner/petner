package com.kosta.petner.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.petner.bean.CareService;
import com.kosta.petner.bean.PetInfo;
import com.kosta.petner.bean.SitterInfo;

@Repository
public class OwnerDAOImpl implements OwnerDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public void regist(PetInfo petInfo) throws Exception {
		sqlSession.insert("mapper.owner.regist", petInfo);

	}

	
	
	// 메인 => 펫시터찾기 221130 DSC
	@Override
	public List<Map<String, Object>> getAllAvailSitter() {
		return sqlSession.selectList("mapper.owner.getAllAvailSitter");
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

	@Override
	public String getFileByPetNo(Integer pet_no) {
		return sqlSession.selectOne("mapper.owner.getFileByPetNo", pet_no);
	}

	@Override
	public void insertRequireServiceFrom(CareService careService) {
		sqlSession.insert("mapper.owner.insertRequireServiceFrom", careService);
	}

	@Override
	public List<CareService> getServiceList(Integer user_no, Integer row) {
		Map<String,Object>map = new HashMap<String,Object>();
		map.put("user_no", user_no);
		map.put("row", row);
		return sqlSession.selectList("mapper.owner.getServiceList", map);
	}

	@Override
	public Integer csListCount(Integer user_no) {
		return sqlSession.selectOne("mapper.owner.csListCount", user_no);
	}

	@Override
	public int csListAllCount() {
		return sqlSession.selectOne("mapper.owner.csListAllCount");
	}
	
	// 동물 한마리 정보 가져오기 221130DSC 
	@Override
	public PetInfo getMyPetByPetNo(Map<String, Object> param) {
		return sqlSession.selectOne("mapper.owner.getMyPetByPetNo", param);
	}
	
	

}
