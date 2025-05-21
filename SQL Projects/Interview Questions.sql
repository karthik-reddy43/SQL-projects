select datediff(now(),'2023-01-03');

select datediff(now(), '2003-08-01');

select substr("Karthik Reddy", 2, 4);

select substring("Karthik Reddy", 2, 4);

select e.emp_id, e.Emp_name, e.manager_id, m.emp_name as manager_name from
emp_manager as e join emp_manager as m on e.manager_id = m.emp_id;

use karthik;
create  table num( n_id int);

insert into num values
(0),(3),(3),(1),(2),(0),(2),(3),(0),(2),(1); 

select * from num; 

SELECT n_id,
  CASE 
    WHEN n_id = 0 THEN n_id + 10
    WHEN n_id = 1 THEN n_id + 20 
    ELSE n_id 
  END AS num_add
FROM num;





create table num1(num_int int);

INSERT INTO num1 (num_int) 
VALUES 
(-3),
(9),
(10),
(-6),
(5),
(8),
(-9),
(4);

select * from num1;

select sum(case when num_int > 0 
then num_int else 0 end ) as sum_pos,
sum(case when num_int < 0 
then num_int else 0 end ) as sum_neg
from num1;




create table dummy_sql 
(eid int primary key ,
city varchar(30) check (city = 'Mumbai'),
age int check( age > 0));

insert into dummy_sql
values (101,'Mumbai',10);

select * from dummy_sql;

insert into dummy_sql
values (102,'Delhi',10);

insert into dummy_sql
values (103,'Mumbai',-10);


create table a ( id int);

insert into a 
values
(122),
(140),
(190),
(90),
(70);

create table b(id int);

insert into b
values
(122),
(150),
(200),
(90),
(75);

select id from b left join a 
using (id) where a.id is null;






