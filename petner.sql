--user_no 시퀀스
--혜경
CREATE SEQUENCE user_no_seq 
INCREMENT BY 1
START WITH 1 
NOCACHE;

--pet_no 시퀀스
--혜경
CREATE SEQUENCE pet_no_seq 
INCREMENT BY 1
START WITH 1 
NOCACHE;

--file_no 시퀀스
--혜경
CREATE SEQUENCE file_no_seq 
INCREMENT BY 1
START WITH 1 
NOCACHE;


--반려동물 정보 등록
--혜경
CREATE TABLE pet_info(
	 pet_no 		NUMBER
	,user_no 		NUMBER
	,file_no		NUMBER
	,pet_kind 		varchar(50)
	,pet_specie 	varchar(50)
	,pet_name 		varchar(50)
	,pet_age 		number
	,pet_weight 	number
	,pet_gender		varchar(50)
	,pet_neutral 	varchar(50)
	,pet_info 		varchar(500)
);

--시터 정보 등록
--혜경
CREATE TABLE sitter_info(
	 user_no		NUMBER
	,file_no		NUMBER
	,pet_kind 		varchar(50)
	,pet_specie 	varchar(50)
	,work_day 		varchar(50)
	,service 		varchar(50)
	,zipcode		NUMBER
	,addr			varchar(500)
	,addr_detail	varchar(500)
	,sitter_info 	varchar(500)
);

SELECT * FROM pet_info;
SELECT * FROM users;
SELECT * FROM FILE_TB ft ;

--게시판 번호 테이블
--혜경
CREATE TABLE bd_no(
	board_name varchar2(50)
	,board_no	number
);

INSERT INTO bd_no
values('공지사항',1);

INSERT INTO bd_no
values('이벤트',2);

INSERT INTO bd_no
values('유저프로필',3);

INSERT INTO bd_no
values('시터프로필',4);

INSERT INTO bd_no
values('펫사진',5);

SELECT * FROM BD_NO;


--파일테이블
--혜경
CREATE TABLE file_tb(
	 file_no		NUMBER
	,user_no 		NUMBER
	,board_no 		NUMBER
	,origin_filename varchar(500)
	,server_filename varchar(500)
);

SELECT * FROM file_tb;
SELECT * FROM pet_info;

DELETE pet_info;

DROP TABLE users;

-------------------------------------------------------
--사용자테이블
--동인
CREATE TABLE users(
	user_no NUMBER PRIMARY KEY NOT null,
	user_type NUMBER,
	id varchar2(50),
	nickname varchar2(50),
	email varchar2(50),
	password varchar2(50),
	name varchar2(50),
	joindate DATE,
	gender varchar2(50),
	zipcode varchar2(50),
	addr varchar2(500),
	addr_detail varchar2(500),
	user_level varchar2(50),
	user_auth NUMBER,
	file_no NUMBER
);
--file_no REFERENCES file_tb(file_no)--

CREATE SEQUENCE seq_user_no INCREMENT BY 1 START WITH 1;
SELECT seq_user_no.nextval FROM dual;
SELECT seq_user_no.currval FROM dual;

-------------------드랍-------------
DROP TABLE users;
DROP SEQUENCE seq_user_no;

------------간단로그인 전용-----------

INSERT INTO USERS(user_no, user_type, id, nickname, email, password, name, joindate, gender, zipcode, addr, addr_detail, user_level, user_auth, file_no)
values(seq_user_no.nextval, 1, '1234', '펫트너', 'petner@petner.com', '1234','펫트너', sysdate, '미정', '12345', '가디역', '호서대벤처타워', 'VIP', 1, 0);


-----조회-----
SELECT * FROM users;

