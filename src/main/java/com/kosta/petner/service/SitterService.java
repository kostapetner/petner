package com.kosta.petner.service;

import java.util.List;

import com.kosta.petner.bean.CareService;
import com.kosta.petner.bean.Find;
import com.kosta.petner.bean.PageInfo;
import com.kosta.petner.bean.SitterInfo;

public interface SitterService {

	void regist(SitterInfo sitterInfo);
	
	/* 날짜:22.11.21
	 * 작성자: 김혜경
	 * 내용: 돌봐줄 동물 찾기 리스트 가져오기
	 */
	List<CareService> findPetList(Integer page, PageInfo pageInfo);

	/* 날짜:22.11.22
	 * 작성자: 김혜경
	 * 내용: service_no에 맞는 돌봐줄 동물 찾기 viewForm(디테일페이지)
	 */
	CareService getViewForm(Integer service_no);

	/* 날짜:22.11.22
	 * 작성자: 김혜경
	 * 내용: 돌봐줄 동물 찾기 검색
	 */
	List<CareService> findPetSearch(Find findVO);
}
