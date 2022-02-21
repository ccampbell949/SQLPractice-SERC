--Exercise 3: Writing Queries That Test for Nullability  

--Scenario  

--The sales department would like to have additional segmentation of customers. Some columns that you 
--should retrieve contain missing values, and you will have to change the NULL to some more meaningful
--information for the business users.  

--The main tasks for this exercise are as follows:  

--Write a SELECT statement that will retrieve the customer fax information. 
 

--Write a SELECT statement that will return all the customers that do not have a two-character abbreviation for the region. 
 

--Task 1: Write a SELECT statement to retrieve the customer fax information  

--Write a SELECT statement to retrieve the contactname and fax columns from the Customers table. If there 
--is a missing value in the fax column, return the value ‘No information’.  

select contactname, coalesce(fax, 'no information')
from customers;

--Write two solutions, one using the COALESCE function and the other using the ISNULL function.  

select contactname, ISNULL(fax, 'no information')
from customers;


--Execute the written statement and compare the results that you got with the recommended results 
--shown in the file 72 - Lab Exercise 3 - Task 1 Result.txt.  

--What is the difference between the ISNULL and COALESCE functions?  

--coalesce is industry standard

--Task 2: Write a filter for a variable that could be a NULL  

--Update the provided T-SQL statement with a WHERE clause to filter the region column using the provided variable
--@region, which can have a value or a NULL. Test the solution using both provided variable declaration cases.  

 
              

DECLARE @region AS NVARCHAR(30) = N'WA'; 

SELECT 

   customerid, region 

FROM Customers

where region = @region



DECLARE @region AS NVARCHAR(30) = N'WA'; 

SELECT 

   customerid, region 

FROM Customers

where region is null;



 
-- DECLARE @region AS NVARCHAR(30) = NULL; 

--SELECT 
--	CustomerID, region
--FROM Customers
--WHERE region = @region OR (region IS NULL AND @region IS NULL);

--GO


--Task 3: Write a SELECT statement to return all the customers that do not have a two-character abbreviation for 
--the region  

--Write a SELECT statement to retrieve the contactname, city, and region columns from the Customers table. Return 
--only rows that do not have two characters in the region column, including those with an inapplicable region (where the region is NULL).  


select contactname, city, region
from customers
where len(region)<> 2 OR region is null -- the underscore represents one character 

--to return say 2 characters, use where region = '__'

--Execute the written statement and compare the results that you got with the recommended results shown in the file 73
--- Lab Exercise 3 - Task 3 Result.txt. Notice the number of rows returned.  

--Results: After this exercise, you should have an understanding of how to test for nullability.  