package com.kosta.petner.bean;

import org.springframework.web.multipart.MultipartFile;

public class PetInfo {

	private Integer userNo;
	private String profile;
	private String pet_kind;
	private String pet_specie;
	private String pet_name;
	private Integer pet_age;
	private Integer pet_weight;
	private String pet_sex;
	private String pet_neutral;
	private String info;
	
	private MultipartFile imageFile;

	public PetInfo() {
		super();
	}

	public PetInfo(Integer userNo, String profile, String pet_kind, String pet_specie, String pet_name, Integer pet_age,
			Integer pet_weight, String pet_sex, String pet_neutral, String info, MultipartFile imageFile) {
		super();
		this.userNo = userNo;
		this.profile = profile;
		this.pet_kind = pet_kind;
		this.pet_specie = pet_specie;
		this.pet_name = pet_name;
		this.pet_age = pet_age;
		this.pet_weight = pet_weight;
		this.pet_sex = pet_sex;
		this.pet_neutral = pet_neutral;
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

	public String getPet_name() {
		return pet_name;
	}

	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}

	public Integer getPet_age() {
		return pet_age;
	}

	public void setPet_age(Integer pet_age) {
		this.pet_age = pet_age;
	}

	public Integer getPet_weight() {
		return pet_weight;
	}

	public void setPet_weight(Integer pet_weight) {
		this.pet_weight = pet_weight;
	}

	public String getPet_sex() {
		return pet_sex;
	}

	public void setPet_sex(String pet_sex) {
		this.pet_sex = pet_sex;
	}

	public String getPet_neutral() {
		return pet_neutral;
	}

	public void setPet_neutral(String pet_neutral) {
		this.pet_neutral = pet_neutral;
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
