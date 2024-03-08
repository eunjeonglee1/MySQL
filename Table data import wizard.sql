-- table data import wizard를 이용하여 테이블 생성

-- 1. Navigator에서 DB를 선택하고 우클릭하여 [table data import wizard] 선택
-- 2. import하려는 데이터 경로 선택
-- 3. table이름과 필드명, 테이터 형식 수정& 선택
-- 4. 데이터 임포트 실행
-- 5. 테이블 생성 확인


-- desc bookshopdb.product; #describe 약어 : desc
-- 파일 임포트로 업로드하면 제약조건이 설정되어있지 않음

/*-- 제약조건 설정
use bookshopdb;

alter table product modify prdNo varchar(10) not null;

alter table product add constraint PK_product_prdNo primary key(prdNo);


alter table product modify prdName varchar(20),
					modify prdMaker varchar(30),
					modify prdColor varchar(10),
					modify ctgNo varchar(10);
desc product;
*/

use bookshopdb;

-- alter table productorder modify order_id int not null;
-- alter table productorder add constraint PK_productorder_order_id primary key(order_id);
alter table productorder modify product_id varchar(10) not null;
alter table productorder add constraint FK_prdorder_prd foreign key (product_id) references product (prdNo);

desc productorder;