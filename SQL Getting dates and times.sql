select
	GETDATE() as [getdate],
	CURRENT_TIMESTAMP as [current_timestamp],
	GETUTCDATE() as [getutcdate],
	SYSDATETIME() as [sysdatetime],
	SYSUTCDATETIME() as [sysutcdatetime],
	SYSDATETIMEOFFSET() as [sysdatetimeoffset]

	select DATEname(year, '20120212');
	select DAY('20120212') as [day], MONTH('20120212') as [month], YEAR('20121212') as [year]


	select DATETIMEFROMPARTS(2012, 2, 12, 8, 30, 0, 0) as result; --7 arguments year, month, day, hours, minutes, seconds, nanoseconds
	select DATETIME2FROMPARTS(2012, 2, 12, 8, 20, 00, 0, 0) as result; --adds milliseconds
	select DATEFROMPARTS(2012, 2, 12) as result; --3 arguments
	select DATETIMEOFFSETFROMPARTS(2012, 2, 12, 8, 30, 0, 0, -7, 0, 0) as result;

	select DATEDIFF(millisecond, getdate(), sysdatetime());

	select ISDATE('20120212'); -- is valid
	select ISDATE('20120230'); -- february doesn't have 30 days