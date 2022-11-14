package com.kosta.petner.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosta.petner.bean.SitterInfo;
import com.kosta.petner.bean.Users;
import com.kosta.petner.service.MypageService;

//나의정보출력/수정관리/리뷰
@Controller
public class MyPageController {
	
	@Autowired
	MypageService mypageService;
	
	@Autowired
	HttpSession session;
	
	
   //마이페이지 메인화면 
   @RequestMapping(value = "/mypage", method = RequestMethod.GET)
   String main(HttpSession session, Model model) {
	   Users sessionInfo = (Users) session.getAttribute("authUser");
		
	   String id = sessionInfo.getId();
	   Users users = mypageService.getMyinfo(id);
	   
	   model.addAttribute("member", users);
	   model.addAttribute("page", "mypage/myinfo/myBasicInfo");
	   model.addAttribute("title", "나의정보보기");
	  
	   return "/layout/mypage_default";
   }
   
   // 마이페이지 나의 기본정보 보기
   @RequestMapping("/mypage/myBasicInfo")
   public String myBasicInfo(HttpSession session, Model model) {
	   
	  Users sessionInfo = (Users) session.getAttribute("authUser");		
	  String id = sessionInfo.getId();
	  Users users = mypageService.getMyinfo(id);
      
      System.out.println("member정보"+users+id);
      
      model.addAttribute("page", "mypage/myinfo/myBasicInfo");
      model.addAttribute("title", "나의정보보기");
      model.addAttribute("member", users);
      return "/layout/mypage_default";
   }
   
   // 정보 수정페이지
   @RequestMapping("/mypage/myinfoEdit")
   public String myinfoEdit(HttpSession session, Model model) {
	  Users sessionInfo = (Users) session.getAttribute("authUser");		
	  String id = sessionInfo.getId();
	  Users users = mypageService.getMyinfo(id);
	  
	  Users member = mypageService.getMyinfo(id);
      model.addAttribute("page", "mypage/myinfo/myinfoEdit");
      model.addAttribute("title", "나의정보수정");
      model.addAttribute("member", users);
      return "/layout/mypage_default";
   }
   
   @RequestMapping(value="/mypage/myinfoEdit", method = RequestMethod.POST)
   public String myinfoUpdate(@ModelAttribute Users users, BindingResult result, Model model) { 
		System.out.println("폼값:" + users);
		mypageService.updateMyinfo(users);		
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
}
