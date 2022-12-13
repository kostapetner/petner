package com.kosta.petner.controller;


import java.util.ArrayList;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.petner.bean.ChatMessage;
import com.kosta.petner.bean.ChatRoom;
import com.kosta.petner.bean.ChatSession;
import com.kosta.petner.bean.Users;
import com.kosta.petner.service.ChatService;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

@Controller
public class ChatController {
   
   @Autowired
   ChatService cService;
   
   
   @Autowired
   private ChatSession cSession;
   
   /**
    * 해당 채팅방의 채팅 메세지 불러오기
    * @param roomId
    * @param model
    * @param response
    * @throws JsonIOException
    * @throws IOException
    */
   @RequestMapping(value="{room_id}.do")
   public void messageList(@PathVariable String room_id, String user_id, Model model, HttpServletResponse response) throws JsonIOException, IOException {
       
       List<ChatMessage> mList = cService.messageList(room_id);
       response.setContentType("application/json; charset=utf-8");

       // 안읽은 메세지의 숫자 0으로 바뀌기
       ChatMessage message = new ChatMessage();
       message.setUser_id(user_id);
       message.setRoom_id(room_id);
       cService.updateCount(message);
       
       Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
       gson.toJson(mList,response.getWriter());
   }
   
   /**
    * 채팅 방이 없을 때 생성
    * @param room
    * @param userEmail
    * @param masterNickname
    * @return
    */
 
   @RequestMapping(value="createChat.do", method = RequestMethod.POST)
   public String createChat(ChatRoom room, String user_name, String user_id){
       
		/* UserMaster m = pService.getProductDetail(masterNickname); */
       
       room.setUser_id(user_id);
       room.setUser_name(user_name);
		/*
		 * room.setMasterEmail(m.getEmail()); room.setMasterName(m.getmNickname());
		 * room.setMasterPic(m.getmProPicRe());
		 */

       ChatRoom exist  = cService.searchChatRoom(room);
       
       // DB에 방이 없을 때
       if(exist == null) {
           System.out.println("방이 없다!!");
           int result = cService.createChat(room);
           if(result == 1) {
               System.out.println("방 만들었다!!");
               return "mypage/chat/chatForm";
           }else {
               return "redirect:/";
           }
       }
       // DB에 방이 있을 때
       else{
           System.out.println("방이 있다!!");
           return "mypage/chat/chatForm";
       }
   }
   
   /**
    * 채팅 방 목록 불러오기
    * @param room
    * @param userEmail
    * @param response
    * @throws JsonIOException
    * @throws IOException
    */
   @RequestMapping("chatRoomList.do")
   public void createChat(ChatRoom room, ChatMessage message, String user_id, HttpServletResponse response) throws JsonIOException, IOException{
       List<ChatRoom> cList = cService.chatRoomList(user_id);
       
       for(int i = 0; i < cList.size(); i++) {
           message.setRoom_id(cList.get(i).getRoom_id());
           message.setUser_id(user_id);
           int count = cService.selectUnReadCount(message);
           cList.get(i).setUnReadCount(count);
       }
       
       response.setContentType("application/json; charset=utf-8");

       Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
       gson.toJson(cList,response.getWriter());
   }
   
   @RequestMapping("chatSession.do")
   public void chatSession( HttpServletResponse response) throws JsonIOException, IOException{
       
       ArrayList<String> chatSessionList = cSession.getAuthUser();
       
       response.setContentType("application/json; charset=utf-8");

       Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
       gson.toJson(chatSessionList,response.getWriter());
   }
   
}
