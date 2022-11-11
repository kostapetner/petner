package com.kosta.petner.bean;


public class Users {
	private int user_no;
	private int user_type;
	private String id;
	private String nickname;
	private String email;
	private String password;
	private String name;
	private String joindate;
	private String gender;
	private String zipcode;
	private String addr;
	private String addr_detail;
	private String user_level;
	private int user_auth;
	private int file_no;
	
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getUser_type() {
		return user_type;
	}
	public void setUser_type(int user_type) {
		this.user_type = user_type;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddr_detail() {
		return addr_detail;
	}
	public void setAddr_detail(String addr_detail) {
		this.addr_detail = addr_detail;
	}
	public String getUser_level() {
		return user_level;
	}
	public void setUser_level(String user_level) {
		this.user_level = user_level;
	}
	public int getUser_auth() {
		return user_auth;
	}
	public void setUser_auth(int user_auth) {
		this.user_auth = user_auth;
	}
	public int getFile_no() {
		return file_no;
	}
	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}
	public Users(int user_no, int user_type, String id, String nickname, String email, String password, String name,
			String joindate, String gender, String zipcode, String addr, String addr_detail, String user_level,
			int user_auth, int file_no) {
		super();
		this.user_no = user_no;
		this.user_type = user_type;
		this.id = id;
		this.nickname = nickname;
		this.email = email;
		this.password = password;
		this.name = name;
		this.joindate = joindate;
		this.gender = gender;
		this.zipcode = zipcode;
		this.addr = addr;
		this.addr_detail = addr_detail;
		this.user_level = user_level;
		this.user_auth = user_auth;
		this.file_no = file_no;
	}
	
	public Users() {
		super();
		// TODO Auto-generated constructor stub
	}
}
	
	