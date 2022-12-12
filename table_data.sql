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


-- board 완료 ==================================================
create table tbl_attach ( 
  uuid varchar2(100) not null,
  uploadPath varchar2(200) not null,
  fileName varchar2(100) not null, 
  filetype char(1) default 'I',
  bno number(10,0)
);

alter table tbl_attach add constraint pk_attach primary key (uuid); 

alter table tbl_attach add constraint fk_board_attach foreign key (bno) references tbl_board(bno);

-------

--방명록 관리
CREATE TABLE board(
	id			NUMBER			CONSTRAINT board_id_pk PRIMARY KEY,
	title		VARCHAR2(300)	NOT NULL,
	content		VARCHAR2(4000)	NOT NULL,
	writer		VARCHAR2(100)	NOT NULL,
	writedate	DATE DEFAULT SYSDATE,
	readcnt		NUMBER DEFAULT 0,
	filename	VARCHAR2(300),
	filepath	VARCHAR2(300)
);

CREATE SEQUENCE seq_board START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_board
	BEFORE INSERT ON board
	FOR EACH ROW
BEGIN
	SELECT seq_board.NEXTVAL INTO :new.id FROM dual;
END;
/

COMMIT;

--========================================================
INSERT INTO board (title, content, writer, filename, filepath)
SELECT title, content, writer, filename, filepath
FROM board;

--========================================================
CREATE TABLE board_comment (
	id NUMBER constraint board_comment_id_pk PRIMARY KEY,
	pid NUMBER NOT NULL, /* 원글의 아이디 */
	writer VARCHAR2(20) NOT NULL, /* 댓글 작성자 아이디 */
	content VARCHAR2(4000) NOT NULL,
    writedate DATE DEFAULT SYSDATE,
    CONSTRAINT board_comment_pid_fk FOREIGN KEY(pid) REFERENCES board(id) ON DELETE CASCADE
);

SELECT * FROM board_comment;
SELECT * FROM USERS u ;

CREATE SEQUENCE seq_board_comment
START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_board_comment
    BEFORE INSERT ON board_comment
    FOR EACH ROW
BEGIN
    SELECT seq_board_comment.NEXTVAL INTO :NEW.id FROM dual;
END;
/

COMMIT;
-- board 완료.end ==================================================

