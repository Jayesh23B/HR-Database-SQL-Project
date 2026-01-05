 --* HR DATABASE MANAGEMENT SYSTEM - CLEAN SETUP SCRIPT
 --* Database  : HR_DB
 --* Schema    : regions, countries, locations, jobs, departments, employees, dependents
---------------------------------------------------
-- 0. CREATE DATABASE
---------------------------------------------------
IF DB_ID('HR_DB') IS NULL
BEGIN
    CREATE DATABASE HR_DB;
END;
GO

USE HR_DB;
GO

---------------------------------------------------
-- 1. DROP TABLES IF THEY ALREADY EXIST (CORRECT ORDER)
---------------------------------------------------
IF OBJECT_ID('dbo.dependents', 'U') IS NOT NULL
    DROP TABLE dbo.dependents;

IF OBJECT_ID('dbo.employees', 'U') IS NOT NULL
    DROP TABLE dbo.employees;

IF OBJECT_ID('dbo.departments', 'U') IS NOT NULL
    DROP TABLE dbo.departments;

IF OBJECT_ID('dbo.jobs', 'U') IS NOT NULL
    DROP TABLE dbo.jobs;

IF OBJECT_ID('dbo.locations', 'U') IS NOT NULL
    DROP TABLE dbo.locations;

IF OBJECT_ID('dbo.countries', 'U') IS NOT NULL
    DROP TABLE dbo.countries;

IF OBJECT_ID('dbo.regions', 'U') IS NOT NULL
    DROP TABLE dbo.regions;
GO


/************************************************************************************
 * 2. TABLE CREATION
 ************************************************************************************/

---------------------------------------------------
-- 2.1 regions
---------------------------------------------------
CREATE TABLE regions (
    region_id   INT PRIMARY KEY,
    region_name VARCHAR(25) DEFAULT NULL
);
GO

