package com.kosta.petner.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.petner.bean.PetInfo;
import com.kosta.petner.bean.SitterInfo;
import com.kosta.petner.bean.Users;
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
	
	
	@Override
	public Users getMyinfo(String id) {
		return usersDAO.getMyinfo(id);
	}
	
	
	

	@Override
	public int updateMyinfo(Users users) {
		return usersDAO.updateMyinfo(users);
	}

	@Override
	public SitterInfo getMySitterinfo(int user_no) {
		
		SitterInfo sitterInfo = sitterDAO.getSitterInfo(user_no);		
		
		// 동물정보바꾸기
		String pet_kind = sitterInfo.getPet_kind(); // mon,tue,wed
		String[] petsArr = pet_kind.split(",");
		String[] pets_ko = {"강아지", "고양이", "새", "관상어", "파충류"};
		String[] pets_en = {"dog", "cat", "bird", "fish", "reptile"};
		List<String> petList = new ArrayList<>();
		
		for(String pets : petsArr ) {
			int i = Arrays.asList(pets_en).indexOf(pets);
			petList.add(pets_ko[i]);
		}
		String petsKo = petList.toString();
		sitterInfo.setPet_kind(petsKo); 
		
		// 요일정보 바꾸기 
		String work_days = sitterInfo.getWork_day(); // mon,tue,wed
		String[] daysArr = work_days.split(",");
		String[] days_ko = {"일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"};
		String[] days_en = {"sun", "mon", "tue", "wed", "thu", "fri", "sat"};
		List<String> dayList = new ArrayList<>();
		
		for(String days : daysArr ) {
			// [wed, thu, fri]의 days_en 인덱스 찾아서 days_ko로 바꾸어라 345 나와야함
			int i = Arrays.asList(days_en).indexOf(days);
			//System.out.println("korean"+days_ko[a]);
			dayList.add(days_ko[i]);
		}
		// 요일정보
		String daysKo = dayList.toString();
		sitterInfo.setWork_day(daysKo); 
		
		// 서비스정보
		String service = sitterInfo.getService();
		String[] serviceArr = service.split(",");
		String[] service_ko = {"산책", "목욕", "방문관리", "교육"};
		String[] service_en = {"walk", "shower","visit", "education"};
		List<String> servList = new ArrayList<>();
		
		for(String servies : serviceArr ) {
			int i = Arrays.asList(service_en).indexOf(servies);
			servList.add(service_ko[i]);
		}
		String servKo = servList.toString();
		sitterInfo.setService(servKo); 
		
		return sitterInfo;
		//return sitterDAO.getSitterInfo(user_no);
	}

	@Override
	public List<PetInfo> getMyPetinfo(int user_no) {
		return ownerDAO.getPetByUserNo(user_no);
	}

	@Override
	public Object getMyAllInfo(int user_no) {
		// 마이페이지에서 물고 다녀야 하는 모든 정보
		return usersDAO.getMyAllInfo(user_no);
	}




	@Override
	public Map<String, Object> getCount(int user_no) {
		// TODO Auto-generated method stub
		return usersDAO.getCount(user_no);
	}



	

}
