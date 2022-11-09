package com.kosta.petner.bean;


public class Users {
	private int userNo;
	private int userType;
	private String id;
	private String nickname;
	private String email;
	private String password;
	private String name;
	private String joindate;
	private String gender;
	private String address;
	
	
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getUserType() {
		return userType;
	}
	public void setUserType(int userType) {
		this.userType = userType;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Users(int userNo, int userType, String id, String nickname, String email, String password, String name,
			String joindate, String gender, String address) {
		super();
		this.userNo = userNo;
		this.userType = userType;
		this.id = id;
		this.nickname = nickname;
		this.email = email;
		this.password = password;
		this.name = name;
		this.joindate = joindate;
		this.gender = gender;
		this.address = address;
	}
	public Users() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "UsersVo [userNo=" + userNo + ", userType=" + userType + ", id=" + id + ", nickname=" + nickname
				+ ", email=" + email + ", password=" + password + ", name=" + name + ", joindate=" + joindate
				+ ", gender=" + gender + ", address=" + address + "]";
	}
	
	
}