---------------------------------------------------
-- 2.2 countries
---------------------------------------------------
CREATE TABLE countries (
    country_id   CHAR(2) PRIMARY KEY,
    country_name VARCHAR(40) DEFAULT NULL,
    region_id    INT NOT NULL,
    FOREIGN KEY (region_id)
        REFERENCES regions (region_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
GO

---------------------------------------------------
-- 2.3 locations
---------------------------------------------------
CREATE TABLE locations (
    location_id    INT PRIMARY KEY,
    street_address VARCHAR(40) DEFAULT NULL,
    postal_code    VARCHAR(12) DEFAULT NULL,
    city           VARCHAR(30) NOT NULL,
    state_province VARCHAR(25) DEFAULT NULL,
    country_id     CHAR(2) NOT NULL,
    FOREIGN KEY (country_id)
        REFERENCES countries (country_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
GO

---------------------------------------------------
-- 2.4 jobs
---------------------------------------------------
CREATE TABLE jobs (
    job_id     INT PRIMARY KEY,
    job_title  VARCHAR(35) NOT NULL,
    min_salary DECIMAL(8,2) DEFAULT NULL,
    max_salary DECIMAL(8,2) DEFAULT NULL
);
GO
---------------------------------------------------
-- 2.5 departments
---------------------------------------------------
CREATE TABLE departments (
    department_id   INT PRIMARY KEY,
    department_name VARCHAR(30) NOT NULL,
    location_id     INT DEFAULT NULL,
    FOREIGN KEY (location_id)
        REFERENCES locations (location_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
GO
---------------------------------------------------
-- 2.6 employees
---------------------------------------------------
CREATE TABLE employees (
    employee_id   INT PRIMARY KEY,
    first_name    VARCHAR(20) DEFAULT NULL,
    last_name     VARCHAR(25) NOT NULL,
    email         VARCHAR(100) NOT NULL,
    phone_number  VARCHAR(20) DEFAULT NULL,
    hire_date     DATE NOT NULL,
    job_id        INT NOT NULL,
    salary        DECIMAL(8,2) NOT NULL,
    manager_id    INT DEFAULT NULL,
    department_id INT DEFAULT NULL,
    FOREIGN KEY (job_id)
        REFERENCES jobs (job_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (department_id)
        REFERENCES departments (department_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (manager_id)
        REFERENCES employees (employee_id)
);
GO

---------------------------------------------------
-- 2.7 dependents
---------------------------------------------------
CREATE TABLE dependents (
    dependent_id INT PRIMARY KEY,
    first_name   VARCHAR(50) NOT NULL,
    last_name    VARCHAR(50) NOT NULL,
    relationship VARCHAR(25) NOT NULL,
    employee_id  INT NOT NULL,
    CONSTRAINT FK_dependents_employees
        FOREIGN KEY (employee_id)
        REFERENCES employees(employee_id)
);
GO


/************************************************************************************
 * 3. DATA INSERTION
 ************************************************************************************/

---------------------------------------------------
-- 3.1 regions data
---------------------------------------------------
INSERT INTO regions(region_id,region_name) VALUES (1,'Europe');
INSERT INTO regions(region_id,region_name) VALUES (2,'Americas');
INSERT INTO regions(region_id,region_name) VALUES (3,'Asia');
INSERT INTO regions(region_id,region_name) VALUES (4,'Middle East and Africa');
GO

---------------------------------------------------
-- 3.2 countries data
---------------------------------------------------
INSERT INTO countries(country_id,country_name,region_id) VALUES ('AR','Argentina',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('AU','Australia',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('BE','Belgium',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('BR','Brazil',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('CA','Canada',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('CH','Switzerland',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('CN','China',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('DE','Germany',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('DK','Denmark',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('EG','Egypt',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('FR','France',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('HK','HongKong',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('IL','Israel',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('IN','India',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('IT','Italy',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('JP','Japan',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('KW','Kuwait',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('MX','Mexico',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('NG','Nigeria',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('NL','Netherlands',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('SG','Singapore',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('UK','United Kingdom',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('US','United States of America',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('ZM','Zambia',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('ZW','Zimbabwe',4);
GO

---------------------------------------------------
-- 3.3 locations data
---------------------------------------------------
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
VALUES (1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US');

INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
VALUES (1500,'2011 Interiors Blvd','99236','South San Francisco','California','US');

INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
VALUES (1700,'2004 Charade Rd','98199','Seattle','Washington','US');

INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
VALUES (1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA');

INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
VALUES (2400,'8204 Arthur St',NULL,'London',NULL,'UK');

INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
VALUES (2500,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK');

INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
VALUES (2700,'Schwanthalerstr. 7031','80925','Munich','Bavaria','DE');
GO

---------------------------------------------------
-- 3.4 jobs data
---------------------------------------------------
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (1,'Public Accountant',4200.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (2,'Accounting Manager',8200.00,16000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (3,'Administration Assistant',3000.00,6000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (4,'President',20000.00,40000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (5,'Administration Vice President',15000.00,30000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (6,'Accountant',4200.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (7,'Finance Manager',8200.00,16000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (8,'Human Resources Representative',4000.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (9,'Programmer',4000.00,10000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (10,'Marketing Manager',9000.00,15000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (11,'Marketing Representative',4000.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (12,'Public Relations Representative',4500.00,10500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (13,'Purchasing Clerk',2500.00,5500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (14,'Purchasing Manager',8000.00,15000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (15,'Sales Manager',10000.00,20000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (16,'Sales Representative',6000.00,12000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (17,'Shipping Clerk',2500.00,5500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (18,'Stock Clerk',2000.00,5000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (19,'Stock Manager',5500.00,8500.00);
GO

---------------------------------------------------
-- 3.5 departments data
---------------------------------------------------
INSERT INTO departments(department_id,department_name,location_id) VALUES (1,'Administration',1700);
INSERT INTO departments(department_id,department_name,location_id) VALUES (2,'Marketing',1800);
INSERT INTO departments(department_id,department_name,location_id) VALUES (3,'Purchasing',1700);
INSERT INTO departments(department_id,department_name,location_id) VALUES (4,'Human Resources',2400);
INSERT INTO departments(department_id,department_name,location_id) VALUES (5,'Shipping',1500);
INSERT INTO departments(department_id,department_name,location_id) VALUES (6,'IT',1400);
INSERT INTO departments(department_id,department_name,location_id) VALUES (7,'Public Relations',2700);
INSERT INTO departments(department_id,department_name,location_id) VALUES (8,'Sales',2500);
INSERT INTO departments(department_id,department_name,location_id) VALUES (9,'Executive',1700);
INSERT INTO departments(department_id,department_name,location_id) VALUES (10,'Finance',1700);
INSERT INTO departments(department_id,department_name,location_id) VALUES (11,'Accounting',1700);
GO

---------------------------------------------------
-- 3.6 employees data (subset that covers all dependents + managers)
---------------------------------------------------
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (100,'Steven','King','steven.king@sqltutorial.org','515.123.4567','1987-06-17',4,24000.00,NULL,9);

INSERT INTO employees VALUES
(101,'Neena','Kochhar','neena.kochhar@sqltutorial.org','515.123.4568','1989-09-21',5,17000.00,100,9),
(102,'Lex','De Haan','lex.de haan@sqltutorial.org','515.123.4569','1993-01-13',5,17000.00,100,9),
(103,'Alexander','Hunold','alexander.hunold@sqltutorial.org','590.423.4567','1990-01-03',9,9000.00,102,6),
(104,'Bruce','Ernst','bruce.ernst@sqltutorial.org','590.423.4568','1991-05-21',9,6000.00,103,6),
(105,'David','Austin','david.austin@sqltutorial.org','590.423.4569','1997-06-25',9,4800.00,103,6),
(106,'Valli','Pataballa','valli.pataballa@sqltutorial.org','590.423.4560','1998-02-05',9,4800.00,103,6),
(107,'Diana','Lorentz','diana.lorentz@sqltutorial.org','590.423.5567','1999-02-07',9,4200.00,103,6),
(108,'Nancy','Greenberg','nancy.greenberg@sqltutorial.org','515.124.4569','1994-08-17',7,12000.00,101,10),
(109,'Daniel','Faviet','daniel.faviet@sqltutorial.org','515.124.4169','1994-08-16',6,9000.00,108,10),
(110,'John','Chen','john.chen@sqltutorial.org','515.124.4269','1997-09-28',6,8200.00,108,10),
(111,'Ismael','Sciarra','ismael.sciarra@sqltutorial.org','515.124.4369','1997-09-30',6,7700.00,108,10),
(112,'Jose Manuel','Urman','jose manuel.urman@sqltutorial.org','515.124.4469','1998-03-07',6,7800.00,108,10),
(113,'Luis','Popp','luis.popp@sqltutorial.org','515.124.4567','1999-12-07',6,6900.00,108,10),
(114,'Den','Raphaely','den.raphaely@sqltutorial.org','515.127.4561','1994-12-07',14,11000.00,100,3),
(115,'Alexander','Khoo','alexander.khoo@sqltutorial.org','515.127.4562','1995-05-18',13,3100.00,114,3),
(116,'Shelli','Baida','shelli.baida@sqltutorial.org','515.127.4563','1997-12-24',13,2900.00,114,3),
(117,'Sigal','Tobias','sigal.tobias@sqltutorial.org','515.127.4564','1997-07-24',13,2800.00,114,3),
(118,'Guy','Himuro','guy.himuro@sqltutorial.org','515.127.4565','1998-11-15',13,2600.00,114,3),
(119,'Karen','Colmenares','karen.colmenares@sqltutorial.org','515.127.4566','1999-08-10',13,2500.00,114,3),
(120,'Matthew','Weiss','matthew.weiss@sqltutorial.org','650.123.1234','1996-07-18',19,8000.00,100,5),
(121,'Adam','Fripp','adam.fripp@sqltutorial.org','650.123.2234','1997-04-10',19,8200.00,100,5),
(122,'Payam','Kaufling','payam.kaufling@sqltutorial.org','650.123.3234','1995-05-01',19,7900.00,100,5),
(123,'Shanta','Vollman','shanta.vollman@sqltutorial.org','650.123.4234','1997-10-10',19,6500.00,100,5),
(126,'Irene','Mikkilineni','irene.mikkilineni@sqltutorial.org','650.124.1224','1998-09-28',18,2700.00,120,5),
(145,'John','Russell','john.russell@sqltutorial.org',NULL,'1996-10-01',15,14000.00,100,8),
(146,'Karen','Partners','karen.partners@sqltutorial.org',NULL,'1997-01-05',15,13500.00,100,8),
(176,'Jonathon','Taylor','jonathon.taylor@sqltutorial.org',NULL,'1998-03-24',16,8600.00,100,8),
(177,'Jack','Livingston','jack.livingston@sqltutorial.org',NULL,'1998-04-23',16,8400.00,100,8),
(178,'Kimberely','Grant','kimberely.grant@sqltutorial.org',NULL,'1999-05-24',16,7000.00,100,8),
(179,'Charles','Johnson','charles.johnson@sqltutorial.org',NULL,'2000-01-04',16,6200.00,100,8),
(192,'Sarah','Bell','sarah.bell@sqltutorial.org','650.501.1876','1996-02-04',17,4000.00,123,5),
(193,'Britney','Everett','britney.everett@sqltutorial.org','650.501.2876','1997-03-03',17,3900.00,123,5),
(200,'Jennifer','Whalen','jennifer.whalen@sqltutorial.org','515.123.4444','1987-09-17',3,4400.00,101,1),
(201,'Michael','Hartstein','michael.hartstein@sqltutorial.org','515.123.5555','1996-02-17',10,13000.00,100,2),
(202,'Pat','Fay','pat.fay@sqltutorial.org','603.123.6666','1997-08-17',11,6000.00,201,2),
(203,'Susan','Mavris','susan.mavris@sqltutorial.org','515.123.7777','1994-06-07',8,6500.00,101,4),
(204,'Hermann','Baer','hermann.baer@sqltutorial.org','515.123.8888','1994-06-07',12,10000.00,101,7),
(205,'Shelley','Higgins','shelley.higgins@sqltutorial.org','515.123.8080','1994-06-07',2,12000.00,101,11);
GO
---------------------------------------------------
-- 3.7 dependents data (FOREIGN KEYS FIXED: NO 206)
---------------------------------------------------
TRUNCATE TABLE dependents;
GO

INSERT INTO dependents (dependent_id, first_name, last_name, relationship, employee_id) 
VALUES (1, 'Penelope', 'Gietz', 'Child', 205);  -- 206 from PDF fixed to 205

INSERT INTO dependents VALUES
(2,'Nick','Higgins','Child',205),
(3,'Ed','Whalen','Child',200),
(4,'Jennifer','King','Child',100),
(5,'Johnny','Kochhar','Child',101),
(6,'Bette','De Haan','Child',102),
(7,'Grace','Faviet','Child',109),
(8,'Matthew','Chen','Child',110),
(9,'Joe','Sciarra','Child',111),
(10,'Christian','Urman','Child',112),
(11,'Zero','Popp','Child',113),
(12,'Karl','Greenberg','Child',108),
(13,'Uma','Mavris','Child',203),
(14,'Vivien','Hunold','Child',103),
(15,'Cuba','Ernst','Child',104),
(16,'Fred','Austin','Child',105),
(17,'Helen','Pataballa','Child',106),
(18,'Dan','Lorentz','Child',107),
(19,'Bob','Hartstein','Child',201),
(20,'Lucille','Fay','Child',202),
(21,'Kirsten','Baer','Child',204),
(22,'Elvis','Khoo','Child',115),
(23,'Sandra','Baida','Child',116),
(24,'Cameron','Tobias','Child',117),
(25,'Kevin','Himuro','Child',118),
(26,'Rip','Colmenares','Child',119),
(27,'Julia','Raphaely','Child',114),
(28,'Woody','Russell','Child',145),
(29,'Alec','Partners','Child',146),
(30,'Sandra','Taylor','Child',176);
GO
-- Check counts
SELECT COUNT(*) AS Total_Employees  FROM employees;
SELECT COUNT(*) AS Total_Dependents FROM dependents;
-- Check that all dependents have a matching employee
SELECT d.dependent_id, d.employee_id
FROM dependents d
LEFT JOIN employees e ON d.employee_id = e.employee_id
WHERE e.employee_id IS NULL;
GO

/************************************************************************************
 * HR DATABASE MANAGEMENT SYSTEM - TASK 1: COMPLETE SOLUTION SCRIPT
 * Topic: SELECT, ORDER BY, DISTINCT, TOP N, WHERE, ALTER TABLE, FOREIGN KEY
 ************************************************************************************/
USE HR_DB;  
GO
/************************************************************************************
 * 1. SELECT STATEMENTS
 ************************************************************************************/
---------------------------------------------------
-- 1A) Get data from ALL rows and columns in the employees table
---------------------------------------------------
SELECT *
FROM employees;
GO
---------------------------------------------------
-- 1B) Get employee_id, first_name, last_name, hire_date of all employees
---------------------------------------------------
SELECT
    employee_id,
    first_name,
    last_name,
    hire_date
FROM employees;
GO
---------------------------------------------------
-- 1C) Get first_name, last_name, salary, and a calculated new salary
--     (Example: new salary = salary + 10%)
---------------------------------------------------
SELECT
    first_name,
    last_name,
    salary,
    salary * 1.10 AS new_salary
FROM employees;
GO
---------------------------------------------------
-- 1D) Get first_name, last_name, salary and salary doubled as New_SALARY
---------------------------------------------------
SELECT
    first_name,
    last_name,
    salary,
    salary * 2 AS New_SALARY
FROM employees;
GO
/************************************************************************************
 * 2. ORDER BY STATEMENTS
 ************************************************************************************/
---------------------------------------------------
-- 2A) Return employee_id, first_name, last_name, hire_date, salary
---------------------------------------------------
SELECT
    employee_id,
    first_name,
    last_name,
    hire_date,
    salary
FROM employees
ORDER BY employee_id;
GO

---------------------------------------------------
-- 2B) Sort employees by first_name in alphabetical order
---------------------------------------------------
SELECT
    employee_id,
    first_name,
    last_name,
    hire_date,
    salary
FROM employees
ORDER BY first_name ASC;
GO

---------------------------------------------------
-- 2C) Sort employees by first_name ASC and last_name DESC
---------------------------------------------------
SELECT
    employee_id,
    first_name,
    last_name,
    hire_date,
    salary
FROM employees
ORDER BY first_name ASC, last_name DESC;
GO
---------------------------------------------------
-- 2D) Sort employees by salary from high to low
---------------------------------------------------
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM employees
ORDER BY salary DESC;
GO
---------------------------------------------------
-- 2E) Sort employees by hire_date from oldest to newest
---------------------------------------------------
SELECT
    employee_id,
    first_name,
    last_name,
    hire_date
FROM employees
ORDER BY hire_date ASC;
GO
---------------------------------------------------
-- 2F) Sort employees by hire_date from newest to oldest
---------------------------------------------------
SELECT
    employee_id,
    first_name,
    last_name,
    hire_date
FROM employees
ORDER BY hire_date DESC;
GO
/************************************************************************************
 * 3. DISTINCT STATEMENTS
 ************************************************************************************/
---------------------------------------------------
-- 3A) Select salary values and sort from high to low
---------------------------------------------------
SELECT
    salary
FROM employees
ORDER BY salary DESC;
GO
---------------------------------------------------
-- 3B) Select UNIQUE salary values from employees
---------------------------------------------------
SELECT DISTINCT
    salary
FROM employees
ORDER BY salary DESC;
GO
---------------------------------------------------
-- 3C) Select job_id and salary from employees
---------------------------------------------------
SELECT
    job_id,
    salary
FROM employees;
GO
---------------------------------------------------
-- 3D) Remove duplicate combinations of job_id and salary
---------------------------------------------------
SELECT DISTINCT
    job_id,
    salary
FROM employees;
GO

---------------------------------------------------
-- 3E) Return DISTINCT phone numbers of employees
---------------------------------------------------
SELECT DISTINCT
    phone_number
FROM employees;
GO
/************************************************************************************
 * 4. TOP N STATEMENTS
 ************************************************************************************/
---------------------------------------------------
-- 4A) Return ALL rows in employees sorted by first_name
---------------------------------------------------
SELECT *
FROM employees
ORDER BY first_name;
GO
---------------------------------------------------
-- 4B) Return the FIRST 5 rows after sorting by first_name
---------------------------------------------------
SELECT TOP (5) *
FROM employees
ORDER BY first_name;
GO
---------------------------------------------------
-- 4C) Return 5 rows starting from the 4th row (after sorting by first_name)
---------------------------------------------------
SELECT *
FROM employees
ORDER BY first_name
OFFSET 3 ROWS        -- skip first 3 rows (start from row 4)
FETCH NEXT 5 ROWS ONLY;
GO
---------------------------------------------------
-- 4D) Get the TOP 5 employees with the HIGHEST salaries
---------------------------------------------------
SELECT TOP (5) *
FROM employees
ORDER BY salary DESC;
GO
---------------------------------------------------
-- 4E) Get employees who have the 2nd highest salary in the company
---------------------------------------------------
SELECT *
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE salary < (SELECT MAX(salary) FROM employees)
);
GO
/************************************************************************************
 * 5. WHERE CLAUSE AND COMPARISON OPERATORS
 ************************************************************************************/
---------------------------------------------------
-- 5A) Employees with salaries > 14000 (sorted by salary DESC)
---------------------------------------------------
SELECT *
FROM employees
WHERE salary > 14000
ORDER BY salary DESC;
GO
---------------------------------------------------
-- 5B) Employees who work in department_id = 5
---------------------------------------------------
SELECT *
FROM employees
WHERE department_id = 5;
GO
---------------------------------------------------
-- 5C) Employee whose last_name is 'Chen'
---------------------------------------------------
SELECT *
FROM employees
WHERE last_name = 'Chen';
GO
---------------------------------------------------
-- 5D) Employees who joined AFTER 1st January 1999
---------------------------------------------------
SELECT *
FROM employees
WHERE hire_date > '1999-01-01';
GO
---------------------------------------------------
-- 5E) Employees who joined in the year 1999
---------------------------------------------------
SELECT *
FROM employees
WHERE hire_date BETWEEN '1999-01-01' AND '1999-12-31';
GO
---------------------------------------------------
-- 5F) Employee whose last_name is 'Himuro'
---------------------------------------------------
SELECT *
FROM employees
WHERE last_name = 'Himuro';
GO
---------------------------------------------------
-- 5G) Search for the string 'Himuro' in last_name
---------------------------------------------------
SELECT *
FROM employees
WHERE last_name LIKE '%Himuro%';
GO
---------------------------------------------------
-- 5H) Employees who do NOT have phone numbers
---------------------------------------------------
SELECT *
FROM employees
WHERE phone_number IS NULL;
GO
---------------------------------------------------
-- 5I) Employees whose department_id is NOT 8
---------------------------------------------------
SELECT *
FROM employees
WHERE department_id <> 8;
GO
---------------------------------------------------
-- 5J) Employees whose department_id is NOT 8 and NOT 10
---------------------------------------------------
SELECT *
FROM employees
WHERE department_id NOT IN (8, 10);
GO
---------------------------------------------------
-- 5K) Employees whose salary is greater than 10000
---------------------------------------------------
SELECT *
FROM employees
WHERE salary > 10000;
GO
---------------------------------------------------
-- 5L) Employees in department 8 AND salary > 10000
---------------------------------------------------
SELECT *
FROM employees
WHERE department_id = 8
  AND salary > 10000;
GO
---------------------------------------------------
-- 5M) Employees whose salaries are LESS than 10000
---------------------------------------------------
SELECT *
FROM employees
WHERE salary < 10000;
GO
---------------------------------------------------
-- 5N) Employees whose salaries are GREATER THAN or EQUAL to 9000
---------------------------------------------------
SELECT *
FROM employees
WHERE salary >= 9000;
GO
---------------------------------------------------
-- 5O) Employees whose salaries are LESS THAN or EQUAL to 9000
---------------------------------------------------
SELECT *
FROM employees
WHERE salary <= 9000;
GO
/************************************************************************************
 * 6. ALTER TABLE (COURSES TABLE)
 * Note: Example structure used for ALTER operations
 ************************************************************************************/
---------------------------------------------------
-- 6.0) Base courses table (only needed if not already created)
---------------------------------------------------
IF OBJECT_ID('dbo.courses', 'U') IS NULL
BEGIN
    CREATE TABLE courses (
        course_id   INT PRIMARY KEY,
        course_name VARCHAR(100)
    );
END;
GO
---------------------------------------------------
-- 6A) Add a new column named credit_hours to the courses table
---------------------------------------------------
ALTER TABLE courses
ADD credit_hours INT;
GO

---------------------------------------------------
-- 6B) Add fee and max_limit columns to the courses table
---------------------------------------------------
ALTER TABLE courses
ADD fee       DECIMAL(10,2),
    max_limit INT;
GO
---------------------------------------------------
-- 6C) Change the attribute of the fee column to NOT NULL
---------------------------------------------------
ALTER TABLE courses
ALTER COLUMN fee DECIMAL(10,2) NOT NULL;
GO
---------------------------------------------------
-- 6D) Remove the fee column of the courses table
---------------------------------------------------
ALTER TABLE courses
DROP COLUMN fee;
GO
---------------------------------------------------
-- 6E) Remove the max_limit and credit_hours columns of the courses table
---------------------------------------------------
ALTER TABLE courses
DROP COLUMN max_limit,
            credit_hours;
GO

/************************************************************************************
 * 7. SQL FOREIGN KEY CONSTRAINT (projects & project_milestones)
 ************************************************************************************/
IF OBJECT_ID('dbo.projects', 'U') IS NULL
BEGIN
    CREATE TABLE projects (
        project_id   INT PRIMARY KEY,
        project_name VARCHAR(255),
        start_date   DATE NOT NULL,
        end_date     DATE NOT NULL
    );
END;
GO

IF OBJECT_ID('dbo.project_milestones', 'U') IS NULL
BEGIN
    CREATE TABLE project_milestones (
        milestone_id   INT PRIMARY KEY,
        project_id     INT,
        milestone_name VARCHAR(100)
    );
END;
GO

---------------------------------------------------
-- 7A) Add a FOREIGN KEY constraint to project_milestones
--     (to enforce relationship between projects and project_milestones)
---------------------------------------------------
IF NOT EXISTS (
    SELECT 1
    FROM sys.foreign_keys
    WHERE name = 'FK_project_milestones_projects'
      AND parent_object_id = OBJECT_ID('dbo.project_milestones')
)
BEGIN
    ALTER TABLE project_milestones
    ADD CONSTRAINT FK_project_milestones_projects
        FOREIGN KEY (project_id)
        REFERENCES projects(project_id);
END;
GO

---------------------------------------------------
-- 7B) Example of adding a FOREIGN KEY constraint
--     to an existing table (alternate name)
---------------------------------------------------
ALTER TABLE project_milestones
ADD CONSTRAINT FK_project_milestones_projects_existing
    FOREIGN KEY (project_id)
    REFERENCES projects(project_id);
/************************************************************************************
 * HR DATABASE MANAGEMENT SYSTEM - TASK 2: LOGICAL & SPECIAL OPERATORS
 * Topic: AND, OR, NOT, BETWEEN, IN, LIKE, EXISTS, ALL, AVG, etc.
 ************************************************************************************/
USE HR_DB;  
GO
/************************************************************************************
 * PART 1: BASIC LOGICAL OPERATORS (AND, OR, NOT) & SIMPLE FILTERS
 ************************************************************************************/
---------------------------------------------------
-- 1A) Find all employees whose salaries are > 5000 AND < 7000
---------------------------------------------------
SELECT *
FROM employees
WHERE salary > 5000
  AND salary < 7000;
GO

---------------------------------------------------
-- 1B) Find employees whose salary is either 7000 OR 8000
---------------------------------------------------
SELECT *
FROM employees
WHERE salary IN (7000, 8000);
GO
---------------------------------------------------
-- 1C) Find all employees who do NOT have a phone number
---------------------------------------------------
SELECT *
FROM employees
WHERE phone_number IS NULL;
GO
---------------------------------------------------
-- 1D) Find all employees whose salaries are BETWEEN 9000 AND 12000
---------------------------------------------------
SELECT *
FROM employees
WHERE salary BETWEEN 9000 AND 12000;
GO
---------------------------------------------------
-- 1E) Find all employees who work in department_id 8 OR 9
---------------------------------------------------
SELECT *
FROM employees
WHERE department_id IN (8, 9);
GO
---------------------------------------------------
-- 1F) Find all employees whose first_name starts with 'Jo'
---------------------------------------------------
SELECT *
FROM employees
WHERE first_name LIKE 'Jo%';
GO
---------------------------------------------------
-- 1G) Find all employees whose first_name has 'h' as the SECOND character
---------------------------------------------------
SELECT *
FROM employees
WHERE first_name LIKE '_h%';
GO
---------------------------------------------------
-- 1H) Find all employees whose salary is greater than ALL salaries in department 8
---------------------------------------------------
SELECT *
FROM employees e
WHERE e.salary > ALL (
    SELECT salary
    FROM employees
    WHERE department_id = 8
);
GO
/************************************************************************************
 * PART 2: BETWEEN, NOT BETWEEN, DATES, AVG, EXISTS
 ************************************************************************************/
---------------------------------------------------
-- 2A) Find employees whose salary is greater than the AVERAGE salary of EVERY department
--     (salary > ALL department-wise average salaries)
---------------------------------------------------
SELECT *
FROM employees e
WHERE e.salary > ALL (
    SELECT AVG(salary)
    FROM employees
    GROUP BY department_id
);
GO
---------------------------------------------------
-- 2B) Find all employees who have dependents
---------------------------------------------------
SELECT *
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM dependents d
    WHERE d.employee_id = e.employee_id
);
GO
---------------------------------------------------
-- 2C) Find all employees whose salaries are BETWEEN 2500 AND 2900
---------------------------------------------------
SELECT *
FROM employees
WHERE salary BETWEEN 2500 AND 2900;
GO
---------------------------------------------------
-- 2D) Find all employees whose salaries are NOT in the range 2500 to 2900
---------------------------------------------------
SELECT *
FROM employees
WHERE salary NOT BETWEEN 2500 AND 2900;
GO
---------------------------------------------------
-- 2E) Find employees who joined the company BETWEEN 1999-01-01 AND 2000-12-31
---------------------------------------------------
SELECT *
FROM employees
WHERE hire_date BETWEEN '1999-01-01' AND '2000-12-31';
GO
---------------------------------------------------
-- 2F) Find employees who did NOT join the company from 1989-01-01 to 1999-12-31
---------------------------------------------------
SELECT *
FROM employees
WHERE hire_date NOT BETWEEN '1989-01-01' AND '1999-12-31';
GO
---------------------------------------------------
-- 2G) Find employees who joined the company BETWEEN 1990 and 1993
---------------------------------------------------
SELECT *
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1993-12-31';
GO
/************************************************************************************
 * PART 3: LIKE PATTERNS (%, _)
 ************************************************************************************/
