CREATE TABLE notice(
    id          NUMBER CONSTRAINT notice_id_pk PRIMARY KEY,
    title       VARCHAR2(300) NOT NULL,
    content     VARCHAR2(4000) NOT NULL,
    writer      VARCHAR2(20) NOT NULL,
    writedate   DATE DEFAULT SYSDATE,
    readcnt     NUMBER DEFAULT 0,
    file_no		VARCHAR2(300),
    filename    VARCHAR2(300),
    filepath    VARCHAR2(300),
    root        NUMBER,
    step        NUMBER default 0,
    indent      NUMBER default 0 
);
ALTER TABLE notice
ADD(root NUMBER, step NUMBER DEFAULT 0, indent NUMBER DEFAULT 0);

UPDATE notice SET root = id;

ALTER TRIGGER trg_notice DISABLE;

DROP table notice;

DROP SEQUENCE notice_seq;

CREATE SEQUENCE seq_notice
START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_notice
    BEFORE INSERT ON notice
    FOR EACH ROW
BEGIN
    SELECT seq_notice.NEXTVAL INTO:NEW.id FROM dual;
END;
-- qna 완료 ==================================================
--qna 테이블 생성
CREATE TABLE qna(
    id          NUMBER CONSTRAINT qna_id_pk PRIMARY KEY,
    title       VARCHAR2(300) NOT NULL,
    content     VARCHAR2(4000) NOT NULL,
    writer      VARCHAR2(20) NOT NULL,
    writedate   DATE DEFAULT SYSDATE,
    readcnt     NUMBER DEFAULT 0,
    file_no    VARCHAR2(300),
    filename    VARCHAR2(300),
    filepath    VARCHAR2(300),
    root        NUMBER,
    step        NUMBER default 0,
    indent      NUMBER default 0 
);
CREATE SEQUENCE seq_qna
START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_qna
    BEFORE INSERT ON qna
    FOR EACH ROW
BEGIN
    SELECT seq_qna.NEXTVAL INTO:NEW.id FROM dual;
END;


INSERT INTO qna (id, title, content, writer)
VALUES (1, '첫 글 테스트', 'ㅁㄴㅇㄻㄴㅇㄹ', '관리자');


INSERT INTO qna(title, content, writer, writedate, filepath, filename)
SELECT title, content, writer, writedate, filepath, filename FROM qna;

UPDATE qna SET root = id;

ALTER TRIGGER trg_qna DISABLE;

COMMIT;

SELECT * FROM qna;


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

