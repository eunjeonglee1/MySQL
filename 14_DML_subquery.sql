/*
서브쿼리(subquery) : 부속질의 
	- 메인쿼리와 서브쿼리로 구성
	- 단일행 서브쿼리 | 다중행 서브쿼리
	- where 절에 사용하는 서브쿼리 연산자:
				# 비교 : = , < , <=, =>, >, != (단일 행 반환)
                # 집합 : in, not in (다중행 반환)
                # 존재 : exists, not exists (다중행 반환)
                # 한정 : any, all (다중행 반환)
*/

use bookdb;

-- 고객 호날두가 주문한 수량을 조회

/*-- inner join 사용 예시
select BS.clientNo, BC.clientName, BS.bsDate, BS.bsQty
		from booksale BS
        inner join bookclient BC
        on BC.clientNo = BS.clientNo
        where BC.clientName = '호날두';
*/        

/*-- 서브쿼리 사용 예시 : 단일행 서브쿼리 ('=' 사용)
select BS.bsDate, BS.bsQty
		from bookSale BS
        where clientNo = ( select clientNo
								from bookclient
								where clientName = '호날두');


-- 호날두가 주문한 총주문량 출력
select sum(bsQty) as '총주문량'
		from bookSale BS
        where clientNo = ( select clientNo
								from bookclient
								where clientName = '호날두');


-- cartesion product의 결과로 테이블을 생성한 후 조회
select bookclient.clientNo,bookClient.clientName,bookSale.bsDate,bookSale.bsQty
		from bookClient,bookSale
			where 
				booksale.clientNo = (
				select clientNo from bookClient where clientName='호날두'
                )
;

select bookclient.clientNo,bookClient.clientName,bookSale.bsDate,bookSale.bsQty
		from bookClient,bookSale
			where 
				booksale.clientNo=bookclient.clientNo
                and booksale.clientNo = (
				select clientNo from bookClient where clientName='호날두'
                )
;


-- 가장 비싼 도서의 명과 가격 조회
select bookName, bookPrice
		from book
		where bookPrice = (select max(bookPrice)
							from book);

-- 서브쿼리 사용 예시 : 단일행 서브쿼리 ('>' 사용)
-- 평균 도서 가격보다 비싼 도서의 도서명과 도서가격 조회 
select bookName, bookPrice
		from book
		where bookPrice > (select avg(bookPrice)
							from book);

select avg(bookPrice) as '평균도서가격' from book;
*/

-- 다중행 서브쿼리 : in, not insert

/*-- 도서 구매이력이 있는 고객명 조회 (in 사용)
select clientName
		from bookClient
		where clientNo in (select distinct clientNo
							from booksale);
                            
-- 도서 구매이력이 없는 고객명 조회 (not in 사용)
select clientName
		from bookClient
		where clientNo not in (select distinct clientNo
							from booksale);

*/

/*-- 중첩 서브쿼리 사용
-- 도서명이 '자료구조'를 구매한 고객의 이름과 연락처
select clientName, clientPhone
		from bookclient
        where clientNo in (select clientNo
								from booksale
                                where bookNo in (select bookNo
														from book
                                                        where bookName = '자료구조'));

-- 도서명이 '자바' 이름이 들어간 책을 구매한 고객의 이름과 연락처
select clientName, clientPhone
		from bookclient
        where clientNo in (select clientNo
								from booksale
                                where bookNo in (select bookNo
														from book
                                                        where bookName like '%자바%'));
*/


/*-- 다중형 서브쿼리 : exists, not exists
-- 도서 구매이력이 있는 고객명 조회 (exists 사용)
select clientName
		from bookClient
		where exists (select clientNo
							from booksale
                            where bookClient.clientNo = bookSale.clientNo);
                            
-- 도서 구매이력이 없는 고객명 조회 (not exists 사용)
select clientName
		from bookClient
		where not exists (select clientNo
							from booksale
                            where bookClient.clientNo = bookSale.clientNo);
                            
*/

/*-- exists와 in의 차이점

-- exists : 서브쿼리 결과에 null 값 포함

select clientNo
	from bookclient
    where exists (select clientHobby from bookclient);
    
-- in : 서브쿼리 결과에 null 값 포함하지 않음

select clientNo
	from bookclient
    where clientHobby in (select clientHobby from bookclient);
*/

-- 다중형 서브쿼리 : All, Any

select clientNo, bsNo, bsQty
		from booksale
        where bsQty > all (select bsQty
									from bookSale
                                    where clientNo = '2');