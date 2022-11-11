package com.kosta.petner.service;




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
	
	//비밀번호 찾기
	public Users findPassword(Users users);
	
	//비밀번호 수정
	public void ModifyPassword(Users users);
	
}