---------------------------------------------------
-- 3A) Find employees whose first_name starts with 'Da'
---------------------------------------------------
SELECT *
FROM employees
WHERE first_name LIKE 'Da%';
GO
---------------------------------------------------
-- 3B) Find employees whose first_name ENDS with 'er'
---------------------------------------------------
SELECT *
FROM employees
WHERE first_name LIKE '%er';
GO
---------------------------------------------------
-- 3C) Find employees whose last_name contains 'an'
---------------------------------------------------
SELECT *
FROM employees
WHERE last_name LIKE '%an%';
GO
---------------------------------------------------
-- 3D) Retrieve employees whose first_name starts with 'Jo'
--     and is followed by AT MOST 2 characters (length 2 to 4)
---------------------------------------------------
SELECT *
FROM employees
WHERE first_name LIKE 'Jo%'
  AND LEN(first_name) <= 4;
GO
---------------------------------------------------
-- 3E) Find employees whose first_name has AT MOST 1 character
--     after any starting characters (length <= 2)
---------------------------------------------------
SELECT *
FROM employees
WHERE LEN(first_name) <= 2;
GO
---------------------------------------------------
-- 3F) Find employees whose first_name starts with 'S' but NOT 'Sh'
---------------------------------------------------
SELECT *
FROM employees
WHERE first_name LIKE 'S%'
  AND first_name NOT LIKE 'Sh%';
