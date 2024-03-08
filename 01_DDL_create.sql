use testdb1;
/*
	여러줄 주석하는법
*/ 
# 한 줄 주석 하는법
-- 한 줄 주석 하는법
-- workbench에서 주석을 위한 단축키 : ctrl+/

-- 상품 테이블 생성 : 제품아이디, 제품명, 제품가격, 제조사
-- 제약조건 : 기본키 > 제품아이디

-- create table product(
-- 	prdId varchar(10) not null primary key,
--     prdName varchar(30) not null,
--     prdPrice int,
--     prdCompany varchar(30)
--     );

/*
create table product1 (
	prdId varchar(10) not null ,
    prdName varchar(30) not null,
    prdPrice int,
    prdCompany varchar(30),
    primary key(prdId)  -- key는 따로 작성하면 가독성이 높아짐
    );

create table product2 (
	prdId varchar(10) not null ,
    prdName varchar(30) not null,
    prdPrice int,
    prdCompany varchar(30),
    constraint PK_product2_prdId primary key(prdId)  -- 주키의 별칭을 쓰는 경우 & 복합키를 쓰는 경우
    );
    
create table publisher (
	pubNo varchar(10) not null primary key,
    pubName varchar(30) not null
    );
*/

-- 외래키(foregin key) 생성 및 제약조건 설정
-- create table book (
-- 	bookNo varchar(10) not null primary key,
--     bookName varchar(30) not null,
--     bookPrice int default 10000 check (bookPrice >1000), -- 기본값 설정(무결성)
--     bookDate date,
--     pubNo varchar(10) not null,
--     constraint FK_book_Publisher foreign key (pubNo) references publisher (pubNo)
--     );

/*    위와 같은 내용
create table book (
	bookNo varchar(10) not null primary key,
    bookName varchar(30) not null,
    bookPrice int default 10000 check (bookPrice >1000), -- 기본값 설정(무결성)
    bookDate date,
    pubNo varchar(10) not null,
    foreign key (pubNo) references publisher (pubNo)
    );
*/

-- describe book; -- 테이블 형태로 확인하는것
describe publisher;