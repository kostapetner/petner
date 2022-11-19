package com.kosta.petner.controller;

import java.io.File;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kosta.petner.bean.Qna;
import com.kosta.petner.bean.QnaPage;
import com.kosta.petner.bean.Users;
import com.kosta.petner.service.CommonService;
import com.kosta.petner.service.QnaServiceImpl;
import com.kosta.petner.service.UsersServiceImpl;


@Controller
public class QnaController {
	@Autowired private QnaServiceImpl service;
	@Autowired private CommonService common;
	@Autowired private UsersServiceImpl usersService;
	@Autowired private QnaPage page;
	
	//글 목록
	@RequestMapping("/list.qna")
	public String list(Model model, HttpSession session, @RequestParam(defaultValue = "1") int curPage,Users users, String search, String keyword) {
		//QNA 클릭 하면 admin으로 자동 로그인
		HashMap<String, String> map = new HashMap<String, String>();
		//HashMap : 데이터를 담을 자료 구조
//		map.put("id", "admin");
//		map.put("pw", "1234");
//		session.setAttribute("login_info", usersService.login(users));
		
		
		session.setAttribute("category", "qna");
		
		//DB에서 글 목록 조회해와 화면에 출력
		page.setCurPage(curPage);
		page.setSearch(search);
		page.setKeyword(keyword);
		
		model.addAttribute("page", service.qna_list(page));
		model.addAttribute("title", "qna");
		
		return "qna/list";
	}
	
	//신규 글 작성 화면 요청=========================================================
	@RequestMapping("/new.qna")
	public String qna() {
		return "qna/new";
	}
	
	//신규 글 저장 처리 요청
	@RequestMapping("/insert.qna")
	public String insert(MultipartFile file, Qna qna, HttpSession session) {
		//첨부한 파일을 서버 시스템에 업로드하는 처리
		if(!file.isEmpty()) {
			qna.setFilepath(common.upload("qna", file, session));
			qna.setFilename(file.getOriginalFilename());
		}
		
		qna.setWriter( ((Users) session.getAttribute("login_info")).getId() );
		//화면에서 입력한 정보를 DB에 저장한 후
		service.qna_insert(qna);
		//목록 화면으로 연결
		return "redirect:list.qna";
	}
	
	//QNA 글 상세 화면 요청
	@RequestMapping("/detail.qna")
	public String detail(int id, Model model) {
		//선택한 QNA 글에 대한 조회수 증가 처리
		service.qna_read(id);
		
		//선택한 QNA 글 정보를 DB에 조회해와 상세 화면에 출력
		model.addAttribute("vo", service.qna_detail(id));
		model.addAttribute("crlf", "\r\n");
		model.addAttribute("page", page);
		
		return "qna/detail";
	} //detail()
	
	//첨부 파일 다운로드 요청
	@ResponseBody @RequestMapping("/download.qna")
	public void download(int id, HttpSession session, HttpServletResponse response) {
		Qna qna = service.qna_detail(id);
		common.download(qna.getFilename(), qna.getFilepath(), session, response);
	} // download()
	
	//QNA 글 삭제 처리 요청
	@RequestMapping("/delete.qna")
	public String delete(int id, HttpSession session) {
		//선택한 QNA 글에 첨부한 파일이 있다면 서버의 물리적 영역에서 해당 파일도 삭제한다
		Qna qna = service.qna_detail(id);
		if(qna.getFilepath() != null) {
			File file = new File(session.getServletContext().getRealPath("resources") + qna.getFilepath());
			if( file.exists() ) { file.delete(); }
		}
		
		//선택한 QNA 글을 DB에서 삭제한 후 목록 화면으로 연결
		service.qna_delete(id);
		
		return "redirect:list.qna";
	} //delete()
	
	//QNA 글 수정 화면 요청
	@RequestMapping("/modify.qna")
	public String modify(int id, Model model) {
		//선택한 QNA 글 정보를 DB에서 조회해와 수정 화면에 출력
		model.addAttribute("vo", service.qna_detail(id));
		return "qna/modify";
	} //modify()
	
	//QNA 글 수정 처리 요청
	@RequestMapping("/update.qna")
	public String update(Qna qna, MultipartFile file, HttpSession session, String attach) {
		//원래 글의 첨부 파일 관련 정보를 조회
		Qna qna1 = service.qna_detail(qna.getId());
		String uuid = session.getServletContext().getRealPath("resources") + qna1.getFilepath();
		
		//파일을 첨부한 경우 - 없었는데 첨부 / 있던 파일을 바꿔서 첨부
		if(!file.isEmpty()) {
			qna.setFilename(file.getOriginalFilename());
			qna.setFilepath(common.upload("qna", file, session));
			
			//원래 있던 첨부 파일은 서버에서 삭제
			if(qna1.getFilename() != null) {
				File f = new File(uuid);
				if (f.exists()) { f.delete(); }
			}
		} else {
			//원래 있던 첨부 파일을 삭제됐거나 원래부터 첨부 파일이 없었던 경우
			if(attach.isEmpty()) {
				//원래 있던 첨부 파일은 서버에서 삭제
				if(qna1.getFilename() != null) {
					File f = new File(uuid);
					if (f.exists()) { f.delete(); }
				}
				

			} else { //원래 있던 첨부 파일을 그대로 사용하는 경우
				qna.setFilename(qna1.getFilename());
				qna.setFilepath(qna1.getFilepath());
			}
		}
		
		//화면에서 변경한 정보를 DB에 저장한 후 상세 화면으로 연결
		service.qna_update(qna);
		
		return "redirect:detail.qna?id=" + qna.getId();
	} //update()
	
	//답글 쓰기 화면 요청==================================================================
	@RequestMapping("/reply.qna")
	public String reply(Model model, int id) {
		//원글의 정보를 답글 쓰기 화면에서 알 수 있도록 한다.
		model.addAttribute("vo", service.qna_detail(id));
		
		return "qna/reply";
	} //reply()
	
	//신규 답글 저장 처리 요청==============================================================
	@RequestMapping("/reply_insert.qna")
	public String reply_insert(Qna qna, HttpSession session, MultipartFile file) {
		if(!file.isEmpty()) {
			qna.setFilename(file.getOriginalFilename());
			qna.setFilepath(common.upload("qna", file, session));
		}
		qna.setWriter(((Users) session.getAttribute("login_info")).getId());
		
		//화면에서 입력한 정보를 DB에 저장한 후 목록 화면으로 연결
		service.qna_reply_insert(qna);
		return "redirect:list.qna";
	} //reply_insert()
}

