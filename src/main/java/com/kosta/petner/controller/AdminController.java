package com.kosta.petner.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosta.petner.dao.UsersDAO;
import com.kosta.petner.service.MypageService;


@Controller
public class AdminController {
	
	@Autowired
	MypageService mypageService;
	
	@Autowired
	UsersDAO usersDAO;
	
	@Autowired
	HttpSession session;
	
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
		String admin_user(HttpSession session,Model model) {
			
			
			try {
				List list = usersDAO.selectAllUsers();
				model.addAttribute("list",list);
				model.addAttribute("page", "admin/ad_user");
				model.addAttribute("title", "회원정보 관리");
			} catch(Exception e) {
				e.printStackTrace();
				model.addAttribute("err", "전체계좌 조회 실패");
				model.addAttribute("page", "err");
			}
//			 Users sessionInfo = (Users) session.getAttribute("authUser");		
//			  String id = sessionInfo.getId();
//			  Users users = mypageService.getMyinfo(id);
//		      
//		      System.out.println("member정보"+users+id);
//		      
//			model.addAttribute("page", "admin/ad_user");
//			model.addAttribute("title", "회원정보 관리");
			//model.addAttribute("member", users);
			return "/layout/admin_main";
		}
		
		
		
	
}
