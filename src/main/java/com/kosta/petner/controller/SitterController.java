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

import com.kosta.petner.bean.SitterInfo;
import com.kosta.petner.service.SitterFormService;

@Controller
public class SitterController {

	@Autowired
	SitterFormService sitterFormService;

	//펫시터 정보등록 페이지
	@RequestMapping(value = "/sitterForm", method = RequestMethod.GET)
	String sitterForm(Model model) {
		model.addAttribute("title", "시터정보등록");
		model.addAttribute("page", "mypage/sitterForm");
		return "/layout/mypage_default";
	}
	
	//DB insert
	@RequestMapping(value = "/sitterForm/register", method = RequestMethod.POST)
	public ModelAndView register(Model model, @ModelAttribute SitterInfo sitterInfo) {
		ModelAndView mav = new ModelAndView();
		try {
			//파일
			MultipartFile file = sitterInfo.getImageFile(); //파일 자체를 가져옴
			if(!file.isEmpty()) {
				String path = "D:\\javaStudy\\workspace\\stsWorkspace\\Petner\\src\\main\\webapp\\resources\\upload";
				File destFile = new File(path +"\\"+ file.getOriginalFilename());//file을 destFile로 옮겨라.
				file.transferTo(destFile);
				sitterInfo.setProfile(file.getOriginalFilename());//파일의 이름을 넣어주기위해 따로 설정
				mav.setViewName("redirect:/");
				System.out.println(sitterInfo.toString());
			}
			sitterFormService.regist(sitterInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
}
