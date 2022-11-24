package com.kosta.petner.controller;

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

	
	
   //마이페이지 메인화면 / 기본정보보기
   @RequestMapping(value = "/mypage", method = RequestMethod.GET)
   String main(HttpSession session, Model model) {

	   String id = getLoginUserId(session);
	   Users users = mypageService.getMyinfo(id);	 
	   int user_no = getLoginUserNo(session);
	   
	   
	   Map<String,Object> cnt = mypageService.getCount(user_no);	   
	   System.out.println("맵정보"+cnt);  
      
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
   @RequestMapping(value="/mypage/myinfoEdit", method = RequestMethod.POST)
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
   public String mySitterInfo(HttpSession session, Model model){
	   
	   Users sessionInfo = (Users) session.getAttribute("authUser");
	   int user_no = sessionInfo.getUser_no();
	  
	   try {
		   SitterInfo sitterInfo = mypageService.getMySitterinfo(user_no);	      
		   System.out.println("시터정보"+sitterInfo);
	      
		   model.addAttribute("page", "mypage/sitter/mySitterInfo");
		   model.addAttribute("title", "나의펫시터정보보기");
		   model.addAttribute("data", sitterInfo);
	   }catch(Exception e) {
		   e.printStackTrace();
		   System.out.println("coconut");
		   model.addAttribute("page", "mypage/sitter/mySitterInfo");
	   }
	  
	   return "/layout/mypage_default";
   }
   
   // 시터정보수정
   @RequestMapping(value = "/mypage/mySitterInfoEdit", method = RequestMethod.GET)
   public String mySitterInfoEdit(HttpSession session, Model model){
	   Users sessionInfo = (Users) session.getAttribute("authUser");
	   int user_no = sessionInfo.getUser_no();
	   SitterInfo sitterInfo = mypageService.getMySitterinfo(user_no);
	   
	   model.addAttribute("data", sitterInfo);
	   model.addAttribute("page", "mypage/sitter/mySitterInfoEdit");
	   model.addAttribute("title", "나의펫시터정보수정");
	   //model.addAttribute("data", sitterInfo);
	   return "/layout/mypage_default";
   }
   
   
   // 내가 보호자일일 경우의 컨트롤러
   // 내 반려동물 정보 가져오기
   @RequestMapping(value = "/mypage/myPetInfo", method = RequestMethod.GET)
   public String myPetInfo(HttpSession session, Model model){
	   Users sessionInfo = (Users) session.getAttribute("authUser");
	   int user_no = sessionInfo.getUser_no();
	   	   
	   String path = servletContext.getRealPath("/resources/upload/");//업로드 할 폴더 경로
	   
	   try {
		   // 1이상이기 때문에 리스트로 받아야함
		   List<PetInfo> petInfo = ownerService.getPetByUserNo(user_no);		 
		   System.out.println("나의동물정보"+petInfo);
	      
		   model.addAttribute("page", "mypage/owner/myPetInfo");
		   model.addAttribute("title", "나의반려동물");
		   model.addAttribute("data", petInfo);
		   model.addAttribute("path", path);
	   }catch(Exception e) {
		   e.printStackTrace();
		   System.out.println("반려동물정보없어!!!");
		   model.addAttribute("page", "mypage/owner/myPetInfo");
	   }
	   return "/layout/mypage_default";
   }
  
}
