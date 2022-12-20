
-----------------채팅 테이블 생성-----------------------
CREATE TABLE ChatRoom(
	room_id varchar2(5),
	user_id varchar2(50),
	user_nickname varchar2(50),
	user_pic  number,
	another_id varchar2(50),
	another_nickname varchar2(50),
	another_pic  number,
	unReadCount NUMBER
	);


	CREATE TABLE ChatMessage(
	room_id varchar(5),
	message_id varchar2(50) ,
	message varchar2(1000),
	user_nickname varchar2(50),
	user_id varchar2(50),
	unReadCount NUMBER,
	sessionCount NUMBER
	);


--------시퀀스 생성----------------------------------------

CREATE SEQUENCE seq_chatroom_id START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_chatmessage_id START WITH 1 INCREMENT BY 1;


---------조회--------------------------------------------

SELECT * FROM chatRoom;
SELECT * FROM chatMessage;