/* 기존 db 삭제
drop database if exists shopdb;
drop database if exists testdb;
drop database if exists testdb1;
drop database if exists testdb2;
*/
-- drop schema testdb1; <도 사용 가능

-- DB생성
-- create schema bookshopdb default character set utf8mb4;

/*-- 테이블 생성 : 도서(book), 출판사(publisher), 회원(member), 주문(order)

use bookshopdb;

create table bookshopdb.publisher (
		pubNo varchar(10) not null,
        pubName varchar(30) not null,
        primary key (pubNo)
);

create table book (
		bookNo varchar(10) not null primary key,
        bookName varchar(30) not null,
        bookPrice int default 10000 check(bookPrice>1000),
        bookDate date,
        pubNo varchar(10) not null,
        foreign key (pubNo) references publisher (pubNo)
        );
        
 drop table book;
booksale

create table book (
		bookNo varchar(10) not null primary key,
        bookName varchar(30) not null,
        bookPrice int default 10000 check(bookPrice>1000),
        bookDate date,
        pubNo varchar(10) not null,
        constraint FK_book_publisher foreign key (pubNo) references publisher (pubNo)
        );

*/


-- 학사관리시스템 DB : schooldb 생성
-- create schema schooldb default character set utf8mb4;


/*-- 테이블 생성 : student,department, professor,course,scores

use schooldb;

create table department(
		depCode char(10) not null,
        depName varchar(15) not null,
        depTel varchar(15),
        primary key (depCode)
);


create table student(
		stdId varchar(10) not null primary key,
        stdName varchar(15) not null,
        stdYear int default 1 check(stdYear>=1 and stdYear<=4),
        stdAddr varchar(40),
        stdBirth date,
        depCode char(10) not null,
        constraint FK_std_depart foreign key (depCode) references department (depCode)
);


create table professor(
		proNo char(10) not null primary key,
        proName varchar(30) not null,
        proPhone char(20),
        depCode char(10) not null,
        constraint FK_pro_depart foreign key (depCode) references department (depCode)
);

create table  course(
		courseCode char(10) not null primary key,
        courseName varchar(30) not null,
        courseCredit int default 3 check (courseCredit>=1 and courseCredit<=6),
        proNo char(10) not null,
        constraint FK_course_professor foreign key(proNo) references professor(proNo)
);

create table scores(
		stdId varchar(10) not null,
        courseCode char(10) not null,
        score int default 0 check(score >=0 and score <=100),
        grade char(10) not null,
        constraint PK_scores_std_course primary key (stdId, courseCode),
        constraint FK_scores_student foreign key(stdId) references student (stdId),
        constraint FK_scores_course foreign key(courseCode) references course (courseCode)
);

create table board(
		boardNo int auto_increment not null primary key,
        boardTitle varchar(30) not null,
        boardAuthor varchar(20) not null,
        boardcontent varchar(100) not null
);
*/

-- 테이블 변경 (alter)
-- alter table board auto_increment=100;
-- set @@auto_increment_increment=2;

-- set @count =0;
--  update board set boardNo = @count:=@count+1