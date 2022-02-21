select customerid, companyname
from customers as c
where exists (
		select * from orders as o
		where c.customerid = o.customerid);


select customerid, companyname
from customers as c
where NOT EXISTS (	
		select * 
		from orders as o
		where c.customerid = o.customerid);



--create an outer join to achieve same thing as the "not exists" above
select c.customerid, c.companyname
from customers as c left outer join orders as o
on c.customerid = o.customerid
where o.orderid is null;

--compare count (*) > 0 exists
select employeeid, lastname
from employees as e
where (select count(*) from orders as o
		where o.employeeid = e.employeeid) > 0