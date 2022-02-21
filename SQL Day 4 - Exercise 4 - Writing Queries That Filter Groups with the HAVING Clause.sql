--Exercise 4: Writing Queries That Filter Groups with the HAVING Clause  

--Scenario  

--The sales and marketing departments were satisfied with the reports you provided to analyze customers’ 
--behavior. Now they would like to have the results filtered based on the total sales amount and number of 
--orders. So, in the last exercise, you will learn how to filter the result based on aggregated functions 
--and learn when to use the WHERE and HAVING clauses.  

--The main tasks for this exercise are as follows:  

--Write a SELECT statement to retrieve the top 10 customers that spent more than$10,000.   

--Write a SELECT statement to retrieve specific orders based on different predicate logic.   

--Write a SELECT statement to retrieve all customers that placed a specific number of orders and the --last order date.   

--Task 1: Write a SELECT statement to retrieve the top 10 customers  

--Write a SELECT statement to retrieve the top 10 customers by total sales amount that spent more than 
--$10,000 in terms of sales amount. Display the custid column from the Orders table and a calculated 
--column that contains the total sales amount based on the qty and unitprice columns from the OrderDetails
--table. Use the alias totalsalesamount for the calculated column.  

SELECT TOP (10) 
	o.CustomerID, 
	SUM(d.qty * d.unitprice) AS totalsalesamount 
FROM Orders AS o
INNER JOIN OrderDetails AS d ON d.orderid = o.orderid
GROUP BY o.CustomerID
HAVING SUM(d.qty * d.unitprice) > 10000
ORDER BY totalsalesamount DESC;

--Execute the written statement and compare the results that you got with the recommended results shown
--in the file 82 - Lab Exercise 4 - Task 1 Result.txt.  

--Task 2: Write a SELECT statement to retrieve specific orders  

--Write a SELECT statement against the Orders and OrderDetails tables and display the empid column and 
--a calculated column representing the total sales amount. Filter the results to group only the rows 
--with an order year 2008.  


SELECT
	o.orderid,
	o.EmployeeID,
	SUM(d.qty * d.unitprice) as totalsalesamount
FROM Orders AS o
INNER JOIN OrderDetails AS d ON d.orderid = o.orderid
WHERE o.orderdate >= '20080101' AND o.orderdate < '20090101'
GROUP BY o.orderid, o.EmployeeID;


--Execute the written statement and compare the results that you got with the recommended results shown
--in the file 83 - Lab Exercise 4 - Task 2 Result.txt.  

--Page Break
 

--Task 3: Apply additional filtering  

--Copy the T-SQL statement in task 2 and modify it to apply an additional filter to retrieve only the
--rows that have a sales amount higher than $10,000.  


-- add having clause
SELECT
	o.orderid,
	o.EmployeeID,
	SUM(d.qty * d.unitprice) as totalsalesamount
FROM Orders AS o
INNER JOIN OrderDetails AS d ON d.orderid = o.orderid
WHERE o.orderdate >= '20080101' AND o.orderdate < '20090101'
GROUP BY o.orderid, o.EmployeeID
HAVING SUM(d.qty * d.unitprice) >= 10000;



--Execute the written statement and compare the results that you got with the recommended results shown
--in the file 84 - Lab Exercise 4 - Task 3_1 Result.txt.  

--Apply an additional filter to show only employees with empid equal number 3.  

-- add predicate
SELECT
	o.orderid,
	o.EmployeeID,
	SUM(d.qty * d.unitprice) as totalsalesamount
FROM Orders AS o
INNER JOIN OrderDetails AS d ON d.orderid = o.orderid
WHERE 
	o.orderdate >= '20080101' AND o.orderdate <= '20090101'
	AND o.EmployeeID = 3
GROUP BY o.orderid, o.EmployeeID
HAVING SUM(d.qty * d.unitprice) >= 10000;


--Execute the written statement and compare the results that you got with the recommended results shown
--in the file 85 - Lab Exercise 4 - Task 3_2 Result.txt.  

--Did you apply the predicate logic in the WHERE clause or the HAVING clause? Which do you think is 
--better? Why?  

--no real difference in resultys - only difference is how the selct statement is logocally processed having is 4th, 
--select is 5th
--difference is in logical order
 

--Task 4: Retrieve the customers with more than 25 orders  

--Write a SELECT statement to retrieve all customers who placed more than 25 orders and add information 
--about the date of the last order and the total sales amount. Display the custid column from the Orders 
--table and two calculated columns: lastorderdate based on the orderdate column and totalsalesamount 
--based on the qty and unitprice columns in the OrderDetails table.  

SELECT
	o.CustomerID, 
	MAX(orderdate) AS lastorderdate, 
	SUM(d.quantity * d.unitprice) AS totalsalesamount
FROM Orders AS o
INNER JOIN [Order Details] AS d ON d.orderid = o.orderid
GROUP BY o.CustomerID 
HAVING COUNT(DISTINCT o.orderid) > 25;

--Execute the written statement and compare the results that you got with the recommended result shown 
--in the file 86 - Lab Exercise 4 - Task 4 Result.txt.  

--Results: After this exercise, you should have an understanding of how to use the HAVING clause.