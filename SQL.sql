
-- create database
Create Database Db1
go

sp_renameDb 'Db1', 'practiceDb'
go

Alter Database practiceDb Modify Name=dbpractice
go

use dbpractice
go

Alter Database Db1 Set SINGLE_USER with ROLLBACK IMMEDIATE
go

Use Db1
go

-- create table

Create Table tbl1(
	Id int,
	name nvarchar(20)
)
go

Select * from tbl1
go

insert into tbl1 values(1, 'john'), (2, 'james')

Select * from tbl1;

Select Id from tbl1;

select name from tbl1;

Select id, name, len(name) as length from tbl1;

Select id, name, upper(name) from tbl1;

Select * from tbl1;
go


Alter Table tbl1
Alter Column Id Int Not null

sp_help tbl1

Alter Table tbl1
Add Constraint PK_tbl1_Id
Primary Key(Id)

Select * from tbl1;

Alter Table tbl1
Add GenderId int 
Constraint DF_tbl_GenderId
Default 3

Select * from tbl1;

insert into tbl1 (Id, name)values(3, 'ankita')

Create Table tblGender(
	Id int not null,
	Gender nvarchar(10)
)
Select * from tblGender

insert into tblGender values(1, 'Male')
insert into tblGender values(2, 'Female')
insert into tblGender values(1, 'Unknown')

Select * from tblGender;

Update tblGender Set Id = 3 where Gender='Unknown'

Alter Table tblGender
Add Constraint PK_tblGender_Id
Primary Key(Id)
go

Alter Table tbl1
Add Constraint FK_tbl1_GenderID
Foreign Key(GenderId) references tblGender(Id)

Select * from tbl1
Select * from tblGender

Update tbl1 Set GenderId = 1 where Id=2

Alter Table tbl1
Add Age int

Select * from tbl1

Alter Table tbl1
Add Constraint DF_tbl1_Age
Default 18 for Age

Select * from tbl1;

Update tbl1 Set Age = 18 where Id in (1,2,3)

--check constraint 

Alter Table tbl1
Add Constraint CK_tbl1_Age
Check (Age >= 18 AND Age < 150)

Select * from tbl1


Create Table tbl2(
	Id int primary key identity(1,1),
	Name nvarchar(10)
)
go

Insert into tbl2 (Name)Values('Amar')
Insert into tbl2 (Name)Values('Shankar')
Insert into tbl2 (Name)Values('Shambu')
Insert into tbl2 (Name)Values('Tara Sigh')
Insert into tbl2 (Name)Values('Prabhu')
Insert into tbl2 (Name)Values('Aeon')

Select * from tbl2;

Truncate Table tbl2

Delete from tbl2 where id = 6

-- explicitly supply value to identity column

Set IDENTITY_INSERT tbl2 OFF

Insert into tbl2 (Id, Name)values(6, 'John')

Insert Into tbl2 Values('Martin')
Select * from tbl2

Delete from tbl2 where id between 1 and 8

Delete from tbl2 where id = 9

-- starting at 0 
DBCC CHECKIDENT('tbl2', RESEED, 0)

-- get identity values

--same session same scope
SELECT SCOPE_IDENTITY()

--same session any scope
SELECT @@IDENTITY

-- all session all scope
Select IDENT_CURRENT('tbl2')


Select * from tbl1

Alter Table tbl1
Add Email nvarchar(20)

Update tbl1 Set Email='john@mail.com' where Id =1
Update tbl1 Set Email='james@mail.com' where Id =2
Update tbl1 Set Email='ankita@mail.com' where Id =3

--unique key allows one null value
ALter Table tbl1
Add Constraint UQ_tbl1_Email
Unique(Email)

insert into tbl1 values(4, 'Jogn', 2, 25, 'jogn@mail.com')
Select * From tbl1

Select [Id], [Name], [GenderId], [Age], [Email],[City] from [Db1].[dbo].[tbl1]

Alter Table tbl1
Add City Nvarchar(10)

