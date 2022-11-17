package com.kosta.petner.service;

import com.kosta.petner.bean.PetInfo;
import com.kosta.petner.bean.SitterInfo;
import com.kosta.petner.bean.Users;


public interface MypageService {
	// 나의 기본정보
	Users getMyinfo(String id);
	// 나의정보 수정
	int updateMyinfo(Users users);
	
	// 나의 시터정보 가져오기
	SitterInfo getMySitterinfo(int user_no);
	
	// 나의 반려동물 정보 가져오기
	PetInfo getMyPetinfo(int user_no);
	
	// 마이페이지 ALL INFO
	Object getMyAllInfo(int user_no);
	
} 
