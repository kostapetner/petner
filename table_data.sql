CREATE TABLE notice (
	notice_no NUMBER ,
	user_id	VARCHAR2(50),
	notice_title VARCHAR2(50),
	notice_content VARCHAR2(50),
	file_no	VARCHAR2(50),
	reg_date date,
	notice_hit NUMBER,
	notice_re_ref number,
	notice_re_lev number,
	notice_re_seq number
);


INSERT INTO notice (notice_no, user_id, notice_title, notice_content,file_no)
VALUES (notice_seq.nextval, 'admin', '타이틀', '글내용테스트' , 'file_no');



DROP table notice;

DROP SEQUENCE notice_seq;


SELECT * FROM notice;

CREATE SEQUENCE notice_seq
INCREMENT BY 1 
START WITH 1 ;





CREATE TABLE qna (
	qna_no NUMBER ,
	user_id	VARCHAR2(50),
	qna_title VARCHAR2(50),
	qna_content VARCHAR2(50),
	file_no	VARCHAR2(50),
	reg_date date,
	qna_hit NUMBER,
	qna_re_ref number,
	qna_re_lev number,
	qna_re_seq number
);


INSERT INTO qna (qna_no, user_id, qna_title, qna_content,file_no)
VALUES (qna_seq.nextval, 'admin', '마지막글', '글내용테스트' , 'file_no');

DROP table qna;

DROP SEQUENCE qna_seq;


SELECT * FROM qna;

CREATE SEQUENCE qna_seq
INCREMENT BY 1 
START WITH 1 ;
