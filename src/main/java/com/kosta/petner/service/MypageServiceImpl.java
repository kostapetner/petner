package com.kosta.petner.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.petner.bean.Member;
import com.kosta.petner.dao.MemberDAO;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public Member getMyinfo(String id) {
		return memberDAO.getMyinfo(id);
	}

	@Override
	public Member updateMyinfo(Member member) {
		return memberDAO.updateMyinfo(member);
	}

}
