package com.kosta.petner.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.petner.bean.PageInfo;
import com.kosta.petner.bean.Qna;
import com.kosta.petner.service.QnaService;


@Controller
public class QnaController {
	@Autowired
	QnaService qnaService;

	@Autowired
	ServletContext servletContext;

	// 글쓰기 화면 이동
	@RequestMapping(value = "/qnawriteform", method = RequestMethod.GET)
	public String qnawriteform(Model model) {
		model.addAttribute("page", "qna/writeform");
		model.addAttribute("title", "글쓰기");
		return "/layout/main";
	}
	
	
	// 글쓰기
	@RequestMapping(value = "/qnawrite", method = RequestMethod.POST)
	public String qnawrite(@ModelAttribute Qna qna, BindingResult result, Model model) {
		try {
			qnaService.resistQna(qna);
			model.addAttribute("redirect:/qnaList");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("/qna/err");
		}

		return "redirect:/qnaList";
	}

	@RequestMapping(value = "/qnaList", method = { RequestMethod.GET, RequestMethod.POST })
	public String qnaList(@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			Model model) {
//		ModelAndView mav = new ModelAndView();
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

	@RequestMapping(value = "/qnadetail", method = RequestMethod.GET)
	String qnadetail(@RequestParam("qna_no") Integer qnaNum,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page, Model model) {
		// ModelAndView mav = new ModelAndView();
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

	@RequestMapping(value = "/qnamodifyform", method = RequestMethod.GET)
	String qnamodifyform(@RequestParam("qna_no") Integer qnaNum, Model model) {
		// ModelAndView mav = new ModelAndView();
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

	@RequestMapping(value = "/qnamodify", method = RequestMethod.POST)
	public String qnamodify(@ModelAttribute Qna qna, Model model) {
		// ModelAndView mav = new ModelAndView();
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

	@RequestMapping(value = "/qnareplyform", method = RequestMethod.GET)
	public String qnareplyform(@RequestParam("qna_no") Integer qnaNum,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page, Model model) {
		// ModelAndView mav = new ModelAndView();

		try {
//			model.addAttribute("/layout/admin_main");
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