GO
/************************************************************************************
 * PART 4: NOT, IN, NOT IN, NOT LIKE, NOT BETWEEN
 ************************************************************************************/
---------------------------------------------------
-- 4A) Retrieve all employees who work in department_id = 5
---------------------------------------------------
SELECT *
FROM employees
WHERE department_id = 5;
GO
---------------------------------------------------
-- 4B) Employees who work in department_id = 5 AND salary is NOT greater than 5000
--     (i.e. salary <= 5000)
---------------------------------------------------
SELECT *
FROM employees
WHERE department_id = 5
  AND salary <= 5000;
GO
---------------------------------------------------
-- 4C) Get all employees who are NOT working in departments 1, 2, or 3
---------------------------------------------------
SELECT *
FROM employees
WHERE department_id NOT IN (1, 2, 3);
GO
---------------------------------------------------
-- 4D) Retrieve all employees whose first_name does NOT start with 'D'
---------------------------------------------------
SELECT *
FROM employees
WHERE first_name NOT LIKE 'D%';
GO
---------------------------------------------------
-- 4E) Get employees whose salaries are NOT between 1000 and 5000
---------------------------------------------------
SELECT *
FROM employees
WHERE salary NOT BETWEEN 1000 AND 5000;
GO
/************************************************************************************
 * PART 5: EXISTS / NOT EXISTS, NULL / NOT NULL
 ************************************************************************************/
