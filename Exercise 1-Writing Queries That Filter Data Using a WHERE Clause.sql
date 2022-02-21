--Task 1: Write a SELECT statement that uses a WHERE clause  

--Write a SELECT statement that will return the custid, companyname, contactname,
--address, city, country, and phone columns from the Customers table.  

select customerid, companyname, contactname, address, city, country, phone
from Customers


--Filter the results to include only the customers from the country Brazil. 

select customerid, companyname, contactname, address, city, country, phone
from Customers
where Country = 'brazil'
--Execute the written statement and compare the results that you got with the desired results 
--shown in the file 52 - Lab Exercise 1 - Task 1 Result.txt


--Task 2: Write a SELECT statement that uses an IN predicate in the WHERE clause  

--Write a SELECT statement that will return the custid, companyname, contactname, address, city, country, and 
--phone columns from the Customers table. Filter the results to include only customers from the countries Brazil, 
--UK, and USA.  

select customerid, companyname, contactname, address, city, country, phone
from Customers
where Country = 'brazil' OR country = 'usa' OR country = 'uk';

--Execute the written statement and compare the results that you got with the desired results shown in the file 53 -
--Lab Exercise 1 - Task 2 Result.txt.  


--Task 3: Write a SELECT statement that uses a LIKE predicate in the WHERE clause  

--Write a SELECT statement that will return the custid, companyname, contactname, address,
--city, country, and phone columns from the Customers table. Filter the results to include 
--only the customers with a contact name starting with the letter A.  

select customerid, companyname, contactname, address, city, country, phone
from Customers
where ContactName like 'a%'

--Execute the written statement and compare the results that you got with the desired results
--shown in the file 54 - Lab Exercise 1 - Task 3 Result.txt. 



--Task 4: Observe the T-SQL statement provided by the IT department  

--The IT department has written a T-SQL statement that retrieves the custid and companyname columns from 
--the Customers table and the orderid column from the Orders table: 

SELECT 

   c.customerid, c.companyname, o.orderid 

FROM Customers AS c LEFT OUTER JOIN Orders AS o ON c.customerid = o.customerid AND c.city = 'Paris';  

--Execute the query. Notice two things. First, the query retrieves all the rows from the Customers table. 
--Second, there is a comparison operator in the ON clause specifying that the city column should be equal to
--the value “Paris”.  

--Copy the provided T-SQL statement and modify it to have a comparison operator for the city column in the WHERE 
--clause. Execute the query.  

SELECT 

   c.customerid, c.companyname, o.orderid 

FROM Customers AS c LEFT OUTER JOIN Orders AS o ON c.customerid = o.customerid
where c.city = 'Paris';  

--Compare the results that you got with the desired results shown in the file 55 - Lab Exercise 1 - Task 4 Result.txt.  

--Is the result the same as in the first T-SQL statement? Why? What is the difference between specifying the predicate in
--the ON clause and in the WHERE clause?

--The second method returns fewer results. The reason for this is ??



--Task 5: Write a SELECT statement to retrieve those customers without orders  

--Write a T-SQL statement to retrieve customers from the Customers table that do not --have matching orders in the Orders table. Matching customers with orders is based on
--a comparison between the customer’s custid value and the order’s custid value. Retrieve
--the custid and companyname columns from the Customers table. (Hint: Use a T-SQL statement
--that is similar to the one in the previous task.)  

SELECT 

   c.customerid, c.companyname, o.orderid 

FROM Customers AS c LEFT OUTER JOIN Orders AS o ON c.customerid = o.customerid



--Execute the written statement and compare the results that you got with the desired results
--shown in the file 56 - Lab Exercise 1 - Task 5 Result.txt.  

 

--Results: After this exercise, you should be able to filter rows of data from one or more
--tables by using WHERE predicates with logical operators.