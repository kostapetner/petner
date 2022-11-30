package com.kosta.petner.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.petner.bean.CareService;
import com.kosta.petner.bean.Find;
import com.kosta.petner.bean.PageInfo;
import com.kosta.petner.bean.SitterInfo;
import com.kosta.petner.dao.OwnerDAO;
import com.kosta.petner.dao.SitterDAO;

@Service
public class SitterServiceImpl implements SitterService {

	@Autowired
	SitterDAO sitterDAO;

	@Autowired
	OwnerDAO ownerDAO;

	@Override
	public void regist(SitterInfo sitterInfo) {
		sitterDAO.regist(sitterInfo);
	}

	/* 날짜:22.11.21
	 * 작성자: 김혜경
	 * 내용: 돌봐줄 동물 찾기 리스트 가져오기
	 */
	@Override
	public List<CareService> findPetList(Integer page, PageInfo pageInfo) {
		int listCount = ownerDAO.csListAllCount(); //전체 게시글 수
		int maxPage = (int)Math.ceil((double)listCount/10); //전체 페이지 수, 올림 처리
		int startPage = page/10 * 10 + 1;         //현재 페이지 보여줄 시작 페이지 버튼(1,11,21, 등...)
		int endPage = startPage +10 -1;           //현재 페이지에 보여줄 마지막 페이지 버튼(10, 20, 30, 등..)
		if(endPage > maxPage) endPage = maxPage;
		
		pageInfo.setPage(page);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		
		Integer row = (page-1)*10+1;
		return sitterDAO.findPetList(row);
	}

	/* 날짜:22.11.22
	 * 작성자: 김혜경
	 * 내용: service_no에 맞는 돌봐줄 동물 찾기 viewForm(디테일페이지)
	 */
	@Override
	public CareService getViewForm(Integer service_no) {
		return sitterDAO.getViewForm(service_no);
	}

	/* 날짜:22.11.22
	 * 작성자: 김혜경
	 * 내용: 돌봐줄 동물 찾기 검색
	 */
	@Override
	public List<CareService> findPetSearch(Find findVO) {
		return sitterDAO.findPetSearch(findVO);
	}

	/* 날짜:22.11.30
	 * 작성자: 김혜경
	 * 내용: 펫시터 정보등록시 프로필 사진 users테이블에 update
	 */
	@Override
	public void updateFileNoToUsers(SitterInfo sitterInfo) {
		sitterDAO.updateFileNoToUsers(sitterInfo);
	}
}
