package com.kosta.petner.service;

import com.kosta.petner.bean.FileVO;

public interface FileService {

	//file_tb에 파일정보 저장
	void insertFile(FileVO fileVO);

	//server_filename에 맞는 file_no값 가져오기
	Integer getFileNo(String server_filename);

}