---------------------------------------------------
-- 5A) Get employees who do NOT have any dependents
---------------------------------------------------
SELECT *
FROM employees e
WHERE NOT EXISTS (
    SELECT 1
    FROM dependents d
    WHERE d.employee_id = e.employee_id
);
GO
---------------------------------------------------
-- 5B) Find all employees who do NOT have phone numbers
---------------------------------------------------
SELECT *
FROM employees
WHERE phone_number IS NULL;
GO
---------------------------------------------------
-- 5C) Find all employees who DO have phone numbers
---------------------------------------------------
SELECT *
FROM employees
WHERE phone_number IS NOT NULL;
GO
/************************************************************************************
 * HR DATABASE MANAGEMENT SYSTEM - TASK 3: JOINS
 ************************************************************************************/
USE HR_DB;  -- Ensure we are working in the correct database
GO
/************************************************************************************
 * PART 1: INNER JOIN (employees, departments, jobs)
 ************************************************************************************/
---------------------------------------------------
-- 1A) Get the information of departments with id 1, 2, and 3
---------------------------------------------------
SELECT
    d.department_id,
    d.department_name,
    l.location_id,
    l.city,
    l.state_province,
    l.country_id
FROM departments AS d
INNER JOIN locations AS l
    ON d.location_id = l.location_id
