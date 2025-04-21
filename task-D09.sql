
create database Company1
use Company1
go
create schema Employees
go
--1- Create a table named "Employees" with columns for ID (integer), Name (varchar), and Salary (decimal).
create table Employees.employee
(
	Em_Id int not null,
	Em_Name varchar(50),
	Em_Salary decimal(6,2)
)

-- 2-Add a new column named "Department" to the "Employees" table with data type varchar(50).
alter table Employees.employee
add Department varchar(50)

--3-Remove the "Salary" column from the "Employees" table
alter table Employees.employee
drop column Em_Salary

--4-Rename the "Department" column in the "Employees" table to "DeptName".
EXEC sp_rename 'Employees.employee.Department', 'DeptName', 'Column'

--5-Create a new table called "Projects" with columns for ProjectID (integer) and ProjectName (varchar).
create table Company1.Employees.Projects(
	Project_ID int not null,
	Project_Name varchar(50)
)

--6-Add a primary key constraint to the "Employees" table for the "ID" column.
alter table Employees.employee
add primary key(Em_Id)

alter table Employees.Projects
add primary key(Project_ID)


--7-Create a foreign key relationship between the
--"Employees" table (referencing "ID") and the "Projects" table (referencing "ProjectID").

create table Em_Projects
(
	Em_Id int,
	project_ID int,

	primary key (Em_Id,project_ID)
)


--8-Remove the foreign key relationship between "Employees" and "Projects."
drop table Em_Projects

create table Em_Projects
(
	Em_Id int,
	project_ID int,

	primary key (Em_Id,project_ID)
)


--9-Add a unique constraint to the "Name" column in the "Employees" table.
alter table Employees.employee
add CONSTRAINT Em_Name UNIQUE(Em_Name)


--10-Create a table named "Customers" with columns for CustomerID (integer), FirstName (varchar),
--LastName (varchar), and Email (varchar), and Status (varchar).

create table Customers(
	Customer_ID int,
	C_FirstName varchar(50),
	C_LastName varchar(50),
	C_Email varchar(50),
	C_Status varchar(50)
)


--11-Add a unique constraint to the combination of "FirstName" and "LastName" columns in the "Customers" table.
alter table Customers
add CONSTRAINT UN_FirstName UNIQUE(C_FirstName)

alter table Customers
add CONSTRAINT UN_LastName UNIQUE(C_LastName)


--12-Add a default value of 'Active' for the "Status" column in the "Customers" table,
--where the default value should be applied when a new record is inserted.

alter table Customers
add Constraint Status_Active Default 'Active' for C_Status


--13-Create a table named "Orders" with columns for OrderID (integer), CustomerID (integer),
--OrderDate (datetime), and TotalAmount (decimal).
create table Orders(
	Order_ID int,
	Customer_ID int,
	OrderDate datetime2,
	TotalAmount decimal(6,2)
)


--14-Add a check constraint to the "TotalAmount" column in the
--"Orders" table to ensure that it is greater than zero.
alter table Orders
ADD CONSTRAINT positive_TotalAmount check(TotalAmount > 0)


--15-Create a schema named "Sales" and move the "Orders" table into this schema.
go
create schema Sales 
go

alter schema Sales TRANSFER OBJECT::Orders


--16-Rename the "Orders" table to "SalesOrders."
EXEC sp_rename 'Sales.Orders', 'Sales_Orders'







