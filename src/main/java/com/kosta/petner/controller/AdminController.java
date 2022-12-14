package com.kosta.petner.controller;

import java.io.File;
import java.net.MalformedURLException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.petner.bean.Notice;
import com.kosta.petner.bean.NoticePage;
import com.kosta.petner.bean.PageInfo;
import com.kosta.petner.bean.Qna;
import com.kosta.petner.bean.QnaPage;
import com.kosta.petner.bean.Users;
import com.kosta.petner.dao.UsersDAO;
import com.kosta.petner.service.AdminService;
import com.kosta.petner.service.CommonService;
import com.kosta.petner.service.FileService;
import com.kosta.petner.service.MypageService;
import com.kosta.petner.service.NoticeService;
import com.kosta.petner.service.QnaService;
import com.kosta.petner.service.UsersService;

@Controller
public class AdminController {

	@Autowired
	QnaPage qnaPage;
	
	@Autowired
	NoticePage noticePage;
	
	@Autowired
	CommonService common;

	@Autowired
	AdminService adminService;

	@Autowired
	QnaService qnaService;

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

	@Autowired
	FileService fileService;

	// ******* 관리자 메인화면
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	String main(Model model) {

		model.addAttribute("page", "admin/ad_main");
		model.addAttribute("title", "관리자 메인 페이지");
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
		return "/layout/admin_main";
	}

	// 관리자 유저 디테일 화면조회 이동
	@RequestMapping(value = "/ad_detailForm", method = RequestMethod.GET)
	public String ad_authorityForm(@RequestParam("user_no") Integer user_no, Model model) throws Exception {
		// user_no 로 회원의 상세 정보 전부 조회
		Users users = usersService.getUserByUserNo(user_no);
		model.addAttribute("users", users);
		model.addAttribute("page", "admin/ad_detail");
		return "/layout/admin_main";
	}

	// 관리자 유저 타입 업데이트 요청
	@RequestMapping(value = "/ad_userupdate")
	public String ad_userupdate(Users users, Model model) {
		usersService.updateUserType(users);
//			model.addAttribute("users", users);
//			model.addAttribute("page", "admin/ad_detail");
		return "redirect:/admin_user";
		// return "redirect:ad_detailForm?user_no=" + users.getUser_no();
	}

//		@RequestMapping(value = "/ad_authorityForm", method = RequestMethod.GET)
//		String admin_authorityForm(@RequestParam("user_no") Integer user_no,
//				 Model model) {
//			try {
//				// 조회수 증가
//				Users users = usersService.getUserByUserNo(user_no);
//				model.addAttribute("users", users);
//				model.addAttribute("page", "admin/ad_authority");
//			} catch (Exception e) {
//				e.printStackTrace();
//				model.addAttribute("/notice/err");
//			}
//			return "/layout/admin_main";
//		}
//		
//		@RequestMapping(value = "/ad_authority", method = RequestMethod.POST)
//		public String ad_authority(@ModelAttribute Users users, Model model) {
//			try {
////				noticeService.modifyNotice(users);
////				model.addAttribute("notice_no", notice.getNotice_no());
//				model.addAttribute("redirect:/admin/ad_authority");
//			} catch (Exception e) {
//				e.printStackTrace();
//				model.addAttribute("err", e.getMessage());
//				model.addAttribute("/notice/err");
//			}
//			return "redirect:/admin/ad_authority";
//		}

	// 관리자 회원탈퇴
	@RequestMapping(value = "/ad_usersdelete", method = RequestMethod.POST)
	public ModelAndView ad_usersdelete(@RequestParam("user_no") Integer user_no) {
		System.out.println("Controller:" + user_no);
		ModelAndView mav = new ModelAndView();
		try {
			// 회원 탈퇴 시키기
			usersService.deleteUsers(user_no);
			mav.setViewName("redirect:/admin_user");
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("err", e.getMessage());
			mav.setViewName("/notice/err");
		}
		return mav;
	}

	/////////////////////// notice ///////////////////////

