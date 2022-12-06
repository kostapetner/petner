package com.kosta.petner.bean;

import java.sql.Date;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Component
public class Qna {
	private int qna_no;
	private String user_id;
	private String qna_pass;
	private String qna_title;
	private String qna_content;
	private String filepath;
	private String file_no;
	private int qna_re_ref;
	private int qna_re_lev;
	private int qna_re_seq;
	private int qna_hit;
	private Date reg_date;
	
	private MultipartFile imageFile;

	
	
	
}
