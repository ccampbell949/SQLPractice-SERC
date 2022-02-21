--Exercise 3: Writing Queries That Use Distinct Aggregate Functions  

--Scenario  

--The marketing department would like to have some additional reports that display the number of customers that made
--any order in the specific period of time and the number of customers based on the first letter in the contact name.  

--The main tasks for this exercise are as follows:  

--Modify a SELECT statement to display the number of distinct customers for each order year.   

--Write a SELECT statement to retrieve the number of customers based on first letter of the contact name.   

--Write a SELECT statement to retrieve additional sales statistics.   

--Task 1: Modify a SELECT statement to retrieve the number of customers  

--A junior analyst prepared a T-SQL statement to retrieve the number of orders and the number of customers for each order
--year. Observe the provided T-SQL statement and execute it:  

SELECT 

   YEAR(orderdate) AS orderyear, 

   COUNT(orderid) AS nooforders, 

   COUNT(customerid) AS noofcustomers 

FROM Sales.Orders 

GROUP BY YEAR(orderdate); 
 

--Observe the results. Notice that the number of orders is the same as the number of customers. Why?  

--Correct the T-SQL statement to show the correct number of customers that placed an order for each year.  


SELECT
	YEAR(orderdate) AS orderyear, 
	COUNT(orderid) AS nooforders, 
	COUNT(DISTINCT CustomerID) AS noofcustomers
FROM Orders 
GROUP BY YEAR(orderdate);


--Execute the written statement and compare the results that you got with the recommended results shown in the
--file 72 - Lab Exercise 3 - Task 1 Result.txt.  

--Task 2: Write a SELECT statement to analyze segments of customers  

--Write a SELECT statement to retrieve the number of customers based on the first letter of the values in the 
--contactname column from the Customers table. Add an addition al column to show the total number of orders placed 
--by each group of customers. Use the aliases firstletter, noofcustomers and nooforders. Order the result by the firstletter 
--column.  


SELECT
	SUBSTRING(c.contactname,1,1) AS firstletter,
	COUNT(DISTINCT c.CustomerID) AS noofcustomers, 
	COUNT(o.orderid) AS nooforders
FROM Customers AS c
LEFT OUTER JOIN Orders AS o ON o.CustomerID = c.CustomerID
GROUP BY SUBSTRING(c.contactname,1,1)
ORDER BY firstletter;

--Execute the written statement and compare the results that you got with the recommended results shown in the
--file 73 - Lab Exercise 3 - Task 2 Result.txt.  

 
 --Task 3: Write a SELECT statement to retrieve additional sales statistics  

--Copy the T-SQL statement in exercise 1, task 4, and modify to include the following information about
--for each product category: total sales amount, number of orders, and average sales amount per order. 
--Use the aliases totalsalesamount, nooforders, and avgsalesamountperorder, respectively.  

SELECT
	c.categoryid, c.categoryname, 
	SUM(d.quantity * d.unitprice) AS totalsalesamount, 
	COUNT(DISTINCT o.orderid) AS nooforders,
	SUM(d.quantity * d.unitprice) / COUNT(DISTINCT o.orderid) AS avgsalesamountperorder
FROM Orders AS o
INNER JOIN [Order Details] AS d ON d.orderid = o.orderid
INNER JOIN Products AS p ON p.productid = d.productid
INNER JOIN Categories AS c ON c.categoryid = p.categoryid
WHERE orderdate >= '19980101' AND orderdate < '19990101'
GROUP BY c.categoryid, c.categoryname;

--Execute the written statement and compare the results that you got with the recommended results shown 
--in the file 74 - Lab Exercise 3 - Task 3 Result.txt.  

--Results: After this exercise, you should have an understanding of how to apply a DISTINCT aggregate
--function.  

 