Create database Karthik;
use Karthik;
show databases;

create table emp_details (Name varchar(50), Age int, Sex char(1), DOJ date, City varchar(50), Salary float);
describe emp_details;

insert into emp_details values("Karthik",20,"M", "2003-08-01","Hyderabad",120000),
("Akshith",20,"M", "2003-04-25", "Bengaluru", 180000),
("Shreya",21,"F", "2002-09-18", "Vijayawada", 200000),
("Yasasvi",20,"F", "2003-04-20", "Guntur", 150000),
("Jayanth", 20,"M", "2003-07-15", "Vizag", 100000),
("Deeksha", 21, "F", "2002-12-10", "Warangal", 190000);

select * from emp_details;

select distinct city from emp_details;

select count(Name) from emp_details;

select distinct name from emp_details;

select count(Name) as count_name from emp_details;

select sum(salary) from emp_details;

select avg(salary) from emp_details;

select name, age, city from emp_details;

select * from emp_details where age > 20;

select name, sex, age , city from emp_details where sex = "F";

select * from emp_details where city = "Hyderabad" or city = "Vijayawada";

select * from emp_details where city in ("Hyderabad","Vijayawada");

select * from emp_details where doj between "2003-01-01" and "2003-12-31";

select sex, sum(salary) as total_salarybygender from emp_details group by sex;

select * from emp_details order by salary;

select * from emp_details order by salary desc;




