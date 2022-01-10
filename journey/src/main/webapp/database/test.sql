create schema journey;


create database journey;
use journey;

create table users(
id varchar(10) not null primary key,  -- 사용자 아이디
pw varchar(10) not null,  -- 사용자 비밀번호
username varchar(20) not null, -- 사용자 이름
tel varchar(30) not null -- 사용자 전화번호
);

show databases;

select * from users;