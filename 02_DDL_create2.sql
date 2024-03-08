use testdb2;
/*
 create table Department (
 	dptNo varchar(10) not null primary key,
      dptName varchar(30) not null,
      dptTel varchar(10)
      );

  create table Student (
   	 stdNo varchar(10) not null primary key,
       stdName varchar(30) not null,
       stdYear int default 4 check (stdYear >= 1 and stdYear =< 4),
       stdAddress varchar(30),
       stdBirthDay date,
       dptNo varchar(10) not null,
      constraint FK_Student_Department foreign key (dptNo) references Department (dptNo)
       );

 CREATE TABLE professor (
     proNo CHAR(10) NOT NULL PRIMARY KEY,
     proName VARCHAR(30) NOT NULL,
     proPhone CHAR(20),
     dptNo CHAR(10) NOT NULL,
     CONSTRAINT FK_pro_department FOREIGN KEY (dptNo) REFERENCES department (dptNo)
 );

 CREATE TABLE course (
 	courseCode CHAR(10) NOT NULL PRIMARY KEY,
     courseName VARCHAR(30) NOT NULL,
     courseCredit INT DEFAULT 3 CHECK (courseCredit >= 1 and courseCredit <= 6),
     proNo CHAR(10) NOT NULL,
     CONSTRAINT FK_course_professor FOREIGN KEY (proNo) REFERENCES professor (proNo)
 );


-- 주키를 복합키 형식으로 지정
CREATE TABLE scores (
	stdNo char(10) not null,
	courseCode char(10) not null,
    score int default 0 not null check (score >=0 and score <=100),
    grade char(10) not null,
    constraint PK_Scores_stdNo_courseCode primary key (stdNO, courseCode),
     constraint FK_Scores_student FOREIGN KEY (stdNO) REFERENCES student (stdNO),
     constraint FK_Scores_course FOREIGN KEY (courseCode) REFERENCES course (courseCode)
     );



-- 자동으로 아이디나 값이 증가 : auto_increment
create table board(
	boardNo int auto_increment not null primary key,
    boradTitle varchar(30) not null,
    boardAuthor varchar(20) not null,
    boradContent varchar(100) not null
    );
 
 
-- alter : 데이터베이스, 테이블, 뷰 등의 정보 수정(변경) -> alter를 작성한 시점부터 추가된 데이터에 수정됨
-- @@auto_increment_increment=3 -> 번호가 3배수로 늘어나게 만드는 코드
-- @@ < 내장함수 사용할때
-- @ < 변수명 사용할때

 alter table board auto_increment=100;
 set @@auto_increment_increment=3;
*/

-- update문을 이용하여 게시판 boardNo 값을 일괄적으로 변경
-- @변수 = 값 < 파이썬과 비슷한 변수지정하는법

set @count = 0;
update board set boardNo = @count :=@count+1;