Update tbl1 Set City = 'Kolkata' where Id=4

Select Distinct City From tbl1

Select * from tbl1 Where City='Pune'

Select * From tbl1 Where City != 'Pune'

Select * from tbl1 Where Age in (21, 25, 46)

Select * from tbl1 Where Id Between 2 And 4

Select * From tbl1 Where City Like 'M%'

Select * from tbl1 Where Email Like '%@%'

Select * from tbl1 Where City Like '[PM]%'

Select * From tbl1 Where City Like '_%e'

Select * From tbl1 Where City Like '[^P]%'

Select * from tbl1 Where City in ('Mumbai', 'Pune') And Age = 18

Select * From tbl1

Select * From tbl1
Order by Name, Email

Select Top 2 * from tbl1

Update tbl1 Set Age = 29 Where Id = 2

Select * From tbl1
Order By Age

--Group By 
Select City, Count(Id)
From tbl1
Group By City

Select City, Min(Age) 
from tbl1
Group by City

Select * From tbl1

Create Table tblEmployee(
	Id Int Primary key,
	Name NVarchar(12),
	Gender nvarchar(6),
	Salary int,
	City nvarchar(15)
)
go

INSERT INTO tblEmployee (Id, Name, Gender, Salary, City) VALUES (1, 'John', 'Male', 50000, 'New York');
INSERT INTO tblEmployee (Id, Name, Gender, Salary, City) VALUES (2, 'Emily', 'Female', 55000, 'Los Angeles');
INSERT INTO tblEmployee (Id, Name, Gender, Salary, City) VALUES (3, 'Michael', 'Male', 60000, 'Chicago');
INSERT INTO tblEmployee (Id, Name, Gender, Salary, City) VALUES (4, 'Sophia', 'Female', 52000, 'Houston');
INSERT INTO tblEmployee (Id, Name, Gender, Salary, City) VALUES (5, 'William', 'Male', 58000, 'Phoenix');
INSERT INTO tblEmployee (Id, Name, Gender, Salary, City) VALUES (6, 'Olivia', 'Female', 53000, 'Philadelphia');
INSERT INTO tblEmployee (Id, Name, Gender, Salary, City) VALUES (7, 'James', 'Male', 62000, 'San Antonio');
INSERT INTO tblEmployee (Id, Name, Gender, Salary, City) VALUES (8, 'Ava', 'Female', 54000, 'San Diego');
INSERT INTO tblEmployee (Id, Name, Gender, Salary, City) VALUES (9, 'Alexander', 'Male', 57000, 'Dallas');
INSERT INTO tblEmployee (Id, Name, Gender, Salary, City) VALUES (10, 'Mia', 'Female', 51000, 'San Jose');
INSERT INTO tblEmployee (Id, Name, Gender, Salary, City) VALUES (11, 'Ethan', 'Male', 59000, 'Austin');
INSERT INTO tblEmployee (Id, Name, Gender, Salary, City) VALUES (12, 'Charlotte', 'Female', 55000, 'Jacksonville');
INSERT INTO tblEmployee (Id, Name, Gender, Salary, City) VALUES (13, 'Daniel', 'Male', 63000, 'Fort Worth');
INSERT INTO tblEmployee (Id, Name, Gender, Salary, City) VALUES (14, 'Amelia', 'Female', 56000, 'Columbus');
INSERT INTO tblEmployee (Id, Name, Gender, Salary, City) VALUES (15, 'Henry', 'Male', 61000, 'San Francisco');
INSERT INTO tblEmployee (Id, Name, Gender, Salary, City) VALUES (16, 'Evelyn', 'Female', 52000, 'Charlotte');
INSERT INTO tblEmployee (Id, Name, Gender, Salary, City) VALUES (17, 'Matthew', 'Male', 64000, 'Indianapolis');
INSERT INTO tblEmployee (Id, Name, Gender, Salary, City) VALUES (18, 'Harper', 'Female', 57000, 'Seattle');
INSERT INTO tblEmployee (Id, Name, Gender, Salary, City) VALUES (19, 'Jacob', 'Male', 60000, 'Denver');
INSERT INTO tblEmployee (Id, Name, Gender, Salary, City) VALUES (20, 'Liam', 'Male', 62000, 'Washington');

