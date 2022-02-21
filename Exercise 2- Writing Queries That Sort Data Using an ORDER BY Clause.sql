--Exercise 2: Writing Queries That Sort Data Using an ORDER BY Clause  

--Scenario  

--The sales department would like to have a report showing all the orders with some customer information. 
--An additional request is that the result be sorted by the order dates and the customer IDs. Remember from 
--the previous modules that the order of the rows in the output of a query without an ORDER BY clause is 
--not guaranteed. Because of this, you will have to write a SELECT statement that uses an ORDER BY clause.  

--The main tasks for this exercise are as follows:  

--Write a SELECT statement that uses an ORDER BY clause.   

--Analyze and correct a query.   

--Task 1: Write a SELECT statement that uses an ORDER BY clause  

--Write a SELECT statement to retrieve the custid and contactname columns from the Customers table and 
--the orderid and orderdate columns from the Orders table. Filter the results to include only orders placed
--on or after September 1, 1996 (filter the orderdate column). Then sort the result by orderdate in descending
--order and custid in ascending order.  

select 
	c.customerid, c.contactname, o.orderid, o.orderdate
from 
	Customers as c inner join orders as o on c.CustomerID = o.CustomerID
where
	OrderDate >= '19960901' 
order by 
	o.orderdate desc, c.customerid asc

--Execute the written statement and compare the results that you got with the desired results shown in the 
--file 62 - Lab Exercise 2 - Task 1 Result.txt.  

--Task 2: Order the result by the firstname column  

--SELECT 

--e.empid, e.lastname, e.firstname, e.title, 

--m.lastname AS mgrlastname, m.firstname AS mgrfirstname 

--FROM Employees AS e 

--INNER JOIN Employees AS m ON e.mgrid = m.empid 

--WHERE 

--mgrlastname = N'Fuller'; 

 

--Copy the existing T-SQL statement from task 2 and modify it so that the result will return all employees 
--and be ordered by the manager’s first name. Try first to use the source column name, and then try to use 
--the alias column name.  

SELECT 

e.EmployeeID, e.lastname, e.firstname, e.title, e.reportsto,

m.lastname AS mgrlastname, m.firstname AS mgrfirstname 

FROM Employees AS e 

INNER JOIN Employees AS m ON e.reportsto = m.EmployeeID 

order by 
	mgrfirstname



--Execute the written statement and compare the results that you got with the recommended results shown in
--the file 64 - Lab Exercise 2 - Task 3 Result.txt. 

--Why were you able to use a source column name or an alias column name?  

--Results: After this exercise, you should know how to use an ORDER BY clause. 