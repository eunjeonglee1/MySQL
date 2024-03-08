/* UPDATE문 : 레코드의 필드 값 변경
	 -- 형식 : update 테이블명 set 필드면 = 값 where 조건;
*/ 
 
use bookshopdb;
/*-- update 예제 

-- select * from product;

-- prdNo가 '5'인 제품의 color 값을 블랙으로 변경
-- update product set prdColor = '블랙' where prdNo= '5';

-- prdColor의 값이 블랙인 경우 검정으로 변경
-- update product set prdColor = '검정' where prdColor= '블랙';

select * from product where prdColor = '검정' ;
*/

/* Delete 문 : 조건에 맞는 행을 삭제
	  -- 형식 : delete from 테이블명 where 조건;
*/

/*-- delete 예제

-- select * from product where prdName = '32인치 LED 모니터';
-- select * from product where ctgNo = '2';

-- 제품명이 '32인치 LED 모니터' 레코드 삭제

delete from product where prdName = '32인치 LED 모니터';
select * from product where prdName = '32인치 LED 모니터';
*/
