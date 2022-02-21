select c.CustomerID, c.CompanyName, o.OrderDate, o.OrderID
from Customers as c 
LEFT OUTER JOIN Orders as o
on c.CustomerID = o.CustomerID
where o.OrderDate is NULL

--Right outer join

Select c.CustomerID, c.CompanyName, o.OrderDate, o.OrderID
from Customers as c Right OUTER JOIN Orders as o
on c.CustomerID = o.CustomerID
where c.CustomerID is Null

--Cross join
select e1.FirstName, e2.LastName
from Employees as e1
cross join Employees as e2

--self join
select e.EmployeeID, e.LastName, e.Title, e.ReportsTo, m.LastName
from Employees as e
left outer join Employees as m
on e.ReportsTo = m.EmployeeID
--returns all emplyees and their manager