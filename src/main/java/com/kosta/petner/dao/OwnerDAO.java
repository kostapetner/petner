package com.kosta.petner.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kosta.petner.bean.CareService;
import com.kosta.petner.bean.PetInfo;

public interface OwnerDAO {

	void regist(PetInfo petInfo)throws Exception;
	
	// 보호자의 반려동물 정보가져오기 221115_DSC
	PetInfo getPetInfo(int user_no);

	//user_no에 맞는 pet정보를 가져옴
	List<PetInfo> getPetByUserNo(Integer user_no);

	PetInfo getPetByPetNo(Integer pet_no);

	String getFileByPetNo(Integer pet_no);

	void insertRequireServiceFrom(CareService careService);

	//List<CareService> getServiceList(Integer user_no);
	//페이징+리스트
	List<CareService> getServiceList(@Param("user_no") Integer user_no, @Param("row") Integer row);
	
	//user_no가 조건으로 들어간 리스트 수
	Integer csListCount(Integer user_no);

	//전체 care_service 게시글 수
	int csListAllCount();

	//care_service테이블의 전체 게시글 수
	List<CareService> findPetList(Integer row);

}
