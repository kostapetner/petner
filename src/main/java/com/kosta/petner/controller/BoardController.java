package com.kosta.petner.controller;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.petner.bean.Board;
import com.kosta.petner.bean.PageInfo;
import com.kosta.petner.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;

	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value="/writeform", method=RequestMethod.GET)
	public String writeform(Model model) {
		model.addAttribute("page", "board/writeform");
		model.addAttribute("title", "공지사항 글쓰기");
		return "/layout/admin_main";
	}
	
	@RequestMapping(value="/boardwrite", method=RequestMethod.POST)
	public ModelAndView boardwrite(@ModelAttribute Board board) {
		ModelAndView mav = new ModelAndView();
		try {
			MultipartFile file = board.getFile();
			if(!file.isEmpty()) {
				//String path = servletContext.getRealPath("/upload/");
				String path = "/Users/yoo-jinkim/git/petner/src/main/webapp/resources/upload/board/";
				File destFile = new File(path+file.getOriginalFilename());
				file.transferTo(destFile);
				board.setBoard_file(file.getOriginalFilename());
			}
			
			boardService.resistBoard(board);
			mav.setViewName("redirect:/boardList");
		} catch(Exception e) {
			e.printStackTrace();
			mav.setViewName("/board/err");
		}
		return mav;
	}	
	
	@RequestMapping(value="/boardList", method= {RequestMethod.GET, RequestMethod.POST})
	String boardList(@RequestParam(value="page", required=false, defaultValue="1") Integer page, Model model) {
//		ModelAndView mav = new ModelAndView();
		PageInfo pageInfo = new PageInfo();
		try {
			List<Board> articleList = boardService.getBoardList(page, pageInfo);
			model.addAttribute("articleList", articleList);
			model.addAttribute("pageInfo", pageInfo);
			model.addAttribute("page","/board/listform");
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("err", e.getMessage());
			model.addAttribute("/board/err");
		}
		return "/layout/admin_main";
	}
	
	@RequestMapping(value="/boarddetail", method=RequestMethod.GET)
	String boarddetail(@RequestParam("board_num") Integer boardNum, 
			@RequestParam(value="page",required=false,defaultValue="1") Integer page, Model model) {
		// ModelAndView mav = new ModelAndView();
		try {
			Board board = boardService.getBoard(boardNum);
			model.addAttribute("article", board);
			model.addAttribute("page", page);
			model.addAttribute("page","/board/viewform");
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("/board/err");
		}
		return "/layout/admin_main";
	}
	
	@RequestMapping(value="/modifyform", method=RequestMethod.GET)
	String modifyform(@RequestParam("board_num") Integer boardNum, Model model) {
		// ModelAndView mav = new ModelAndView();
		try {
			Board board = boardService.getBoard(boardNum);
			model.addAttribute("article", board);
			model.addAttribute("page","/board/modifyform");
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "조회 실패");
			model.addAttribute("/board/err");
		}
		return "/layout/admin_main";
	}
	
	@RequestMapping(value="/boardmodify", method=RequestMethod.POST)
	public ModelAndView boardmodify(@ModelAttribute Board board) {
		ModelAndView mav = new ModelAndView();
		try {
			boardService.modifyBoard(board);
			mav.addObject("board_num", board.getBoard_num());
			mav.setViewName("redirect:/boarddetail");
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject("err", e.getMessage());
			mav.setViewName("/board/err");
		}
		return mav;
	}
	
	@RequestMapping(value="/replyform", method=RequestMethod.GET)
	String replyform(@RequestParam("board_num") Integer boardNum, 
			@RequestParam(value="page",required=false,defaultValue="1") Integer page, Model model) {
		// ModelAndView mav = new ModelAndView();
		try {
			model.addAttribute("boardNum", boardNum);
			model.addAttribute("age", page);
			model.addAttribute("page","/board/replyform");
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("err", e.getMessage());
			model.addAttribute("/board/err");
		}
		return "/layout/admin_main";
	}
	
	@RequestMapping(value="/boardreply", method=RequestMethod.POST)
	public ModelAndView boardreply(@ModelAttribute Board board, 
			@RequestParam(value="page",required=false,defaultValue="1") Integer page) {
		ModelAndView mav = new ModelAndView();
		try {
			boardService.boardReply(board);
			mav.addObject("page", page);
			mav.setViewName("redirect:/boardList");
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject("err", e.getMessage());
			mav.setViewName("/board/err");
		}
		return mav;
	}
	
	@RequestMapping(value="/deleteform", method=RequestMethod.GET)
	public ModelAndView deleteform(@RequestParam("board_num") Integer boardNum,
			@RequestParam(value="page",required=false,defaultValue="1") Integer page) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("board_num", boardNum);
		mav.addObject("page", page);
		mav.setViewName("/board/deleteform");
		return mav;
	}
	
	@RequestMapping(value="/boarddelete", method=RequestMethod.POST)
	public ModelAndView boarddelete(@RequestParam("board_num") Integer boardNum,
			@RequestParam(value="board_pass") String password,
			@RequestParam(value="page",required=false,defaultValue="1") Integer page) {
		System.out.println("Controller:"+boardNum);
		ModelAndView mav = new ModelAndView();
		try {
			boardService.deleteBoard(boardNum, password);
			mav.addObject("page", page);
			mav.setViewName("redirect:/boardList");
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject("err", e.getMessage());
			mav.setViewName("/board/err");
		}
		return mav;
	}
}















