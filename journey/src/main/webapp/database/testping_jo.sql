-- 아마존에 연결되어있음 id : admin pw : 그거

use journey;

-- 10개 국 : 미국 / 영국 / 일본 / 태국 / 중국 / 필리핀 / 독일 / 이탈리아 / 그리스 / 인도

create table country(
	-- 번호, 국가 이름, 평점(리뷰에서 매긴 평균), 
	code integer primary key auto_increment,
	countryName varchar(30) not null,
	score varchar(10) default "0"	-- 소수점 값 --> varchar로 값을 받음 --> 표시할 땐 Double.parseDouble(String)으로 바꿔받음
);

create table board(
	code integer primary key auto_increment,
	countryCode integer not null,
	userName varchar(30) not null default "Guest",
	content varchar(5000),
	score integer default 0,
	`date` datetime not null default current_timestamp,
	pw varchar(30)		-- 게스트 상태에서 글을 쓸 경우 사용예정
);

drop table country;
drop table board;

insert country(countryName) value("미국");
insert country(countryName) value("영국");
insert country(countryName) value("일본");
insert country(countryName) value("태국");
insert country(countryName) value("중국");
insert country(countryName) value("필리핀");
insert country(countryName) value("독일");
insert country(countryName) value("이탈리아");
insert country(countryName) value("그리스");
insert country(countryName) value("인도");

insert board(countryCode, userName, content, score) values(1, "으악", "으아악", 6);
insert board(countryCode, content, score, pw) values(2, "으악!", 8, "1234");
insert board(countryCode, content, score, pw) values(1,"정말 멋있었다", 9, "1234");
insert board(countryCode, content, score, pw) values(2,"정말 멋있었다", 8, "1234");
insert board(countryCode, content, score, pw) values(3,"정말 멋있었다", 7, "1234");
insert board(countryCode, content, score, pw) values(4,"정말 멋있었다", 8, "1234");
insert board(countryCode, userName, content, score) values(5, "A회원", "정말 멋있었다", 9);
insert board(countryCode, content, score, pw) values(5,"정말 멋있었다", 4, "1234");
insert board(countryCode, content, score, pw) values(7,"정말 멋있었다", 3, "1234");
insert board(countryCode, content, score, pw) values(8,"정말 멋있었다", 6, "1234");
insert board(countryCode, content, score, pw) values(9,"정말 멋있었다", 7, "1234");
insert board(countryCode, content, score, pw) values(10,"정말 멋있었다", 10, "1234");

select * from country;
select * from board;