INSERT INTO tblEmployee (Id, Name, Gender, Salary, City) VALUES (21, 'John', 'Male', 50000, 'New York');
INSERT INTO tblEmployee (Id, Name, Gender, Salary, City) VALUES (22, 'Emily', 'Female', 55000, 'Los Angeles');
INSERT INTO tblEmployee (Id, Name, Gender, Salary, City) VALUES (23, 'Michael', 'Male', 60000, 'Chicago');
INSERT INTO tblEmployee (Id, Name, Gender, Salary, City) VALUES (24, 'Sophia', 'Female', 52000, 'Houston');
INSERT INTO tblEmployee (Id, Name, Gender, Salary, City) VALUES (25, 'William', 'Male', 58000, 'Phoenix');
INSERT INTO tblEmployee (Id, Name, Gender, Salary, City) VALUES (26, 'Olivia', 'Female', 53000, 'Philadelphia');
INSERT INTO tblEmployee (Id, Name, Gender, Salary, City) VALUES (27, 'James', 'Male', 62000, 'San Antonio');
INSERT INTO tblEmployee (Id, Name, Gender, Salary, City) VALUES (28, 'Ava', 'Female', 54000, 'San Diego');
INSERT INTO tblEmployee (Id, Name, Gender, Salary, City) VALUES (29, 'Alexander', 'Male', 57000, 'Dallas');
INSERT INTO tblEmployee (Id, Name, Gender, Salary, City) VALUES (30, 'Mia', 'Female', 51000, 'San Jose');
INSERT INTO tblEmployee (Id, Name, Gender, Salary, City) VALUES (31, 'Ethan', 'Male', 59000, 'Austin');
INSERT INTO tblEmployee (Id, Name, Gender, Salary, City) VALUES (32, 'Charlotte', 'Female', 55000, 'Jacksonville');
INSERT INTO tblEmployee (Id, Name, Gender, Salary, City) VALUES (33, 'Daniel', 'Male', 63000, 'Fort Worth');
INSERT INTO tblEmployee (Id, Name, Gender, Salary, City) VALUES (34, 'Amelia', 'Female', 56000, 'Columbus');
INSERT INTO tblEmployee (Id, Name, Gender, Salary, City) VALUES (35, 'Henry', 'Male', 61000, 'San Francisco');
INSERT INTO tblEmployee (Id, Name, Gender, Salary, City) VALUES (36, 'Evelyn', 'Female', 52000, 'Charlotte');
INSERT INTO tblEmployee (Id, Name, Gender, Salary, City) VALUES (37, 'Matthew', 'Male', 64000, 'Indianapolis');
INSERT INTO tblEmployee (Id, Name, Gender, Salary, City) VALUES (38, 'Harper', 'Female', 57000, 'Seattle');
INSERT INTO tblEmployee (Id, Name, Gender, Salary, City) VALUES (39, 'Jacob', 'Male', 60000, 'Denver');
INSERT INTO tblEmployee (Id, Name, Gender, Salary, City) VALUES (40, 'Liam', 'Male', 62000, 'Washington');


Select * From tblEmployee

Select City, Min(Salary) as TotalSalary, Count(Id)
From tblEmployee
Group By City

Select Gender, City, Sum(Salary)
From tblEmployee
Group By Gender, City


Select City, Sum(Salary)
From tblEmployee
Where Gender = 'Male'
Group By City


Select City, Sum(Salary) 
From tblEmployee
Group By Gender
Having Gender='Female'

Select * from tblEmployee

Select Gender, Count(Id)
From tblEmployee
Group By Gender
Having COUNT(Gender) > 18

-- JOINS