WHERE d.department_id IN (1, 2, 3);
GO
---------------------------------------------------
-- 1B) Get the information of employees who work in departments 1, 2, and 3
---------------------------------------------------
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    e.email,
    e.hire_date,
    e.salary,
    d.department_id,
    d.department_name
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
WHERE d.department_id IN (1, 2, 3);
GO
---------------------------------------------------
-- 1C) Get first_name, last_name, job_title, department_name
---------------------------------------------------
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    j.job_title,
    d.department_name
FROM employees AS e
INNER JOIN jobs AS j
    ON e.job_id = j.job_id
INNER JOIN departments AS d
    ON e.department_id = d.department_id
WHERE d.department_id IN (1, 2, 3);
GO
/************************************************************************************
 * PART 2: LEFT JOIN (countries, locations)
 ************************************************************************************/
---------------------------------------------------
-- 2A) Query the country names of US, UK, and China
---------------------------------------------------
SELECT
    country_id,
    country_name
FROM countries
WHERE country_id IN ('US', 'UK', 'CN');
GO
---------------------------------------------------
-- 2B) Retrieve the locations located in the US, UK, and China
--     (locations INNER JOIN countries)
---------------------------------------------------
SELECT
    l.location_id,
    l.street_address,
    l.postal_code,
    l.city,
    l.state_province,
    c.country_id,
    c.country_name
FROM locations AS l
INNER JOIN countries AS c
    ON l.country_id = c.country_id
WHERE c.country_id IN ('US', 'UK', 'CN');
GO
---------------------------------------------------
-- 2C) Join the countries table with the locations table
---------------------------------------------------
SELECT
    c.country_id,
    c.country_name,
    l.location_id,
    l.city,
    l.state_province
FROM countries AS c
LEFT JOIN locations AS l
    ON c.country_id = l.country_id
ORDER BY c.country_id, l.location_id;
GO
---------------------------------------------------
-- 2D) Find the countries that do NOT have any locations
---------------------------------------------------
SELECT
    c.country_id,
    c.country_name
FROM countries AS c
LEFT JOIN locations AS l
    ON c.country_id = l.country_id
WHERE l.location_id IS NULL;
GO
/************************************************************************************
 * PART 3: JOIN 3 TABLES (regions, countries, locations)
 ************************************************************************************/
---------------------------------------------------
-- 3A) Join regions, countries, and locations
---------------------------------------------------
SELECT
    r.region_id,
    r.region_name,
    c.country_id,
    c.country_name,
    l.location_id,
    l.city,
    l.state_province
FROM regions AS r
INNER JOIN countries AS c
    ON r.region_id = c.region_id
LEFT JOIN locations AS l
    ON c.country_id = l.country_id
ORDER BY r.region_id, c.country_id, l.location_id;
GO
/************************************************************************************
 * PART 4: SELF JOIN (employees → managers)
 ************************************************************************************/
---------------------------------------------------
-- 4A) Show who reports to whom (SELF INNER JOIN)
---------------------------------------------------
SELECT
    e.employee_id           AS Employee_ID,
    e.first_name            AS Employee_FirstName,
    e.last_name             AS Employee_LastName,
    m.employee_id           AS Manager_ID,
    m.first_name            AS Manager_FirstName,
    m.last_name             AS Manager_LastName
FROM employees AS e
INNER JOIN employees AS m
    ON e.manager_id = m.employee_id
ORDER BY
    m.employee_id,
    e.employee_id;
GO

---------------------------------------------------
-- 4B) Include the PRESIDENT (who has no manager)
---------------------------------------------------
SELECT
    e.employee_id           AS Employee_ID,
    e.first_name            AS Employee_FirstName,
    e.last_name             AS Employee_LastName,
    e.manager_id,
    m.employee_id           AS Manager_ID,
    m.first_name            AS Manager_FirstName,
    m.last_name             AS Manager_LastName
FROM employees AS e
LEFT JOIN employees AS m
    ON e.manager_id = m.employee_id
ORDER BY
    e.employee_id;
GO
/************************************************************************************
 * HR DATABASE MANAGEMENT SYSTEM - TASK 4: GROUP BY & HAVING
 * Topic: GROUP BY with aggregate functions, and HAVING for group filtering
 ************************************************************************************/
USE HR_DB;  -- Ensure we are working in the correct database
GO
/************************************************************************************
 * PART 1: GROUP BY on employees & departments
 ************************************************************************************/
---------------------------------------------------
-- 1A) Group the values in department_id column of the employees table
---------------------------------------------------
SELECT
    department_id
FROM employees
GROUP BY department_id;
GO
---------------------------------------------------
-- 1B) Count the number of employees by department (id only)
---------------------------------------------------
SELECT
    department_id,
    COUNT(*) AS employee_count
