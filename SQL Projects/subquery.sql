show databases;
use karthik;

show tables;

select * from employees;

select dept from employees where salary = (select max(salary) from employees);

select emp_name from employees where salary = (select max(salary) from employees);
# or
select emp_name,salary from employees where salary = (select max(salary) from employees);

SELECT MAX(SALARY) FROM Employees;

Select emp_name,dept,salary from employees where
salary < (select avg(salary) from employees);

#fun
select avg(salary) from employees;

# SubQueries with INSERT statement:

create table products (prod_id int, item varchar(30), sell_price float, product_type varchar(30));

insert into products values 
(101, 'Jewellery', 1800, 'Luxury'),
(102, 'T-Shirt', 100, 'Non-Luxury'),
(103, 'Laptop', 1300, 'Luxury'),
(104, "Table", 400, "Non-Luxury");

select * from products;

create table orders (order_id int, product_sold varchar(30), selling_price float);

insert into orders
select  prod_id, item, sell_price
from products where prod_id in
(select prod_id from products where sell_price > 1000);

select * from orders;

# UPDATE SubQuery
use karthik;
select * from employees;

## creating other version of employees as employees_b to implement subquery

create table Employees_b (emp_id int primary key,emp_name varchar(25), age int, gender char(1), doj date, dept varchar(25), city varchar(25), salary float);
describe employees_b;

Insert into employees_b values
(3050,'Karthik',20, "M","2003-08-01",'CSE',"Hyderabad", 360000),
(3005,'Akshith',20, "M","2003-04-25","E-Commerce",'Warangal',280000),
(3049,'Shreya',21,"F","2002-09-18","Arts","Vijayawada",300000),
(3021,'Yasasvi',20,"F", "2003-04-20","Marketing","Guntur",250000),
(3048,'Jayanth',20,"M","2003-07-15","Marketing",'Vizag',260000),
(3001,'Koushik',20, "M","2003-03-28",'E-commerce',"Shamirpet", 380000),
(3029,'Richitha',21, "F","2002-06-01","Arts",'Medchal',280000),
(3033,'Suma',21,"F","2002-11-25","Design","Dallas",320000),
(3004,'Grish',21,"F", "2002-08-20","Arts","Warangal",220000),
(3036,'Praneeth',21,"M","2002-10-15","Marketing",'Godavari',240000);

select * from employees_b;

update employees 
set salary = salary * 0.36
where age in (select age from employees_b where age <= 20);

select * from employees;

# SubQuery with delete statement

Delete from employees where age in
(select age from employees_b where age >20);

select * from employees;