Create Table tblDepartment(
	Id int Primary Key Identity(1,1),
	DepartmentName nvarchar(10),
	Location nvarchar(10),
	DepartmentHead nvarchar(10)
)

Create Table tblemp(
	ID Int Primary Key Identity(1, 1),
	Name nvarchar(10),
	Gender nvarchar(6),
	Salary int,
	DepartmentId int references tblDepartment(Id)
)

Insert into tblDepartment Values('IT', 'London', 'Rick')
Insert into tblDepartment Values('Payroll', 'Delhi', 'Ron')
Insert into tblDepartment Values('HR', 'New York', 'Christie')
Insert into tblDepartment Values('Other D', 'Sydney', 'Cindrella')

Insert Into tblemp Values('Tom', 'Male', 4000, 1)
Insert Into tblemp Values('Pam', 'Female', 3000, 3)
Insert Into tblemp Values('John', 'Male', 3500, 1)
Insert Into tblemp Values('Sam', 'Male', 4500, 2)
Insert Into tblemp Values('Tod', 'Male', 2800, 2)
Insert Into tblemp Values('Ben', 'Male', 7000, 1)
Insert Into tblemp Values('Sara', 'Female', 4800, 3)
Insert Into tblemp Values('Valarie', 'Female', 5500, 1)
Insert Into tblemp Values('James', 'Male', 6500, NULL)
Insert Into tblemp Values('Russell', 'Male', 8800, NULL)

Select * From tblDepartment
Select * From tblemp

--INNER JOIN
Select Name, Gender, Salary, DepartmentName
From tblemp
Join tblDepartment
On tblemp.DepartmentId = tblDepartment.Id

--LEFT JOIN/LEFT OUTER JOIN
Select e.[Name], e.Gender, e.Salary, d.DepartmentName
From tblemp e
Left Join tblDepartment d
On e.DepartmentId = d.Id

--Right Join/RIGHT OUTER JOIN

Select e.[Name], e.Gender, e.Salary, d.DepartmentName
From tblemp e
Right Join tblDepartment d
ON e.DepartmentId = d.Id

--FULL OUTER JOIN
Select e.[Name], e.Gender, e.Salary, d.DepartmentName
From tblemp e
FULL JOIN tblDepartment d
ON e.DepartmentId = d.Id

--CROSS JOIN
Select e.Name, e.Gender, e.Salary, d.DepartmentName
From tblemp e
Cross Join tblDepartment d

-- Advanced or Intelligent Join
--Non Matchin rows from left table
Select e.Name, e.Gender, e.Salary, d.DepartmentName
From tblemp e
Left Join tblDepartment d
On e.DepartmentId = d.Id
Where e.DepartmentId is Null

-- Non matching rows from the right table
Select e.Name, e.Gender, e.Salary, d.DepartmentName
From tblemp e
Right Join tblDepartment d
On e.DepartmentId = d.Id
Where e.DepartmentId is Null

-- Non Matching rows from both the table
Select e.Name, e.Gender, e.Salary, d.DepartmentName
From tblemp e
Full JOIN tblDepartment d
On e.DepartmentId = d.Id
Where e.DepartmentId is NULL


--Self Join
Create Table tblemp2(
	EmpId int primary key identity(1,1),
	Name nvarchar(20),
	ManagerId int
)

Insert into tblemp2 values('Mike', 3);
Insert into tblemp2 values('Rob', 1);
Insert into tblemp2 values('Todd', NULL);
Insert into tblemp2 values('Ben', 1);
Insert into tblemp2 values('Sam', 1);

Select * From tblemp2

--self inner join
Select e.EmpId, e.Name as EmployeeName, m.Name  as ManagerName
From tblemp2 e
Inner Join tblemp2 m
on e.ManagerId = m.EmpId

--self left join
Select e.EmpId, e.Name as EmployeeName, m.Name as ManagerName
From tblemp2 e
Left Join tblemp2 m
On e.ManagerId = m.EmpId

--self right join
Select e.EmpId, e.Name as EmployeeName, m.Name as ManagerName
From tblemp2 e
Right Join tblemp2 m
on e.ManagerId = m.EmpId

