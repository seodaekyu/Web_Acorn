-- 책 정보 번호를 얻어낼 시퀀스
CREATE SEQUENCE book_seq;
-- 책 정보를 저장할 테이블
CREATE TABLE book(
	num NUMBER PRIMARY KEY, -- 책번호
	name VARCHAR(100), -- 책이름
	publisher VARCHAR(50), -- 출판사
	author VARCHAR(30), -- 저자
	publicationdate DATE -- 출판일
);

-- 책 대여 번호를 얻어낼 시퀀스
CREATE SEQUENCE bookrent_seq;
-- 책 대여 정보를 저장할 테이블
CREATE TABLE rent(
	rentnum NUMBER PRIMARY KEY, -- 대여번호
	booknum NUMBER, -- 도서번호
	id VARCHAR(50), -- 대출자
	rentdate DATE, -- 대출일자
	returndate DATE, --반납일자
	returncompletedate DATE --반납완료일자
);

-- 게시글의 번호를 얻어낼 시퀀스
CREATE SEQUENCE board_seq;
-- 게시글을 저장할 테이블
CREATE TABLE board(
	num NUMBER PRIMARY KEY, -- 글번호
	writer VARCHAR2(100) NOT NULL, -- 작성자(로그인된 아이디)
	title VARCHAR2(100) NOT NULL, -- 제목
	content CLOB, -- 글 내용
	viewCount NUMBER, -- 조회수
	regdate DATE -- 글 작성일
);

-- 댓글의 번호를 얻어낼 시퀀스
CREATE SEQUENCE board_comment_seq;
-- 댓글을 저장할 테이블
CREATE TABLE board_comment(
	commentnum NUMBER PRIMARY KEY, -- 댓글번호
	boardnum NUMBER, -- 글번호
	writer VARCHAR2(100) NOT NULL, -- 댓글 작성자(로그인된 아이디)
	comment1 CLOB, -- 댓글 내용
	regdate DATE -- 댓글 작성일
);
