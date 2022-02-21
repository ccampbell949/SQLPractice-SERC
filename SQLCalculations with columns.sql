select OrderID, ProductID, UnitPrice, Quantity, Discount
from [Order Details]

select ProductID, (UnitPrice * Quantity) as [total amount]
from [Order Details]
where ProductID = 65
order by Quantity asc;

select distinct country from Customers
Order by Country asc;
