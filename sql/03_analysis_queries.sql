/*
===========================================================
HR Database Management System
Business Analysis Queries
Author : Jayesh Bacchav
===========================================================

This script demonstrates practical SQL queries used
for HR analytics and business reporting.

Sections
1. Basic Queries
2. Aggregate Analysis
3. Join Queries
4. Intermediate Analysis
5. Advanced SQL
===========================================================
*/

USE HR_Database;
GO

/*=========================================================
SECTION 1 : BASIC QUERIES
=========================================================*/

-- 1. Display all employees

SELECT *
FROM Employees;

-----------------------------------------------------------

-- 2. Display employee names

SELECT first_name,last_name
FROM Employees;

-----------------------------------------------------------

-- 3. Employees working in IT Department

SELECT *
FROM Employees
WHERE department_id = 50;

-----------------------------------------------------------

-- 4. Employees earning more than 70000

SELECT *
FROM Employees
WHERE salary > 70000;

-----------------------------------------------------------

-- 5. Employees hired after 2022

SELECT *
FROM Employees
WHERE hire_date > '2022-01-01';

-----------------------------------------------------------

-- 6. List all departments

SELECT *
FROM Departments;

-----------------------------------------------------------

-- 7. List all jobs

SELECT *
FROM Jobs;

-----------------------------------------------------------

-- 8. Sort employees by salary

SELECT first_name,last_name,salary
FROM Employees
ORDER BY salary DESC;

-----------------------------------------------------------

-- 9. Top 5 highest paid employees

SELECT TOP 5
first_name,
last_name,
salary
FROM Employees
ORDER BY salary DESC;

-----------------------------------------------------------

-- 10. Employees working in HR

SELECT *
FROM Employees
WHERE department_id=10;



/*=========================================================
SECTION 2 : AGGREGATE ANALYSIS
=========================================================*/

-- 11. Total Employees

SELECT COUNT(*) AS TotalEmployees
FROM Employees;

-----------------------------------------------------------

-- 12. Average Salary

SELECT AVG(salary) AS AverageSalary
FROM Employees;

-----------------------------------------------------------

-- 13. Highest Salary

SELECT MAX(salary)
FROM Employees;

-----------------------------------------------------------

-- 14. Lowest Salary

SELECT MIN(salary)
FROM Employees;

-----------------------------------------------------------

-- 15. Salary Expense

SELECT SUM(salary)
FROM Employees;

-----------------------------------------------------------

-- 16. Employee Count by Department

SELECT
department_id,
COUNT(*) AS TotalEmployees
FROM Employees
GROUP BY department_id;

-----------------------------------------------------------

-- 17. Average Salary by Department

SELECT
department_id,
AVG(salary) AverageSalary
FROM Employees
GROUP BY department_id;

-----------------------------------------------------------

-- 18. Departments having more than one employee

SELECT
department_id,
COUNT(*) TotalEmployees
FROM Employees
GROUP BY department_id
HAVING COUNT(*)>1;



/*=========================================================
SECTION 3 : JOIN QUERIES
=========================================================*/

-- 19. Employee with Department

SELECT
e.first_name,
e.last_name,
d.department_name
FROM Employees e
INNER JOIN Departments d
ON e.department_id=d.department_id;

-----------------------------------------------------------

-- 20. Employee with Job Title

SELECT
e.first_name,
e.last_name,
j.job_title
FROM Employees e
JOIN Jobs j
ON e.job_id=j.job_id;

-----------------------------------------------------------

-- 21. Department with Location

SELECT
d.department_name,
l.city
FROM Departments d
JOIN Locations l
ON d.location_id=l.location_id;

-----------------------------------------------------------

-- 22. Employee with Country

SELECT
e.first_name,
c.country_name
FROM Employees e
JOIN Departments d
ON e.department_id=d.department_id
JOIN Locations l
ON d.location_id=l.location_id
JOIN Countries c
ON l.country_id=c.country_id;

-----------------------------------------------------------

-- 23. Employee and Manager

