package com.kosta.petner.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.petner.bean.PageInfo;
import com.kosta.petner.bean.PetInfo;
import com.kosta.petner.bean.Review;
import com.kosta.petner.bean.SitterInfo;
import com.kosta.petner.bean.Users;
import com.kosta.petner.dao.FileDAO;
import com.kosta.petner.dao.MypageDAO;
import com.kosta.petner.dao.OwnerDAO;
import com.kosta.petner.dao.SitterDAO;
import com.kosta.petner.dao.UsersDAO;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	UsersDAO usersDAO;
	
	@Autowired
	SitterDAO sitterDAO;
	
	@Autowired
	OwnerDAO ownerDAO;
	
	@Autowired
	FileDAO fileDAO;
	
	@Autowired
	MypageDAO mypageDAO;
	
	// 기본정보
	@Override
	public Users getMyinfo(String id) {
		return usersDAO.getMyinfo(id);
	}
	@Override
	public int updateMyinfo(Users users) {
		return usersDAO.updateMyinfo(users);
	}
	
	// 펫시터 관련
	@Override
	public SitterInfo getMySitterinfo(int user_no) {
		return sitterDAO.getSitterInfo(user_no);
	}
	
	@Override
	public int updateMySitterInfo(SitterInfo sitterInfo) {
		return sitterDAO.updateSitterInfo(sitterInfo);
	}
	
	// 보호자 관련
	@Override
	public List<PetInfo> getMyPetinfo(int user_no) {
		return ownerDAO.getPetByUserNo(user_no);
	}
	
	
	// 마이페이지 세션에 필요한 정보
	@Override
	public Object getMyAllInfo(int user_no) {
		// 마이페이지에서 물고 다녀야 하는 모든 정보
		return usersDAO.getMyAllInfo(user_no);
	}

	@Override // 시터정보 동물정보 카운트
	public Map<String, Object> getCount(int user_no) {
		// TODO Auto-generated method stub
		return usersDAO.getCount(user_no);
	}
	
	//마이페이지 필요할 파일이름
	@Override
	public String getFile(Integer fileNo) {
		return fileDAO.getServerFilename(fileNo);
	}
	
	//내가 쓴 리뷰
	@Override
	public List<Review> writtenReviewList(Integer page, PageInfo pageInfo) throws Exception {
		int listCount = mypageDAO.selectWrittenReviewCount();	//전체 게시글 수
		int maxPage = (int)Math.ceil((double)listCount/10.0);	//전체 페이지 수, 올림처리
		int startPage = page / 10 * + 1;	//현재 패이지에 보여줄 시작 페이지 버튼 (1, 11, 21 ....)
		int endPage = startPage + 10 - 1;	//현재 페이지에 보여줄 마지막 페이지 버튼(10, 20, 30 ....)
		if(endPage>maxPage) endPage = maxPage;
		
		pageInfo.setPage(page);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		
		int row = (page-1)*10+1;
		return mypageDAO.writtenReviewList(row);
	}




	



	

}
