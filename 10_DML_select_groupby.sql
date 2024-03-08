/* 집계함수 : max(필드명), min(필드명),sum(필드명),avg(필드명),round(필드명)
		    count(필드명), count(*)

*/
use bookshopdb;
/* 집계함수 예제
select count(prdPrice) as '총 제품수',
	   sum(prdPrice) as '가격총액',
	   round(avg(prdPrice),1) as 평균가격,
	   min(prdPrice) as 최저가,
	   max(prdPrice) as 최고가
       from product;
    
select * from book;
select count(bookAuthor) as '총 저자명',
	   count(*) as '도서총수',
	   min(bookPrice) as 최저가,
	   max(bookPrice) as '최고가'
       from book;
         

 select count(prdName) from product where prdName like '%데이터%';

 select prdName from product where prdName like '%노트북%';
 */
 
 /* 그룹별 집계 : group by / having
 select 집약키 필드명, 집계함수 적용,... from where 조건 group by 집약키 필드명;
 group by에 사용하는 필드 => 집계를 위한 키 ,집약키

 
select * from book order by pubNo;

select pubNo, count(pubNo),sum(bookPrice) from book group by pubNo;
 
 
select * from productorder;
-- productorder 테이블에서 고객별 주문총액과 평균주문액 출력

select customer_id, 
			count(quantity) as 주문횟수,
            sum(quantity) as 주문총액,
            avg(quantity) as 평균주문액
			from productorder group by customer_id
            # with rollup #각 열의 Total 해준것을 출력, 순서는 order by 위에 씀
            order by '평균주문액' desc;
*/

use bookshopdb;

/*-- having절은 group by의 조건이 됨
select pubNo, count(*) as '도서 수 합계' from book where bookPrice >=25000
		group by pubNo having count(*)>=2
        order by '도서 수 합계' desc;
*/        
/*        
select count(*) from book where pubNo='1';
select count(*) from book where pubNo='2';
select count(*) from book where pubNo='3';
*/

-- 도서테이블 가격을 내림차순 정렬하여 도서명, 저자, 가격 조회(가격이 동일하면 저자 오름차순)
# select bookName,bookAuthor,bookPrice from book order by bookPrice desc, bookAuthor;

-- 도서테이블에서 저자에 길동이 들어가는 도서의 가격총액 계산하여 출력
# select sum(bookPrice) as 가격합계 from book where bookAuthor like '%길동%';

-- 도서 테이블에서 '서초출판사' 도서 중 최고가와 최저가 출력
# select * from publisher;
# select min(bookPrice) as 최저가 , max(bookPrice) as 최고가 from book where pubNo='3';

-- 제품주문테이블에서 고객별로 총주문량과 평균 주문량을 계산하여 고객번호 순으로 출력
-- select customer_id, sum(quantity) as 총주문량, round(avg(quantity)) as 평균주문량 
-- 		from productorder 
--         group by customer_id
--         having 총주문량 >= 3
--         order by 총주문량;