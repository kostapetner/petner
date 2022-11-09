package com.kosta.petner.service;

import com.kosta.petner.bean.Member;


public interface MypageService {
	// 나의 기본정보
	Member getMyinfo(String id);
	
}
