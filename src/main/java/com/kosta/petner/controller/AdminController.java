package com.kosta.petner.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class AdminController {
	
	//관리자페이지 메인화면 
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	String main(Model model) {
		model.addAttribute("page", "admin/ad_main");
		model.addAttribute("title", "관리자 메인 페이지");
		return "/layout/admin_main";
	}
	
	//관리자페이지 권한관리 화면
			@RequestMapping(value = "/admin_authority", method = RequestMethod.GET)
			String admin_authority(Model model) {
				model.addAttribute("page", "admin/ad_authority");
				model.addAttribute("title", "권한관리");
				return "/layout/admin_main";
			}
			
			
	
	//관리자페이지 회원정보 관리 화면
		@RequestMapping(value = "/admin_user", method = RequestMethod.GET)
		String admin_user(Model model) {
			model.addAttribute("page", "admin/ad_user");
			model.addAttribute("title", "회원정보 관리");
			return "/layout/admin_main";
		}
		
		
		
	
}
