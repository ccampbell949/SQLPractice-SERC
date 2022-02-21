--Task 1: Execute the T-SQL statement  

--The developer has written this query:  

SELECT 

   custid, contactname, orderid 

FROM Customers 

INNER join Orders ON Customers.custid = Orders.custid; 

 

--Execute the query exactly as written inside a query window and observe the result.  

--You get an error. What is the error message? Why do you think you got this error?
--Invalid column name - should be Customer ID and need aliase

--Answer - doesnt know where it's getting customers from. Need to use aliases



--Task 2: Apply the needed changes and execute the T-SQL statement  

--Notice that there are full source table names written as table aliases.  

--Apply the needed changes to the SELECT statement so that it will run without an error. 

SELECT 

   customerID, contactname, orderid 

FROM Customers

INNER join Orders as o ON c.CustomerID = o.CustomerID; 


--Test the changes by executing the T-SQL statement.  

--Copy the T-SQL statement from task 2 and modify it to use the table aliases “C” for the 
--Sales.Custumers table and “O” for the Sales.Orders table.  


SELECT 

   c.CustomerID, c.contactname, o.orderid 

FROM Customers as c

INNER join Orders as o ON c.CustomerID = o.CustomerID 





--Execute the written statement and compare the results with the results in task 2.  

--Change the prefix of the columns in the SELECT statement with full source table names and execute the statement.  

--You get an error. Why? 

--Change the SELECT statement to use the table aliases written at the beginning of the task.  


 --SELECT 

--   custid, contactname, orderid 

--FROM Customers 

--INNER join Orders ON Customers.custid = Orders.custid; 

  

----  Task 4: Add an additional table and columns  

----Copy the T-SQL statement from task 3 and modify it to include three additional columns from the 
--OrderDetails table: productid, qty, and unitprice.  

SELECT 

   c.CustomerID, c.contactname, o.orderid, od.ProductID, od.Quantity, od.UnitPrice 

FROM Customers as c

INNER join Orders as o ON c.CustomerID = o.CustomerID 
Inner join [Order Details] od on o.OrderID = od.OrderID


----Execute the written statement and compare the results that you got with the 
--recommended results shown in the file 63 - Lab Exercise 2 - Task 4 Result.txt.  