Use NORTHWND
Go

select 1 + '2' as result; --cannot add say abc as these are different data types

select 'abc' + 'xyz' as result; --added info must be the same data type

select cast (12345678910 as Varchar(10)) + 'abcefgeg' as result; --cast is used to convert data types