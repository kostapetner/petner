package com.kosta.petner.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.petner.bean.PetInfo;
import com.kosta.petner.bean.SitterInfo;
import com.kosta.petner.bean.Users;
import com.kosta.petner.dao.OwnerDAO;
import com.kosta.petner.dao.SitterDAO;
import com.kosta.petner.dao.UsersDAO;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	UsersDAO usersDAO;
	
	@Autowired
	SitterDAO sitterDAO;
	
	@Autowired
	OwnerDAO ownerDAO;
	
	
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

	@Override
	public List<PetInfo> getMyPetinfo(int user_no) {
		return ownerDAO.getPetByUserNo(user_no);
	}

	@Override
	public Object getMyAllInfo(int user_no) {
		// 마이페이지에서 물고 다녀야 하는 모든 정보
		return usersDAO.getMyAllInfo(user_no);
	}




	@Override
	public Map<String, Object> getCount(int user_no) {
		// TODO Auto-generated method stub
		return usersDAO.getCount(user_no);
	}



	

}
