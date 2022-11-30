CREATE TABLE REVIEW(
review_no NUMBER PRIMARY KEY,
review_active_user NUMBER NOT NULL,
review_passive_user NUMBER NOT NULL,
title varchar2(100) NOT NULL,
content varchar(2000),
rating NUMBER NOT null,
review_date date,
CONSTRAINT fk_review_active_user FOREIGN KEY(review_active_User) REFERENCES users(user_No), 
CONSTRAINT fk_review_passive_user FOREIGN KEY(review_passive_User) REFERENCES users(user_No)
);
CREATE SEQUENCE seq_review_no INCREMENT BY 1 START WITH 1;




----테스트 데이터----

SELECT * FROM review;
insert into review(review_no, review_active_user, review_passive_user, title, content, rating, review_date) 
values(seq_review_no.nextval, 2, 23, '리뷰제목', '내용내용내용', 3, sysdate);