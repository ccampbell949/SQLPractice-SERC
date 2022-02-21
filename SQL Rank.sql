use NORTHWND

select COUNT (*) as numorderlines, SUM(quantity*unitprice) as totalsales
from [Order Details];


select (quantity * unitprice) as totalsales
from [Order Details]



select top(5) productid, productname, unitprice, 
RANK() over(order by unitprice desc) AS
rankbyprice
from products
order by rankbyprice;



select PARSE ('02/12/2012' as datetime2 using 'en-US') AS parse_result;



SELECT productid, unitprice,
IIF(unitprice > 50, 'high', 'low') as pricepoint
from Products;