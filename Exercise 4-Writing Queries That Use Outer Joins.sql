--Exercise 4: Writing Queries That Use Outer Joins  

--Scenario  

--The sales department was satisfied with the report you produced in exercise 2. Now the sales staff 
--would like to change the report to show all customers, even if they did not have any orders, and still 
--include the information about the orders for the customers that did place orders. You need to write a 
--SELECT statement to retrieve all rows from Customers (columns custid and contactname) and the orderid 
--column from the table Orders.  

--The main task for this exercise is as follows:  

--Write a SELECT statement using an outer join to retrieve the needed columns.  

--Task 1: Write a SELECT statement that uses an outer join  

--Write a SELECT statement to retrieve the custid and contactname columns from the Customers table
--and the orderid column from the Orders table. The statement should retrieve all rows from the Customers table.  

Select c.CustomerID, c.companyname, c.contactname, o.orderid
from Customers as c left OUTER JOIN Orders as o
on c.customerID = o.CustomerID

SELECT 
	c.customerID, c.contactname, o.orderid
FROM Customers AS c
LEFT OUTER JOIN Orders AS o ON c.customerID = o.customerID;

--Execute the written statement and compare the results that you got with the recommended results 
--shown in the file 82 - Lab Exercise 4 - Task 1 Result.txt.  

--Notice the values in the column orderid. Are there any missing values (marked as NULL)? Why?  

--there are no null values 
  
--Results: After this exercise, you should have a basic understanding of how to write T-SQL statements
--that use outer joins.  

 