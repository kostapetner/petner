package com.kosta.petner.service;

import java.util.List;

import com.kosta.petner.bean.PetInfo;

public interface OwnerService {

	void regist(PetInfo petInfo)throws Exception;

	//user_no에 맞는 pet정보를 가져옴
	List<PetInfo> getPetByUserNo(Integer user_no);

	PetInfo getPetByPetNo(Integer pet_no);

	String getFileByPetNo(Integer pet_no);

	
}
