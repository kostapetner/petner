package com.kosta.petner.bean;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class Notice {
	private int notice_no;
	private String user_id;
	private String notice_pass;
	private String notice_title;
	private String notice_content;
	private String file_no;
//	private String open_yn;
	private int notice_re_ref;
	private int notice_re_lev;
	private int notice_re_seq;
	private int notice_hit;
	private Date reg_date;

	private MultipartFile imageFile;

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public void setNotice_pass(String notice_pass) {
		this.notice_pass = notice_pass;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public void setFile_no(String file_no) {
		this.file_no = file_no;
	}
//	public void setOpen_yn(String open_yn) {
//		this.open_yn = open_yn;
//	}
	public void setNotice_re_ref(int notice_re_ref) {
		this.notice_re_ref = notice_re_ref;
	}
	public void setNotice_re_lev(int notice_re_lev) {
		this.notice_re_lev = notice_re_lev;
	}
	public void setNotice_re_seq(int notice_re_seq) {
		this.notice_re_seq = notice_re_seq;
	}
	public void setNotice_hit(int notice_hit) {
		this.notice_hit = notice_hit;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getNotice_no() {
		return notice_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public String getNotice_pass() {
		return notice_pass;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public String getFile_no() {
		return file_no;
	}
//	public String getOpen_yn() {
//		return open_yn
//	}
	public int getNotice_re_ref() {
		return notice_re_ref;
	}
	public int getNotice_re_lev() {
		return notice_re_lev;
	}
	public int getNotice_re_seq() {
		return notice_re_seq;
	}
	public int getNotice_hit() {
		return notice_hit;
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
