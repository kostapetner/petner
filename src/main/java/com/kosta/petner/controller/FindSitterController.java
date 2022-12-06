package com.kosta.petner.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.kosta.petner.bean.Find;
import com.kosta.petner.bean.Users;
import com.kosta.petner.service.OwnerService;
import com.kosta.petner.service.UsersService;

@Controller
public class FindSitterController {
	// 메인화면 => 펫시터 찾기 관련 컨트롤러 
	
	@Autowired
	OwnerService ownerService;
	
	@Autowired
	UsersService usersService;
	
	//펫시터찾기
	@RequestMapping(value = "/findSitter", method = RequestMethod.GET)
	String findSitter(Model model, HttpServletRequest request){
		//System.out.print("체크");
		//List<SitterInfo> sitterList = ownerService.getAllAvailSitter();
		//List<Map<String, Object>> avaiSitterList = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> availSitterList = ownerService.getAllAvailSitter();
		System.out.println("====뿅======:"+availSitterList);
		
		String[] days_ko = { "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" };
		String[] days_en = { "sun", "mon", "tue", "wed", "thu", "fri", "sat" };
		
		List<String> dayList = new ArrayList<>();
		int i = 0 ;
		
		for(Map<String, Object> days : availSitterList ) {
			
			String work_days = (String) days.get("WORK_DAY"); // mon,tue
			System.out.println("1차 List에서 workday=>"+work_days);
			String[] daysArr = work_days.split(",");
			
			System.out.println("2. 배열로=>"+Arrays.toString(daysArr));
			
			for (String arrToKr : daysArr) {
				i = Arrays.asList(days_en).indexOf(arrToKr);
				days.replace("WORK_DAY", days_ko[i]);
			}
			//dayList.add(days_ko[i]);
			//String daysKo = dayList.toString();
			//System.out.println(daysKo);
			
		}
		System.out.println("====뿅AFTER======:"+availSitterList);
		/*
		 * 리스트의 수만큼 반복 돌면서 mon, tue > 월, 화 바꾼다.*/
		
		//user의 DB에 저장된 값 가져오기 22.12.05김혜경
		Users users = (Users) WebUtils.getSessionAttribute(request, "authUser");
		if(users == null) {
			System.out.println("null");
		}else {
			Integer user_no = users.getUser_no();
			Users userInfo = usersService.getUserByUserNo(user_no);
			model.addAttribute("userInfo", userInfo);
		}
				
		model.addAttribute("dataList", availSitterList);
		model.addAttribute("title", "펫시터찾기");
		model.addAttribute("page", "main/find/findSitter");
		return "/layout/main";
	}
	
	
	//돌봐줄 동물 찾기 검색
	//검색조건 : 성별, 서비스, 동물종류, 요일
	@ResponseBody
	@RequestMapping(value = "/findSitter/findSitterSearch", method= RequestMethod.POST)
	public List<Map<String, Object>> findSitterSearch(Model model, @RequestBody Find findVO) {
		List<Map<String, Object>> sitterSearchList = null;
		try {
			//리스트 불러오기
			sitterSearchList = ownerService.findSitterSearch(findVO);
			System.out.println("====뿅======:"+sitterSearchList);
			
			List<Map<String, Object>> availSitterList = sitterSearchList; 
			 
			String[] days_ko = { "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" };
			String[] days_en = { "sun", "mon", "tue", "wed", "thu", "fri", "sat" };
			
			List<String> dayList = new ArrayList<>();
			
			for(Map<String, Object> days : availSitterList ) {
				
				String work_days = (String) days.get("WORK_DAY"); // mon,tue
				String[] daysArr = work_days.split(",");
				
				for (String days2 : daysArr) {
					int i = Arrays.asList(days_en).indexOf(days2);
					dayList.add(days_ko[i]);
				}
				String daysKo = dayList.toString();
				System.out.println(daysKo);
				days.replace("WORK_DAY", daysKo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sitterSearchList;
		
	}
	
	
}
