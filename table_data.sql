DROP TABLE notice;
DROP SEQUENCE seq_notice;
DROP TABLE tbl_attach;
DROP TABLE board CASCADE CONSTRAINTS;
DROP SEQUENCE seq_board;
DROP TABLE board_comment;
DROP SEQUENCE seq_board_comment;
DROP TABLE qna;
DROP SEQUENCE seq_qna;


-- notice ==================================================
-- notice 테이블 생성
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

UPDATE notice SET root = id;

CREATE SEQUENCE seq_notice
START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_notice
    BEFORE INSERT ON notice
    FOR EACH ROW
BEGIN
    SELECT seq_notice.NEXTVAL INTO:NEW.id FROM dual;
END;

ALTER TRIGGER trg_notice DISABLE;

SELECT * FROM notice;


-- qna ==================================================
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

UPDATE qna SET root = id;

ALTER TRIGGER trg_qna DISABLE;

COMMIT;


-- board ==================================================
CREATE TABLE board(
	id NUMBER CONSTRAINT board_id_pk PRIMARY KEY,
	title VARCHAR2(300)	NOT NULL,
	content VARCHAR2(4000)	NOT NULL,
	writer VARCHAR2(100)	NOT NULL,
	writedate DATE DEFAULT SYSDATE,
	readcnt NUMBER DEFAULT 0,
	filename VARCHAR2(300),
	filepath VARCHAR2(300)
);

CREATE SEQUENCE seq_board START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_board
	BEFORE INSERT ON board
	FOR EACH ROW
BEGIN
	SELECT seq_board.NEXTVAL INTO :new.id FROM dual;
END;
COMMIT;

-- test db

INSERT INTO board (id, title, content, writer,writedate)
VALUES (12, '테스트룰루랄라', '내용내용', 'user_1',sysdate);
INSERT INTO board (id, title, content, writer,writedate)
VALUES (13, '테스트이용', '내용내용', 'user_1',sysdate);
INSERT INTO board (id, title, content, writer,writedate)
VALUES (14, '글글', '내용내용', 'user_1',sysdate);
INSERT INTO board (id, title, content, writer,writedate)
VALUES (15, '글 테스트입니다.', '내용내용', 'user_1',sysdate);
INSERT INTO board (id, title, content, writer,writedate)
VALUES (16, '글 테스트이다', '내용내용', 'user_1',sysdate);




-- board_comment ========================================================
CREATE TABLE board_comment (
	id NUMBER constraint board_comment_id_pk PRIMARY KEY,
	pid NUMBER NOT NULL, /* 원글의 아이디 */
	writer VARCHAR2(20) NOT NULL, /* 댓글 작성자 아이디 */
	content VARCHAR2(4000) NOT NULL,
    writedate DATE DEFAULT SYSDATE,
    CONSTRAINT board_comment_pid_fk FOREIGN KEY(pid) REFERENCES board(id) ON DELETE CASCADE
);

SELECT * FROM board_comment;

CREATE SEQUENCE seq_board_comment
START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_board_comment
    BEFORE INSERT ON board_comment
    FOR EACH ROW
BEGIN
    SELECT seq_board_comment.NEXTVAL INTO :NEW.id FROM dual;
END;
COMMIT;