-- self full join
Select e.EmpId, e.Name as EmployeeName, m.Name as ManagerName
From tblemp2 e
Full Join tblemp2 m
on e.ManagerId = m.EmpId

-- self cross join
Select e.EmpId, e.Name as EmployeeName, m.Name as ManagerName
From tblemp2 e
Cross Join tblemp2 m

-- Different Ways to Replace Null Values

Select * from tblemp2

-- ISNULL
Select e.EmpId, e.Name as EmployeeName, ISNULL(m.Name, 'No Manager') as ManagerName
From tblemp2 e
Left Join tblemp2 m
ON e.ManagerId = m.EmpId

-- COALESCE -/returns first non null value
Select e.EmpId, e.Name as EmpName, Coalesce(m.Name, 'No Manager') as ManagerName
From tblemp2 e
Left Join tblemp2 m
On e.ManagerId = m.EmpId

-- Case Statement
Select e.EmpId, e.Name as EmpName,
Case 
	When m.Name is NULL 
	THEN 'No Manager' 
	ELSE m.Name		
END as ManagerName
From tblemp2 e
Left Join tblemp2 m
On e.ManagerId = m.EmpId

-- UNION and UNION ALL
-- UNION ALL combines result from two queries
-- UNION removes duplicate records

select * from tblemp2
UNION ALL
Select * From tblemp2

Select * from tblemp2
UNION
Select * from tblemp2
order by Name Desc

-- Stored Procedure

Create Procedure spGetEmployeeManager
as
Begin
	Select e.EmpId, e.Name as EmployeeName, m.Name as ManagerName
	From tblemp2 e
	Inner Join tblemp2 m
	On e.ManagerId = m.EmpId
End

Exec spGetEmployeeManager

sp_helptext spGetEmployeeManager

-- stored procedure with parameter

Select * From tblEmployee

Create Procedure spGetEmployeeByGenderAndCity
@Gender nvarchar(10),
@City nvarchar(10)
as
Begin 
	Select Id, [Name], Gender, Salary, City 
	From tblEmployee
	Where Gender = @Gender AND City = @City
End

Alter Procedure spGetEmployeeByGenderAndCity
@Gender nvarchar(10),
@City nvarchar(20)
as
Begin 
	Select Id, [Name], Gender, Salary, City 
	From tblEmployee
	Where Gender = @Gender AND City = @City
End

spGetEmployeeByGenderAndCity 'Female', 'Los Angeles'

sp_helptext spGetEmployeeByGenderAndCity 

-- to encrypt stored procedure
Alter Procedure spGetEmployeeByGenderAndCity
@Gender nvarchar(10),
@City nvarchar(20)
WITH ENCRYPTION
as
Begin 
	Select Id, [Name], Gender, Salary, City 
	From tblEmployee
	Where Gender = @Gender AND City = @City
End

sp_helptext spGetEmployeeByGenderAndCity 

-- stored procedure with output parameter
Select * From tblemp

Create Procedure spGetEmployeeCountByGender
@Gender nvarchar(10),
@EmployeeCount Int Output
As
Begin
	Select @EmployeeCount = Count(Id)
	From tblemp
	Where Gender = @Gender
End

Declare @Count Int
Execute spGetEmployeeCountByGender 'Male', @Count out
Print @Count

sp_help spGetEmployeeCountByGender
sp_helptext spGetEmployeeCountByGender
sp_depends spGetEmployeeCountByGender

-- stored procedure return values
-- stored procedure returns a [integer] status variable on success = 0, non-zero for failure

Select * From tblemp

Create Procedure spGetNameById
@Id int,
@Name nvarchar(20) output
as 
Begin
	Select @Name = [Name]
	From tblemp
	Where Id = @Id
End

Declare @return_value int
Declare	@name nvarchar(20)
Execute @return_value = spGetNameById @Id= 1, @Name = @name out
Select @return_value, @Name