FROM employees
GROUP BY department_id;
GO
---------------------------------------------------
-- 1C) Count the number of employees by department
---------------------------------------------------
SELECT
    d.department_id,
    d.department_name,
    COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees e
    ON d.department_id = e.department_id
GROUP BY
    d.department_id,
    d.department_name;
GO
---------------------------------------------------
-- 1D) Sort the departments by headcount (number of employees) in DESC order
---------------------------------------------------
SELECT
    d.department_id,
    d.department_name,
    COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees e
    ON d.department_id = e.department_id
GROUP BY
    d.department_id,
    d.department_name
ORDER BY
    employee_count DESC;
GO
---------------------------------------------------
-- 1E) Find departments with headcounts greater than 5
---------------------------------------------------
SELECT
    d.department_id,
    d.department_name,
    COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees e
    ON d.department_id = e.department_id
GROUP BY
    d.department_id,
    d.department_name
HAVING
    COUNT(e.employee_id) > 5;
GO
---------------------------------------------------
-- 1F) Return the MIN, MAX and AVG salary of employees in each department
---------------------------------------------------
SELECT
    d.department_id,
    d.department_name,
    MIN(e.salary) AS min_salary,
    MAX(e.salary) AS max_salary,
    AVG(e.salary) AS avg_salary
FROM departments d
LEFT JOIN employees e
    ON d.department_id = e.department_id
GROUP BY
    d.department_id,
    d.department_name;
GO
---------------------------------------------------
-- 1G) Get the TOTAL salary paid per department (SUM of salary)
---------------------------------------------------
SELECT
    d.department_id,
    d.department_name,
    SUM(e.salary) AS total_salary
FROM departments d
LEFT JOIN employees e
    ON d.department_id = e.department_id
GROUP BY
    d.department_id,
    d.department_name;
GO
---------------------------------------------------
-- 1H) Group rows by department_id AND job_id and return each group
---------------------------------------------------
SELECT
    department_id,
    job_id,
    COUNT(*)          AS employee_count,
    MIN(salary)       AS min_salary,
    MAX(salary)       AS max_salary,
    AVG(salary)       AS avg_salary
FROM employees
GROUP BY
    department_id,
    job_id;
GO
/************************************************************************************
 * PART 2: HAVING clause
 ************************************************************************************/
---------------------------------------------------
-- 2A) Get managers and their direct reports:
---------------------------------------------------
SELECT
    m.employee_id      AS manager_id,
    m.first_name       AS manager_first_name,
    m.last_name        AS manager_last_name,
    COUNT(e.employee_id) AS direct_reports
FROM employees e
INNER JOIN employees m
    ON e.manager_id = m.employee_id
GROUP BY
    m.employee_id,
    m.first_name,
    m.last_name;
GO
---------------------------------------------------
-- 2B) Find managers who have at least 5 direct reports
---------------------------------------------------
SELECT
    m.employee_id      AS manager_id,
    m.first_name       AS manager_first_name,
    m.last_name        AS manager_last_name,
    COUNT(e.employee_id) AS direct_reports
FROM employees e
INNER JOIN employees m
    ON e.manager_id = m.employee_id
GROUP BY
    m.employee_id,
    m.first_name,
    m.last_name
HAVING
    COUNT(e.employee_id) >= 5;
GO
---------------------------------------------------
-- 2C) Sum of salary per department, and select only departments
---------------------------------------------------
SELECT
    d.department_id,
    d.department_name,
    SUM(e.salary) AS total_salary
FROM departments d
INNER JOIN employees e
    ON d.department_id = e.department_id
GROUP BY
    d.department_id,
    d.department_name
HAVING
    SUM(e.salary) BETWEEN 20000 AND 30000;
GO
---------------------------------------------------
-- 2D) Find the department(s) whose LOWEST salary is greater than 10000
---------------------------------------------------
SELECT
    d.department_id,
    d.department_name,
    MIN(e.salary) AS min_salary
FROM departments d
INNER JOIN employees e
    ON d.department_id = e.department_id
GROUP BY
    d.department_id,
    d.department_name
HAVING
    MIN(e.salary) > 10000;
GO
---------------------------------------------------
-- 2E) Find departments whose AVERAGE salary is BETWEEN 5000 and 7000
---------------------------------------------------
SELECT
    d.department_id,
    d.department_name,
    AVG(e.salary) AS avg_salary
FROM departments d
INNER JOIN employees e
    ON d.department_id = e.department_id
GROUP BY
    d.department_id,
    d.department_name
HAVING
    AVG(e.salary) BETWEEN 5000 AND 7000;
GO

 /************************************************************************************
 * HR DATABASE MANAGEMENT SYSTEM - TASK 5: OTHER QUERIES
 * Topics: UNION, INTERSECT, EXISTS, CASE, UPDATE
 ************************************************************************************/

USE HR_DB;  -- Ensure we are working in the correct database
GO
/************************************************************************************
 * 1) SQL UNION OPERATOR
 * Question:
 *   Write a query to combine the first name and last name of employees and dependents.
 ************************************************************************************/
---------------------------------------------------
-- 1A) Combine first_name + last_name from employees and dependents
---------------------------------------------------
SELECT
    first_name,
    last_name,
    'Employee' AS person_type
FROM employees

UNION

SELECT
    first_name,
    last_name,
    'Dependent' AS person_type
FROM dependents;
GO
---------------------------------------------------
-- 1B) Same as above, but UNION ALL keeps duplicates 
---------------------------------------------------
-- SELECT
--     first_name,
--     last_name,
--     'Employee' AS person_type
-- FROM employees
--
-- UNION ALL
--
-- SELECT
--     first_name,
--     last_name,
--     'Dependent' AS person_type
-- FROM dependents;
-- GO
/************************************************************************************
 * 2) SQL INTERSECT OPERATOR
 *   Write a query to apply INTERSECT operator to A and B and sort by id DESC.
 ************************************************************************************/
--------------------------------------------------
-- 2A) INTERSECT example with tables A and B
---------------------------------------------------
SELECT id
FROM A

INTERSECT

SELECT id
FROM B
ORDER BY id DESC;
GO
/************************************************************************************
 * 3) SQL EXISTS OPERATOR (employees & dependents)
 * Questions:
 *   A. Find all employees who have at least one dependent.
 *   B. Find all employees who do NOT have any dependents.
 ************************************************************************************/

---------------------------------------------------
-- 3A) Employees who have at least ONE dependent
---------------------------------------------------
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    e.department_id,
    e.salary
FROM employees AS e
WHERE EXISTS (
    SELECT 1
    FROM dependents AS d
    WHERE d.employee_id = e.employee_id
);
GO
---------------------------------------------------
-- 3B) Employees who do NOT have any dependents
---------------------------------------------------
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    e.department_id,
    e.salary
