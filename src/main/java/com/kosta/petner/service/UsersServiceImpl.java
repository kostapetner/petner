package com.kosta.petner.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.kosta.petner.bean.Users;
import com.kosta.petner.dao.UsersDAO;

@Service
public class UsersServiceImpl implements UsersService {

	@Autowired
	UsersDAO usersDAO;
	
	
	@Override
	public void joinUsers(Users users) throws Exception {
		System.out.println("service:" +users);
		Users usersvo = usersDAO.selectId(users.getId());
		if(usersvo!=null) throw new Exception("아이디 중복");
		usersDAO.insertUsers(users);
		
	}


	@Override
	public boolean isDoubleId(String id) throws Exception {
		
		Users users = usersDAO.selectId(id);
		if(users==null) return false;
		return true;
	}


	
	@Override
	public Users getUsers(Users users) {
		return usersDAO.getUsers(users.getId(), users.getPassword());
			}


	@Override
	public Users getId(Users users) {
		return usersDAO.getId(users);
			}
}



	
	
	


	
