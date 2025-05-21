# Creating and Modifying Relations using SQL

create database DBMS;

use DBMS;

create table Students ( sid char(20), name char(30), login char(20), age int, gpa real);

insert into Students (sid,name,login,age,gpa)
values (50000, "Dave", "dave@cs", 19, 3.3),
(53666,"Jones", "jones@cs", 18, 3.4),
(53688,"Smith", "smith@ec", 18,3.2),
(53650,"Smith", "smith@math", 19,3.8),
(53831, "Madayan", "madayan@music", 11,1.8),
(53832, "Guldu","guldu@music",12,2.0);

select * from Students;

update Students S
set S.age = S.age + 1 , S.gpa =S.gpa-1
where S.sid = 53688;

select * from students;

update students s 
set s.gpa = S.gpa - 0.1
where S.gpa >= 3.3 ;

select * from students;