Create Proc spGetTotalCountEmployee1
@TotalCount int output
As
Begin
	Select @TotalCount = Count(ID) from tblemp
End

Create Proc spGetTotalCountEmployee2
as
Begin
	Return( Select Count(ID)From tblemp )
End

Declare @TotalCount int
Execute spGetTotalCountEmployee1 @TotalCount out
Print @TotalCount

Declare @TotalCount2 int
Execute @TotalCount2 = spGetTotalCountEmployee2
Print @TotalCount2

-- Built in String Function
--ASCII() return a ascii code value for character
Select ASCII('A')
Select Ascii('apple')

--Char() returns character for given ascii code value
Select CHAR(65)

--CharIndex() returns the index of character in expression start with 1
Select CHARINDEX('a', 'apple')

--LTRIM()  remove white spaces on left side of expression
Select ltrim('       hello       ')

--RTRIM() removes white spaces on right side of expression
Select rtrim('       hello           ')

--trim() remove white spaces from left and right side of expression
Select trim('       hello           ')

-- Len() returns length of string
Select Len('apple')

--lower() returns lowercase of given expression
select lower('APPLE')

--upper() returns uppercase of given expression
Select upper('apple')

--Left() returns number of character from the left side of expression
Select Left('apple', 3)

--right() returns number of character from the right side of expression
select right('apple', 3)

--Replace(string, character, replace_value)
Select replace('box', 'b', 'x')

--replicate(string, n) repeat the string n times
Select REPLICATE('apple', 4)

--Reverse(string) 
Select REVERSE('apple')

--Soundex(string)
Select SOUNDEX('apple')

-- space(n)
Select space(15) + 'apple'

--str()
select STR('15.455', 5, 2)

--STUFF(String, star, end, replacement)
select STUFF('apple', 2, 3, 'xxx')

--substring()
Select SUBSTRING('apple', 1, 4)
	-- output - appl
Select SUBSTRING('apple', 0, 4)
	--output - app

--Unicode
Select UNICODE('apple')

--concat(string1, string2, ...)
--concatws(separator, string1, string2, ...)
select Concat('apple', 'aaple1')

select CONCAT_WS(',', 'apple', 'apple1')


--PATINDEX(pattern, string)  returns the index of first occurance of pattern
Select PATINDEX('%@mail.com', Email) From tbl1


--Date Time Functions
/*
	Time           :only time
	Date		   :only date
	smalldatetime  :date and time without nano second
	datetime	   :date time with only 3 nano second digit
	datetime2      :more precision in nano second 6 digit
	datetimeoffset :datetime2 + timezone offset
*/

/*

function				Date Time Format
GetDate()				2024-04-19 03:47:36.987
Current_timestamp		2024-04-19 03:47:49.147
SysDateTime()			2024-04-19 03:48:01.4114783
SysDateTimeOffset()		2024-04-19 03:48:11.5666745 +05:30
GetUtcDate()			2024-04-18 22:18:24.887
SysUtcDateTime()		2024-04-18 22:18:34.2492819
*/


--IsDate() returns 1 for time date and datetime, return 0 for other and datetime2
select ISDATE('John')

Select ISDATE('2024-04-19')

--Day()
Select Day(GETDATE())

--Month()
Select Month(GetDate())

-- Year()
Select Year(GetDate())

--datename
Select DATENAME(Day, GetDate())
Select DATENAME(Weekday, GetDate())
Select DATENAME(Month, GetDate())
Select DATENAME(DAYOFYEAR, GetDate())
Select DATENAME(week, GetDate())
Select DATENAME(quarter, GetDate())

--Datepart
Select DatePart(Weekday, GetDate())
Select DATENAME(weekday, GetDate())

--DateADD
Select DATEADD(Day, 5, Getdate())
Select DATEADD(week, 1, Getdate())
Select DateAdd(Month, 2, GetDate())
Select DATEADD(Year, 1, Getdate())

