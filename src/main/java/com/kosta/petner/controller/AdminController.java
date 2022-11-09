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
		model.addAttribute("page", "admin/admin_mainForm");
		model.addAttribute("title", "관리자페이지");
		return "/layout/admin_main";
	}
	
}
