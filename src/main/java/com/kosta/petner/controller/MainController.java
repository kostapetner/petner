package com.kosta.petner.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//인덱스/ 공지사항 / 메인화면 시터 오너 제외 기능
@Controller
public class MainController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	String main(Model model) {
		return "/main/index_main";
	}
	
	//펫시터찾기
	@RequestMapping(value = "/findSitter", method = RequestMethod.GET)
	String findSitter(Model model) {
		model.addAttribute("title", "펫시터찾기");
		model.addAttribute("page", "main/findSitter");
		return "/layout/main";
	}
	
	//돌봐줄 동물 찾기
	@RequestMapping(value = "/findPet", method = RequestMethod.GET)
	String findPet(Model model) {
		model.addAttribute("title", "돌봐줄 동물 찾기");
		model.addAttribute("page", "main/findPet");
		return "/layout/main";
	}
}
