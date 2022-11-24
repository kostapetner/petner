package com.kosta.petner.bean;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Notice {
	private Integer notice_no;
	private String user_id;
	private String notice_pass;
	private String notice_title;
	private String notice_content;
	private Integer file_no;
	private Integer notice_re_ref;
	private Integer notice_re_lev;
	private Integer notice_re_seq;
	private Integer notice_hit;
	private Date reg_date;

	private MultipartFile imageFile;

}
