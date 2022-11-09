package com.kosta.petner.controller;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.petner.bean.PetInfo;
import com.kosta.petner.service.OwnerService;

//서비스신청 / 펫시터찾기
//클라이언트 : 반려동물보호자
@Controller
public class OwnerController {

	@Autowired
	OwnerService ownerService;
	
	//펫 정보등록 페이지
	@RequestMapping(value = "/petner/petForm", method = RequestMethod.GET)
	String sitterForm(Model model) {
		model.addAttribute("title", "펫정보등록");
		model.addAttribute("page", "mypage/petForm");
		return "/layout/mypage_default";
	}
	
	//DB insert
	@RequestMapping(value = "/petForm/register", method = RequestMethod.POST)
	public ModelAndView register(Model model, @ModelAttribute PetInfo petInfo) {
		ModelAndView mav = new ModelAndView();
		try {
			//파일
			MultipartFile file = petInfo.getImageFile(); //파일 자체를 가져옴
			if(!file.isEmpty()) {
				String path = "D:\\javaStudy\\workspace\\stsWorkspace\\Petner\\src\\main\\webapp\\resources\\upload";
				File destFile = new File(path +"\\"+ file.getOriginalFilename());//file을 destFile로 옮겨라.
				file.transferTo(destFile);
				petInfo.setProfile(file.getOriginalFilename());//파일의 이름을 넣어주기위해 따로 설정
				mav.setViewName("redirect:/");
				System.out.println(petInfo.toString());
			}
			ownerService.regist(petInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@RequestMapping(value = "/petner/findSitter", method = RequestMethod.GET)
	String findSitter(Model model) {
		model.addAttribute("title", "펫시터찾기");
		model.addAttribute("page", "find/findSitter");
		return "/layout/main";
	}
	
}
