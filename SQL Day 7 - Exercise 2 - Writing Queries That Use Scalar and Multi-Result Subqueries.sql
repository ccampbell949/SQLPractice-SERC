--Exercise 2: Writing Queries That Use Scalar and Multi-Result Subqueries  

--Scenario  

--The marketing department would like to prepare materials for different groups of products 
--and customers based on historic sales information. You have to prepare different SELECT 
--statements that use a subquery in the WHERE clausuctre.  

--The main tasks for this exercise are as follows:  

--Write a SELECT statement to retrieve specific products.   

--Write a query and understand a three-valued predicate logic.   

--Task 1: Write a SELECT statement to retrieve specific products  

--Write a SELECT statement to retrieve the productid and productname columns from the Products table
--. Filter the results to include only products that were sold in high quantities (more than 100 products)
--for a specific order line.  


select productid, productname		
from products					
where productid in (select productid			--select productid which is in the condition within the brackets
					from [order details]		--select product ids from order details where quantity id over 100
					where quantity > 100)		--similar to linking primary keys


--Execute the written statement and compare the results that you got with the desired results shown
--in the file 62 - Lab Exercise 2 - Task 1 Result.txt.  

--Task 2: Write a SELECT statement to retrieve those customers without orders  

--Write a SELECT statement to retrieve the custid and contactname columns from the Customers table.
--Filter the results to include only those customers that do not have any placed orders.  

select customerid, contactname
from customers
where customerid not in (select customerid
							from orders)
							

--Execute the written statement and compare the results that you got with the recommended results
--shown in the file 63 - Lab Exercise 2 - Task 2 Result.txt. Remember the number of rows in the results.  

--Task 3: Add a row and rerun the query that retrieves those customers without orders 

--The IT department has written a T-SQL statement that inserts an additional row in the Orders 
--table. This row has a NULL in the custid column.  

--INSERT INTO Orders ( --customerid, employeeid, orderdate, requireddate, shippeddate, orderid, freight, shipname, shipaddress,  --shipcity, shipregion, shippostalcode, shipcountry) VALUES --(NULL, 1, '20111231', '20111231', '20111231', 1, 0, --'ShipOne', 'ShipAddress', 'ShipCity', 'RA', '1000', 'USA')  

--Execute this query exactly as written inside a query window.  

--Copy the T-SQL statement you wrote in task 2 and execute it.  


select customerid, contactname
from customers
where customerid in (select customerid
							from orders)

--Observe the result. How many rows are in the result? Why?  
--2 results

--Modify the T-SQL statement to retrieve the same number of rows as in task 2. (Hint: You have to
--remove the rows with an unknown value in the custid column.)  

select customerid, contactname
from customers
where customerid not in (select customerid
							from orders
							where customerid is null)

--Execute the modified statement and compare the results that you got with the recommended results
--shown in the file 64 - Lab Exercise 2 - Task 3 Result.txt. 

--Results: After this exercise, you should know how to use multi-result subqueries in T-SQL statements.  

 

--INSERT INTO Sales.Orders ( --custid, empid, orderdate, requireddate, shippeddate, shipperid, freight, shipname, shipaddress,  --shipcity, shipregion, shippostalcode, shipcountry) VALUES --(NULL, 1, '20111231', '20111231', '20111231', 1, 0, --'ShipOne', 'ShipAddress', 'ShipCity', 'RA', '1000', 'USA')  