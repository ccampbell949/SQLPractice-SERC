--Exercise 2: Writing Queries That Use Logical Functions  

--Scenario  

--The sales department would like to have different reports regarding
--the segmentation of customers and specific order lines. You will add 
--a new calculated column to show the target group for the segmentation.  

--The main tasks for this exercise are as follows:  

--Write a SELECT statement to mark specific customers based on one or more
--logical predicates inside the logical function. 
 

--Write a SELECT statement to segment the customers into four groups using
--the modulo operator. 
 

--Task 1: Write a SELECT statement to mark specific customers based on their country  

--and contact title  

--Write a SELECT statement against the Customers table and retrieve the custid
--and contactname columns. Add a calculated column named segmentgroup using a 
--logical function IIF with the value “Target group” for customers that are 
--from Mexico and have in the contact title the value “Owner”. Use the value 
--“Other” for the rest of the customers.  


select customerid, contactname, IIF(country = 'Mexico' AND contacttitle = 'Owner', 
'Target Group', 'Other') as segmentgroup
from customers


--Execute the written statement and compare the results that you got with the 
--desired results shown in the file 62 - Lab Exercise 2 - Task 1 Result.txt.  

--Task 2: Modify the T-SQL statement to mark different customers  

--Modify the T-SQL statement from task 1 to change the calculated column to show 
--the value “Target gSEroup” for all customers without a missing value in the region
--attribute or with the value “Owner” in the contact title attribute.  

select IIF(region is not null OR contacttitle = 'Owner', 
'Target Group', 'Other') as segmentgroup, customerid, contactname
from customers

--Execute the written statement and compare the results that you got with the
--recommended result shown in the file 63 - Lab Exercise 2 - Task 2 Result.txt. 

 

--Task 3: Create four groups of customers  

--Write a SELECT statement against the Customers table and retrieve the custid
--and contactname columns. Add a calculated column named segmentgroup using the
--logical function CHOOSE with four possible descriptions (“Group One”, “Group Two”,
--“Group Three”, “Group Four”). Use the modulo operator on the column custid. 
--(Use the expression custid % 4 + 1 to determine the target group.)  

select choose(customerid % 4 + 1, 'group one', 'group 2', 'group 3', 'group 4') as segmentgroup,
customerid, contactname
from customers --WONT RUN DUE TO VARCHAR VALUE


--SELECT CHOOSE(custid % 4 + 1, N'Group One', N'Group Two', N'Group Three', N'Group Four') AS segmentgroup, custid, contactname
--FROM Customers;

--Execute the written statement and compare the results that you got with the 
--recommended results shown in the file 64 - Lab Exercise 2 - Task 3 Result.txt. 

--Results: After this exercise, you should know how to use the logical functions.