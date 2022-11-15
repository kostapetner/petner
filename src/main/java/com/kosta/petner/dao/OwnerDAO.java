package com.kosta.petner.dao;

import java.util.List;

import com.kosta.petner.bean.PetInfo;

public interface OwnerDAO {

	void regist(PetInfo petInfo)throws Exception;

	//user_no에 맞는 pet정보를 가져옴
	List<PetInfo> getPetByUserNo(Integer user_no);

	PetInfo getPetByPetNo(Integer pet_no);

}
