package com.kosta.petner.service;

import com.kosta.petner.bean.Users;


public interface MypageService {
	// 나의 기본정보
	Users getMyinfo(String id);
	// 나의정보 수정
	int updateMyinfo(Users users);
	
} 
