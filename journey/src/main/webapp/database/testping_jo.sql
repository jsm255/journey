-- 아마존에 연결되어있음 id : admin pw : 그거

use journey;

-- 10개 국 : 미국 / 영국 / 일본 / 태국 / 중국 / 필리핀 / 독일 / 이탈리아 / 그리스 / 인도

create table country(
	-- 번호, 국가 이름, 평점(리뷰에서 매긴 평균), 
	code integer primary key auto_increment,
	countryName varchar(30) not null,
	score varchar(10) default "0"	-- 소수점 값 --> varchar로 값을 받음 --> 표시할 땐 Double.parseDouble(String)으로 바꿔받음
);

create table review(
	code integer primary key auto_increment,
	countryName varchar(30) not null,
	userName varchar(30) not null default "guest",
	content varchar(5000),
	score integer default 0,
	`date` datetime not null default current_timestamp,
	pw varchar(30),		-- 게스트 상태에서 글을 쓸 경우 사용예정
    attachCnt integer default 0
);

create table reReview(
	code integer primary key auto_increment,
    countryName varchar(30) not null,
	userName varchar(30) not null default "guest",
	content varchar(5000),
	`date` datetime not null default current_timestamp,
	pw varchar(30),		-- 게스트 상태에서 글을 쓸 경우 사용예정
    attachCode integer not null
);

drop table country;
drop table review;

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

update country set flag="images/usflag.png" where countryName="미국";

insert review(countryName, userName, content, score, attachCnt) values("미국", "으악", "으아악", 6, 2);
insert review(countryName, content, score, pw) values("영국", "으악!", 8, "1234");
insert review(countryName, content, score, pw, attachCnt) values("미국","정말 멋있었다", 9, "1234", 1);
insert review(countryName, content, score, pw) values("영국","정말 멋있었다", 8, "1234");
insert review(countryName, content, score, pw) values("일본","정말 멋있었다", 7, "1234");
insert review(countryName, content, score, pw) values("태국","정말 멋있었다", 8, "1234");
insert review(countryName, userName, content, score) values("중국", "A회원", "정말 멋있었다", 9);
insert review(countryName, content, score, pw) values("중국","정말 멋있었다", 4, "1234");
insert review(countryName, content, score, pw) values("독일","정말 멋있었다", 3, "1234");
insert review(countryName, content, score, pw) values("이탈리아","정말 멋있었다", 6, "1234");
insert review(countryName, content, score, pw) values("그리스","정말 멋있었다", 7, "1234");
insert review(countryName, content, score, pw) values("인도","정말 멋있었다", 10, "1234");

insert review(countryName, userName, content, score) values("미국", "으악3", "으아악으아악", 6);
insert review(countryName, userName, content, score) values("미국", "으악4", "으아악333", 9);
insert review(countryName, userName, content, score) values("미국", "으악5", "으아악44444", 8);
insert review(countryName, userName, content, score) values("미국", "으악6", "으아악55555", 7);
insert review(countryName, userName, content, score) values("미국", "으악8", "으아악666", 6);
insert review(countryName, userName, content, score) values("미국", "으악7", "으아악777", 5);
insert review(countryName, userName, content, score) values("미국", "으악9", "으아악888", 10);
insert review(countryName, userName, content, score) values("미국", "으악0", "으아악999", 9);
insert review(countryName, userName, content, score) values("미국", "으악-", "으아악111123", 2);
insert review(countryName, userName, content, score) values("미국", "으악=", "으아악32131", 6);
insert review(countryName, userName, content, score) values("미국", "으악11", "으아악32323", 7);
insert review(countryName, userName, content, score) values("미국", "으악12", "으아악43434", 7);

insert reReview(countryName, userName, content, attachCode) values("미국", "대댓글다는 사람", "ㄹㅇㅋㅋ", 1);
insert reReview(countryName, userName, content, attachCode) values("미국", "대댓글다는 사람2", "ㄹㅇㅋㅋ2", 1);
insert reReview(countryName, userName, content, attachCode) values("미국", "대댓글다는 사람", "ㄹㅇㅋㅋ", 3);

select * from country;
select * from review;