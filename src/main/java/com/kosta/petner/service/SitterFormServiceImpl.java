package com.kosta.petner.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.petner.bean.SitterInfo;
import com.kosta.petner.dao.SitterFormDAO;

@Service
public class SitterFormServiceImpl implements SitterFormService {

	@Autowired
	SitterFormDAO sitterFormDAO;


	@Override
	public void regist(SitterInfo sitterInfo) {
		sitterFormDAO.regist(sitterInfo);
	}

}
