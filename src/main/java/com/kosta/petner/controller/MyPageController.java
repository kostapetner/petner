package com.kosta.petner.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosta.petner.bean.MypageSession;
import com.kosta.petner.bean.PetInfo;
import com.kosta.petner.bean.SitterInfo;
import com.kosta.petner.bean.Users;
import com.kosta.petner.service.MypageService;
import com.kosta.petner.service.OwnerService;

//나의정보출력/수정관리/리뷰
@Controller

public class MyPageController {

	@Autowired
	ServletContext servletContext;

	@Autowired
	MypageService mypageService;

	@Autowired
	OwnerService ownerService;

	@Autowired
	HttpSession session;

	public String getLoginUserId(HttpSession session) {
		MypageSession mypageSession = (MypageSession) session.getAttribute("mypageSession");
		String id = mypageSession.getId();
		return id;
	}

	public int getLoginUserNo(HttpSession session) {
		MypageSession mypageSession = (MypageSession) session.getAttribute("mypageSession");
		int user_no = mypageSession.getUser_no();
		return user_no;
	}

	// 마이페이지 메인화면 / 기본정보보기
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	String main(HttpSession session, Model model) {

		String id = getLoginUserId(session);
		Users users = mypageService.getMyinfo(id);
		int user_no = getLoginUserNo(session);

		Map<String, Object> cnt = mypageService.getCount(user_no);
		System.out.println("맵정보" + cnt);

		model.addAttribute("page", "mypage/myinfo/myBasicInfo");
		model.addAttribute("title", "나의정보보기");
		model.addAttribute("member", users);
		model.addAttribute("count", cnt);

		return "/layout/mypage_default";
	}

	// 마이페이지 나의 기본정보 보기 / 추후에 마이페이지 메인화면과 기본정보 분리할경우 살림
//   @RequestMapping("/mypage/myBasicInfo")
//   public String myBasicInfo(HttpSession session, Model model) {
//	  
//	   String id = getLoginUserId(session);
//	   Users users = mypageService.getMyinfo(id);	   
//	   int user_no = getLoginUserNo(session);	  
//	   
//	   Map<String,Object> cnt = mypageService.getCount(user_no);	   
//	   System.out.println("맵정보"+cnt);  
//      
//      model.addAttribute("page", "mypage/myinfo/myBasicInfo");
//      model.addAttribute("title", "나의정보보기");
//      model.addAttribute("member", users);
//      model.addAttribute("count", cnt);
//      
//      return "/layout/mypage_default";
//   }

	// 정보 수정페이지
	@RequestMapping("/mypage/myinfoEdit")
	public String myinfoEdit(HttpSession session, Model model) {

		String id = getLoginUserId(session);
		Users users = mypageService.getMyinfo(id);

		model.addAttribute("page", "mypage/myinfo/myinfoEdit");
		model.addAttribute("title", "나의정보수정");
		model.addAttribute("member", users);
		return "/layout/mypage_default";
	}

	// 정보업데이크
	@RequestMapping(value = "/mypage/myinfoEdit", method = RequestMethod.POST)
	public String myinfoUpdate(HttpSession session, @ModelAttribute Users users, BindingResult result, Model model) {

		mypageService.updateMyinfo(users);

		// 세션수정해해함
		MypageSession mypageSession = (MypageSession) session.getAttribute("mypageSession");
		mypageSession.setNickname(users.getNickname());
		session.getAttribute("mypageSession");

		return "redirect:/mypage";
	}

	// 내가 펫시터일 경우의 컨트롤러
	@RequestMapping(value = "/mypage/mySitterInfo", method = RequestMethod.GET)
	public String mySitterInfo(HttpSession session, Model model) {

		int user_no = getLoginUserNo(session);

		try {
			SitterInfo sitterInfo = mypageService.getMySitterinfo(user_no);
			System.out.println("시터정보" + sitterInfo);

			// 동물정보바꾸기
			String pet_kind = sitterInfo.getPet_kind(); // mon,tue,wed
			String[] petsArr = pet_kind.split(",");
			String[] pets_ko = { "강아지", "고양이", "새", "관상어", "파충류" };
			String[] pets_en = { "dog", "cat", "bird", "fish", "reptile" };
			List<String> petList = new ArrayList<>();

			for (String pets : petsArr) {
				int i = Arrays.asList(pets_en).indexOf(pets);
				petList.add(pets_ko[i]);
			}
			String petsKo = petList.toString();
			sitterInfo.setPet_kind(petsKo);

			// 요일정보 바꾸기
			String work_days = sitterInfo.getWork_day(); // mon,tue,wed
			String[] daysArr = work_days.split(",");
			String[] days_ko = { "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" };
			String[] days_en = { "sun", "mon", "tue", "wed", "thu", "fri", "sat" };
			List<String> dayList = new ArrayList<>();

			for (String days : daysArr) {
				// [wed, thu, fri]의 days_en 인덱스 찾아서 days_ko로 바꾸어라 345 나와야함
				int i = Arrays.asList(days_en).indexOf(days);
				// System.out.println("korean"+days_ko[a]);
				dayList.add(days_ko[i]);
			}
			String daysKo = dayList.toString();
			sitterInfo.setWork_day(daysKo);

			// 서비스정보
			String service = sitterInfo.getService();
			String[] serviceArr = service.split(",");
			String[] service_ko = { "산책", "목욕", "방문관리", "교육" };
			String[] service_en = { "walk", "shower", "visit", "education" };
			List<String> servList = new ArrayList<>();

			for (String servies : serviceArr) {
				int i = Arrays.asList(service_en).indexOf(servies);
				servList.add(service_ko[i]);
			}
			String servKo = servList.toString();
			sitterInfo.setService(servKo);

			model.addAttribute("page", "mypage/sitter/mySitterInfo");
			model.addAttribute("title", "나의펫시터정보보기");
			model.addAttribute("data", sitterInfo);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("page", "mypage/sitter/mySitterInfo");
		}

		return "/layout/mypage_default";
	}

	// 시터정보수정
	@RequestMapping(value = "/mypage/mySitterInfoEdit", method = RequestMethod.GET)
	public String mySitterInfoEdit(HttpSession session, Model model) {

		int user_no = getLoginUserNo(session);
		SitterInfo sitterInfo = mypageService.getMySitterinfo(user_no);

		model.addAttribute("data", sitterInfo);
		System.out.println("시터정보" + sitterInfo);
		model.addAttribute("page", "mypage/sitter/mySitterInfoEdit");
		model.addAttribute("title", "나의펫시터정보수정");
		return "/layout/mypage_default";
	}

	// 내가 보호자일일 경우의 컨트롤러
	// 내 반려동물 정보 가져오기
	@RequestMapping(value = "/mypage/myPetInfo", method = RequestMethod.GET)
	public String myPetInfo(HttpSession session, Model model) {
		Users sessionInfo = (Users) session.getAttribute("authUser");
		int user_no = sessionInfo.getUser_no();

		String path = servletContext.getRealPath("/resources/upload/");// 업로드 할 폴더 경로

		try {
			// 1이상이기 때문에 리스트로 받아야함
			List<PetInfo> petInfo = ownerService.getPetByUserNo(user_no);
			System.out.println("나의동물정보" + petInfo);

			model.addAttribute("page", "mypage/owner/myPetInfo");
			model.addAttribute("title", "나의반려동물");
			model.addAttribute("data", petInfo);
			model.addAttribute("path", path);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("반려동물정보없어!!!");
			model.addAttribute("page", "mypage/owner/myPetInfo");
		}
		return "/layout/mypage_default";
	}

}
