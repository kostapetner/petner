----시퀀스----
--pet_no 시퀀스
CREATE SEQUENCE pet_no_seq 
INCREMENT BY 1
START WITH 1 
NOCACHE;

--file_no 시퀀스
CREATE SEQUENCE file_no_seq 
INCREMENT BY 1
START WITH 1 
NOCACHE;

--service_no시퀀스
CREATE SEQUENCE service_no_seq 
INCREMENT BY 1
START WITH 1 
NOCACHE;

----create문----
--반려동물 정보 등록
CREATE TABLE pet_info(
	 pet_no 		NUMBER
	,user_no 		NUMBER
	,file_no		NUMBER
	,pet_kind 		varchar2(50)
	,pet_specie 	varchar2(50)
	,pet_name 		varchar2(50)
	,pet_age 		number
	,pet_weight 	number
	,pet_gender		varchar2(50)
	,pet_neutral 	varchar2(50)
	,PET_INFO 		varchar2(500)
	,pet_info 		varchar2(500)
);

--시터 정보 등록
CREATE TABLE sitter_info(
	 user_no		NUMBER
	,file_no		NUMBER
	,pet_kind 		varchar2(50)
	,pet_specie 	varchar2(50)
	,work_day 		varchar2(50)
	,service 		varchar2(50)
	,zipcode		varchar2(50)
	,addr			varchar2(500)
	,addr_detail	varchar2(500)
	,sitter_info 	varchar2(500)
);
--게시판 번호 테이블
CREATE TABLE bd_no(
	 board_name varchar2(50)
	,board_no	number
);

--펫시팅 서비스 신청
CREATE TABLE care_service(
	 service_no		NUMBER
	,user_no		NUMBER
	,pet_no			NUMBER
	,zipcode		varchar2(50)
	,addr			varchar2(500)
	,addr_detail	varchar2(500)
	,service 		varchar2(50)
	,st_date		DATE
	,end_date		DATE
	,request_money 	NUMBER
	,request_title 	varchar2(500)
	,request_detail	varchar2(500)
	,status 		varchar2(50)
	,reg_date		DATE
	,file_no		NUMBER
);

--파일테이블
CREATE TABLE file_tb(
	 file_no			NUMBER
	,user_no 			NUMBER
	,board_no 			NUMBER
	,origin_filename 	varchar2(500)
	,server_filename 	varchar2(500)
);

-------------------insert-------------------
--bd_no
INSERT INTO bd_no values('공지사항',1);
INSERT INTO bd_no values('이벤트',2);
INSERT INTO bd_no values('유저프로필',3);
INSERT INTO bd_no values('시터프로필',4);
INSERT INTO bd_no values('펫사진',5);




--12/20수정사항
--sitter_info 테이블의 zipcode컬럼 NUMBER>varchar2(50)로 수정
--care_service 테이블의 zipcode컬럼 NUMBER>varchar2(50)로 수정
--service_no 시퀀스 추가