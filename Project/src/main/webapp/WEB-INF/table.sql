-- 책 정보를 저장할 테이블
CREATE SEQUENCE book_seq;

CREATE TABLE book(
	num NUMBER PRIMARY KEY,
	name VARCHAR(100),
	publisher VARCHAR(50),
	author VARCHAR(30),
	publicationdate DATE
);
