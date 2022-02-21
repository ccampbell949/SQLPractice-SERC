----------------------------------------------------------------------- 

-- Exercise 1 

--------------------------------------------------------------------- 

 

USE northwnd; 

GO 

 

--------------------------------------------------------------------- 

-- Task 1 

--  

-- 

-- Execute the provided T-SQL code to create the stored procedure Sales.GetTopCustomers. 

-- 

-- Write a T-SQL statement to execute the created procedure. 

-- 

-- Execute the T-SQL statement and compare the results that you got with the desired results shown in the file 52 - Lab Exercise 1 - Task 1 Result.txt.  

--------------------------------------------------------------------- 

 

CREATE PROCEDURE GetTopCustomers AS 

SELECT TOP(10) 

c.customerid, 

c.contactname, 

SUM(o.Freight) AS salesvalue 

FROM Orders AS o 

INNER JOIN Customers AS c ON c.customerid = o.customerid 

GROUP BY c.customerid, c.contactname 

ORDER BY salesvalue DESC; 

EXECUTE GetTopCustomers;	

GO 



--------------------------------------------------------------------- 

-- Task 2 

--  

-- The IT department has changed the stored procedure from task 1 and has supplied you with T-SQL code to apply 
--the needed changes. Execute the provided T-SQL code. 

-- 

-- Write a T-SQL statement to execute the modified stored procedure. 

-- 

-- Execute the T-SQL statement and compare the results that you got with the desired results shown in the file 53 - Lab Exercise 1 - Task 2 Result.txt.  

-- 

-- What is the difference between the previous T-SQL code and this one? 
		--same output. The second code uses offset, whereas the first one uses TOP
-- 

-- If some applications are using the stored procedure from task 1, would they still work properly after the changes you have applied in task 2?  

--------------------------------------------------------------------- 

 

ALTER PROCEDURE GetTopCustomers AS 

SELECT  

c.CustomerID, 

c.contactname, 

SUM(o.freight) AS salesvalue 

FROM Orders AS o 

INNER JOIN Customers AS c ON c.customerid = o.customerid 

GROUP BY c.customerid, c.contactname 

ORDER BY salesvalue DESC 

OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY; 

EXECUTE GetTopCustomers;	


GO 

 