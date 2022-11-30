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
	@Override // 펫시터정보 업데이트 1125DSC
	public int updateSitterInfo(SitterInfo sitterInfo) {
		return sqlSession.update("mapper.sitter.updateSitterInfo", sitterInfo);
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
	public List<CareService> findPetSearch(Find findVO) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		//st_date
		if(findVO.getSt_date() != null && !findVO.getSt_date().equals("")) {
			map.put("st_date",findVO.getSt_date());
		}else {
			System.out.println("st_date null입니다.");
		}
		//end_date
		if(findVO.getEnd_date() != null && !findVO.getEnd_date().equals("")) {
			map.put("end_date",findVO.getEnd_date());
		}else {
			System.out.println("st_date null입니다.");
		}
		//service
		if(findVO.getService() != null && !findVO.getService().equals("")) {
			map.put("serviceArray",findVO.getService());
		}else {
			System.out.println("서비스 null입니다.");
		}
		//pet_kind
		if(findVO.getPet_kind() != null && !findVO.getPet_kind().equals("")) {
			map.put("petKindArray",findVO.getPet_kind());
		}else {
			System.out.println("동물종류 null입니다.");
		}
		//gender
		if(findVO.getGender() != null && !findVO.getGender().equals("")) {
			map.put("genderArray",findVO.getGender());
		}else {
			System.out.println("성별 null입니다.");
		}
		//keyword
		map.put("keyword",findVO.getKeyword());

		return sqlSession.selectList("mapper.sitter.findPetSearch", map);
	}

	/* 날짜:22.11.30
	 * 작성자: 김혜경
	 * 내용: 펫시터 정보등록시 프로필 사진 users테이블에 update
	 */
	@Override
	public void updateFileNoToUsers(SitterInfo sitterInfo) {
		sqlSession.update("mapper.sitter.updateFileNoToUsers", sitterInfo);
	}

	

}
