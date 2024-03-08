use testdb2;

/*

*alter table
	-- add 열 이름: 열 추가
	-- rename column : 열의 이름 변경
	-- modify 열 이름 + 데이터 형식 + 제약조건 : 열의 데이터 형식 변경
	-- drop column : 열 삭제
	-- drop : 여러 개의 열 삭제
	-- drop primary key : 기본키 삭제
	-- drop constraint : 제약조건 삭제
    -- add constraint : 제약조건 추가
    -- alter 열이름 drop defalut 값 : 기본값 삭제
    -- alter 열이름 set defalut 값 : 기본값 변경
*/

/*
alter table student add stdTel varchar (13);


*student table에 열 추가
-- student table의 여러개 열 추가 : stdAge, stdAddr2

alter table student add (stdAge char(2), stdAddr2 varchar(50));



-- describe student; 

-- modify 열 이름 데이터 형식 :데이터 형식 변경
 alter table student modify stdAge int;

-- modify 열 이름 데이터 형식 제약조건 : 데이터 제약조건 변경
 alter table student modify stdName varchar(20) null;
 


-- rename column : 열 이름 변경
 alter table student rename column stdTel to stdHP;

-- change : 열 이름과 타입 변경
 alter table student change stdAddress stdAddr1 varchar(30);

-- drop column 열이름 : 열 삭제
alter table student drop column stdHP 

-- drop 열이름, drop 열이름, ... : 여러 개 열 삭제

alter table student drop stdAge,
					drop stdAddr1,
					drop stdAddr2;
                    
-- 기본키, 외래키 삭제 
alter table department drop primary key;
-- 외래키로 참조하고 있는 student, professor table이 있어서 primary key 삭제 불가
-- 먼저 외래키로 사용하고 있는 테이블에서 제약조건 삭제
-- 만약 constraint를 이용하여 외래키 이름을 설정하지 않은 경우 navigator에서 설정된 이름 사용

alter table student drop constraint FK_Student_Department;
alter table professor drop constraint FK_pro_department;
alter table department drop primary key;



-- add constraint : 제약조건 추가
-- add primary key
-- add foreign key (필드명) references 테이블(필드명)


-- 기본키 제약조건 추가
alter table department add constraint PK_department_dptNo primary key (dptNo);

# 또는

alter table department add primary key (dptNo);


-- 외래키 제약조건 추가
alter table student add foreign key (dptNo) references department(dptNo); 
						#constraint를 쓰지 않아 이름이 자동으로 지정됨

# 또는

alter table student add constraint PK_std_depart foreign key (dptNo) references department(dptNo);


alter table student drop constraint student_ibfk_1;


-- **on delete(update) cascade : 기존테이블의 데이터가 삭제되었을때 외래키의 테이블데이터도 자동으로 삭제

alter table student 
			add constraint FK_std_depart 
			foreign key (dptNo) references department(dptNo)
			on delete cascade;

*/

-- 모든 제약조건 출력

-- select * from information_schema.table_constraints; # 전체를 볼때

/* 일부분 제약조건 출력
select * from information_schema.table_constraints
	where table_schema='testdb2' and table_name='student';

    
select * from information_schema.table_constraints
	where table_name='student';   # schema 이름을 작성하지 않아도 검색됨
*/

/*
-- testdb1의 book 테이블의 check 제약 확인
select * from information_schema.table_constraints
	where table_schema='testdb1';

-- check 제약 삭제 후 조건 변경
-- alter table testdb1.book drop constraint book_chk_1;

alter table testdb1.book add check(bookPrice>100);
select * from information_schema.table_constraints
	where table_schema='testdb1';
    


alter table testdb1.book alter column bookPrice drop default;
# 또는
-- alter table testdb1.book alter bookPrice drop default;

*/

-- describe testdb1.book;
/*
-- bookPrice의 값이 null 허용하도록 변경
 alter table testdb1.book modify bookprice int null; 

-- bookPrice의 값이 default 2000 설정 변경
 alter table testdb1.book alter bookprice set default 2000;
describe testdb1.book
/*
