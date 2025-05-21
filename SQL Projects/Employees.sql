use karthik;
show tables;

show tables;

create table Employees(emp_id int primary key,emp_name varchar(25), age int, gender char(1), doj date, dept varchar(25), city varchar(25), salary float);
describe employees;

Insert into employees values
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

select * from employees;

select distinct city from employees;

select distinct dept from employees;

select avg(age) from employees;

select dept, avg(age) from employees group by dept;

select dept, round(avg(age),1) as average_age from employees group by dept;

select dept, sum(salary) as salary_sum from employees group by dept;

select  count(emp_id), city from employees group by city order by count(emp_id);

select  count(emp_id), city from employees group by city order by count(emp_id) desc;

select year(doj) as year , count(emp_id) from employees group by year(doj);

select dept, min(salary) as lowest_salary from employees group by dept;

select distinct dept, length(dept) as length_dept from employees;

select dept, count(emp_id) from employees group by dept having count(emp_id) > 2;

select * from employees where dept <> 'Marketing' ;

select * from employees where dept != 'Marketing';

select * from (select * from employees order by salary desc limit 3) as Third order by salary limit 1;

select * from (select * from employees order by salary desc limit 3) as Third order by salary desc limit 1;

SELECT Emp_id,Emp_name, dept
FROM employees
WHERE emp_id % 2 = 1;  -- Assuming 'id' is the primary key

with CTE as
(
select * , row_number() over 
(order by emp_id) as rn 
from employees
)
select* from CTE Where rn % 2 =1;

select length(emp_name) - length(replace(upper(emp_name), 'A', '')) from employees;

select * from employees where length(emp_name) - length(replace(upper(emp_name), 'A', '')) = 2;

use karthik;
select * from emp_details;

select distinct e.emp_id, e.emp_name, e.salary from
employees as e, employees as e1
where e.salary = e1.salary = e.emp_id != e1.emp_id;

select emp_name, dept from employees as e 
where e.dept = 'Marketing'
union all 
select emp_name, dept from employees as e1 
where e1.dept = 'Marketing';





