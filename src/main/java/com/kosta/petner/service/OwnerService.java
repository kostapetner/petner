package com.kosta.petner.service;

import java.util.List;

import com.kosta.petner.bean.CareService;
import com.kosta.petner.bean.PetInfo;

public interface OwnerService {

	void regist(PetInfo petInfo)throws Exception;
	
	/* 작성자: 김혜경
	 * 내용: user_no에 맞는 pet정보를 가져옴
	 */
	List<PetInfo> getPetByUserNo(Integer user_no);

	PetInfo getPetByPetNo(Integer pet_no);

	String getFileByPetNo(Integer pet_no);

	
	/* 날짜:22.11.16
	 * 작성자: 김혜경
	 * 내용: 펫시팅 서비스 신청
	 */
	void insertRequireServiceFrom(CareService careService);

	/* 날짜:22.11.17
	 * 작성자: 김혜경
	 * 내용: 시터 서비스 신청 list가져오기
	 */
	List<CareService> getServiceList(Integer user_no);
	
	/* 날짜:22.11.17
	 * 작성자: 김혜경
	 * 내용: 시터 서비스 신청 list 수 가져오기
	 */
	Integer csListCount(Integer user_no);

	
}
