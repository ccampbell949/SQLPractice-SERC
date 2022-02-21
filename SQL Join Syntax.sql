use NORTHWND
Go

--ANSI SQL 89 Syntax
Select c.CompanyName, o.OrderDate
from Customers as c, Orders as o
where c.CustomerID = o.CustomerID

--ANSI SQL 92 Syntax		--this one is "on" not "where"
select c.CompanyName, o.OrderDate
from Customers as c JOIN Orders as o
on c.CustomerID = o.CustomerID

