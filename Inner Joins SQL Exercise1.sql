--Write a SELECT statement that will return the productname column from the Products table (use table alias “p”) and the
--categoryname column from the Categories table (use table alias “c”) using an inner join.  

--Execute the written statement  

 select p.ProductName, c.CategoryName
from Products as p inner join Categories as c
on p.CategoryID = c.CategoryID

--Which column did you specify as a predicate in the ON clause of the join? Why?
--category column is common between both tables

--Let us say that there is a new row in the Categories table and this new product category does not have any products associated with it 
--in the Products table. Would this row be included in the result of the SELECT statement written in task 1? Please explain. 
--No because the inner join only returns matches

--Results: After this exercise, you should know how to use an inner join between two tables.  