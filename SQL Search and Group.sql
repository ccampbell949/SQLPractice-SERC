USE NORTHWND;​

SELECT EmployeeID, YEAR(OrderDate) AS orderyear​

FROM Orders​

WHERE CustomerID ='FRANK'

GROUP BY EmployeeID, YEAR(OrderDate)​

HAVING COUNT(*) > 1​

ORDER BY EmployeeID, orderyear;​