	// 공지사항 목록화면 요청//////////////////////////////////////////////////////
		@RequestMapping("/ad_list_notice")
		public String ad_list_notice(Model model, HttpSession session, @RequestParam(defaultValue = "1") int curPage, String search,
				String keyword) {
			try {
				// 공지사항 클릭 하면 admin으로 자동 로그인
				HashMap<String, String> map = new HashMap<String, String>();
				// HashMap : 데이터를 담을 자료 구조
				// map.put("id", "admin");
				// map.put("pw", "1234");
				// session.setAttribute("login_info", users.login(map));
				session.setAttribute("category", "no");
				// DB에서 공지 글 목록을 조회해와 목록 화면에 출력
				noticePage.setCurPage(curPage);
				noticePage.setSearch(search);
				noticePage.setKeyword(keyword);
				model.addAttribute("notice", noticeService.notice_list(noticePage));
				model.addAttribute("page", "admin/notice/list");

			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("err", e.getMessage());
				model.addAttribute("/notice/err");
			}

			return "/layout/admin_main";
		}

		// 신규 공지 글 작성 화면 요청//////////////////////////////////////////////////////
		@RequestMapping("/ad_new_notice")
		public String ad_new_notice(Model model) {
			model.addAttribute("page", "admin/notice/new");
			return "/layout/admin_main";
		}

//		//신규 공지 글 저장 처리 요청//////////////////////////////////////////////////////
		@RequestMapping("/ad_insert_notice")
		public String ad_insert_notice(MultipartFile file, Notice vo, HttpSession session) {
			//첨부한 파일을 서버 시스템에 업로드하는 처리
			if( !file.isEmpty() ) {
				vo.setFilepath(common.upload("notice", file, session));
				vo.setFilename(file.getOriginalFilename());
			}
			
			vo.setWriter( ((Users) session.getAttribute("authUser")).getId() );
			//화면에서 입력한 정보를 DB에 저장한 후
			noticeService.notice_insert(vo);
			//목록 화면으로 연결
			return "redirect:ad_list_notice";
		}
		
		// 저장된 이미지 보여주기
		public @RequestMapping(value = "/{ad_filepath}", method = RequestMethod.GET)
		UrlResource ad_showImage(int id,MultipartFile file,@PathVariable String filepath,HttpServletResponse response) throws
		MalformedURLException {
			Notice vo = noticeService.notice_detail(id);
			
		 	return new UrlResource("file:" + vo.getFilepath());
		 	
		 }


		// 공지글 상세 화면 요청//////////////////////////////////////////////////////
		@RequestMapping("/ad_detail_notice")
		public String ad_detail_notice(int id, Model model) {
			try {
				// 선택한 공지글에 대한 조회수 증가 처리
				noticeService.notice_read(id);

				// 선택한 공지글 정보를 DB에서 조회해와 상세 화면에 출력
				model.addAttribute("vo", noticeService.notice_detail(id));
				model.addAttribute("crlf", "\r\n");
				model.addAttribute("notice", noticePage);
				model.addAttribute("page", "admin/notice/detail");

			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("err", e.getMessage());
				model.addAttribute("/notice/err");
			}

			return "/layout/admin_main";
		} // detail()

		// 첨부파일 다운로드 요청//////////////////////////////////////////////////////
		@ResponseBody
		@RequestMapping("/ad_download_notice")
		public void ad_download_notice(int id, HttpSession session, HttpServletResponse response) {
			Notice vo = noticeService.notice_detail(id);
			common.download(vo.getFilename(), vo.getFilepath(), session, response);
		} // download()

		// 공지글 삭제 처리 요청//////////////////////////////////////////////////////
		@RequestMapping("/ad_delete_notice")
		public String ad_delete_notice(int id, HttpSession session) {
			// 선택한 공지글에 첨부된 파일이 있다면 서버의 물리적 영역에서 해당 파일도 삭제한다
			Notice vo = noticeService.notice_detail(id);
			if (vo.getFilepath() != null) {
				File file = new File(session.getServletContext().getRealPath("resources") + vo.getFilepath());
				if (file.exists()) {
					file.delete();
				}
			}

			// 선택한 공지글을 DB에서 삭제한 후 목록 화면으로 연결
			noticeService.notice_delete(id);

			return "redirect:ad_list_notice";
		} // delete()

