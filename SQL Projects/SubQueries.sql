# SubQueries

use karthik;
show tables;
select * from employees;

select * from emp_details;

select emp_name, dept,salary from employees where salary > (select avg(salary) from employees);

# Stored Procedure

delimiter //
create procedure top_salaries()
begin 
select Emp_name, dept, salary from 
employees where salary > 90000;
end //
delimiter ;

call top_salaries;

# Stored Procedure using IN

delimiter //
create procedure sp_SortBySalaries(IN var int)
begin
select emp_name, age, salary from employees 
order by salary desc limit var;
end //
delimiter ;

call sp_sortbysalaries(3);

delimiter //
create procedure update_salary( IN temp_name varchar(20), in new_salary float)
begin 
update emp_details set
salary = new_salary where name = temp_name;
end; //

select * from emp_details;

call update_salary("Shreya", 180000);

select * from emp_details;

# Stored Procedure using OUT;

delimiter //
create procedure sp_countemployees(OUT Total_emps int)
begin
select count(name) into Total_emps from emp_details
where sex = "F";
end //
delimiter ;

call sp_countemployees (@F_emp);
select @F_emp as female_emps;

# Trigger in SQL;

# Creating Student Table

create table students (st_roll int, age int, name varchar(30), marks float);

delimiter //
create trigger marks_verify_st 
before insert on students
for each row 
if new.marks < 0 then set new.marks = 50;
end if; //


insert into students values
(501,10,"Ruth",75.0),
(502,12,"Mike",-20.5),
(503,13,"Dave",90.0),
(504,10,"Jacobs",-12.5);

select * from students;

# Dropping A trigger
 drop trigger marks_verify_st;

# Views in SQL:

use classicmodels;

select * from customers;

create view cust_details
as 
select CustomerName, phone, city 
from customers;

select * from cust_details;

select * from productlines;
select * from products;

create view product_description
as 
select ProductName, Quantityinstock, msrp, textdescription from
products as p inner join productlines as pl on p.productline = pl.productline;

select * from product_description;

# Renaming Description;

rename table product_description to vehicle_description;
rename table vehicle_description to product_description;

# Display Views:

show full tables
where table_type = "VIEW";

# Delete View:

drop view cust_details;

# Windows Functions:

use karthik;

select * from employees;

select emp_name, age, dept sum(salary) over (partition by dept) as total_salary 
from employees;

select * from friends;

select * from emp_details;

use triggers;

select * from employees; 

# Row Number;

use karthik;
select row_number() over (order by salary) as row_num, emp_name, emp_name, salary from employees order by salary;

# Find Duplicats:

create table demo(st_id int, st_name varchar(20));

insert into demo values
(101,"Shane"),
(102,"Bradley"),
(103,"Herath"),
(103,"Herath"),
(104,"Nathan"),
(105,"Kevin"),
(105,"Kevin");

select * from demo;

select st_id, st_name, row_number() over (partition by st_id, st_name order by st_id) as row_num from demo;

# Rank Function:

create table demo1(var_a int);
insert into demo1 values
(101),(102),(103),(104),(105),(106),(106),(107);

select var_a, rank() over (order by var_a) as test_rank
from demo1;

# First Value():

select emp_name, age, salary, first_value(emp_name) over (order by salary desc) as highest_salary from employees;

select emp_name,dept,salary, first_value(emp_name) over (partition by dept order by salary desc ) as highest_salary from employees;

 