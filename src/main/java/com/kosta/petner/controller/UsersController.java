package com.kosta.petner.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.kosta.petner.bean.Users;
import com.kosta.petner.service.UsersService;



@Controller
public class UsersController {

	@Autowired
	UsersService usersService;
	
	@Autowired
	HttpSession session;
	
	
		
	//회원가입 이동
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	String joinForm() {
		return "users/join/joinForm";
	}
	
	//회원가입 
	@RequestMapping(value = "/joinpet", method = RequestMethod.POST)
	String join(@ModelAttribute Users users, Model model) {
		System.out.println("회원가입정보:" + users);
		try{
			usersService.joinUsers(users);
			model.addAttribute("page","users/login/loginForm");
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "회원가입 오류");
			model.addAttribute("page", "err");
		}
		
		return "/layout/main";
		
	}
		
	//중복체크
	@ResponseBody 
	@RequestMapping(value = "/checkId", method = RequestMethod.POST)
	   String checkId(@RequestParam("id") String id, Model model) {
		try {
			if(usersService.isDoubleId(id)) return "true";
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "아이디 중복");
			model.addAttribute("page","err");
		}
	      return "false";
	}
	
	
		// 로그인화면 이동
		@RequestMapping(value = "/login", method = RequestMethod.GET)
		String main(Model model) {
			model.addAttribute("page", "users/login/loginForm");
			model.addAttribute("title", "로그인");
			return "/layout/main";
		}
		
		//로그인
		@RequestMapping(value="/login",method = RequestMethod.POST)              
		public String login(@ModelAttribute Users users, Model model) throws Exception {				
			System.out.println("users.getId():    "+ users.getId());
			System.out.println("users.getPassword():    "+ users.getPassword());
		
			
			Users authUser = usersService.getUsers(users);

			if(authUser ==null) {
				System.out.println("로그인 실패");
				model.addAttribute("result", "fail");
				return "users/login/loginForm";	
			}
			
			//user정보를 authUser라는 세션에 담음
			session.setAttribute("authUser", authUser);
			System.out.println(authUser);
			
			return "redirect:/";
			}

		//로그아웃
		@RequestMapping(value="/logout",method = RequestMethod.GET)
		public String logout() {
			
			session.removeAttribute("authUser");
			return "redirect:/";
		}
		
		//아이디 찾기로 이동
		@RequestMapping(value = "/findId", method = RequestMethod.GET)
		String findId() {
			return "users/login/findId";
		}
		
		//아이디 찾기
		@RequestMapping(value="/findId",method = RequestMethod.POST)              
		public String findId(@ModelAttribute Users users, Model model) throws Exception {				
			System.out.println("users.getName():    "+ users.getName());
			System.out.println("users.getEmail():    "+ users.getEmail());
		
			Users userInfo = usersService.getId(users);

			if(userInfo ==null) {
				System.out.println("입력값 오류");
				model.addAttribute("result", "fail");
				return "users/login/findId";	
			}
			//user정보를 userInfo 라는 세션에 담음
			model.addAttribute("result", 0);
			model.addAttribute("id", users.getId());
			System.out.println(users.getId());
			
			return "redirect:/";
			}

		
		
		
		//비밀번호 찾기
		@RequestMapping(value = "/findPass", method = RequestMethod.GET)
		String findPass() {
			return "users/login/findPass";
		}
}
