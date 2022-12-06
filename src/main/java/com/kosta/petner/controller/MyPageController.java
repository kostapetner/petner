package com.kosta.petner.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.multipart.MultipartFile;

import com.kosta.petner.bean.FileVO;
import com.kosta.petner.bean.MypageSession;
import com.kosta.petner.bean.PetInfo;
import com.kosta.petner.bean.Review;
import com.kosta.petner.bean.SitterInfo;
import com.kosta.petner.bean.Users;
import com.kosta.petner.service.FileService;
import com.kosta.petner.service.MypageService;
import com.kosta.petner.service.OwnerService;

//나의정보출력/수정관리/리뷰
@Controller

public class MyPageController {

	@Autowired
	ServletContext servletContext;
	
	@Autowired
	FileService fileServie;

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
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String main(HttpSession session, Model model) {

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


	// 나의정보업데이트
	@RequestMapping(value = "/mypage/myinfoEdit", method = RequestMethod.POST)
	public String myinfoUpdate(HttpSession session, @ModelAttribute Users users, BindingResult result, Model model) {

		mypageService.updateMyinfo(users);

		// 세션수정해해함
		MypageSession mypageSession = (MypageSession) session.getAttribute("mypageSession");
		mypageSession.setNickname(users.getNickname());
		session.getAttribute("mypageSession");

		return "redirect:/mypage";
	}
	
	
	// 내가 펫시터일 경우의 컨트롤러=================================================
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
			System.out.println("시터정보없음===");
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
	// 시터정보 업데이트
	@RequestMapping(value = "/mypage/mySitterInfoEdit", method = RequestMethod.POST)
	public String mySitterInfoUpdata(HttpSession session, @ModelAttribute SitterInfo sitterInfo, BindingResult result, Model model) throws IllegalStateException, IOException {
		
		System.out.println( "시터정보없데이트===== file_no?:"+sitterInfo.getFile_no());
		mypageService.updateMySitterInfo(sitterInfo);
		
		if(sitterInfo.getImageFile().isEmpty()== false) { 
			//이미지도 수정한경우 파일테이블 업데이트해야하고 파일을 올려야함
			System.out.println("이미지파일 처리할게 있음"+sitterInfo.getImageFile().getOriginalFilename());
			
			MultipartFile file = sitterInfo.getImageFile(); //파일 자체를 가져옴
			// 서버에 올라갈 랜덤한 파일 이름을 만든다
			String generatedString = RandomStringUtils.randomAlphanumeric(10);
			String filename = file.getOriginalFilename();
			int idx = filename.lastIndexOf(".");//확장자 위치
			String ext = filename.substring(filename.lastIndexOf("."));
			String real_filename = filename.substring(0, idx);//확장자분리
			String server_filename = real_filename + generatedString + ext;
			
			String path = servletContext.getRealPath("/resources/upload/");//업로드 할 폴더 경로
			File fileLocation = new File(path);
			File destFile = new File(path+server_filename);
			file.transferTo(destFile);
			
			FileVO fileVo  = new FileVO();
			int file_no = sitterInfo.getFile_no();
			
			fileVo.setFile_no(file_no);
			fileVo.setOrigin_filename(filename);//파일의 이름을 넣어주기위해 따로 설정
			fileVo.setServer_filename(server_filename);
			
			
			fileServie.updateSitterImage(fileVo);
		}
		// 이미지 변경이 있을 경우에만 파일테이블의 파일이름도 업데이트 하기
		//int user_no = getLoginUserNo(session);
		
		
		
		
		return "redirect:/mypage/mySitterInfo";
	
	}
	

	// 내가 보호자일일 경우의 컨트롤러=================================================
	// 내 반려동물 정보 가져오기
	@RequestMapping(value = "/mypage/myPetInfo", method = RequestMethod.GET)
	public String myPetInfo(HttpSession session, Model model) {
		int user_no = getLoginUserNo(session);

		try {
			// 1이상이기 때문에 리스트로 받아야함
			List<PetInfo> petInfo = ownerService.getPetByUserNo(user_no);
			System.out.println("나의동물정보" + petInfo);

			model.addAttribute("page", "mypage/owner/myPetInfo");
			model.addAttribute("title", "나의반려동물");
			model.addAttribute("data", petInfo);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("반려동물정보없음");
			model.addAttribute("page", "mypage/owner/myPetInfo");
		}
		return "/layout/mypage_default";
	}

	
	//나의반려동물 수정페이지
	@RequestMapping(value = "/mypage/myPetInfoEdit", method = RequestMethod.GET)
	public String myPetInfoEdit(HttpSession session, Model model, HttpServletRequest request, HttpServletResponse response) {
		
		int user_no = getLoginUserNo(session);
		int pet_no = Integer.parseInt(request.getParameter("petNo"));
		
		// pet_no && user_no 일치하는 정보만 하나만 가져올경우 임의로 접근가능
		
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("pet_no", pet_no);
		param.put("user_no", user_no);
		
		PetInfo petInfo = mypageService.getMyPetByPetNo(param);
		System.out.println("동물한마리정보DATA: " + petInfo);		
		
		model.addAttribute("data", petInfo);
		model.addAttribute("page", "mypage/owner/myPetInfoEdit");
		model.addAttribute("title", "반려동물정보수정");
		
		return "/layout/mypage_default";
	}
	
	// 마이펫정보 수정
	@RequestMapping(value = "/mypage/myPetInfoEdit", method = RequestMethod.POST)
	public String myPetInfoUpdate(HttpSession session, @ModelAttribute PetInfo petInfo, BindingResult result, Model model) {
		System.out.println("펫폼정보"+petInfo);
		
		int user_no = getLoginUserNo(session);
		
		petInfo.setUser_no(user_no);
		
		mypageService.updateMyPetInfo(petInfo);
		
		return "redirect:/mypage/myPetInfo";
	}
	
	// 마이펫 삭제
	@RequestMapping(value = "/mypage/myPetDel", method = RequestMethod.GET)
	public String myPetDel(HttpSession session, HttpServletRequest request) {
		
		int pet_no = Integer.parseInt(request.getParameter("petNo"));
		
		mypageService.deletePet(pet_no);
	
		return "redirect:/mypage/myPetInfo";
	}
	

	//리뷰작성페이지
	@RequestMapping("/mypage/writeform")
	public String myReview(HttpSession session, Model model) {

		String id = getLoginUserId(session);

		model.addAttribute("page", "mypage/review/writeform");
		model.addAttribute("title", "리뷰쓰기");
		return "/layout/mypage_default";
	}


	
	
	
	

	// 내가 작성한 리뷰 리스트
	@RequestMapping("/mypage/review/acquireReviewList")
	public String acquireReviewList(HttpSession session, Model model) {
		String id = getLoginUserId(session);
		Users users = mypageService.getMyinfo(id);

		model.addAttribute("page", "mypage/review/acquireReviewList");
		model.addAttribute("title", "작성한 리뷰");
		model.addAttribute("member", users);
		return "/layout/mypage_default";
	}

	// 내가 받은 리뷰 리스트
	@RequestMapping("/mypage/review/receiveReviewList")
	public String receiveReviewList(HttpSession session, Model model) {
		String id = getLoginUserId(session);
		Users users = mypageService.getMyinfo(id);

		model.addAttribute("page", "mypage/review/receiveReviewList");
		model.addAttribute("title", "받은 리뷰");
		model.addAttribute("member", users);
		return "/layout/mypage_default";
	}
	
	
	/*
	 * @RequestMapping(value="/mypage/review/reviewWrite",
	 * method=RequestMethod.POST) ModelAndView reviewWrite(@ModelAttribute Review
	 * review) { ModelAndView mav = new ModelAndView(); String path =
	 * servletContext.getRealPath(); //파일업로드 }
	 */

}
