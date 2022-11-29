package com.kosta.petner.dao;

import java.util.List;

import com.kosta.petner.bean.CareService;
import com.kosta.petner.bean.Find;
import com.kosta.petner.bean.SitterInfo;

public interface SitterDAO {

	void regist(SitterInfo sitterInfo);
	
	// 221125-DSC 시터정보가져오기 & 수정하기
	SitterInfo getSitterInfo(int user_no);
	int updateSitterInfo(SitterInfo sitterInfo);

	//care_service테이블의 전체 게시글
	List<CareService> findPetList(Integer row);

	/* 날짜:22.11.22
	 * 작성자: 김혜경
	 * 내용: service_no에 맞는 돌봐줄 동물 찾기 viewForm(디테일페이지)
	 */
	CareService getViewForm(Integer service_no);

	/* 날짜:22.11.22
	 * 작성자: 김혜경
	 * 내용: 돌봐줄 동물 찾기 검색
	 */
	List<Find> findPetSearch(Find findVO);
	
	
	//List<CareService> findPetSearch(Find findVO);
}
