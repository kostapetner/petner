package com.kosta.petner.dao;

import com.kosta.petner.bean.PetInfo;

public interface OwnerDAO {

	void regist(PetInfo petInfo)throws Exception;
	
	// 보호자의 반려동물 정보가져오기 221115_DSC
	PetInfo getPetInfo(int user_no);

}
