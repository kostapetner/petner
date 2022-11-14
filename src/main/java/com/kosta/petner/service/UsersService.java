package com.kosta.petner.service;




import javax.servlet.http.HttpServletResponse;

import com.kosta.petner.bean.Users;

public interface UsersService {
	//회원가입
	public void joinUsers(Users users) throws Exception;
	
	//중복체크
	public boolean isDoubleId(String id) throws Exception;
	
	//로그인
	public Users getUsers(Users users);
	
	//아이디 찾기
	public Users findId(Users users);
	
	//이메일발송
	public void sendEmail(Users users, String div) throws Exception;

	//비밀번호찾기
	public void findPass(HttpServletResponse response, Users users) throws Exception;

	
}
