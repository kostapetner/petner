
-----------유저테이블---------------------------------by.동인
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


-------------------시퀀스 생성---------------------------------
CREATE SEQUENCE seq_user_no INCREMENT BY 1 START WITH 1;
SELECT seq_user_no.nextval FROM dual;
SELECT seq_user_no.currval FROM dual;

-------------------드랍-------------
DROP TABLE users;
DROP TABLE kakao_users;
DROP SEQUENCE seq_user_no;
DROP SEQUENCE seq_k_user_no;
------------간단로그인 전용-----------

INSERT INTO USERS(user_no, user_type, id, nickname, email, password, name, joindate, gender, zipcode, addr, addr_detail, user_level, user_auth, file_no)
values(seq_user_no.nextval, 1, '1234', '펫트너', 'petner@petner.com', '1234','펫트너', sysdate, '미정', '12345', '가디역', '호서대벤처타워', 'VIP', 1, 0);




-----조회-----
SELECT * FROM users;

------------비밀번호수정-------

 update users 
	    set password = '1234'
	    where id = '1234'
	    and   name = '펫트너'
	    and   email = 'petner@petner.com';
	  	  
------------유저 삭제-----------------
DELETE from users WHERE user_no = 44;
