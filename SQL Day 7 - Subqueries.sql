--scarlar sub query

SELECT ORDERID, PRODUCTID, unitprice, quantity
from [Order Details]
where orderid = (select max(orderid) as lastorder --where equal to this formula
						from orders);				-- the alias isn't necessary
						
--sql will always run the inside query first



--Multi-valued subquery -- IN predicate
select customerid, orderid
from orders
where customerid in
	(select customerid
	from Customers
	where country = N'Mexico'); --returning the customerids of customers who reside in mexico to the outer function


--multi-valued as a join - can also do the above as a join

select c.customerid, o.orderid
from customers as c 
join orders as o on c.customerid = o.customerid
where c.country = N'Mexico'

--correlated subqueries
--dependent on outer query, cannot be executed separately - harder to test than self-contained queries

select orderid, employeeid, orderdate
from orders as o1
where orderdate = 
	(select max(orderdate)
	from orders as o2
	where o2.Employeeid = o1.employeeid) --the alias used in the outer function is used within the nested function and so cannot be run independently
	order by employeeid, orderdate;

select customerid, orderdate, quantity
from customers as c
where quantity = (
					select max(o.quantity
					from [order details] as o
					where o.customerid = c.customerid)
order by c.customerid

select c.customerid, o.orderdate, od.quantity
from customers as c inner join orders as o
on c.customerid = o.customerid inner join [order details] as od
on o.orderid = od.orderid
where c.customerid = 'ALFKI'



