package com.kosta.petner.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CareService {
	private Integer service_no;
	private Integer user_no;
	private Integer file_no;
	private Integer pet_no;
	private Integer zipcode;
	private String addr;
	private String addr_detail;
	private String service;
	private String st_date;
	private String end_date;
	private Integer request_money;
	private String request_title;
	private String request_detail;
	private String status;
}
