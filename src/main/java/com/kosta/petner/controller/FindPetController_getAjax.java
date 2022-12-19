package com.kosta.petner.controller;

import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.kosta.petner.bean.CareService;
import com.kosta.petner.bean.Find;
import com.kosta.petner.bean.Users;
import com.kosta.petner.service.FileService;
import com.kosta.petner.service.SitterService;
import com.kosta.petner.service.UsersService;

@Controller
public class FindPetController {
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	UsersService usersService;
	
	@Autowired
	FileService fileService;
	
	@Autowired
	SitterService sitterService;

	//돌봐줄 동물 찾기 페이지
	@RequestMapping(value = "/findPet", method= {RequestMethod.POST, RequestMethod.GET})
	String findPet(Model model, @RequestParam(value="zipcode", required=false, defaultValue ="1") String qszipcode,
					@RequestParam(value="addr", required=false) String addr, Find findPetVO, HttpServletRequest request) {
		//user의 DB에 저장된 값 가져오기
		Users users = (Users) WebUtils.getSessionAttribute(request, "authUser");
		if(users == null) {
			System.out.println("null");
		}else {
			Integer user_no = users.getUser_no();
			Users userInfo = usersService.getUserByUserNo(user_no);
			model.addAttribute("userInfo", userInfo);
		}
		model.addAttribute("qszipcode", qszipcode);
		model.addAttribute("qsaddrp", addr);
		model.addAttribute("title", "돌봐줄 동물 찾기");
		model.addAttribute("page", "main/find/findPet");
		return "/layout/main";
	}
	
	//돌봐줄 동물 찾기 검색
	//검색조건 : 날짜, 서비스, 동물종류, 보호자 성별, (현재위치), 펫이름
	@ResponseBody
	@RequestMapping(value = "/findPet/viewForm/findPetSearch", method= RequestMethod.POST)
	public List<CareService> findPetSearch(Model model, @RequestBody Find findVO) {
		System.out.println("findPetSearch 들어오ㅘㅅ앋");
		List<CareService> petSearchList = null;
		try {
			//리스트 불러오기
			petSearchList = sitterService.findPetSearch(findVO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return petSearchList;
	}
	
	//게시글 사진 화면에 띄우기
	@RequestMapping(value = "/findPet/{fileNo}", method = RequestMethod.GET)
	public void viewCareServiceImages(@PathVariable String fileNo, HttpServletResponse response) {
	String path = servletContext.getRealPath("/resources/upload/");
		FileInputStream fis = null;
		try {
			Integer file_no = Integer.parseInt(fileNo);
			String server_filename = fileService.getServerFilename(file_no);
			fis = new FileInputStream(path + server_filename);
			OutputStream out = response.getOutputStream();
			FileCopyUtils.copy(fis, out);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(fis != null) {
				try {
					fis.close();
				} catch (Exception e) {} 
			}
		}
	}
		
	//돌봐줄 동물 찾기 게시글에 따른 viewForm
	@RequestMapping(value = "/findPet/viewForm/{serviceNo}", method= RequestMethod.GET)
	String findPet(Model model, @PathVariable String serviceNo, @RequestParam(value="zipcode", required=false) String zipcode, 
					@RequestParam(value="addr", required=false) String addr) {
		CareService careService = new CareService();
		Integer service_no = Integer.parseInt(serviceNo);
		careService = sitterService.getViewForm(service_no);
		careService.setZipcode(zipcode);
		careService.setAddr(addr);
		model.addAttribute("cs", careService);
		model.addAttribute("title", "돌봐줄 동물 찾기");
		model.addAttribute("page", "main/find/findPetViewForm");
		return "/layout/main";
	}
}
