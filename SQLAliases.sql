select CompanyName as [Company Name], ContactTitle as [Contact Title], ContactName as [Contact Number]
from Customers

select c.CompanyName, c.ContactTitle, c.ContactName, o.OrderID, o.ProductID --the c and c point towards the aliase tables
from Customers as c, [Order Details] as o --this is used to combine different columns from multiple tables
--https://www.w3schools.com/sql/sql_alias.asp

select CompanyName [Company Name]
from Customers as S