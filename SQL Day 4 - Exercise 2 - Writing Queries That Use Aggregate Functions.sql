--Exercise 2: Writing Queries That Use Aggregate Functions  

--Scenario  

--The marketing department would like to launch a new campaign, so the staff needs to gain a better insight into the 
--existing customers’ buying behavior. You will have to create different sales reports based on the total and average 
--sales amount per year and per customer.  

--The main tasks for this exercise are as follows:  

--Write a SELECT statement to retrieve the total sales amount per order.   

--Write a SELECT statement to retrieve additional information about the order lines.   

--Write a SELECT statement to analyze all customers’ buying behavior.   

--Task 1: Write a SELECT statement to retrieve the total sales amount per order  

--Write a SELECT statement to retrieve the orderid column from the Sales.Orders table and the total sales
--amount per orderid. (Hint: Multiply the qty and unitprice columns from the OrderDetails table.) Use the 
--alias salesamount for the calculated column. Sort the result by the total sales amount in descending order.  


select o.orderid, sum(od.quantity*od.unitprice) as salesamount
from orders as o
inner join [Order Details] as od on o.orderid = od.orderid
group by o.orderid
order by salesamount desc

--Execute the written statement and compare the results that you got with the desired results shown in the
--file 62 - Lab Exercise 2 - Task 1 Result.txt.  

--Task 2: Add additional columns  

--Copy the T-SQL statement in task 1 and modify it to include the total number of order lines for each 
--order and the average order line sales amount value within the order. Use the aliases nooforderlines and 
--avgsalesamountperorderline, respectively.  

select o.orderid, 
	sum(od.quantity*od.unitprice) as salesamount,
	count(*) as nooforderlines,
	avg(od.quantity*od.unitprice) as avgsalesamountperprderline
from orders as o
inner join [Order Details] as od on o.orderid = od.orderid
group by o.orderid
order by salesamount desc

--Execute the written statement and compare the results that you got with the recommended results shown in
--the file 63 - Lab Exercise 2 - Task 2 Result.txt.  

--Task 3: Write a SELECT statement to retrieve the sales amount value per month  

--Write a select statement to retrieve the total sales amount for each month. The SELECT clause should
--include a calculated column named yearmonthno (YYYYMM notation) based on the orderdate column in the 
--Orders table and a total sales amount (multiply the qty and unitprice columns from the OrderDetails 
--table). Order the result by the yearmonthno calculated column.  

select year(o.orderdate)*100 + month(OrderDate) as yearmonthno, sum(od.quantity*od.unitprice) as totalsales
from orders as o
inner join [Order Details] as od on o.orderid = od.orderid
group by year(o.orderdate), month(orderdate)
order by yearmonthno;


--Execute the written statement and compare the results that you got with the recommended result shown 
--in the file 64 - Lab Exercise 2 - Task 3 Result.txt.  

--Task 4: Write a SELECT statement to list all customers with the total sales amount and number of order
--lines added  

--Write a select statement to retrieve all the customers (including those that did not place any orders)
--and their total sales amount, maximum sales amount per order line, and number of order lines.  
--The SELECT clause should include the custid and contactname columns from the Customers table and four 
--calculated columns based on appropriate aggregate functions:  
--totalsalesamount, representing the total sales amount per order  
--maxsalesamountperorderline, representing the maximum sales amount per order line  
--numberofrows, representing the number of rows (use * in the COUNT function)  
--numberoforderlines, representing the number of order lines (use the orderid column in the COUNT function)  
--Order the result by the totalsalesamount column.  

select c.CustomerID. c.ContactName, sum(d.quantity*d.unitprice) as totalsales
MAX(d.quantity*d.unitprice) as maxsalesamountperorderline,
COUNT(*) as numberofrows,
COUNT(o.orderid) as numberorderlines
from Customers as c
LEFT outer join orders as o on o.customerid = c.customerid
LEFT outer join [order details] as d on d.orderid = o.orderid
group by c.customerid, c.contactname
order by totalsalesamount;

SELECT 
	c.CustomerID, c.contactname, 
	SUM(d.qty * d.unitprice) AS totalsalesamount,
	MAX(d.qty * d.unitprice) AS maxsalesamountperorderline, 
	COUNT(*) AS numberofrows,
	COUNT(o.orderid) AS numberoforderlines
FROM Customers AS c
LEFT OUTER JOIN Orders AS o ON o.CustomerID = c.CustomerID
LEFT OUTER JOIN OrderDetails AS d ON d.orderid = o.orderid
GROUP BY c.CustomerID, c.contactname
ORDER BY totalsalesamount;




--Execute the written statement and compare the results that you got with the recommended results shown in 
--the file 65 - Lab Exercise 2 - Task 4 Result.txt.  

--Notice that the custid 22 and 57 rows have a NULL in the columns with the SUM and MAX aggregate functions. 
--What are their values in the COUNT columns? Why are they different?  

--Results: After this exercise, you should know how to use aggregate functions