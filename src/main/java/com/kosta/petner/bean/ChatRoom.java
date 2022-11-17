package com.kosta.petner.bean;

/*
	2022.11.11 홍시원 추가
	방번호와 사용자, 상대방의 정보가 담겨있다.
	roomId로 채팅방을 구분하며,
	unReadCount를 통해 읽었는지 파악 할 수 있게 해준다.
*/
public class ChatRoom {

	private String roomId; // 방 번호

	private String userEmail; // 사용자 이메일
	private String userName; // 사용자 이름
	private String userImg; // 사용자 사진

	private String masterEmail; // 상대방 이메일
	private String masterName; // 상대방 이름
	private String masterImg; // 상대방 사진

	private int unReadCnt; // 안 읽은 메세지 수

	public ChatRoom() {
		super();
	}

	public ChatRoom(String roomId, String userEmail, String userName, String userImg, String masterEmail,
			String masterName, String masterImg, int unReadCnt) {
		super();
		this.roomId = roomId;
		this.userEmail = userEmail;
		this.userName = userName;
		this.userImg = userImg;
		this.masterEmail = masterEmail;
		this.masterName = masterName;
		this.masterImg = masterImg;
		this.unReadCnt = unReadCnt;
	}

	public String getRoomId() {
		return roomId;
	}

	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserImg() {
		return userImg;
	}

	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}

	public String getMasterEmail() {
		return masterEmail;
	}

	public void setMasterEmail(String masterEmail) {
		this.masterEmail = masterEmail;
	}

	public String getMasterName() {
		return masterName;
	}

	public void setMasterName(String masterName) {
		this.masterName = masterName;
	}

	public String getMasterImg() {
		return masterImg;
	}

	public void setMasterImg(String masterImg) {
		this.masterImg = masterImg;
	}

	public int getUnReadCnt() {
		return unReadCnt;
	}

	public void setUnReadCnt(int unReadCnt) {
		this.unReadCnt = unReadCnt;
	}

	@Override
	public String toString() {
		return "ChatRoom [roomId=" + roomId + ", userEmail=" + userEmail + ", userName=" + userName + ", userImg="
				+ userImg + ", masterEmail=" + masterEmail + ", masterName=" + masterName + ", masterImg=" + masterImg
				+ ", unReadCnt=" + unReadCnt + "]";
	}
}
