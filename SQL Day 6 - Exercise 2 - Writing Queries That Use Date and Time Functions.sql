--Exercise 2: Writing Queries That Use Date and Time Functions  

--Scenario  

--The sales department would like to have different reports that focus on data during specific 
--time frames. The sales staff would like to analyze distinct customers, distinct products, and
--orders placed near the end of the month. You will have to write the SELECT statements using
--the different date and time functions.  

--The main tasks for this exercise are as follows:  

--Write a SELECT statement to retrieve all distinct customers that placed an order in February  --2008.   

--Write a SELECT statement to retrieve all orders placed in last five days of the month.   

--Write a SELECT statement to show all distinct products being sold in the first 10 weeks of  --the year 2007.   

--Analyze and correct the query.   

--Task 1: Write a SELECT statement to retrieve all distinct customers  

--Write a SELECT statement to retrieve distinct values for the custid column from the Orders table.
--Filter the results to include only orders placed in February 2008.  

select distinct(customerid), orderdate
from orders
where datename(month, orderdate) = 'February' and year(orderdate) = '1998'

--Execute the written statement and compare the results that you got with the desired results shown 
--in the file 62 - Lab Exercise 2 - Task 1 Result.txt.  

--Task 2: Write a SELECT statement to calculate the first and last day of the month  

--Write a SELECT statement with these columns:  

--Current date and time  

--First date of the current month  

--Last date of the current month  


select 
	current_timestamp as [Curent Date and Time],
	DATEADD(day, -day(current_timestamp) + 1, current_timestamp) as firstday,
	Eomonth(current_timestamp) as lastday,
	DATEADD(day, day(current_timestamp), current_timestamp) as lasttdayalt;


	
--Execute the written statement and compare the results that you got with the recommended result shown 
--in the file 63 - Lab Exercise 2 - Task 2 Result.txt.  

 
--Task 3: Write a SELECT statement to retrieve the orders placed in the last five days of the ordered
--month  

--Write a SELECT statement against the Orders table and retrieve the orderid, custid, and orderdate 
--columns. Filter the results to include only orders placed in the last five days of the order month.  

--Execute the written statement and compare the results that you got with the recommended results shown in
--the file 64 - Lab Exercise 2 - Task 3 Result.txt.  

 
select orderid, customerid, orderdate
 from orders
 where datediff(day, orderdate, eomonth(OrderDate)) < 5;


--Task 4: Write a SELECT statement to retrieve all distinct products sold in the first 10 weeks of the year
--2007  

--Write a SELECT statement against the Orders and OrderDetails tables and retrieve all the distinct values 
--for the productid column. Filter the results to include only orders placed in the first 10 weeks of the 
--year 2007.  

select 
	distinct(od.productid)
	from [order details] as od 
	join orders as o on o.orderid = od.orderid
	where datepart(week, orderdate) <= 10 
	AND datepart(year, orderdate) = '1997';	--2007 returns no results


--Execute the written statement and compare the results that you got with the recommended results shown in 
--the file 65 - Lab Exercise 2 - Task 4 Result.txt.  

--Results: After this exercise, you should know how to use the date and time functions.  