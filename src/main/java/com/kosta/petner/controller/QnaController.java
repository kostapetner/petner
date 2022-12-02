package com.kosta.petner.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.petner.bean.FileVO;
import com.kosta.petner.bean.MypageSession;
import com.kosta.petner.bean.PageInfo;
import com.kosta.petner.bean.Qna;
import com.kosta.petner.bean.Users;
import com.kosta.petner.service.FileService;
import com.kosta.petner.service.MypageService;
import com.kosta.petner.service.QnaService;

import com.kosta.petner.service.CommonService;

@Controller
public class QnaController {

	@Autowired
	CommonService common;

	@Autowired
	FileService fileService;

	@Autowired
	MypageService mypageService;

	@Autowired
	QnaService qnaService;

	@Autowired
	ServletContext servletContext;

	// qna_글쓰기 화면 이동
	@RequestMapping(value = "/qnawriteform", method = RequestMethod.GET)
	public String qnawriteform(Model model) {

		model.addAttribute("page", "qna/writeform");
		model.addAttribute("title", "글쓰기");
		return "/layout/main";
	}
	
	//펫 이미지 파일 화면에 띄우기List<Qna> articleList = qnaService.getQnaList(page, pageInfo);
		@RequestMapping(value = "/{QanNo}", method = RequestMethod.GET)
		public void viewImages(@PathVariable Integer qnaNum, HttpServletResponse response, Qna qna) {
			String path = servletContext.getRealPath("/resources/upload/");
			FileInputStream fis = null;
			try {
				Qna server_filename = qnaService.getQna(qnaNum);
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
		//
	


	@RequestMapping(value="/loadImage.do")
	public String displayPhoto(Integer qnaNum,@RequestParam(value="file_no") String file_no, HttpServletResponse response,Model model)throws Exception{

		// Qna qna = qnaService.getQna(qnaNum);
		//DB에 저장된 파일 정보를 불러오기
		Qna qna = new Qna();
		
	    Qna result = qnaService.getQna(qnaNum);
	    
		response.setContentType("image/jpg");
	    ServletOutputStream bout = response.getOutputStream();
	    //파일의 경로 "qna", file, session
	    
	    String imgpath = qna.getFilepath() + result.getFile_no();
	    //String imgpath = "qna" + qna.getFilepath() + File.separator + result.getFile_no();
	    FileInputStream f = new FileInputStream(imgpath);
//	    int length;
//	    byte[] buffer = new byte[10];
//	    while((length=f.read(buffer)) != -1){
//	    	bout.write(buffer,0,length);
//	    }
	    model.addAttribute("file_no", file_no);
	    return null;
	}
	
	
	
	
	
	
	

	// qna_첨부 파일 다운로드 요청
	@ResponseBody
	@RequestMapping("/qna_download")
	public void download(Integer qnaNum, HttpSession session, HttpServletResponse response) throws Exception {
		Qna qna = qnaService.getQna(qnaNum);
		common.download(qna.getFile_no(), qna.getFilepath(), session, response);
	} // download()

	// qna_글쓰기 DB insert
	@RequestMapping(value = "/qnawrite", method = RequestMethod.POST)
	public String qnawrite(MultipartFile file, @ModelAttribute Qna qna, Model model, HttpSession session)
			throws Exception {

		// 첨부한 파일을 서버 시스템에 업로드하는 처리
		if (!file.isEmpty()) {
			qna.setFilepath(common.upload("qna", file, session));
			qna.setFile_no(file.getOriginalFilename());
		}

		// 화면에서 입력한 정보를 DB에 저장한 후
		qnaService.resistQna(qna);
		// 목록 화면으로 연결
		return "redirect:qnaList";
	}

	// qna_list 정보 불러오기
	@RequestMapping(value = "/qnaList", method = { RequestMethod.GET, RequestMethod.POST })
	public String qnaList(@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			Model model) {
		PageInfo pageInfo = new PageInfo();
		try {
			List<Qna> articleList = qnaService.getQnaList(page, pageInfo);
			model.addAttribute("articleList", articleList);
			model.addAttribute("pageInfo", pageInfo);
			model.addAttribute("page", "/qna/listform");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", e.getMessage());
			model.addAttribute("/qna/err");
		}
		return "/layout/main";
	}

	// qna_글작성한 페이지 이동
	@RequestMapping(value = "/qnadetail", method = RequestMethod.GET)
	String qnadetail(@RequestParam("qna_no") Integer qnaNum,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page, Model model) {
		try {
			// 조회수 증가
			qnaService.qna_read(qnaNum);
			Qna qna = qnaService.getQna(qnaNum);
			model.addAttribute("article", qna);
			model.addAttribute("page", page);
			model.addAttribute("page", "/qna/viewform");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("/qna/err");
		}
		return "/layout/main";
	}

	// qna_수정화면 이동
	@RequestMapping(value = "/qnamodifyform", method = RequestMethod.GET)
	String qnamodifyform(@RequestParam("qna_no") Integer qnaNum, Model model) {
		try {
			Qna qna = qnaService.getQna(qnaNum);
			model.addAttribute("article", qna);
			model.addAttribute("page", "/qna/modifyform");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "조회 실패");
			model.addAttribute("/qna/err");
		}
		return "/layout/main";
	}

	// qna_수정
	@RequestMapping(value = "/qnamodify", method = RequestMethod.POST)
	public String qnamodify(@ModelAttribute Qna qna, Model model) {
		try {
			qnaService.modifyQna(qna);
			model.addAttribute("Qna_no", qna.getQna_no());
			model.addAttribute("redirect:/qnadetail");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", e.getMessage());
			model.addAttribute("/qna/err");
		}
		return "redirect:/qnadetail";
	}

	// qna_답글 작성이동
	@RequestMapping(value = "/qnareplyform", method = RequestMethod.GET)
	public String qnareplyform(@RequestParam("qna_no") Integer qnaNum,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page, Model model) {

		try {
			model.addAttribute("qnaNum", qnaNum);
			model.addAttribute("age", page);
			model.addAttribute("page", "/qna/replyform");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", e.getMessage());
			model.addAttribute("/qna/err");
		}
		return "/layout/main";
	}

	// qna_답글작성하기
	@RequestMapping(value = "/qnareply", method = RequestMethod.POST)
	public String qnareply(@ModelAttribute Qna qna, Model model) {
		try {
			qnaService.qnaReply(qna);
			model.addAttribute("redirect:/qnaList");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", e.getMessage());
			model.addAttribute("/qna/err");
		}
		return "redirect:/qnaList";
	}

	@RequestMapping(value = "/qnadeleteform", method = RequestMethod.GET)
	public ModelAndView qnadeleteform(@RequestParam("qna_no") Integer qnaNum,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("qna_no", qnaNum);
		mav.addObject("page", page);
		mav.setViewName("/qna/deleteform");
		return mav;
	}

	// qna_글삭제
	@RequestMapping(value = "/qnadelete", method = RequestMethod.POST)
	public ModelAndView qnadelete(@RequestParam("qna_no") Integer qnaNum,
//			@RequestParam(value="board_pass") String password,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page) {
		System.out.println("Controller:" + qnaNum);
		ModelAndView mav = new ModelAndView();
		try {
//			boardService.deleteBoard(boardNum, password);
			qnaService.deleteQna(qnaNum);
			mav.addObject("page", page);
			mav.setViewName("redirect:/qnaList");
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("err", e.getMessage());
			mav.setViewName("/qna/err");
		}
		return mav;
	}
}
