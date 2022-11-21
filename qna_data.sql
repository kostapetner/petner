


-- yoojin

--qna 테이블 생성
CREATE TABLE qna(
    id          NUMBER CONSTRAINT qna_id_pk PRIMARY KEY,
    title       VARCHAR2(300) NOT NULL,
    content     VARCHAR2(4000) NOT NULL,
    writer      VARCHAR2(20) NOT NULL,
    writedate   DATE DEFAULT SYSDATE,
    readcnt     NUMBER DEFAULT 0,
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

SELECT * FROM qna;
/

INSERT INTO qna (id, title, content, writer)
VALUES (1, '첫 글 테스트', 'ㅁㄴㅇㄻㄴㅇㄹ', '관리자');
INSERT INTO qna (id, title, content, writer)
VALUES (seq_qna.NEXTVAL, '테스트1', '1234', '관리자1');


INSERT INTO qna(title, content, writer, writedate, filepath, filename)
SELECT title, content, writer, writedate, filepath, filename FROM qna;

UPDATE qna SET root = id;

-- ALTER TRIGGER trg_qna DISABLE

UPDATE qna SET writer='admin2'
WHERE mod(id, 3) = 0;

COMMIT;


-----------