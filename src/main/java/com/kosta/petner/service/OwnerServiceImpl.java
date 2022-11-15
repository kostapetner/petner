package com.kosta.petner.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.petner.bean.PetInfo;
import com.kosta.petner.dao.OwnerDAO;

@Service
public class OwnerServiceImpl implements OwnerService {

	@Autowired
	OwnerDAO ownerDAO;
	
	@Override
	public void regist(PetInfo petInfo) throws Exception {
		ownerDAO.regist(petInfo);
	}

	//user_no에 맞는 pet정보를 가져옴
	@Override
	public List<PetInfo> getPetByUserNo(Integer user_no) {
		return ownerDAO.getPetByUserNo(user_no);
	}

	@Override
	public PetInfo getPetByPetNo(Integer pet_no) {
		return ownerDAO.getPetByPetNo(pet_no);
	}

	@Override
	public String getFileByPetNo(Integer pet_no) {
		return ownerDAO.getFileByPetNo(pet_no);
	}

}