SELECT
e.first_name Employee,
m.first_name Manager
FROM Employees e
LEFT JOIN Employees m
ON e.manager_id=m.employee_id;



/*=========================================================
SECTION 4 : BUSINESS ANALYSIS
=========================================================*/

-- 24. Highest Paid Employee

SELECT TOP 1
first_name,
last_name,
salary
FROM Employees
ORDER BY salary DESC;

-----------------------------------------------------------

-- 25. Employees earning above average salary

SELECT
first_name,
salary
FROM Employees
WHERE salary>
(
SELECT AVG(salary)
FROM Employees
);

-----------------------------------------------------------

-- 26. Salary by Job Role

SELECT
j.job_title,
AVG(e.salary)
FROM Employees e
JOIN Jobs j
ON e.job_id=j.job_id
GROUP BY j.job_title;

-----------------------------------------------------------

-- 27. Hiring Trend

SELECT
YEAR(hire_date) HireYear,
COUNT(*) EmployeesJoined
FROM Employees
GROUP BY YEAR(hire_date)
ORDER BY HireYear;

-----------------------------------------------------------

-- 28. Employees with Dependents

SELECT
e.first_name,
d.relationship
FROM Employees e
JOIN Dependents d
ON e.employee_id=d.employee_id;

-----------------------------------------------------------

-- 29. Department Salary Expense

SELECT
d.department_name,
SUM(e.salary)
FROM Employees e
JOIN Departments d
ON e.department_id=d.department_id
GROUP BY d.department_name;



/*=========================================================
SECTION 5 : ADVANCED SQL
=========================================================*/

-- 30. Rank Employees by Salary

SELECT
first_name,
salary,
RANK() OVER
(
ORDER BY salary DESC
) SalaryRank
FROM Employees;

-----------------------------------------------------------

-- 31. Dense Rank

SELECT
first_name,
salary,
DENSE_RANK() OVER
(
ORDER BY salary DESC
) SalaryRank
FROM Employees;

-----------------------------------------------------------

-- 32. Row Number

SELECT
ROW_NUMBER() OVER
(
ORDER BY salary DESC
) RowNum,
first_name,
salary
FROM Employees;

-----------------------------------------------------------

-- 33. Highest Salary in Each Department

SELECT *
FROM
(
SELECT
first_name,
department_id,
salary,
ROW_NUMBER() OVER
(
PARTITION BY department_id
ORDER BY salary DESC
) rn
FROM Employees
)x
WHERE rn=1;

-----------------------------------------------------------

-- 34. Running Salary Total

SELECT
first_name,
salary,
SUM(salary) OVER
(
ORDER BY employee_id
) RunningTotal
FROM Employees;

-----------------------------------------------------------

-- 35. Employees Above Department Average

SELECT
first_name,
salary,
department_id
FROM Employees e
WHERE salary >
(
SELECT AVG(salary)
FROM Employees
WHERE department_id=e.department_id
);

-----------------------------------------------------------

-- 36. Department Employee Ranking

SELECT
department_id,
first_name,
salary,
RANK() OVER
(
PARTITION BY department_id
ORDER BY salary DESC
)
FROM Employees;

-----------------------------------------------------------

-- 37. Manager Team Size

SELECT
manager_id,
COUNT(*)
FROM Employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id;

-----------------------------------------------------------

-- 38. Employees Without Dependents

SELECT
first_name
FROM Employees
WHERE employee_id NOT IN
(
SELECT employee_id
FROM Dependents
);

-----------------------------------------------------------

-- 39. CTE Example

WITH SalaryCTE AS
(
SELECT
department_id,
AVG(salary) AvgSalary
FROM Employees
GROUP BY department_id
)

SELECT *
FROM SalaryCTE;

-----------------------------------------------------------

-- 40. Employee Count by Country

SELECT
c.country_name,
COUNT(e.employee_id)
FROM Employees e
JOIN Departments d
ON e.department_id=d.department_id
JOIN Locations l
ON d.location_id=l.location_id
JOIN Countries c
ON l.country_id=c.country_id
GROUP BY c.country_name;

GO
