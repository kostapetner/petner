package com.kosta.petner.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.petner.dao.FindSitterDAO;

@Service
public class FindSitterServiceImpl implements FindSitterService{

	@Autowired
	FindSitterDAO findSitterDAO;
	
//	@Override
//	public Integer getId() throws Exception {
//		return testDAO.getId();
//	}

}
