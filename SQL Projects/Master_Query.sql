-- 26

select * from customers;

select * from orders;

select distinct customerid from customers;

select distinct customerid from orders;

select customerid from customers where customerid 
not in (select customerid from orders);

-- 27

select employeeid, orderid, orderdate from orders
where orderdate = EOMONTH(orderdate)
order by employeeid, orderid;

-- 28

select top 5 shipcountry, avg(Freight) as average_freight
from orders where year(orderdate) = 1997
group by shipcountry
order by average_freight desc;



-- 29

select * from products;

select * from categories;

select categoryname, count(*) as total_products
from products as p inner join categories as c
on p.categoryid = c.categoryid
group by categoryname
order by count(*) desc;


-- 30

select * from employees;

select e.employeeid, firstname, count(*) as 
late_orders from orders as o inner join employees
as e on e.EmployeeID = o.employeeid 
where requireddate <= shippeddate
group by e.EmployeeID, e.FirstName
order by late_orders desc;

















