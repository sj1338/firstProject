DROP TABLE member;
CREATE TABLE member (
    memberid VARCHAR2(50) PRIMARY KEY,
    name VARCHAR2(50) NOT NULL,
    password VARCHAR2(10) NOT NULL,
    regdate DATE NOT NULL
);
SELECT * FROM member;
DROP table member;
DROP table article;

SELECT * FROM (SELECT * FROM article WHERE category='art' ORDER BY article_no) ROWNUM;

SELECT ROWNUM, article_no, title, regdate, read_cnt FROM (SELECT * FROM article WHERE category='art' ORDER BY article_no) WHERE ROWNUM <= 4;

SELECT * FROM article;

commit;

INSERT INTO article (category, writer_id, writer_name, title, content, regdate, moddate, read_cnt)
VALUES ('art', 'artId5', '김다섯', '반갑습니다 김다섯 입니다.', '처음뵙겠습니다', sysdate, sysdate, 0);

INSERT INTO article (category, writer_id, writer_name, title, content, regdate, moddate, read_cnt)
VALUES ('cook', 'cookId5', '최다섯', '최다섯입니다. 취미는 도배입니다.', '도배해야지', sysdate, sysdate, 0);

INSERT INTO article (category, writer_id, writer_name, title, content, regdate, moddate, read_cnt)
VALUES ('game', 'gameId3', '이셋', '안녕 난 이셋이야', '반가워', sysdate, sysdate, 0);

INSERT INTO article (category, writer_id, writer_name, title, content, regdate, moddate, read_cnt)
VALUES ('music', 'musicId1', '김헬창', '여기 아무도 없나요?', '없나요?', sysdate, sysdate, 0);

INSERT INTO article (category, writer_id, writer_name, title, content, regdate, moddate, read_cnt)
VALUES ('sport', 'sportId2', '응아냐', '응안돼', 'ㅋㅋ', sysdate, sysdate, 0);

INSERT INTO article (category, writer_id, writer_name, title, content, regdate, moddate, read_cnt)
VALUES ('tour', 'tourTesterId1', '나광고', '정지풀어주세요', '광고안할게요', sysdate, sysdate, 0);

INSERT INTO article (category, writer_id, writer_name, title, content, regdate, moddate, read_cnt)
VALUES ('???', 'ERROR', 'ERROR', 'ERRORtitle', 'ERRORbody', sysdate, sysdate, 0);




commit;

DROP TABLE ARTICLE;
DROP TABLE ARTICLE_CONTENT;

SELECT * FROM article;

CREATE TABLE article (
    category VARCHAR2(50) NOT NULL,
    article_no NUMBER GENERATED AS IDENTITY,
    writer_id VARCHAR2(50) NOT NULL,
    writer_name VARCHAR2(50) NOT NULL,
    title VARCHAR2(255) NOT NULL,
    content VARCHAR2(4000),
    regdate DATE NOT NULL,
    moddate DATE NOT NULL,
    read_cnt NUMBER,
    PRIMARY KEY (article_no)
);





SELECT rn, article_no, writer_id, writer_name, title, content, regdate, moddate, read_cnt
				FROM (SELECT article_no, writer_id, writer_name, title, content, regdate, moddate, read_cnt, ROW_NUMBER() 
				OVER (ORDER BY article_no DESC) rn FROM art_article) WHERE rn BETWEEN 1 AND 10;

------
select ROW_NUMBER() OVER (ORDER BY article_no desc) rn, article_no from article
where category = 'art'
and rn BETWEEN 1 and 4
ORDER BY article_no DESC

;

SELECT rn,category, article_no, writer_id, writer_name, title, content, regdate, moddate, read_cnt
				FROM (SELECT category, article_no, writer_id, writer_name, title, content, regdate, moddate, read_cnt, ROW_NUMBER() 
				OVER (ORDER BY article_no DESC) rn FROM article WHERE category='art') WHERE rn BETWEEN 1 AND 4;
-------


SELECT * FROM article;
--SELECT * FROM article_content;
SELECT COUNT(*) FROM article;

--CREATE TABLE article_content (
--    article_no NUMBER PRIMARY KEY,
--    content VARCHAR2(4000)
--);

INSERT INTO article (write_id,......) 
VALUES (...);

-- 11g
INSERT INTO article (article_no, write_id,......) 
VALUES (article_seq.nextval, ...);

CREATE SEQUENCE article_seq;

CREATE TABLE article (
    article_no NUMBER,
    writer_id VARCHAR2(50) NOT NULL,
    writer_name VARCHAR2(50) NOT NULL,
    title VARCHAR2(255) NOT NULL,
    regdate DATE NOT NULL,
    moddate DATE NOT NULL,
    read_cnd NUMBER,
    PRIMARY KEY (article_no)
);

-- page 처리
SELECT count(*) FROM article;
INSERT INTO article (writer_id, writer_name, title, regdate, moddate, read_cnt)
VALUES ('a', 'a', 'a', sysdate, sysdate, 0);
COMMIT;

SELECT * FROM (
SELECT article_no, title, ROW_NUMBER() OVER (ORDER BY article_no DESC) rn 
FROM article
--ORDER BY article_no DESC
)
WHERE rn BETWEEN 6 AND 10;




-- 댓글
-- 11g
CREATE SEQUENCE reply_seq;
CREATE TABLE reply (
    replyid NUMBER,
    memberid VARCHAR2(50) NOT NULL,
    article_no NUMBER NOT NULL,
    body VARCHAR2(1000) NOT NULL,
    regdate DATE NOT NULL,
    PRIMARY KEY (replyid)
);
INSERT INTO reply (replyid, memberid, article_no, body, regdate)
VALUES (reply_seq.nextval, ' ', 0, ' ', SYSDATE);
-- 12c
DROP TABLE reply;
CREATE TABLE reply (
    replyid NUMBER GENERATED AS IDENTITY,
    memberid VARCHAR2(50) NOT NULL,
    article_no NUMBER NOT NULL,
    body VARCHAR2(1000) NOT NULL,
    regdate DATE NOT NULL,
    PRIMARY KEY (replyid)
);
INSERT INTO reply (memberid, article_no, body, regdate)
VALUES (' ', 0, ' ', SYSDATE);


SELECT * FROM reply;

SELECT replyid, memberid, article_no, body, regdate
FROM reply
WHERE article_no=103
ORDER BY replyid DESC;
