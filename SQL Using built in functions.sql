--Exercise 1: Writing Queries That Use Conversion Functions  

--Scenario  

--You have to prepare a couple of reports for the business users and the IT 
--department. The main tasks for this exercise are as follows:  

--Write a SELECT statement using the CAST or CONVERT function. 
 
--Write a SELECT statement to filter rows based on specific date information. 
 


--Task 1: Write a SELECT statement that uses the CAST or CONVERT function  

--Write a SELECT statement against the Products table to retrieve a calculated 
--column named productdesc. The calculated column should be based on the columns productname
--and unitprice and look like this:  

--Results: The unit price for the Product Chai is 18.00 $.  

SELECT 'The unit price for the ' + productname + ' is ' + CAST(unitprice AS NVARCHAR(10)) + ' $.' AS productdesc
FROM Products;


--Execute the written statement and compare the results that you got with the 
--desired results shown in the file 52 - Lab Exercise 1 - Task 1 Result.txt.  

--need to convert to a varchar to be displayed as a string

--Did you use the CAST or the CONVERT function? Which one do you think is more 
--appropriate to use?  

--CAST is part of the ANSI-SQL specification; whereas, CONVERT is not.  In fact, CONVERT is
--SQL implementation-specific.

--CONVERT differences lie in that it accepts an optional style parameter that is used
--for formatting.

--Unless you have some specific formatting requirements you’re trying to address during the 
--conversion, 
--I would stick with using the CAST function.  There are several reasons I can think of:

--CAST is ANSI-SQL compliant; therefore, more apt to be used in other database implementation.
--There is no performance penalty using CAST.
--I think CAST is easier to read, and since it is part of the ANSI specification, your non-
--SQLServer DBA thinks so too!


--Task 2: Write a SELECT statement to filter rows based on specific date information  

--The US marketing department has supplied you with a start date of 4/1/2007 (using 
--US English form, read as April 1, 1996) and an end date of 11/30/1998. Write a 
--SELECT statement against the Orders table to retrieve the orderid, orderdate, 
--shippeddate, and shipregion columns. Filter the result to include only rows with 
--the order date between the specified start date and end date and have more than 
--30 days between the shipped date and order date. Also check the shipregion column
--for missing values. If there is a missing value, then return the value ‘No region’.  

--In this SELECT statement, you can use the CONVERT function with a style parameter
--or the new PARSE function.  

select OrderID, orderdate, shippeddate, coalesce (shipregion, 'No Region')
from orders
where orderdate >= CONVERT(DATETIME, '4/1/1996', 101) --the 101 is just the format code
	AND orderdate <= CONVERT(DATETIME, '11/30/1998', 101)
	AND shippeddate > DATEADD(DAY, 30, orderdate); --used to add on 30 days.
	--to add on 1 year would be dateadd(year, 1, orderdate)
	--i.e. show results where the shipped date is greater than 30 days after the order date

--Execute the written statement and compare the results that you got with the desired
--results shown in the file 53 - Lab Exercise 1 - Task 2 Result.txt. 