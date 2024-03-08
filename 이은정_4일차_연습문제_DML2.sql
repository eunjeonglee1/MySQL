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