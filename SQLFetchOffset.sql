--offset by 0 rows, i.e. start at first row and return the top 50

SELECT OrderID, customerid, employeeid, orderdate​

FROM Orders​

ORDER BY orderdate, orderid DESC​

OFFSET 0 ROWS FETCH FIRST 50 ROWS ONLY;


--offset the first 50 rows and retun the following 50
SELECT OrderID, customerid, employeeid, orderdate​

FROM Orders​

ORDER BY orderdate, orderid DESC​

OFFSET 50 ROWS FETCH NEXT 50 ROWS ONLY;

--select top 5 results
select top(5) orderid, customerid, orderdate
from Orders
order by OrderDate desc


--select top 10%
select top(10) percent orderid, customerid, orderdate
from Orders
order by OrderDate desc

select customerid, phone
from Customers
where Phone is not null

