create database sql_joins;
show databases;

use sql_joins;

create table cricket ( cricket_id int auto_increment , name varchar(30), primary key(cricket_id));

create table football ( football_id int auto_increment , name varchar(30), primary key(football_id));

insert into cricket (name)
values ("Karthik"), ("Koushik"), ("Jayanth"), ("Akshith"), ("Virat");

select * from cricket;

insert into football (name)
values ("Karthik"), ("Shreyas"), ("Koushik"), ("Neymar"), ("Virat");

select * from football;

#Inner join Implementation

select * from cricket as c inner join football as f on c.name=f.name;

# Alternate Version

select c.cricket_id,c.name, f.football_id, f.name from cricket as c inner join football as f on c.name = f.name;

