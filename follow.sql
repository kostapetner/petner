--follow 테이블--

CREATE TABLE FOLLOW(
followNo NUMBER PRIMARY KEY,
active_User NUMBER NOT NULL,
passive_User NUMBER NOT NULL,
CONSTRAINT fk_active_User FOREIGN KEY(active_User) REFERENCES users(user_No), 
CONSTRAINT fk_passive_User FOREIGN KEY(passive_User) REFERENCES users(user_No)
);

CREATE SEQUENCE followNo_seq INCREMENT BY 1 START WITH 1;

SELECT * FROM follow;
