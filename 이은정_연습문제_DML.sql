/*create schema marketdb default character set utf8mb4;
*/
use marketdb;
/*
create table memberType(
		membertype_id int not null,
        membertype varchar(5) not null,
        primary key (membertype_id)
        );

insert into memberType
			values 	('1','보통회원'),
					('2','할인회원');      

select * from memberType;
 
create table customer(
		customer_id int not null,
        customer_name varchar(45) not null,
        birthday date,
        membertype_id int not null,
        primary key (customer_id),
        constraint FK_cus_mamber foreign key (membertype_id) references memberType (membertype_id)
        );

insert into customer
			values 	('1','김바람','1984-06-24','2'),
			 	    ('2','이구름','1990-07-16','1'),
			 	    ('3','박하늘','1976-03-09','2'),
			 	    ('4','강산','1991-05-04','1'),
			 	    ('5','유바다','1993-04-21','2');  

select * from customer;

create table product(
		product_id int not null,
        customer_name varchar(20) not null,
        stock int default 0 check (stock>=0),
        price int default 100 check (price>=0),
        primary key (product_id)
        );
 
insert into product
			 values (1,'약용 입욕제',100,70),
			  		(2,'약용 핸드솝',23,700),
					(3,'천연 아로마 입욕제',4,120),
					(4,'거품 목욕제',23,120);

select * from product;
 
create table productOrder(
		order_id int not null,
        customer_id int not null,
        product_id int not null,
        quantity int not null,        
        price int not null,        
        order_time datetime,        
        primary key (order_id),
        constraint FK_prodOrder_customer foreign key (customer_id) references customer (customer_id),
        constraint FK_prodOrder_prod foreign key (product_id) references product (product_id)
        );

 insert into productOrder
			values 	(1,4,1,12,840,'2019-10-13 12:01:34'),
			    	(2,5,3,5,600,'2019-10-13 18:11:05'),
			    	(3,2,2,2,1400,'2019-10-14 10:43:54'),
			    	(4,3,2,1,700,'2019-10-15 23:15:09'),
			    	(5,1,4,3,360,'2019-10-15 23:37:11'),
			    	(6,5,2,1,700,'2019-10-16 01:23:28'),
			    	(7,1,4,2,300,'2019-10-18 12:42:50');

select * from productOrder;
*/
/*
-- 1) 고객테이블에 성별, 나이, 전화번호 컬럼을 추가하고, 성별은 ‘F’, ‘M’의 형식이 입력되게 하고, 나이는 0살 이상 입력되도록 설정
alter table customer add (cusomerSex varchar(1) check(cusomerSex='F' or cusomerSex='M'),
						  cusomerAge int check(cusomerAge>=0), 
						  cusomerTel varchar(15));

-- 2) 고객 테이블에 데이터 3개 정도 삽입
insert into customer
			values 	('6','박나래','1986-12-02','2','F','36','010-3333-1145'),
			 	    ('7','기안','1984-02-21','1','M','40','010-5555-6666'),
			 	    ('8','덱스','1996-01-28','1','M','29','010-7777-8888');

            
select * from customer;

-- 3) 고객명이 ‘홍길동’인 고객의 전화번호를 수정(값은 임의의 번호로)
insert into customer values('9','홍길동','1973-05-05','2','M','50','010-2222-2222');
update customer set cusomerTel='010-1111-1111' where customer_name = '홍길동';
select * from customer;

-- 4) 나이가 20살 미만이 고객을 삭제

**참고**
update customer set age=(select floor(CAST(REPLACE(CURRENT_DATE,'-','') AS UNSIGNED) - 
       CAST(REPLACE(birthday,'-','') AS UNSIGNED)) / 10000 );

update customer set cusomerAge = '20' where customer_id= '1';
update customer set cusomerAge = '18' where customer_id= '2';
update customer set cusomerAge = '30' where customer_id= '3';
update customer set cusomerAge = '15' where customer_id= '4';
update customer set cusomerAge = '22' where customer_id= '5';

select * from customer;


alter table productorder drop constraint FK_prodOrder_customer;
alter table productorder 
			add constraint FK_prodOrder_customer
			foreign key (customer_id) references customer(customer_id)
			on delete cascade;
            
 delete from customer where cusomerAge < 20;
 
 select * from customer;

-- 5) 고객 테이블에서 고객명, 생년월일, 성별 조회
select customer_name, birthday, cusomerSex from customer;

-- 6) 고객 테이블에서 주소만 검색하여 조회 (중복되는 주소는 한번만 출력)
select distinct customer_Addr from customer;

-- 7) 고객 테이블에서 취미가 '축구'이거나 '등산'인 고객의 고객명, 취미 조회
select customer_name, customerHobby from customer where customerHobby = '축구' or customerHobby = '둥산';
*/
