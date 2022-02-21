select c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
from Categories as c JOIN Products as p
on c.CategoryID = p.CategoryID

select distinct e.City, e.Country
from Customers as c JOIN Employees as e
on c.city = e.city AND c.Country = e.Country

--joining multiple tables
select c.CustomerID, c.CompanyName, o.OrderID, o.OrderDate, od.ProductID, od.Quantity
from Customers as c JOIN Orders as o
on c.CustomerID = o.CustomerID join [Order Details] od on o.OrderID = od.OrderID