-- 1. DB생성
# create database bookdb default character set utf8mb4;

-- 2. 
use bookdb;
/*
alter table publisher add(
		pubNo varchar(10) not null,
        pubName varchar(20),
        primary key (pubNo)
        );
   

select * from publisher;

alter table book add(
		bookNo varchar(10) not null,
        bookName varchar(20),
        bookAuthor varchar(30),
        bookPrice int,
        bookDate date,
        bookStock int,
        pubNo varchar(10) not null,
        primary key (bookNo),
        constraint FK_pub_book foreign key (pubNo) references publisher (pubNo)
        );

select * from book;

alter table bookclient add(
		clientNo varchar(10) not null,
        clientName varchar(30),
        clientPhone varchar(13),
        clientAddress varchar(50),
        clientBirth date,
        clientHobby varchar(30),
        clientGender varchar(1) not null,
        primary key (clientNo)
        );

select * from bookclient;

alter table booksale add(
		bsNo varchar(10) not null,
        bsDate date,
        bsQty int,
        clientNo varchar(10) not null,
        bookNo varchar(10) not null,
        primary key (bsNo),
        constraint FK_client_sale foreign key (clientNo) references bookclient (clientNo),
        constraint FK_book_sale foreign key (bookNo) references book (bookNo)
        );

select * from booksale;
*/


-- 조인 사용
-- 3-1) 모든 도서에 대하여 도서의 도서번호, 도서명, 출판사명 조회
select B.bookNo, B.bookName, PB.pubName 
		from book B
        join publisher PB
        on B.pubNo = PB.pubNo;
        
-- 3-2) ‘서울 출판사'에서 출간한 도서의 도서명, 저자명, 출판사명 조회 (조건에 출판사명 사용)
select B.bookName, B.bookAuthor, PB.pubName 
		from book B
        join publisher PB
        on B.pubNo = PB.pubNo
        where PB.pubName = '서울 출판사';
      
-- 3-3) ’종로출판사'에서 출간한 도서 중 판매된 도서의 도서명 조회 (중복된 경우 한 번만 출력)(조건에 출판사명 사용)
select distinct B.bookName 
		from book B
        inner join publisher PB on B.pubNo = PB.pubNo
        inner join booksale BS on B.bookNo = BS.bookNo
		where pubName = '정보출판사';

-- 3-4)도서가격이 30,000원 이상인 도서를 주문한 고객의 고객명, 도서명, 도서가격, 주문수량 조회
select BC.clientName, B.bookName, B.bookPrice, BS.bsQty
		from booksale BS
        inner join bookclient BC on BC.clientNo = BS.clientNo
        inner join book B on BS.bookNo = B.bookNo
        where B.bookPrice >=30000;
 
-- 3-5) '안드로이드 프로그래밍' 도서를 구매한 고객에 대하여 도서명, 고객명, 성별, 주소 조회 (고객명으로 오름차순 정렬) 
select B.bookName, BC.clientName, BC.clientGender, BC.clientAddress
		from booksale BS
        join book B on B.bookNo = BS.bookNo
        join bookclient BC on BS.clientNo = BC.clientNo
        where B.bookName = '안드로이드 프로그래밍'
        order by clientName;
 

-- 3-6) ‘도서출판 강남'에서 출간된 도서 중 판매된 도서에 대하여 ‘총 매출액’ 조회
select sum(BS.bsQty*B.bookPrice) as '총 매출액'
		from book B
		join publisher PB on B.pubNo = PB.pubNo
        join booksale BS on B.bookNo = BS.bookNo
        where pubName = '도서출판 강남';
        
-- 3-7) ‘서울 출판사'에서 출간된 도서에 대하여 판매일, 출판사명, 도서명, 도서가격, 주문수량, 주문액 조회
select BS.bsDate, PB.pubName, B.bookName, B.bookPrice, BS.bsQty, B.bookPrice*BS.bsQty as '주문액'
		from book B
		join publisher PB on B.pubNo = PB.pubNo
        join booksale BS on B.bookNo = BS.bookNo
        where PB.pubName = '서울 출판사';

-- 3-8) 판매된 도서에 대하여 도서별로 도서번호, 도서명, 총 주문 수량 조회
select B.bookNo, B.bookName, sum(BS.bsQty) as '총 주문 수량'
		from booksale BS
        join book B on B.bookNo = BS.bookNo
        group by BS.bookNo;


-- 3-9) 판매된 도서에 대하여 고객별로 고객명, 총구매액 조회 ( 총구매액이 100,000원 이상인 경우만 해당)
select BC.clientName, sum(B.bookPrice*BS.bsQty) as 총구매액
		from booksale BS
        join book B on B.bookNo = BS.bookNo
        join bookclient BC on BC.clientNo = BS.clientNo
        group by BC.clientName  #집약키를 Select문에 꼭 쓸 필요는 없다.
        having sum(B.bookPrice*BS.bsQty)>=100000;
       

-- 3-10) 판매된 도서 중 ＇도서출판 강남'에서 출간한 도서에 대하여 고객명, 주문일, 도서명, 주문수량, 출판사명 조회 
-- (고객명으로 오름차순 정렬)
select BC.clientName, BS.bsDate, B.bookName, BS.bsQty, PB.pubName
		from booksale BS
		join book B on B.bookNo = BS.bookNo
        join bookclient BC on BC.clientNo = BS.clientNo
        join publisher PB on PB.pubNo = B.pubNo
        where pubName = '도서출판 강남'
        order by clientName;
        
 

-- 서브쿼리 사용
-- 4-1) 호날두(고객명)가 주문한 도서의 총 구매량 조회
select sum(bsQty) as '총 구매량'
		from booksale
        where clientNo = (select clientNo
								from bookclient
                                where clientName = '호날두');
                                


-- 4-2) ‘종로출판사’에서 출간한 도서를 구매한 적이 있는 고객명 조회
select clientName
		from bookclient
        where clientNo in (select clientNo
							from booksale
							where bookNo in (select bookNo
													from book
													where pubNo in (select pubNo
																		from publisher
																		where pubName='종로출판사')));
                                                                       
-- 4-3) 베컴이 주문한 최고 주문수량 보다 더 많은 도서를 구매한 고객명 조회
select BC.clientName
from booksale BS
join bookclient BC on BS.clientNo = BC.clientNo
where BS.bsQty > (select max(BS.bsQty)
						from booksale BS
						join bookclient BC on BS.clientNo = BC.clientNo
						where BC.clientName = '베컴');

# all로 사용                        
select BC.clientName
from booksale BS
join bookclient BC on BS.clientNo = BC.clientNo
where BS.bsQty > all (select BS.bsQty
						from booksale BS
						join bookclient BC on BS.clientNo = BC.clientNo
						where BC.clientName = '베컴');
                        
-- 4-4) 서울에 거주하는 고객에게 판매한 도서의 총 판매량 조회
select sum(bsQty) as '총 판매량'
		from booksale
		where clientNo in (select clientNo
								from bookclient
                                where clientAddress = '서울');
                                 
-- 4-5) ‘정보출판사’에서 출간한 도서를 구매한 적이 있는 고객명 조회
select clientName
		from bookclient
        where clientNo in (select BC.clientNo
								from booksale BS
                                join bookclient BC on BS.clientNo = BC.clientNo
                                join book B on B.bookNo = BS.bookNo
                                join publisher PB on B.pubNo = PB.pubNo
                                where PB.pubName = '정보출판사');