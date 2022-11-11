package com.kosta.petner.dao;

import com.kosta.petner.bean.Member;

public interface MemberDAO {
	// 내기본정보가져오기
	Member getMyinfo(String id);
	// 내정보수정
	Member updateMyinfo(Member member);
}