--DateDiff()
Select DATEDIFF(Month, '04/19/2024', '09/21/2024')
Select DATEDIFF(DAY, '04/19/2024', '09/21/2024')


--Cast And Convert
--Caste(variable as DataType)
--Conver(DataType, Variable[, dateformat])
/*
	Date format
	101 mm/dd/yy
	102 yy.mm.dd
	103 dd/mm/yyyy

*/

Select GETDATE()
Select Cast(GETDATE() as date)
Select CONVERT(nvarchar, Getdate(), 103)

-- Mathematical Function
--abs()
select abs(-23)
select abs(23.5)

--ceiling()
select CEILING(23.4)  -- 24
select ceiling(-23.4) -- -23

--floor
select FLOOR(23.4) -- 23
Select floor(-23.4)  -- -24

--power
select POWER(2,4)
select power(-3, 3) -- -27

--square
select SQUARE(4)  -- 16

-- sqrt
select SQRT(4) -- 2
select sqrt(15.87)
 
--rand(seed_value)
select rand()  -- random value between 0 to 1
select rand(5)  -- gives a fixed random value

--round
select round(850.556, 2)

Select round(850.556, 2, 1)

-- User Defined Function
--1.Scalar Function
/*
	We can use scalar function in select query
	may or may not have parameters, but will always return a single(scalar) value
*/

Create Function fnCalculateAge(@DOB Date)
Returns Int
As
Begin
	Declare @Age Int
	Set @Age = DATEDIFF(YEAR, @DOB, GETDATE()) - 
				Case
					When (MONTH(@DOB) > MONTH(GETDATE()) OR
						 (MONTH(@DOB) = MONTH(GETDATE()) AND DAY(@DOB) > DAY(GETDATE())))
					THEN 1
					ELSE 0
				End
	Return @Age
End
 

Select dbo.fnCalculateAge('11/10/1996')

--Alter Function
Alter Function fnCalculateAge(@DOB Date)
Returns Int
As
Begin
	Declare @Age Int
	Set @Age = DATEDIFF(YEAR, @DOB, GETDATE()) - 
				Case
					When (MONTH(@DOB) > MONTH(GETDATE()) OR
						 (MONTH(@DOB) = MONTH(GETDATE()) AND DAY(@DOB) > DAY(GETDATE())))
					THEN 1
					ELSE 0
				End
	Return @Age
End

--Drop Function
Drop Function fnCalculateAge

-- Inline Table Valued Function
Select * From tblemp

Create Function fnEmployeesByGender(@Gender nvarchar(20))
Returns Table
As
Return (Select Id, Name, Gender, Salary, DepartmentId
		From tblemp
		where Gender=@Gender)

select * from dbo.fnEmployeesByGender('Male')

-- Multi statement Table valued Function
Select * From tblEmployee

Create Function fnGetEmployee2()
returns @Table Table (Id int, Name nvarchar(20), Salary int)
as
Begin
	Insert Into @Table
	Select Id, Name, Salary From tblEmployee
	Return
End

Select Name, Salary From fnGetEmployee2();
/* you can update table from inline table function not from multi statement inline table fun*/


-- Temporary Tables
/*
	Tables are in TempDB system Database
	Types
		1.Local Temporary Tables
		2.Global Temporary Tables
*/

-- Local Temporary Table // just add # in front of the table name in create command
/*
	a local temp table is available only for the connection that has created the table
*/
Create Table #PersonalDeatails(Id int, Name nvarchar(10));

Select Name from tempdb..sysobjects
where Name like '#PersonalDeatails%'

-- local temp table is automatically dropped
-- you can also drop manually using drop command
Drop Table #PersonalDeatails

--Global Temporary Table  prefixed with ## 
Create Table ##PersonDetails(Id int, Name nvarchar(10))
/*
	global temp tables are visible to all connection of the sql server
	they are dropped only when the last connection is closed
	global temp tables have unique name 
*/

--Indexes
/*
	are used by queries to find data from tables quickly.
	created on tables and views.
	Table scan without index is bad for performance
*/

