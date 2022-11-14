package com.kosta.petner.dao;

import com.kosta.petner.bean.SitterInfo;

public interface SitterDAO {

	void regist(SitterInfo sitterInfo);
	
	// 221114-DSC 시터정보가져오기
	SitterInfo getSitterInfo(int user_no);

}
