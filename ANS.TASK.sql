--•	Create a new database named "CompanyDB."
CREATE DATABASE CompanyDB
USE CompanyDB
--•	Create a schema named "Sales" within the "CompanyDB" database.
CREATE SCHEMA Sales

--•	Create a table named "employees" with columns: employee_id (INT), first_name (VARCHAR), last_name (VARCHAR), and salary (DECIMAL) within the "Sales" schema.
CREATE TABLE Sales.employees(
  employee_id INT DEFAULT(NEXT VALUE FOR j),
  first_name VARCHAR,
  last_name VARCHAR,
  salary DECIMAL
)
--Note: on employee_id use squence NOT identity.
CREATE SEQUENCE j 
   AS INT
   START WITH 1 
   INCREMENT BY 1

--•	Alter the "employees" table to add a new column named "hire_date" with the data type DATE.
ALTER TABLE Sales.employees
ADD hire_date DATE

--•	Select all columns from the "employees" table.
select * 
from Sales.employees

--•	Retrieve only the "first_name" and "last_name" columns from the "employees" table.
select first_name,last_name
from Sales.employees

--•	Retrieve “full name” as a one column from "first_name" and "last_name" columns from the "employees" table.
select first_name+' '+last_name fullName
from Sales.employees

--•	Show the average salary of all employees. (search)
select AVG(salary) AverageSalary
from Sales.employees
--•	Select employees whose salary is greater than 50000.
select  first_name,last_name,salary
from Sales.employees
where salary>50000

--•	Retrieve employees hired in the year 2020.
select first_name,last_name,hire_date
from Sales.employees
where hire_date=2020

--•	List employees whose last names start with 'S.'
select first_name,last_name
from Sales.employees
where last_name like 'S%'

--•	Display the top 10 highest-paid employees.
select top 10 first_name,last_name,salary
from Sales.employees
order by salary desc

--•	Find employees with salaries between 40000 and 60000.
select first_name,last_name,salary
from Sales.employees
where salary between 40000 and 60000

--•	Show employees with names containing the substring 'man.'
select first_name+' '+last_name AS fullName
from Sales.employees
where first_name like'man' or last_name like'man'

--•	Display employees with a NULL value in the "hire_date" column.
select first_name,last_name,hire_date
from Sales.employees
where hire_date is null
--•	Select employees with a salary in the set (40000, 45000, 50000).
select first_name,last_name,employee_id,salary
from Sales.employees
where salary=40000 or salary=45000 or salary=50000
                       --or
					        select first_name,last_name,employee_id,salary
                            from Sales.employees
                            where salary in(40000-45000,50000)
--•	Retrieve employees hired between '2020-01-01' and '2021-01-01.'
select employee_id,first_name,last_name,hire_date
from Sales.employees
where hire_date between '2020-01-01' and '2021-01-01'

--•	List employees with salaries in descending order.
select first_name,last_name,employee_id
from Sales.employees
order by salary desc

--•	Show the first 5 employees ordered by "last_name" in ascending order.
select top 5 first_name,last_name,salary
from Sales.employees
order by last_name

--•	Display employees with a salary greater than 55000 and hired in 2020.****
select first_name,last_name,salary
from Sales.employees
where salary>55000 and hire_date='2020'
--•	Select employees whose first name is 'John' or 'Jane.'
select first_name,last_name
from Sales.employees
where first_name in('John','Jane')
--•	List employees with a salary less than or equal to 55000 and a hire date after '2022-01-01.'
select first_name,last_name,salary,hire_date
from Sales.employees
where salary<=55000 AND hire_date>'2022-01-01'

--•	Retrieve employees with a salary greater than the average salary.
select first_name,last_name,salary
from Sales.employees
WHERE Salary > (SELECT AVG(Salary) FROM Sales.employees);
--•	Display the 3rd to 7th highest-paid employees.
select first_name,last_name,salary
from Sales.employees
order by salary desc
OFFSET 2 rows 
fetch next 5 rows only 

--•	List employees hired after '2021-01-01' in alphabetical order.
select first_name+' '+last_name EmployeeName,hire_date
from Sales.employees
where hire_date>'2021-01-01'
order by EmployeeName
--•	Retrieve employees with a salary greater than 50000 and last name not starting with 'A.'
select *
from Sales.employees
where salary>50000 and last_name NOT LIKE 'A%'

--•	Display employees with a salary that is not NULL.
select *
from Sales.employees
where salary is not null

--•	Show employees with names containing 'e' or 'i' and a salary greater than 45000.
select *
from Sales.employees
where first_name like'%[ei]%' and salary>45000
                         --or
						 select *
						 from Sales.employees
						 where first_name like '%e%' or first_name like '%i%' AND salary>45000
