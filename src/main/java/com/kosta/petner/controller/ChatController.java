package com.kosta.petner.controller;

import java.io.FileInputStream;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kosta.petner.bean.Chat;
import com.kosta.petner.dao.ChatDAO;

@RestController
public class ChatController {
	@Resource(name="uploadPath")
	private String path;
	
	@Autowired
	ChatDAO dao;
	
	@RequestMapping("/chat/json")
	public List<Chat> list(){
		return dao.list();
	}
	
	@RequestMapping(value="chat/insert", method=RequestMethod.POST)
	public int insert(Chat vo){
		dao.insert(vo);
		int last=dao.last();
		System.out.println("last......." + last);
		return last;
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public void insert(int chat_no){
		dao.delete(chat_no);
	}
	
	//이미지파일 출력
	@RequestMapping("/display")
	public byte[] display(String file)throws Exception{
      FileInputStream in=new FileInputStream(path + "/" + file);
      byte[] image=IOUtils.toByteArray(in);
      in.close();
      return image;
	}
}