use NORTHWND

Select
	CURRENT_TIMESTAMP AS currentdatetime,
	CAST(CURRENT_TIMESTAMP AS DATE) AS currentdate,
	CAST(CURRENT_TIMESTAMP AS TIME) AS currenttime,
	YEAR(CURRENT_TIMESTAMP) AS currentyear,
	MONTH(CURRENT_TIMESTAMP) AS currentmonth,
	DAY(CURRENT_TIMESTAMP) AS currentday,
	DATEPART(week, CURRENT_TIMESTAMP) AS currentweeknumber,
	DATENAME(month, CURRENT_TIMESTAMP) AS currentmonthname;

--other possiblities to remove the time portion from datetime
SELECT CAST(CONVERT(CHAR(8), CURRENT_TIMESTAMP, 112) AS DATETIME) AS currentdate;
SELECT DATEADD(day, DATEDIFF(day, '20000101', CURRENT_TIMESTAMP), '20000101') AS currentdate