package com.kosta.petner.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosta.petner.bean.Member;
import com.kosta.petner.service.MypageService;

//나의정보출력/수정관리/리뷰
@Controller
public class MyPageController {
	
	@Autowired
	MypageService mypageService;
	
   //마이페이지 메인화면 
   @RequestMapping(value = "/mypage", method = RequestMethod.GET)
   String main(Model model) {
      model.addAttribute("page", "mypage/myinfo");
      return "/layout/mypage_default";
   }
   
   // 마이페이지 나의 기본정보 보기
   @RequestMapping("/mypage/myinfo")
   public String myinfo(HttpSession session, Model model) {
      // 세션에서 id값 가져오기로 수정
      Member member = mypageService.getMyinfo("cheddar");
      
      System.out.println("member정보"+member);
      
      model.addAttribute("page", "mypage/myinfo");
      model.addAttribute("title", "나의정보보기");
      model.addAttribute("member", member);
      return "/layout/mypage_default";
   }
   
   @RequestMapping("/mypage/myinfoEdit")
   public String myinfoEdit(HttpSession session, Model model) {
      model.addAttribute("page", "mypage/myinfo");
      model.addAttribute("title", "나의정보수정");
      return "/layout/mypage_default";
   }

}