		// 공지글 수정 화면 요청//////////////////////////////////////////////////////
		@RequestMapping("/ad_modify_notice")
		public String ad_modify_notice(int id, Model model) {
			// 선택한 공지글 정보를 DB에서 조회해와 수정화면에 출력
			model.addAttribute("vo", noticeService.notice_detail(id));
			model.addAttribute("page", "admin/notice/modify");
			return "/layout/admin_main";
		} // modify()

		// 공지글 수정 처리 요청//////////////////////////////////////////////////////
		@RequestMapping("/ad_update_notice")
		public String ad_update_notice(Notice vo, MultipartFile file, HttpSession session, String attach) {
			// 원래 공지글의 첨부 파일 관련 정보를 조회
			Notice notice = noticeService.notice_detail(vo.getId());
			String uuid = session.getServletContext().getRealPath("resources") + notice.getFilepath();

			// 파일을 첨부한 경우 - 없었는데 첨부 / 있던 파일을 바꿔서 첨부
			if (!file.isEmpty()) {
				vo.setFilename(file.getOriginalFilename());
				vo.setFilepath(common.upload("notice", file, session));

				// 원래 있던 첨부 파일은 서버에서 삭제
				if (notice.getFilename() != null) {
					File f = new File(uuid);
					if (f.exists()) {
						f.delete();
					}
				}

			} else {
				// 원래 있던 첨부 파일을 삭제됐거나 원래부터 첨부 파일이 없었던 경우
				if (attach.isEmpty()) {
					// 원래 있던 첨부 파일은 서버에서 삭제
					if (notice.getFilename() != null) {
						File f = new File(uuid);
						if (f.exists()) {
							f.delete();
						}
					}

					// 원래 있던 첨부 파일을 그대로 사용하는 경우
				} else {
					vo.setFilename(notice.getFilename());
					vo.setFilepath(notice.getFilepath());
				}

			}

			// 화면에서 변경한 정보를 DB에 저장한 후 상세 화면으로 연결
			noticeService.notice_update(vo);

			return "redirect:ad_detail_notice?id=" + vo.getId();
		} // update()

		// 공지글 답글 쓰기 화면
		// 요청=============================================================================================
		@RequestMapping("/ad_reply_notice")
		public String ad_reply_notice(Model model, int id) {
			// 원글의 정보를 답글 쓰기 화면에서 알 수 있도록 한다.
			model.addAttribute("vo", noticeService.notice_detail(id));
			model.addAttribute("page", "admin/notice/reply");
			return "/layout/admin_main";
		} // reply()

		// 공지글 신규 답글 저장 처리
		// 요청=============================================================================================
		@RequestMapping("/ad_reply_insert_notice")
		public String ad_reply_insert_notice(Notice vo, HttpSession session, MultipartFile file) {
			if (!file.isEmpty()) {
				vo.setFilename(file.getOriginalFilename());
				vo.setFilepath(common.upload("notice", file, session));
			}
			vo.setWriter(((Users) session.getAttribute("authUser")).getId());

			// 화면에서 입력한 정보를 DB에 저장한 후 목록화면으로 연결
			noticeService.notice_reply_insert(vo);
			return "redirect:ad_list_notice";
		} // reply_insert()
	
	
	
	
	
	//////////////////////////////////////////////////////
	
	
	
