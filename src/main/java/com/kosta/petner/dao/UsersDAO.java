package com.kosta.petner.dao;

import com.kosta.petner.bean.UsersVo;

public interface UsersDAO {

	//회원가입
	void insertUsers(UsersVo usersVo) throws Exception;
	
	//아이디 중복체크
	UsersVo selectId(String id)throws Exception;
	
	//로그인
	UsersVo getUsers(UsersVo usersVo) throws Exception;

	int doLoginCnt(UsersVo usersVo) throws Exception;
	
}
