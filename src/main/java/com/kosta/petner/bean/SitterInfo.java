package com.kosta.petner.bean;

import org.springframework.web.multipart.MultipartFile;

public class SitterInfo {

	private Integer userNo;
	private String profile;
	private String pet_kind;
	private String pet_specie;
	private String work_day;
	private String service;
	private String region;
	private String info;
	
	private MultipartFile imageFile;

	public SitterInfo() {
		super();
	}

	public SitterInfo(Integer userNo, String profile, String pet_kind, String pet_specie, String work_day,
			String service, String region, String info, MultipartFile imageFile) {
		super();
		this.userNo = userNo;
		this.profile = profile;
		this.pet_kind = pet_kind;
		this.pet_specie = pet_specie;
		this.work_day = work_day;
		this.service = service;
		this.region = region;
		this.info = info;
		this.imageFile = imageFile;
	}

	public Integer getUserNo() {
		return userNo;
	}

	public void setUserNo(Integer userNo) {
		this.userNo = userNo;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getPet_kind() {
		return pet_kind;
	}

	public void setPet_kind(String pet_kind) {
		this.pet_kind = pet_kind;
	}

	public String getPet_specie() {
		return pet_specie;
	}

	public void setPet_specie(String pet_specie) {
		this.pet_specie = pet_specie;
	}

	public String getWork_day() {
		return work_day;
	}

	public void setWork_day(String work_day) {
		this.work_day = work_day;
	}

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public MultipartFile getImageFile() {
		return imageFile;
	}

	public void setImageFile(MultipartFile imageFile) {
		this.imageFile = imageFile;
	}

	
}
