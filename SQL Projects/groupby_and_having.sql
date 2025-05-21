use karthik;
show tables;
create table sales(product_id int , sell_price float, quantity int, state varchar(20));

describe sales;

insert into sales values
(121, 320.0, 3, "Telangana"),
(121, 320.0, 6, "Andhra Pradesh"),
(121, 320.0, 4, "Madhya Pradesh"),
(123, 290.0, 5, "Assam"),
(123, 290.0, 6, "Punjab"),
(121, 290.0, 7, "Tamil Nadu"),
(121, 320.0, 3, "Karnataka"),
(123, 320.0, 8, "Rajasthan");

select * from sales;

select product_id, sum(sell_price * quantity) as revenue from sales group by product_id;

create table c_product (product_id int , cost_price float);

insert into c_product values
(121, 290.0),
(123,300.0);

select c.product_id, sum((s.sell_price - c.cost_price) * quantity) as profit from sales as s inner join c_product as c 
where s.product_id = c.product_id 
group by c.product_id;

select dept, avg(salary) as avg_salary from employees group by dept having avg(salary) > 280000;

select city , sum(salary) as total from employees group by city having sum(salary) > 300000;

select dept , count(*) as emp_count from employees group by dept having count(*) > 2;

select dept, count(*) as emp_count from employees group by dept having avg(salary) > 250000;