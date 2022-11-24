package com.kosta.petner.controller;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
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

import com.kosta.petner.bean.FileVO;
import com.kosta.petner.bean.Notice;
import com.kosta.petner.bean.PageInfo;
import com.kosta.petner.bean.SitterInfo;
import com.kosta.petner.bean.Users;
import com.kosta.petner.dao.UsersDAO;
import com.kosta.petner.service.FileService;
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
	
	@Autowired
	FileService fileService;

	// 관리자 메인화면
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	String main(Model model) {
		model.addAttribute("page", "admin/ad_main");
		model.addAttribute("title", "관리자 메인 페이지");
		return "/layout/admin_main";
	}

	// 관리자 권한관리 화면
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
		return "/layout/admin_main";
	}
	
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

	// 관리자 공지사항 글쓰기 화면 이동
	@RequestMapping(value = "/ad_noticewriteform", method = RequestMethod.GET)
	public String ad_noticewriteform(Model model) {
		model.addAttribute("page", "admin/notice/writeform");
		return "/layout/admin_main";
	}

//	// 글쓰기
//	@RequestMapping(value = "/ad_noticewrite", method = RequestMethod.POST)
//	public String ad_noticewrite(@ModelAttribute Notice notice, BindingResult result, Model model) {
//		try {
//			noticeService.resistNotice(notice);
//			model.addAttribute("redirect:/ad_noticeList");
//		} catch (Exception e) {
//			e.printStackTrace();
//			model.addAttribute("/notice/err");
//		}
//
//		return "redirect:/ad_noticeList";
//	}
	

	// 관리자 공지사항 DB insert
	@RequestMapping(value = "/ad_noticewriteform/register", method = RequestMethod.POST)
	public ModelAndView ad_noticeregister(Model model, @ModelAttribute Notice notice) {
		ModelAndView mav = new ModelAndView();
		try {
			// 파일
			MultipartFile file = notice.getImageFile(); //파일 자체를 가져옴
			// 서버에 올라갈 랜덤한 파일 이름을 만든다
			String generatedString = RandomStringUtils.randomAlphanumeric(10);
			String filename = file.getOriginalFilename();
			int idx = filename.lastIndexOf(".");//확장자 위치
			String ext = filename.substring(filename.lastIndexOf("."));
			String real_filename = filename.substring(0, idx);//확장자분리
			String server_filename = real_filename + generatedString + ext;
			if(!file.isEmpty()) {
				//1.폴더생성
				FileVO fileVO = new FileVO();
				String path = servletContext.getRealPath("/resources/upload/");//업로드 할 폴더 경로
				File fileLocation = new File(path);
				File destFile = new File(path+server_filename);
				System.out.println(destFile);
				if (fileLocation.exists()) {
					System.out.println("이미 폴더가 생성되어 있습니다.");
					file.transferTo(destFile);
			    }else {
			    	try{
			    		Path directoryPath = Paths.get(path);
						System.out.println(directoryPath);
						Files.createDirectory(directoryPath);//폴더생성
						System.out.println("폴더가 생성되었습니다.");
						file.transferTo(destFile);
					}catch(Exception e){
					    e.getStackTrace();
					}        
				}
					
				//2. 파일정보 파일테이블에 넣기
				fileVO.setUser_no(notice.getNotice_no());
				fileVO.setBoard_no(1);
				fileVO.setOrigin_filename(filename);//파일의 이름을 넣어주기위해 따로 설정
				fileVO.setServer_filename(server_filename);
				fileService.insertFile(fileVO);
				
				//3. notice_info테이블에 정보 넣기
				//3-1. server_filname에 맞는 file_no가져오기
				Integer file_no = fileService.getFileNo(server_filename);
				notice.setFile_no(file_no);
				System.out.println(notice.toString());
				noticeService.resistNotice(notice);
				
				mav.setViewName("redirect:/");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	// 관리자 공지사항 리스트
	@RequestMapping(value = "/ad_noticeList", method = { RequestMethod.GET, RequestMethod.POST })
	public String ad_noticeList(@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			Model model) {
		PageInfo pageInfo = new PageInfo();
		try {
			// 페이징
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

	// 관리자 공지사항 뷰페이지 디테일
	@RequestMapping(value = "/ad_noticedetail", method = RequestMethod.GET)
	String ad_noticedetail(@RequestParam("notice_no") Integer noticeNum,String server_filename,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page, Model model) {
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

	// 관리자 공지사항 수정 페이지
	@RequestMapping(value = "/ad_noticemodifyform", method = RequestMethod.GET)
	String ad_noticemodifyform(@RequestParam("notice_no") Integer noticeNum, Model model) {
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

	// 관리자 공지사항 답글 페이지 이동 ( test )
	@RequestMapping(value = "/ad_noticereplyform", method = RequestMethod.GET)
	public String ad_noticereplyform(@RequestParam("notice_no") Integer noticeNum,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page, Model model) {

		try {
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

	// 관리자 답글쓰기
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

	// 관리자 공지사항 삭제 페이지 이동
	@RequestMapping(value = "/ad_noticedeleteform", method = RequestMethod.GET)
	public ModelAndView ad_nodeleteform(@RequestParam("notice_no") Integer noticeNum,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("notice_no", noticeNum);
		mav.addObject("page", page);
		mav.setViewName("admin/notice/deleteform");
		return mav;
	}

	// 관리자 공지사항 삭제
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
