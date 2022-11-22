package com.kosta.petner.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.petner.bean.Notice;
import com.kosta.petner.bean.PageInfo;
import com.kosta.petner.bean.Users;
import com.kosta.petner.dao.UsersDAO;
import com.kosta.petner.service.MypageService;
import com.kosta.petner.service.NoticeService;
import com.kosta.petner.service.UsersService;

@Controller
public class AdminController {

	@Autowired
	NoticeService noticeService;

	@Autowired
	UsersService usersService;

	@Autowired
	ServletContext servletContext;

	@Autowired
	MypageService mypageService;

	@Autowired
	UsersDAO usersDAO;

	@Autowired
	HttpSession session;

	// 관리자페이지 메인화면
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	String main(Model model) {
		model.addAttribute("page", "admin/ad_main");
		model.addAttribute("title", "관리자 메인 페이지");
		return "/layout/admin_main";
	}

	// 관리자페이지 권한관리 화면
	@RequestMapping(value = "/admin_authority", method = RequestMethod.GET)
	String admin_authority(Model model) {
		model.addAttribute("page", "admin/ad_authority");
		model.addAttribute("title", "권한관리");
		return "/layout/admin_main";
	}

	// 관리자페이지 회원정보 관리 화면
	@RequestMapping(value = "/admin_user", method = RequestMethod.GET)
	String admin_user(HttpSession session, Model model) {

		try {
			List list = usersDAO.selectAllUsers();
			model.addAttribute("list", list);
			model.addAttribute("page", "admin/ad_user");
			model.addAttribute("title", "회원정보 관리");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "전체 회원정보 조회 실패");
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
		// model.addAttribute("member", users);
		return "/layout/admin_main";
	}

	// 글쓰기 화면 이동
	@RequestMapping(value = "/ad_noticewriteform", method = RequestMethod.GET)
	public String ad_noticewriteform(Model model) {
		model.addAttribute("page", "admin/notice/writeform");
		return "/layout/admin_main";
	}

	// 글쓰기
	@RequestMapping(value = "/ad_noticewrite", method = RequestMethod.POST)
	public String ad_noticewrite(@ModelAttribute Notice notice, BindingResult result, Model model) {
		try {
			noticeService.resistNotice(notice);
			model.addAttribute("redirect:/ad_noticeList");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("/notice/err");
		}

		return "redirect:/ad_noticeList";
	}

	@RequestMapping(value = "/ad_noticeList", method = { RequestMethod.GET, RequestMethod.POST })
	public String ad_noticeList(@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			Model model) {
		PageInfo pageInfo = new PageInfo();
		try {
			List<Notice> articleList = noticeService.getNoticeList(page, pageInfo);
			model.addAttribute("articleList", articleList);
			model.addAttribute("pageInfo", pageInfo);
			model.addAttribute("page", "admin/notice/listform");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", e.getMessage());
			model.addAttribute("/notice/err");
		}
		return "/layout/admin_main";
	}

	@RequestMapping(value = "/ad_noticedetail", method = RequestMethod.GET)
	String ad_noticedetail(@RequestParam("notice_no") Integer noticeNum,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page, Model model) {
		// ModelAndView mav = new ModelAndView();
		try {
			// 조회수 증가
			noticeService.notice_read(noticeNum);
			Notice notice = noticeService.getNotice(noticeNum);
			model.addAttribute("article", notice);
			model.addAttribute("page", page);
			model.addAttribute("page", "admin/notice/viewform");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("/notice/err");
		}
		return "/layout/admin_main";
	}

	@RequestMapping(value = "/ad_noticemodifyform", method = RequestMethod.GET)
	String ad_noticemodifyform(@RequestParam("notice_no") Integer noticeNum, Model model) {
		// ModelAndView mav = new ModelAndView();
		try {
			Notice notice = noticeService.getNotice(noticeNum);
			model.addAttribute("article", notice);
			model.addAttribute("page", "admin/notice/modifyform");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "조회 실패");
			model.addAttribute("/notice/err");
		}
		return "/layout/admin_main";
	}

	@RequestMapping(value = "/ad_noticemodify", method = RequestMethod.POST)
	public String ad_noticemodify(@ModelAttribute Notice notice, Model model) {
		// ModelAndView mav = new ModelAndView();
		try {
			noticeService.modifyNotice(notice);
			model.addAttribute("notice_no", notice.getNotice_no());
			model.addAttribute("redirect:/ad_noticedetail");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", e.getMessage());
			model.addAttribute("/notice/err");
		}
		return "redirect:/ad_noticedetail";
	}

	@RequestMapping(value = "/ad_noticereplyform", method = RequestMethod.GET)
	public String ad_noticereplyform(@RequestParam("notice_no") Integer noticeNum,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page, Model model) {
		// ModelAndView mav = new ModelAndView();

		try {
//				model.addAttribute("/layout/admin_main");
			model.addAttribute("noticeNum", noticeNum);
			model.addAttribute("age", page);
			model.addAttribute("page", "admin/notice/replyform");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", e.getMessage());
			model.addAttribute("/notice/err");
		}
		return "/layout/admin_main";
	}

	@RequestMapping(value = "/ad_noticereply", method = RequestMethod.POST)
	public String ad_noticereply(@ModelAttribute Notice notice, Model model) {
		try {
			noticeService.noticeReply(notice);
			model.addAttribute("redirect:/ad_noticeList");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", e.getMessage());
			model.addAttribute("/notice/err");
		}
		return "redirect:/ad_noticeList";
	}

	@RequestMapping(value = "/ad_noticedeleteform", method = RequestMethod.GET)
	public ModelAndView ad_nodeleteform(@RequestParam("notice_no") Integer noticeNum,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("notice_no", noticeNum);
		mav.addObject("page", page);
		mav.setViewName("admin/notice/deleteform");
		return mav;
	}

	@RequestMapping(value = "/ad_noticedelete", method = RequestMethod.POST)
	public ModelAndView ad_noticedelete(@RequestParam("notice_no") Integer noticeNum,
//				@RequestParam(value="board_pass") String password,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page) {
		System.out.println("Controller:" + noticeNum);
		ModelAndView mav = new ModelAndView();
		try {
//				boardService.deleteBoard(boardNum, password);
			noticeService.deleteNotice(noticeNum);
			mav.addObject("page", page);
			mav.setViewName("redirect:/ad_noticeList");
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("err", e.getMessage());
			mav.setViewName("/notice/err");
		}
		return mav;
	}

}
