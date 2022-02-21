select customerID, orderdate, orderid  
from Orders
order by OrderDate desc

--alias's
select customerID, YEAR(orderdate) as [Order Year], Month(orderdate) as [Order Month], orderid 
from Orders
order by [Order Year] desc

--order dates between 1/1/2006 and 31/12/2006

select customerid, orderdate, orderid
from Orders
where OrderDate >= '19960101' and OrderDate <= '19961231'
