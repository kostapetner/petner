package com.kosta.petner.bean;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class Qna {
	private int qna_no;
	private String user_id;
	private String qna_pass;
	private String qna_title;
	private String qna_content;
	private String file_no;
	private int qna_re_ref;
	private int qna_re_lev;
	private int qna_re_seq;
	private int qna_hit;
	private Date reg_date;
	
	private MultipartFile imageFile;
	
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public void setQna_pass(String qna_pass) {
		this.qna_pass = qna_pass;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public void setFile_no(String file_no) {
		this.file_no = file_no;
	}
	public void setQna_re_ref(int qna_re_ref) {
		this.qna_re_ref = qna_re_ref;
	}
	public void setQna_re_lev(int qna_re_lev) {
		this.qna_re_lev = qna_re_lev;
	}
	public void setQna_re_seq(int qna_re_seq) {
		this.qna_re_seq = qna_re_seq;
	}
	public void setQna_hit(int qna_hit) {
		this.qna_hit = qna_hit;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getQna_no() {
		return qna_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public String getQna_pass() {
		return qna_pass;
	}
	public String getQna_title() {
		return qna_title;
	}
	public String getQna_content() {
		return qna_content;
	}
	public String getFile_no() {
		return file_no;
	}
	public int getQna_re_ref() {
		return qna_re_ref;
	}
	public int getQna_re_lev() {
		return qna_re_lev;
	}
	public int getQna_re_seq() {
		return qna_re_seq;
	}
	public int getQna_hit() {
		return qna_hit;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public MultipartFile getImageFile() {
		return imageFile;
	}
	public void setImageFile(MultipartFile imageFile) {
		this.imageFile = imageFile;
	}

	
	
}
