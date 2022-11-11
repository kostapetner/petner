package com.kosta.petner.dao;

import com.kosta.petner.bean.Users;

public interface UsersDAO {

	//회원가입
	void insertUsers(Users users) throws Exception;
	
	//아이디 중복체크
	Users selectId(String id)throws Exception;
	
	// 아이디+비번으로 로그인하기
	Users getUsers(String id, String password);
	
	//이름+이메일로 아이디 찾기
	Users getId(String name, String email);
}
