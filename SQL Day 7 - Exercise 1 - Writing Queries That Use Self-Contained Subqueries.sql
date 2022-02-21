--Exercise 1: Writing Queries That Use Self-Contained Subqueries  

--Scenario  

--The sales department needs some advanced reports to analyze sales orders. You will write
--different SELECT statements that use self-contained subqueries.  

--The main tasks for this exercise are as follows:  

--Write a couple of SELECT statements using a self-contained subquery in the WHERE clause.  

--Observe the SELECT statement provided by the IT department. 
 

--Write a SELECT statement to analyze each sales order against the monthly sales value. 
 

--Task 1: Write a SELECT statement to retrieve the last order date  

--Write a SELECT statement to return the maximum order date from the table Orders. 

select max(orderdate)
from orders


--Execute the written statement and compare the results that you got with the desired results
--shown in the file 52 - Lab Exercise 1 - Task 1 Result.txt.  

--Task 2: Write a SELECT statement to retrieve all orders on the last order date  

--Write a SELECT statement to return the orderid, orderdate, empid, and custid columns from the 
--Orders table. Filter the results to include only orders where the date order equals the last 
--order date. (Hint: Use the query in task 1 as a self-contained subquery.)  


select orderid, orderdate, employeeid, customerid
from orders
where orderdate = (select max(orderdate) from orders)


--Execute the written statement and compare the results that you got with the desired results
--shown in the file 53 - Lab Exercise 1 - Task 2 Result.txt.  

--Task 3: Observe the T-SQL statement provided by the IT department  

--The IT department has written a T-SQL statement that retrieves the orders for all customers whose  

--contact name starts with a letter I:  

 

SELECT 

   orderid, orderdate, employeeid, customerid 

FROM Orders 

WHERE 

customerid = (  

SELECT customerid 

FROM Customers 

WHERE contactname LIKE N'I%' 

);  

--Execute the query and observe the result.  

--Modify the query to filter customers whose contact name starts with a letter B.  


SELECT 

   orderid, orderdate, employeeid, customerid

FROM Orders 

WHERE 

customerid = (  

SELECT customerid 

FROM Customers 

WHERE contactname LIKE N'B%' 

);  



--Execute the query. What happened? What is the error message? Why did the query fail?  

--Apply the needed changes to the T-SQL statement so that it will run without an error.  

--Execute the written statement and compare the results that you got with the desired results 
--shown in the file 54 - Lab Exercise 1 - Task 3 Result.txt.  

 

--Task 4: Write a SELECT statement to analyze each order’s sales as a percentage of the total sales
--amount  

--Write a SELECT statement to retrieve the orderid column from the Orders table and the following
--calculated columns:  

--totalsalesamount (based on the qty and unitprice columns in the OrderDetails table)  

--salespctoftotal (percentage of the total sales amount for each order divided by the total sales
--amount for all orders in a specific period)  

--Filter the results to include only orders placed in May 2008.  

--Execute the written statement and compare the results that you got with the desired results shown 
--in the file 55 - Lab Exercise 1 - Task 4 Result.txt.  

--Results: After this exercise, you should be able to use self-contained subqueries in T-SQL statements.  

 

 