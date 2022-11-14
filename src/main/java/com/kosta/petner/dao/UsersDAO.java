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
	
	//비밀번호 수정
<<<<<<< HEAD
	void updatePw(Users users) throws Exception;
	
	
=======
	void passwordUpdate(Users users);
	
	// 유저정보가져오기
	Users getMyinfo(String id);
	
	
	// 유저정보업데이트
	int updateMyinfo(Users users);
>>>>>>> 65f0f729fe214b597b093506aad9949f4fbd411e
}