FROM employees AS e
WHERE NOT EXISTS (
    SELECT 1
    FROM dependents AS d
    WHERE d.employee_id = e.employee_id
);
GO
/************************************************************************************
 * 4) SQL CASE EXPRESSION
 * Questions:
 *   A. Suppose current year is 2000. Use CASE to show work anniversaries.
 *   B. Use CASE to classify salary as Low / Average / High.
 ************************************************************************************/
---------------------------------------------------
-- 4A) Work anniversaries as of year 2000
--     Calculate years_of_service and show a label using CASE.
---------------------------------------------------
SELECT
    employee_id,
    first_name,
    last_name,
    hire_date,
    (2000 - YEAR(hire_date)) AS years_of_service,
    CASE
        WHEN (2000 - YEAR(hire_date)) >= 20 THEN '20+ Years Anniversary'
        WHEN (2000 - YEAR(hire_date)) BETWEEN 10 AND 19 THEN '10-19 Years Anniversary'
        WHEN (2000 - YEAR(hire_date)) BETWEEN 5 AND 9  THEN '5-9 Years Anniversary'
        ELSE 'Less than 5 Years'
    END AS work_anniversary_label
FROM employees;
GO
---------------------------------------------------
-- 4B) Classify salary into Low / Average / High using CASE
--     < 3000  -> 'Low'
--     3000-5000 -> 'Average'
--     > 5000 -> 'High'
---------------------------------------------------
SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    CASE
        WHEN salary < 3000 THEN 'Low'
        WHEN salary BETWEEN 3000 AND 5000 THEN 'Average'
        ELSE 'High'
    END AS salary_category
FROM employees;
GO
/************************************************************************************
 * 5) SQL UPDATE STATEMENT
 * Questions:
 *   A. Update employee id 192 (Sarah Bell) last name from 'Bell' to 'Lopez'.
 *   B. Ensure last names of children (dependents) match their parent's last_name.
 ************************************************************************************/
---------------------------------------------------
-- 5A) Update employee 192 Sarah Bell → Sarah Lopez
---------------------------------------------------
UPDATE employees
SET last_name = 'Lopez'
WHERE employee_id = 192;
GO
---------------------------------------------------
-- 5B) Make sure dependents last_name always matches parent employee last_name
---------------------------------------------------
UPDATE d
SET d.last_name = e.last_name
FROM dependents AS d
INNER JOIN employees AS e
    ON d.employee_id = e.employee_id;
GO

SELECT d.dependent_id, d.first_name, d.last_name, d.employee_id,
e.first_name AS parent_first_name, e.last_name AS parent_last_name
FROM dependents d
JOIN employees e ON d.employee_id = e.employee_id;
GO

--Task 6
USE HR_DB;   
GO
/************************************************************************************
 * A) Combine Above Two Queries Using a Subquery
 *    Find all employees who locate in the location with id = 1700
 ************************************************************************************/

SELECT
    e.employee_id,
    e.first_name,
    e.last_name
FROM employees AS e
WHERE e.department_id IN (
    SELECT d.department_id
    FROM departments AS d
    WHERE d.location_id = 1700
)
ORDER BY
    e.first_name,
    e.last_name;
GO

/************************************************************************************
 * B) Find all employees who do NOT locate at the location 1700
 ************************************************************************************/
SELECT
    e.employee_id,
    e.first_name,
    e.last_name
FROM employees AS e
WHERE e.department_id NOT IN (
    SELECT d.department_id
    FROM departments AS d
    WHERE d.location_id = 1700
)
ORDER BY
    e.first_name,
    e.last_name;
GO
/************************************************************************************
 * C) Find the employees who have the highest salary
 ************************************************************************************/
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    e.salary
FROM employees AS e
WHERE e.salary = (
    SELECT MAX(salary)
    FROM employees
);
GO
/************************************************************************************
 * D) Find all employees whose salaries are greater than the average salary of ALL employees
 ************************************************************************************/
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    e.salary
FROM employees AS e
WHERE e.salary > (
    SELECT AVG(salary)
    FROM employees
);
GO
/************************************************************************************
 * E) Find all departments which have at least one employee with salary greater than 10,000
 ************************************************************************************/
SELECT
    d.department_id,
    d.department_name
FROM departments AS d
WHERE EXISTS (
    SELECT 1
    FROM employees AS e
    WHERE e.department_id = d.department_id
      AND e.salary > 10000
);
GO
/************************************************************************************
 * F) Find all departments that do NOT have any employee with salary greater than 10,000
 ************************************************************************************/
SELECT
    d.department_id,
    d.department_name
FROM departments AS d
WHERE NOT EXISTS (
    SELECT 1
    FROM employees AS e
    WHERE e.department_id = d.department_id
      AND e.salary > 10000
);
GO
/************************************************************************************
 * G) Find the lowest salary by department
 ************************************************************************************/
SELECT
    department_id,
    MIN(salary) AS lowest_salary
FROM employees
GROUP BY
    department_id;
GO
/************************************************************************************
 * H) Find all employees whose salaries are greater than the LOWEST salary of EVERY department
 ************************************************************************************/
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    e.salary
FROM employees AS e
WHERE e.salary > ALL (
    SELECT MIN(salary) AS min_salary_per_dept
    FROM employees
    GROUP BY department_id
);
GO
/************************************************************************************
 * I) Find all employees whose salaries are greater than or equal to the HIGHEST salary of EVERY department
 ************************************************************************************/

SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    e.salary
FROM employees AS e
WHERE e.salary >= ALL (
    SELECT MAX(salary) AS max_salary_per_dept
    FROM employees
    GROUP BY department_id
);
GO
/************************************************************************************
 * J) Return the average salary of every department
 ************************************************************************************/

SELECT
    department_id,
    AVG(salary) AS avg_salary
FROM employees
GROUP BY
    department_id;
GO
/************************************************************************************
 * K) Calculate the AVERAGE of the AVERAGE salary of departments
 ************************************************************************************/
SELECT
    AVG(dept_avg_salary) AS avg_of_department_avgs
FROM (
    SELECT
        department_id,
        AVG(salary) AS dept_avg_salary
    FROM employees
    GROUP BY
        department_id
) AS dept_avgs;
GO
/************************************************************************************
 * L) Find the salaries of all employees, their overall average salary,and the DIFFERENCE between each employee's salary and the average salary
 ************************************************************************************/
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    e.salary,
    (SELECT AVG(salary) FROM employees) AS overall_avg_salary,
    e.salary - (SELECT AVG(salary) FROM employees) AS diff_from_avg
FROM employees AS e;
GO
-----------------------------------------------------------------------------------------------------------------------------------------------------


