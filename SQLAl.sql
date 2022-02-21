--renaming columns

select OrderID, Unitprice, Quantity as QTY
FROM [Order Details]

select OrderID,  UnitPrice, Quantity QTY  --these both do the same thing
from [Order Details]

select C.companyname as [company name], C.address as [full address], c.Phone as [contact number]
from Customers as c