	// 관리자 공지사항 글쓰기 화면 이동
//	@RequestMapping(value = "/ad_noticewriteform", method = RequestMethod.GET)
//	public String ad_noticewriteform(Model model) {
//		model.addAttribute("page", "admin/notice/writeform");
//		return "/layout/admin_main";
//	}

//	// 관리자 공지사항 DB insert
//	@RequestMapping(value = "/ad_noticewrite", method = RequestMethod.POST)
//	public String ad_noticewrite(MultipartFile file, @ModelAttribute Notice notice, HttpSession session)
//			throws Exception {
//		// 첨부한 파일을 서버 시스템에 업로드하는 처리
//		if (!file.isEmpty()) {
//			notice.setFilepath(common.upload("qna", file, session));
//			notice.setFile_no(file.getOriginalFilename());
//		}
//
//		noticeService.resistNotice(notice);
//
//		return "redirect:ad_noticeList";
//
//	}
//
//	// notice_첨부 파일 다운로드 요청
//	@ResponseBody
//	@RequestMapping("/ad_notice_download")
//	public void download(Integer noticeNum, HttpSession session, HttpServletResponse response) throws Exception {
//		Notice notice = noticeService.getNotice(noticeNum);
//		common.download(notice.getFile_no(), notice.getFilepath(), session, response);
//	} // download()
//
//	
//	// 관리자 notice 공지사항 리스트
//	@RequestMapping(value = "/ad_noticeList", method = { RequestMethod.GET, RequestMethod.POST })
//	public String ad_noticeList(@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
//			Model model) {
//		PageInfo pageInfo = new PageInfo();
//		try {
//			// 페이징
//			List<Notice> articleList = noticeService.getNoticeList(page, pageInfo);
//			model.addAttribute("articleList", articleList);
//			model.addAttribute("pageInfo", pageInfo);
//			model.addAttribute("page", "admin/notice/listform");
//		} catch (Exception e) {
//			e.printStackTrace();
//			model.addAttribute("err", e.getMessage());
//			model.addAttribute("/notice/err");
//		}
//		return "/layout/admin_main";
//	}
//
//	// 관리자 notice 공지사항 뷰페이지 디테일
//	@RequestMapping(value = "/ad_noticedetail", method = RequestMethod.GET)
//	String ad_noticedetail(@RequestParam("notice_no") Integer noticeNum, String server_filename,
//			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page, Model model) {
//		try {
//			// 조회수 증가
//			noticeService.notice_read(noticeNum);
//			Notice notice = noticeService.getNotice(noticeNum);
//			model.addAttribute("article", notice);
//			model.addAttribute("page", page);
//			model.addAttribute("page", "admin/notice/viewform");
//		} catch (Exception e) {
//			e.printStackTrace();
//			model.addAttribute("/notice/err");
//		}
//		return "/layout/admin_main";
//	}
//
//	// 관리자 notice 공지사항 수정 페이지이동
//	@RequestMapping(value = "/ad_noticemodifyform", method = RequestMethod.GET)
//	String ad_noticemodifyform(@RequestParam("notice_no") Integer noticeNum, Model model) {
//		try {
//			Notice notice = noticeService.getNotice(noticeNum);
//
//			model.addAttribute("article", notice);
//			model.addAttribute("page", "admin/notice/modifyform");
//		} catch (Exception e) {
//			e.printStackTrace();
//			model.addAttribute("err", "조회 실패");
//			model.addAttribute("/notice/err");
//		}
//		return "/layout/admin_main";
//	}
//
//	// 관리자 notice 공지사항 수정
//	@RequestMapping(value = "/ad_noticemodify", method = RequestMethod.POST)
//	public String ad_noticemodify(@ModelAttribute Notice notice, Model model) {
//		try {
//			noticeService.modifyNotice(notice);
//			model.addAttribute("notice_no", notice.getNotice_no());
//			model.addAttribute("redirect:/ad_noticedetail");
//		} catch (Exception e) {
//			e.printStackTrace();
//			model.addAttribute("err", e.getMessage());
//			model.addAttribute("/notice/err");
//		}
//		return "redirect:/ad_noticedetail";
//	}
//
//	// 관리자 공지사항 답글 페이지 이동 ( test )
//	@RequestMapping(value = "/ad_noticereplyform", method = RequestMethod.GET)
//	public String ad_noticereplyform(@RequestParam("notice_no") Integer noticeNum,
//			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page, Model model) {
//
//		try {
//			model.addAttribute("noticeNum", noticeNum);
//			model.addAttribute("age", page);
//			model.addAttribute("page", "admin/notice/replyform");
//		} catch (Exception e) {
//			e.printStackTrace();
//			model.addAttribute("err", e.getMessage());
//			model.addAttribute("/notice/err");
//		}
//		return "/layout/admin_main";
//	}
//
//	// 관리자 notice 공지사항 답글쓰기
//	@RequestMapping(value = "/ad_noticereply", method = RequestMethod.POST)
//	public String ad_noticereply(@ModelAttribute Notice notice, Model model) {
//		try {
//			noticeService.noticeReply(notice);
//			model.addAttribute("redirect:/ad_noticeList");
//		} catch (Exception e) {
//			e.printStackTrace();
//			model.addAttribute("err", e.getMessage());
//			model.addAttribute("/notice/err");
//		}
//		return "redirect:/ad_noticeList";
//	}
//
//	// 관리자 notice 공지사항 삭제 페이지 이동
//	@RequestMapping(value = "/ad_noticedeleteform", method = RequestMethod.GET)
//	public ModelAndView ad_nodeleteform(@RequestParam("notice_no") Integer noticeNum,
//			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page) {
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("notice_no", noticeNum);
//		mav.addObject("page", page);
//		mav.setViewName("admin/notice/deleteform");
//		return mav;
//	}
//
//	// 관리자 notice 공지사항 삭제
//	@RequestMapping(value = "/ad_noticedelete", method = RequestMethod.POST)
//	public ModelAndView ad_noticedelete(@RequestParam("notice_no") Integer noticeNum,
////				@RequestParam(value="board_pass") String password,
//			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page) {
//		System.out.println("Controller:" + noticeNum);
//		ModelAndView mav = new ModelAndView();
//		try {
////				boardService.deleteBoard(boardNum, password);
//			adminService.deleteNotice(noticeNum);
//			mav.addObject("page", page);
//			mav.setViewName("redirect:/ad_noticeList");
//		} catch (Exception e) {
//			e.printStackTrace();
//			mav.addObject("err", e.getMessage());
//			mav.setViewName("/notice/err");
//		}
//		return mav;
//	}

