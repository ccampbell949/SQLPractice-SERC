 

--Exercise 3: Writing Queries That Filter Data Using the TOP Option  

--Scenario  

--The Sales department would like to have some additional reports that show the last 
--invoiced orders and the top 10 percent of the most expensive products being sold.  

--The main tasks for this exercise are as follows:  

--Write a SELECT statement that will return the last 20 orders based on order date.   

--Write a SELECT statement that will return the top 10 percent of products based on unit price.   

--Task 1: Write a SELECT statement to retrieve the last 20 orders  

--Write a SELECT statement against the Orders table and retrieve the orderid and orderdate 
--columns. Retrieve the last 20 orders, based on orderdate ordering. 


select top 20
	orderid, orderdate
from orders
order by orderdate desc



--Execute the written statement and compare the results that you got with the recommended 
--results shown in the file 72 - Lab Exercise 3 - Task 1 Result.txt.  

--Task 2: Use the OFFSET-FETCH clause to implement the same task  

--Write a SELECT statement to retrieve the same result as in task 1, but use the OFFSET-FETCH clause.  

select
	orderid, orderdate
from orders
order by orderdate desc
offset 0 rows fetch first 20 rows only


--Execute the written statement and compare the results that you got with the results from task 1.  

--Task 3: Write a SELECT statement to retrieve the most expensive products  

--Write a SELECT statement to retrieve the productname and unitprice columns from the 
--Production.Products table.  


select
	productname, unitprice
from
	products

--Execute the T-SQL statement and notice the number of the rows returned.  

--Modify the SELECT statement to include only the top 10 percent of products based on unitprice
--ordering.  

select top 10 percent
	productname, unitprice
from
	products
order by unitprice desc

--Execute the written statement and compare the results that you got with the recommended results
--shown in the file 73 - Lab Exercise 3 - Task 2 Result.txt. Notice the number of rows returned.  

--Is it possible to implement this task with the OFFSET-FETCH clause?   

select
	productname, unitprice
from
	products
order by unitprice desc
offset 0 rows fetch first 7 rows only



--Results: After this exercise, you should have an understanding of how to apply the TOP option 
--in the SELECT clause of a T-SQL statement.  