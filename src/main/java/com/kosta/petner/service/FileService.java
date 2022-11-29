package com.kosta.petner.service;

import com.kosta.petner.bean.FileVO;

public interface FileService {

	//file_tb에 파일정보 저장
	void insertFile(FileVO fileVO);

	//server_filename에 맞는 file_no값 가져오기
	Integer getFileNo(String server_filename);

	/* 날짜:22.11.16
	 * 작성자: 김혜경
	 * 내용: file_no에 맞는 ServerFilename 가져오기
	 */
	String getServerFilename(Integer file_no);
	
	// 시터 파일 정보 수정 (프로필 이미지 정보) 221129DSC

	void updateSitterImage(FileVO fileVo);

}
