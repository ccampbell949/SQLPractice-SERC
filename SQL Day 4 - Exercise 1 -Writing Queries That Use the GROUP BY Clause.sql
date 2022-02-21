--Exercise 1: Writing Queries That Use the GROUP BY Clause  

--Scenario  

--The sales department would like to create additional up-sell opportunities from existing customers. The staff needs to analyze
--different groups of customers and product categories, depending on several business rules. Based on these rules, you will write
--the SELECT statements to retrieve the needed rows from the Customers table.  

--The main tasks for this exercise are as follows:  

--Write a SELECT statement to retrieve different groups of customers for the specific sales employee.   

--Write a SELECT statement to retrieve groups of customers for the specific order year.   

--Write a SELECT statement to retrieve the sales category groups for the specific year.   

--Task 1: Write a SELECT statement to retrieve different groups of customers  

--Write a SELECT statement that will return groups of customers that made a purchase. The SELECT clause should include the custid
--column from the Orders table and the contactname column from the Customers table. Group by both columns and filter only the orders 
--from the sales employee whose empid equals five.  



select o.CustomerID, c.contactname
from orders as o inner join Customers as c
on c.customerid = o.customerid
where o.employeeid = '5'
group by o.customerid, c.contactname



--Execute the written statement and compare the results that you got with the desired results shown in the file 52 - Lab Exercise
--1 - Task 1 Result.txt.  

--Task 2: Add an additional column from the Customers table  

--Copy the T-SQL statement in task 1 and modify it to include the city column from the Customers table in the SELECT clause.  

select o.CustomerID, c.contactname, c.City
from orders as o inner join Customers as c
on c.customerid = o.customerid
where o.employeeid = '5'
group by o.customerid, c.contactname


--Execute the query.  

--You will get an error. What is the error message? Why?  
--Column 'Customers.City' is invalid in the select list because it is not contained in either an aggregate function or the GROUP BY clause.

--error is due to the city column not being included in the group by


--Correct the query so that it will execute properly.  


select o.CustomerID, c.contactname, c.City
from orders as o inner join Customers as c
on c.customerid = o.customerid
where o.employeeid = '5'
group by o.customerid, c.contactname, c.city

--Execute the query and compare the results that you got with the desired results shown in the file 53 - Lab Exercise 1 - Task 2 
--Result.txt.  

--Task 3: Write a SELECT statement to retrieve the customers with orders for each year  

--Write a SELECT statement that will return groups of rows based on the custid column and a calculated column orderyear representing 
--the order year based on the orderdate column from the Orders table. Filter the results to include only the orders from the sales
--employee whose empid equals five.  


select customerid, year(orderdate) as orderyear
from Orders
where employeeid = '5'
group by customerid, year(orderdate)
order by customerid, orderyear



--Execute the written statement and compare the results that you got with the desired results shown in the file 54 - Lab Exercise 1 -
--Task 3 Result.txt.  

 

--Task 4: Write a SELECT statement to retrieve groups of product categories sold in a specific year  

--Write a SELECT statement to retrieve groups of rows based on the categoryname column in the Production.Categories table. Filter the 
--results to include only the product categories that were ordered in the year 2008.  

select c.CategoryID, c.categoryname --need to go through different tables which have linking information, orderid etc
from orders as o 
inner join [order details] as od on o.OrderID = od.OrderID
inner join products as p on od.productid = p.productid
inner join categories as c on c.categoryid = p.categoryid
where year(orderdate) = '2008' --alt: where orderdate >='20080101' AND orderdate < '20090101'
group by c.categoryid, c.categoryname



--Execute the written statement and compare the results that you got with the desired results shown in the file 55 - Lab Exercise 1 - 
--Task 4 Result.txt.  

--Results: After this exercise, you should be able to use the GROUP BY clause in the T-SQL statement.  