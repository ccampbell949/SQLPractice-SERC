--Exercise 4: Using a Simple CASE Expression  

--Scenario  

--Your company produces a long list of products, and the members of the marketing department would like to
--have product category information in their reports. They have supplied you with a document containing the
--following mapping between the product category IDs and the product category names:  

 
 
--categoryid			Categoryname  

--1					Beverages 

--2					Condiments 

--3					Confections 

--4					Dairy Products 

--5					Grains/Cereals 

--6					Meat/Poultry 

--7					Produce 

--8					Seafood  

 

 
--Because of an active marketing campaign, they would like to include product category information in their 
--reports.  

--The main tasks for this exercise are as follows:  

--Write a SELECT statement to retrieve the productname and categoryid columns from the Products table.   

--Modify an existing query to include a simple CASE expression based on the mapping information supplied by the --marketing department to list the category name for each product.   

--Task 1: Write a SELECT statement  

--Write a SELECT statement to display the categoryid and productname columns from the Products table.  

 select categoryid, productname
 from products

--Task 2: Write a SELECT statement that uses a CASE expression  

--Enhance the SELECT statement in task 1 by adding a CASE expression that generates a result column named 
--categoryname. The new column should hold the translation of the category ID to its respective category 
--name based on the mapping table supplied earlier. Use the value “Other” for any category IDs not found 
--in the mapping table.  

select categoryid, productid,
	case categoryid
		when 1 then 'Beverages'
		when 2 then 'Condiments'
		when 3 then 'Confections'
		when 4 then 'Dairy Products'
		when 5 then 'Grains/Cereals'
		when 6 then 'Meat/Poultry'
		when 7 then 'Produce'
		when 8 then	'Seafood'
		else 'Other'
	end as 'category name'
from products

--Task 3: Write a SELECT statement that uses a CASE expression to differentiate campaign-focused products  

--Modify the SELECT statement in task 2 by adding a new column named is campaign. This column will show
--the description “Campaign Products” for the categories Beverages, Produce, and Seafood and the 
--description “Non-Campaign Products” for all other categories.  


--select categoryid, productid, productname,
--	case categoryid
--		when 1 then 'Campaign Products'
--		when 2 then 'Non-Campaign Products'
--		when 3 then 'Non-Campaign Products'
--		when 4 then 'Non-Campaign Products'
--		when 5 then 'Non-Campaign Products'
--		when 6 then 'Non-Campaign Products'
--		when 7 then 'Campaign Products'
--		when 8 then	'Campaign Products'
--		else 'Other'
--	end as 'Campaign'
--from products

select p.categoryid, p.productname,
	case 
		when p.categoryid = 1 then 'Beverages'
		when p.categoryid = 2 then 'Condiments'
		when p.categoryid = 3 then 'Confections'
		when p.categoryid = 4 then 'Dairy Products'
		when p.categoryid = 5 then 'Grains/Cereals'
		when p.categoryid = 6 then 'Meat/Poultry'
		when p.categoryid = 7 then 'Produce'
		when p.categoryid = 8 then	'Seafood'
		else 'Other'
	end as 'category name',
	case 
		when categoryid in(1, 7, 8) then 'Campaign Product'
		else 'Non-Campaign Products'
	end as 'Campaign Products'
from products as p;



select p.categoryid, p.productname,
	case p.categoryid
		when 1 then 'Beverages'
		when 2 then 'Condiments'
		when 3 then 'Confections'
		when 4 then 'Dairy Products'
		when 5 then 'Grains/Cereals'
		when 6 then 'Meat/Poultry'
		when 7 then 'Produce'
		when 8 then	'Seafood'
		else 'Other'
	end as 'category name',

	case
		when p.categoryid in(1, 7, 8) then 'Campaign Product'
		else 'Non-Campaign Products'
	end as 'Campaign Products'
from products as p;


--Execute the written statement and compare the results that you got with the desired results shown --in the file 84 - Lab Exercise 4 - Task 3 Result.txt.   

--Results: After this exercise, you should know how to use CASE expressions to write simple conditional logic.  

 