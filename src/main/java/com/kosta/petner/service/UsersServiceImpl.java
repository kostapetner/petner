package com.kosta.petner.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.petner.bean.Users;
import com.kosta.petner.dao.UsersDAO;

@Service
public class UsersServiceImpl implements UsersService {

	@Autowired
	UsersDAO usersDAO;
	
	
	@Override
	public void joinUsers(Users users) throws Exception {
		System.out.println("service:" +users);
		Users usersvo = usersDAO.selectId(users.getId());
		if(usersvo!=null) throw new Exception("아이디 중복");
		usersDAO.insertUsers(users);
		
	}

 
	@Override
	public boolean isDoubleId(String id) throws Exception {

		//userDAO를 통해 xml에서 가져온 id 값을 users에 담는다.
		Users users = usersDAO.selectId(id);
		if(users==null) return false;
		return true;
	}


	
	@Override
	public Users getUsers(Users users) {
		return usersDAO.getUsers(users.getId(), users.getPassword());
			}


	@Override
	public Users findId(Users users){
		return usersDAO.getId(users.getName(), users.getEmail());
	}


	@Override
	public void sendEmail(Users users, String div) throws Exception {
		
		System.setProperty("https.protocols", "TLSv1,TLSv1.1,TLSv1.2");


		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; //네이버 이용시 smtp.naver.com
		String hostSMTPid = "cdu3124@gmail.com";
		String hostSMTPpwd = "gzsytehpztjwwnib";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "petner@petner.com";
		String fromName = "펫트너";
		String subject = "";
		String msg = "";

		if(div.equals("findPass")) {
			subject = "펫트너 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += users.getId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += users.getPassword() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = users.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465); //네이버 이용시 587

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}
	@Override
	public void findPass(HttpServletResponse response, Users users) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		Users vo = usersDAO.selectId(users.getId());
		PrintWriter out = response.getWriter();
		// 가입된 아이디가 없으면
		if(usersDAO.selectId(users.getId()) == null) {
			out.print("아이디 정보가 일치하지 않습니다.");
			out.close();
		}
		// 가입된 이메일이 아니면
		else if(!users.getEmail().equals(vo.getEmail()))  {
			out.print( "이메일 정보가 일치하지 않습니다.");
			out.close();
		}else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			users.setPassword(pw);
			// 비밀번호 변경
			usersDAO.updatePw(users);
			// 비밀번호 변경 메일 발송
			sendEmail(users, "findPass");

			out.print("등록된 이메일로 임시비밀번호를 발송하였습니다.");
			out.close();
		}
	}

	//user_no를 파라미터로 받아 유저의 모든 정보를 가져온다
	@Override
	public Users getUserByUserNo(Integer user_no) {
		return usersDAO.getUserByUserNo(user_no);
	}
		
	



			
}



	
	
	


	
