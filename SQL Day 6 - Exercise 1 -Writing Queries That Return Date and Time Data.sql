--Exercise 1: Writing Queries That Return Date and Time Data  

--Scenario  

--Before you start using different date and time functions in business scenarios, you have to practice on
--sample data.  

--The main tasks for this exercise are as follows:  

--Write a couple of SELECT statements using the date and time functions.   

--Answer questions.   

--Task 1: Write a SELECT statement to retrieve the current date and time  

--Write a SELECT statement to return columns that contain:  

--The current date and time. Use the alias currentdatetime.  

--Just the current date. Use the alias currentdate.  

--Just the current time. Use the alias currenttime.  

--Just the current year. Use the alias currentyear.  

--Just the current month number. Use the alias currentmonth.  

--Just the current day of month number. Use the alias currentday.  

--Just the current week number in the year. Use the alias currentweeknumber.  

--The name of the current month based on the currentdatetime column. Use the alias currentmonthname.  


select 
	SYSDATETIME() as currentdatetime,
	getdate() as currentdate,
	current_timestamp as currenttime,
	year(getdate()) as currentyear,
	month(getdate()) as currentmonth,
	day(getdate()) as currentday,
	datepart(week, current_timestamp) as currentweeknumber,
	datename(month, current_timestamp) as currentmonthname; --using datepart along with getdate() will give you the actual number of the month
		
	


--Execute the written statement and compare the results that you got with the desired results shown in the
--file 52 - Lab Exercise 1 - Task 1 Result.txt. Your results will be different because of the current date 
--and time value.  

--Can you use the alias currentdatetime as the source in the second column calculation (currentdate)? 
--Please explain.  

--no as these need to be distinct aliases

--Task 2: Write a SELECT statement to return the data type date  

--Write December 11, 2011, as a column with a data type of date. Use the different possibilities inside
--the T-SQL language (cast, convert, specific function, etc.) and use the alias somedate.  

 
 select cast('20111211' as date) as somedate;
 select convert(date, '20111211', 101) as somedate;
 select datefromparts(2011,12,11) as somedate;


 --Task 3: Write a SELECT statement that uses different date and time functions  

--Write a SELECT statement to return columns that contain:  

--A date and time value that is three months from the current date and time. Use the alias threemonths.  

--Number of days between the current date and the first column (threemonths). Use the alias diffdays.  

--Number of weeks between April 4, 1992, and September 16, 2011. Use the alias diffweeks.  

--First day in the current month based on the current date and time. Use the alias firstday.  

select
	dateadd(month, 3, current_timestamp) as threemonths,
	datediff(day, current_timestamp, dateadd(month, 3, current_timestamp)) as diffdays,
	datediff(week, '19920404', '20110916') as diffweeks,
	DATEADD(day, -day(current_timestamp) + 1, current_timestamp) as firstday;

--Execute the written statement and compare the results that you got with the desired results shown in 
--the file 53 - Lab Exercise 1 - Task 3 Result.txt. Some results will be different because of the current
--date and time value.  

--Results: After this exercise, you should be able to retrieve date and time data using T-SQL.  