	/////////////////////// qna ///////////////////////

	// qna_list 정보 불러오기
	@RequestMapping(value = "/ad_qnaList", method = { RequestMethod.GET, RequestMethod.POST })
	public String qnaList(@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,String search, String keyword,
			Model model) {
		PageInfo pageInfo = new PageInfo();
		try {
			qnaPage.setSearch(search);
			qnaPage.setKeyword(keyword);
			List<Qna> articleList = qnaService.getQnaList(page, pageInfo);
			model.addAttribute("articleList", articleList);
			model.addAttribute("pageInfo", pageInfo);
			model.addAttribute("page", "/admin/qna/listform");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", e.getMessage());
			model.addAttribute("/qna/err");
		}
		return "/layout/admin_main";
	}

	// qna_글쓰기 화면 이동
	@RequestMapping(value = "/ad_qnawriteform", method = RequestMethod.GET)
	public String qnawriteform(Model model) {

		model.addAttribute("page", ".admin/qna/writeform");
		model.addAttribute("title", "글쓰기");
		return "/layout/admin_main";
	}

	// qna_글쓰기 DB insert
	@RequestMapping(value = "/ad_qnawrite", method = RequestMethod.POST)
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
		return "redirect:ad_qnaList";
	}

	// 관리자 qna 뷰페이지 디테일
	@RequestMapping(value = "/ad_qnadetail", method = RequestMethod.GET)
	String ad_qnadetail(@RequestParam("qna_no") Integer qnaNum, String server_filename,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page, Model model) {
		try {
			// 조회수 증가
			qnaService.qna_read(qnaNum);
			Qna qna = qnaService.getQna(qnaNum);
			model.addAttribute("article", qna);
			model.addAttribute("page", page);
			model.addAttribute("page", "admin/qna/viewform");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("/notice/err");
		}
		return "/layout/admin_main";
	}

	// 관리자 qna 삭제
	@RequestMapping(value = "/ad_qnadelete", method = RequestMethod.POST)
	public ModelAndView ad_qnadelete(@RequestParam("qna_no") Integer qnaNum,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page) {
		System.out.println("Controller:" + qnaNum);
		ModelAndView mav = new ModelAndView();
		try {
			adminService.deleteQna(qnaNum);
			mav.addObject("page", page);
			mav.setViewName("redirect:/ad_qnaList");
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("err", e.getMessage());
			mav.setViewName("/notice/err");
		}
		return mav;
	}
	
	
	/////////////////////// qna.end

}
