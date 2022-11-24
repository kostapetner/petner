package com.kosta.petner.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.petner.bean.CareService;
import com.kosta.petner.bean.Find;
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

	//돌봐줄 동물찾기 게시글 가져오기
	@Override
	public List<CareService> findPetList(Integer row) {
		return sqlSession.selectList("mapper.sitter.findPetList", row);
	}

	/* 날짜:22.11.22
	 * 작성자: 김혜경
	 * 내용: service_no에 맞는 돌봐줄 동물 찾기 viewForm(디테일페이지)
	 */
	@Override
	public CareService getViewForm(Integer service_no) {
		return sqlSession.selectOne("mapper.sitter.getViewForm", service_no);
	}

	/* 날짜:22.11.22
	 * 작성자: 김혜경
	 * 내용: 돌봐줄 동물 찾기 검색
	 */
	@Override
	public List<Find> findPetSearch(Find findVO) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		findVO.getPet_kind();
		
		String petKindArray = findVO.getPet_kind();
		System.out.println("petKindArray:   "+petKindArray);
		
		//map.put("petKindArray",petKindArray);
		
		return sqlSession.selectList("mapper.sitter.findPetSearch", findVO);
	}

}
