use NORTHWND
Go

Select
	CONCAT(ContactName, ' (City: ' + City,  + ', Region: ' + Coalesce (Region, '') + ')') as Details
	from Customers;


SELECT ContactName, ContactTitle

FROM Customers

WHERE ContactName LIKE '[A-G]%'
order by ContactName asc