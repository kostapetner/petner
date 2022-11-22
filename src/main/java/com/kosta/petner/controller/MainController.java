package com.kosta.petner.controller;

import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosta.petner.bean.CareService;
import com.kosta.petner.bean.PageInfo;
import com.kosta.petner.service.FileService;
import com.kosta.petner.service.OwnerService;
import com.kosta.petner.service.SitterService;
import com.kosta.petner.service.UsersService;

//인덱스/ 공지사항 / 메인화면 시터 오너 제외 기능
@Controller
public class MainController {
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	UsersService usersService;
	
	@Autowired
	FileService fileService;
	
	@Autowired
	SitterService sitterService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	String main(Model model) {
		return "/main/index_main";
	}
	
	//펫시터찾기
	@RequestMapping(value = "/findSitter", method = RequestMethod.GET)
	String findSitter(Model model) {
		model.addAttribute("title", "펫시터찾기");
		model.addAttribute("page", "main/find/findSitter");
		return "/layout/main";
	}
	
	//돌봐줄 동물 찾기
	@RequestMapping(value = "/findPet", method= {RequestMethod.POST, RequestMethod.GET})
	String findPet(Model model, @RequestParam(value="page", required=false, defaultValue ="1") Integer page) {
		//페이징
		PageInfo pageInfo = new PageInfo();
		//리스트 불러오기
		List<CareService> careserviceList = sitterService.findPetList(page, pageInfo);

		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("careserviceList", careserviceList);
		model.addAttribute("title", "돌봐줄 동물 찾기");
		model.addAttribute("page", "main/find/findPet");
		return "/layout/main";
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
	String findPet(Model model, @PathVariable String serviceNo, 
								@RequestParam(value="page", required=false) Integer page) {
		CareService careService = new CareService();
		Integer service_no = Integer.parseInt(serviceNo);
		careService = sitterService.getViewForm(service_no);
		PageInfo pageInfo = new PageInfo();
		pageInfo.setPage(page);
		model.addAttribute("cs", careService);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("title", "돌봐줄 동물 찾기");
		model.addAttribute("page", "main/find/findPetViewForm");
		return "/layout/main";
	}
	

}
