package com.kosta.petner.controller;

import java.io.File;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.petner.bean.Board;
import com.kosta.petner.bean.Notice;
import com.kosta.petner.bean.PageInfo;
import com.kosta.petner.service.BoardService;
import com.kosta.petner.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	NoticeService noticeService;

	@Autowired
	ServletContext servletContext;

	// 글쓰기 화면 이동
	@RequestMapping(value = "/writeform", method = RequestMethod.GET)
	public String writeform(Model model) {
		model.addAttribute("page", "admin/notice/writeform");
//		model.addAttribute("title", "공지사항 글쓰기");
		return "/layout/main";
	}
	
	

	@RequestMapping(value = "/noticewrite", method = RequestMethod.POST)
	public String noticewrite(@ModelAttribute Notice notice, BindingResult result, Model model) {
		try {
			noticeService.resistNotice(notice);
			model.addAttribute("redirect:/noticeList");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("/notice/err");
		}

		return "redirect:/noticeList";
	}

	@RequestMapping(value = "/noticeList", method = { RequestMethod.GET, RequestMethod.POST })
	public String noticeList(@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			Model model) {
//		ModelAndView mav = new ModelAndView();
		PageInfo pageInfo = new PageInfo();
		try {
			List<Notice> articleList = noticeService.getNoticeList(page, pageInfo);
			model.addAttribute("articleList", articleList);
			model.addAttribute("pageInfo", pageInfo);
			model.addAttribute("page", "/notice/listform");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", e.getMessage());
			model.addAttribute("/notice/err");
		}
		return "/layout/main";
	}

	@RequestMapping(value = "/noticedetail", method = RequestMethod.GET)
	String noticedetail(@RequestParam("notice_no") Integer noticeNum,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page, Model model) {
		// ModelAndView mav = new ModelAndView();
		try {
			// 조회수 증가
			noticeService.notice_read(noticeNum);
			Notice notice = noticeService.getNotice(noticeNum);
			model.addAttribute("article", notice);
			model.addAttribute("page", page);
			model.addAttribute("page", "/notice/viewform");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("/notice/err");
		}
		return "/layout/main";
	}

	@RequestMapping(value = "/modifyform", method = RequestMethod.GET)
	String modifyform(@RequestParam("notice_no") Integer noticeNum, Model model) {
		// ModelAndView mav = new ModelAndView();
		try {
			Notice notice = noticeService.getNotice(noticeNum);
			model.addAttribute("article", notice);
			model.addAttribute("page", "/notice/modifyform");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "조회 실패");
			model.addAttribute("/notice/err");
		}
		return "/layout/main";
	}

	@RequestMapping(value = "/noticemodify", method = RequestMethod.POST)
	public String noticemodify(@ModelAttribute Notice notice, Model model) {
		// ModelAndView mav = new ModelAndView();
		try {
			noticeService.modifyNotice(notice);
			model.addAttribute("notice_no", notice.getNotice_no());
			model.addAttribute("redirect:/noticedetail");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", e.getMessage());
			model.addAttribute("/notice/err");
		}
		return "redirect:/noticedetail";
	}

	@RequestMapping(value = "/replyform", method = RequestMethod.GET)
	public String replyform(@RequestParam("notice_no") Integer noticeNum,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page, Model model) {
		// ModelAndView mav = new ModelAndView();

		try {
//			model.addAttribute("/layout/admin_main");
			model.addAttribute("noticeNum", noticeNum);
			model.addAttribute("age", page);
			model.addAttribute("page", "/notice/replyform");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", e.getMessage());
			model.addAttribute("/notice/err");
		}
		return "/layout/main";
	}

	@RequestMapping(value = "/noticereply", method = RequestMethod.POST)
	public String noticereply(@ModelAttribute Notice notice, Model model) {
		try {
			noticeService.noticeReply(notice);
			model.addAttribute("redirect:/noticeList");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", e.getMessage());
			model.addAttribute("/notice/err");
		}
		return "redirect:/noticeList";
	}

	@RequestMapping(value = "/deleteform", method = RequestMethod.GET)
	public ModelAndView deleteform(@RequestParam("notice_no") Integer noticeNum,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("notice_no", noticeNum);
		mav.addObject("page", page);
		mav.setViewName("/notice/deleteform");
		return mav;
	}

	@RequestMapping(value = "/noticedelete", method = RequestMethod.POST)
	public ModelAndView boarddelete(@RequestParam("notice_no") Integer noticeNum,
//			@RequestParam(value="board_pass") String password,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page) {
		System.out.println("Controller:" + noticeNum);
		ModelAndView mav = new ModelAndView();
		try {
//			boardService.deleteBoard(boardNum, password);
			noticeService.deleteNotice(noticeNum);
			mav.addObject("page", page);
			mav.setViewName("redirect:/noticeList");
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("err", e.getMessage());
			mav.setViewName("/notice/err");
		}
		return mav;
	}
}
