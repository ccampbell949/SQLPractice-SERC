SELECT p.productid, p.productname, c.categoryid,
CASE c.categoryid
		WHEN 1 then 'Beverages'
		else 'unknown category'
end
from categories as c 
inner join products as p on c.CategoryID = p.categoryid




select productid, productname, unitprice,
	case discontinued
		when 0 then 'Active'
		when 1 then 'Discontinued'
	end as status
from products



select orderid, customerid, orderdate, 
	case employeeid
		when 1 then 'buck' 
		when 2 then 'cameron' 
		when 3 then 'davis'
	end  
	
from Orders

