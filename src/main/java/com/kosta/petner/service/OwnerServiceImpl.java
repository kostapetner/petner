package com.kosta.petner.service;

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

}