--this query is takes time
Select * From tblEmployee
Where Salary > 60000 and Salary < 71000

-- create index on salary column
Create Index IX_tblEmployee_Salary
On tblEmployee(Salary Asc)

-- now because of index it will take less time
Select * From tblEmployee
Where Salary > 60000 and Salary < 71000

sp_helpindex tblEmployee -- will return index on the table

--provide table name and index name
Drop Index tblEmployee.IX_tblEmployee_Salary

/* Index Types
	1.Clustered
	2.NonClustered
	3.Unique
	4.Filtered
	5.XML
	6.Full Text
	7.Spatial
	8.Columnstore
	9.Index with included columns
	10.Index on Computed Columns

*/
-- Clustered and NonClustered Index
--clustured index
	-- a table can only have one clustered index
	-- you can make it composite(with multiple columns)
Create clustered Index IX_tblEmployee_Gender_Salary
On tblEmployee(Gender DESC, Salary ASC)

--Drop Index
Drop Index tblEmployee.primarykeyindexname

-- Nonclustered Index
-- this index is saved separately from the table there is no restriction on number of nonclustered index
Create Nonclustered IX_tablename_column
On tablename(columnname ASC|DESC, ...)


--clustered index is faster than nonclustered index

-- Unique and Non Unique Index
-- Unique index is used to enforce the	uniqueness of the key values in the index
-- By default primary key constraint creates a unique clustered index
-- Uniquness is property of index so both clustered and non clustered can be unique
create unique nonclustered ix_tablename_column
on tablename(columnname ASC|DESC,...)

-- when you add unique constraint unique index gets added behind the scene


-- Views
-- a virtual table
Select * From tblemp
Select * From tblDepartment

Select e.id, e.Name, e.Gender, e.Salary, d.DepartmentName
From tblemp e
Join tblDepartment d
On e.DepartmentId = d.Id

Create View vWEmployeesByDepartment
as
Select e.id, e.Name, e.Gender, e.Salary, d.DepartmentName
From tblemp e
Join tblDepartment d
On e.DepartmentId = d.Id

Select * From vWEmployeesByDepartment

sp_helptext vWEmployeesByDepartment

--Alter view statement for altering view defination
-- Drop view viewname

Drop View vWEmployeesByDepartment

--Updateable Views

Select * From tblEmployee

Create view vWEmployeesDataExceptCity
as
Select Id, Name, Gender, Salary
From tblEmployee

Select * From vWEmployeesDataExceptCity

Update vWEmployeesDataExceptCity
Set Salary = 155000
Where Name = 'John'
-- update table using view possible? --> yes

Insert Into vWEmployeesDataExceptCity values(41, 'Jenifer', 'Female', 45000)
-- Insert data into table using views? --> Yes

Delete from vWEmployeesDataExceptCity
Where Id = 41
-- Delete from table using views? --> Yes
--All above was done on the view formed on a single table


-- view using tblemp and tblDepartmet
Create View vWEmployeesByDepartment
as
Select e.id, e.Name, e.Gender, e.Salary, d.DepartmentName
From tblemp e
Join tblDepartment d
On e.DepartmentId = d.Id

--as view is based on multiple tables it may not update the underlying
--based tables correctly.

-- Indexed Views
-- view is just a virtual table wich does not stored any data, all data it retrieves from base tabes
-- when index is created on views, the view get materialized means now it can store data.
Create View ViewName
with schemabinding
as
select_query
-- use schemabinding option
-- for aggregate function that may result in null value provide replacement value
-- for using group by select must contain count_big(*)
-- base table should be referenced with 2 part name
-- ideal for olap system/datawarehouse


--DML Triggers
-- After Triggers/For Triggers
-- Instead of triggers

-- After Triggers
create trigger tr_tablename_foraction
on tablename
for INSERT|DELETE|UPDATE
As
Begin
	inserted | deleted -- two tables available only in triggers
	--inserted when a insert statement is called
	--deleted when a delete statement is called

	--statement
END


