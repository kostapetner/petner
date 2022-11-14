package com.kosta.petner.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.petner.bean.SitterInfo;
import com.kosta.petner.bean.Users;
import com.kosta.petner.dao.SitterDAO;
import com.kosta.petner.dao.UsersDAO;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	UsersDAO usersDAO;
	@Autowired
	SitterDAO sitterDAO;
	
	@Override
	public Users getMyinfo(String id) {
		return usersDAO.getMyinfo(id);
	}

	@Override
	public int updateMyinfo(Users users) {
		return usersDAO.updateMyinfo(users);
	}

	@Override
	public SitterInfo getMySitterinfo(int user_no) {
		return sitterDAO.getSitterInfo(user_no);
	}

}
