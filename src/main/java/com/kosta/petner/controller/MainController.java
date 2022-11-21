package com.kosta.petner.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.WebUtils;

import com.kosta.petner.bean.CareService;
import com.kosta.petner.bean.PageInfo;
import com.kosta.petner.bean.Users;
import com.kosta.petner.service.OwnerService;
import com.kosta.petner.service.UsersService;

//인덱스/ 공지사항 / 메인화면 시터 오너 제외 기능
@Controller
public class MainController {
	
	@Autowired
	OwnerService ownerService;
	
	@Autowired
	UsersService usersService;
	
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
	@RequestMapping(value = "/findPet", method= {RequestMethod.POST, RequestMethod.GET})
	String findPet(Model model, @RequestParam(value="page", required=false, defaultValue ="1") Integer page) {
		//페이징
		PageInfo pageInfo = new PageInfo();
		//리스트 불러오기
		List<CareService> careserviceList = ownerService.findPetList(page, pageInfo);
		for(CareService a : careserviceList) {
			System.out.println(a.toString());
		}
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("careserviceList", careserviceList);
		model.addAttribute("title", "돌봐줄 동물 찾기");
		model.addAttribute("page", "main/findPet");
		return "/layout/main";
	}
}
