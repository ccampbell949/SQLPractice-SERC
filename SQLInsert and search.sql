
	use [ASOS TEST DB]

	--create customer table

	create table EmployeeDetails(
	[Employee ID] char(30) not null,
	[Salary] float (30) not null,
	[Benefits] char(30) not null,
	[Position] char(200) not null
	Constraint [PK_Employee ID] Primary Key ([Employee ID]));

	select * from EmployeeDetails

	delete from EmployeeDetails where [Employee ID]=10

	insert into EmployeeDetails
	values (010, 75000, 15000, 'Manager'),
	(105, 65000, 15000, 'Manager'),
	(152, 60000, 15000, 'Manager'),
	(215, 60000, 12500, 'Manager'),
	(244, 50000, 120000, 'Staff'),
	(300, 45000, 10000, 'Staff'),
	(335, 40000, 10000, 'Staff'),
	(400, 32000, 7500, 'Entry-Level'),
	(441, 28000, 7500, 'Entry-Level')

	update EmployeeDetails
	set [Position] = 'Staff', [Salary] = 40000
	where [Employee ID] = 441;

	update EmployeeDetails
	set [Position] = 'Entry-Level', [Salary] = 25000
	where [Employee ID] = 215
	
	select * from EmployeeDetails
	where Salary >= 12000 AND Position = 'Entry-Level';