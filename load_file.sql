-- create database testdb character set utf8mb4;

 use testdb;




/*
create table flower (
	flowerNo varchar(10) not null primary key,
    flowerName varchar(30) not null,
    flowerInfo longtext,
    flowerImage longblob
);


insert into flower values ('f001', '장미', 
	load_file("F:/workspace_07/02_DB_SQL/rose.txt"),
    load_file("F:/workspace_07/02_DB_SQL/rose.jpg")
);
*/
show variables like 'max_allowed_packet';



--  select * from flower;