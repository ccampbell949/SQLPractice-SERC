select AVG(unitprice) as avg_price, -- average of unit price column
MIN(quantity) as min_qty, --min quantity of quantity column
MAX(discount) as max_discount --max value of discount column
from [order details];

select EmployeeID, YEAR(orderdate) as orderyear,
COUNT(CustomerID) as all_custs, --counts all values in customerid column
COUNT(distinct customerID) as unique_custs -- counts distinct values in customerid column
from Orders
group by EmployeeID, YEAR(OrderDate);

select employeeid, COUNT(*) as cnt
from Orders
group by EmployeeID;

select orderid, productid, AVG (unitprice) as avg_price, MAX(quantity) as max_price, max (discount) as max_disc
from [Order Details]
group by orderid, productid

select AVG (unitprice) as avg_price, MAX(quantity) as max_price, max (discount) as max_disc
from [Order Details]	--this one works without the group by as there are no column names in the select as there are in the one above

--compare having to where

select c.customerid, COUNT(*) as cnt
from Customers as c
join orders as o on c.CustomerID = o.customerid
group by c.CustomerID
having COUNT(*) > 1;