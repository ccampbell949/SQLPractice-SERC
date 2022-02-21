--Exercise 3: Writing Queries That Use Correlated Subqueries and an EXISTS Predicate  

--Scenario  

--The sales department would like to have some additional reports to display different analyses
--of existing customers. Because the requests are complex, you will need to use correlated subqueries.  

--The main tasks for this exercise are as follows:  

--Write a SELECT statement to return the last order date for each customer. 
 

--Write a SELECT statement to display customers without an order using a correlated subquery. 
 

--Write an advanced T-SQL statement to retrieve running aggregates. 
 

--Task 1: Write a SELECT statement to retrieve the last order date for each customer  

--Write a SELECT statement to retrieve the custid and contactname columns from the Customers table. 
--Add a calculated column named lastorderdate that contains the last order date from the Orders 
--table for each customer. (Hint: You have to use a correlated subquery.)  

select c.customerid, c.contactname, 
(select max(o.orderdate) from orders as o where) as lastorderdate		--instead of writing column name,it is a calculated
from customers as c														--column name (like mathematics)


--Execute the written statement and compare the results that you got with the recommended results 
--shown in the file 72 - Lab Exercise 3 - Task 1 Result.txt.  

--Task 2: Write a SELECT statement that uses the EXISTS predicate to retrieve those customers without 
--orders  

--Write a SELECT statement to retrieve all customers that do not have any orders in the Orders table, 
--similar to the request in exercise 2, task 3. However, this time use the EXISTS predicate to filter
--the results to include only those customers without an order. Also, you do not need to explicitly 
--check that the custid column in the Orders table is not NULL.  


select c.customerid
from customers as c
where 
	not exists (select * from orders as o where c.customerid = o.customerid)--returning values where the sondition of customer 
																			--ids being equal does NOT exist



--Execute the written statement and compare the results that you got with the recommended results shown
--in the file 73 - Lab Exercise 3 - Task 2 Result.txt.  

--Why didn’t you need to check for a NULL?  
--the code only brings back results which do not match and so nulls will be included
 
--Task 3: Write a SELECT statement to retrieve customers that bought expensive products  

--Write a SELECT statement to retrieve the custid and contactname columns from the Customers table. 
--Filter the results to include only customers that placed an order on or after April 1, 2008, and 
--ordered a product with a price higher than $100.  

select customerid, contactname
from customers as c
where exists (select * from orders as o 
				inner join [Order Details] as d on d.orderid = o.orderid
				where o.customerid = c.customerid
				and o.orderdate >= '1998041' 
				and d.unitprice > 100)


--Execute the written statement and compare the results that you got with the recommended results shown
--in the file 74 - Lab Exercise 3 - Task 3 Result.txt.  

--Task 4 (challenge): Write a SELECT statement to display the total sales amount and the running total
--sales amount for each order year  

--Running aggregates are aggregates that accumulate values over time. Write a SELECT statement to retrieve
--the following information for each year:  

--The order year  

--The total sales amount  

--The running total sales amount over the years. That is, for each year, return the sum of sales amount
--up to that year. So, for example, for the earliest year (2006) return the total sales amount, for the
--next year (2007), return the sum of the total sales amount for the previous year and the year 2007.  

--The orderyear, representing the order year. This column should be based on the orderyear column  

--SELECT statement should have three calculated columns: from the Orders table.  

--totalsales, representing the total sales amount for each year. This column should be based on the qty 
--and unitprice columns from the OrderDetails table.  

--runsales, representing the running sales amount. This column should use a correlated subquery.  

SELECT
	YEAR(o.orderdate) as orderyear, 
	SUM(d.quantity * d.unitprice) AS totalsales,
	(
		SELECT SUM(d2.quantity * d2.unitprice)
		FROM Orders AS o2
		INNER JOIN OrderDetails AS d2 ON d2.orderid = o2.orderid
		WHERE YEAR(o2.orderdate) <= YEAR(o.orderdate)
	) AS runsales
FROM Orders AS o
INNER JOIN OrderDetails AS d ON d.orderid = o.orderid
GROUP BY YEAR(o.orderdate)
ORDER BY orderyear;


--Execute the T-SQL code and compare the results that you got with the recommended results shown in the
--file 75 - Lab Exercise 3 - Task 4 Result.txt.  

--Task 5: Clean the Customers table  

--Delete the row added in exercise 2 using the provided SQL statement:  

--Execute this query exactly as written inside a query window.  

   

--DELETE Orders 

--WHERE custid IS NULL; 

  

--Results: After this exercise, you should have an understanding of how to use a correlated subquery in
--T- SQL statements.  

 