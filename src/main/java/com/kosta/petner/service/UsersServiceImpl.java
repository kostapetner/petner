package com.kosta.petner.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.kosta.petner.bean.UsersVo;
import com.kosta.petner.dao.UsersDAO;

@Service
public class UsersServiceImpl implements UsersService {

	@Autowired
	UsersDAO usersDAO;
	
	
	@Override
	public void joinUsers(UsersVo usersVo) throws Exception {
		System.out.println("service:" +usersVo);
		UsersVo users = usersDAO.selectId(usersVo.getId());
		if(users!=null) throw new Exception("아이디 중복");
		usersDAO.insertUsers(usersVo);
		
	}


	@Override
	public boolean isDoubleId(String id) throws Exception {
		
		UsersVo users = usersDAO.selectId(id);
		if(users==null) return false;
		return true;
	}


	@Override
	public UsersVo getUsers(UsersVo usersVo) throws Exception {
		return usersDAO.getUsers(usersVo);
	}


	@Override
	public int doLoginCnt(UsersVo usersVo) throws Exception {
		return usersDAO.doLoginCnt(usersVo);
	}
	
	


	

}
