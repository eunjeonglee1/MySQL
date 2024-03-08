-- **정렬(sort) : select from where order by 필드명 [asc | desc];
use bookshopdb;
/* -- 오름차순 내림차순 예제
use bookshopdb;
# asc를 작성하지 않아도 기본 디폴트가 오름차순
select * from book order by bookName;
- 책가격 오름차순
select * from book order by bookPrice;
- 책날짜 내림차순
select * from book order by bookDate desc;
- 저자 오름차순
select * from book order by bookAuthor asc;
*/

/* case 다중조건 (참고만)
-- ascii : 48 ~ 57 => 숫자
-- ascii : 65 ~ 90 => 알파벳 대문자
-- ascii : 97 ~ 122 => 알파벳 소문자

select * from book order by bookName;

-- 정렬기준 : 2가지로 작성한것
select * from book order by (case when ascii(substring(bookName,1)) between 48 and 57 then 3
								  when ascii(substring(bookName,1)) < 122 then 2
                                  else 1
                                  end), bookName;
*/

/*-- 조회 갯수 제한 : limit 숫자 | limit 시작위치, 갯수

-- 데이터 전체 확인
select * from book order by bookName;

-- 처음부터 3개까지만
select * from book order by bookName limit 3;

-- 3~5개까지 확인 (번호는 0부터 시작)
select * from book order by bookName limit 3,5;
*/

/*-- 정렬 기준 : 두가지 이상인 경우
				# as '별칭' : 열 이름 변경하여 보여줌
select bookName as '도서명', bookAuthor as '저자', bookPrice as '가격' , pubNo
				from book order by pubNo, bookPrice desc;
*/