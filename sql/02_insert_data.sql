/*
===========================================
HR Database Management System
Sample Data Insertion Script
Author : Jayesh Bacchav
===========================================
*/

USE HR_Database;
GO

/* ==========================================
   REGIONS
========================================== */

INSERT INTO Regions (region_id, region_name)
VALUES
(1,'Europe'),
(2,'Americas'),
(3,'Asia'),
(4,'Middle East and Africa');


/* ==========================================
   COUNTRIES
========================================== */

INSERT INTO Countries (country_id, country_name, region_id)
VALUES
('US','United States',2),
('CA','Canada',2),
('UK','United Kingdom',1),
('DE','Germany',1),
('IN','India',3),
('JP','Japan',3),
('AU','Australia',3),
('AE','United Arab Emirates',4);


/* ==========================================
   LOCATIONS
========================================== */

INSERT INTO Locations
(location_id, street_address, postal_code, city, state_province, country_id)
VALUES
(1001,'5th Avenue','10001','New York','New York','US'),
(1002,'MG Road','411001','Pune','Maharashtra','IN'),
(1003,'Oxford Street','W1','London','England','UK'),
(1004,'King Street','M5H','Toronto','Ontario','CA'),
(1005,'Marienplatz','80331','Munich','Bavaria','DE'),
(1006,'Shibuya','1500002','Tokyo','Tokyo','JP'),
(1007,'Sheikh Zayed Road','00000','Dubai','Dubai','AE');


/* ==========================================
   DEPARTMENTS
========================================== */

INSERT INTO Departments
(department_id, department_name, location_id)
VALUES
(10,'Human Resources',1002),
(20,'Finance',1001),
(30,'Sales',1003),
(40,'Marketing',1004),
(50,'IT',1002),
(60,'Operations',1005);


/* ==========================================
   JOBS
========================================== */

INSERT INTO Jobs
(job_id, job_title, min_salary, max_salary)
VALUES
(101,'HR Manager',50000,90000),
(102,'HR Executive',30000,50000),
(103,'Software Engineer',50000,120000),
(104,'Senior Software Engineer',80000,150000),
(105,'Finance Analyst',45000,90000),
(106,'Sales Executive',30000,70000),
(107,'Marketing Executive',30000,70000),
(108,'Data Analyst',50000,100000),
(109,'Project Manager',90000,180000),
(110,'Database Administrator',70000,140000);


/* ==========================================
   EMPLOYEES
========================================== */

INSERT INTO Employees
(employee_id, first_name, last_name, email, phone_number,
hire_date, job_id, salary, manager_id, department_id)
VALUES
(1001,'Jay','Sharma','jay.sharma@company.com','9876543210',
'2020-01-15',109,150000,NULL,50),

(1002,'Priya','Patil','priya.patil@company.com','9876543211',
'2021-03-20',108,70000,1001,50),

(1003,'Amit','Verma','amit.verma@company.com','9876543212',
'2022-07-11',103,65000,1001,50),

(1004,'Sneha','Kulkarni','sneha.kulkarni@company.com','9876543213',
'2021-11-09',105,72000,1001,20),

(1005,'Rahul','Joshi','rahul.joshi@company.com','9876543214',
'2019-05-18',101,85000,NULL,10),

(1006,'Neha','Mehta','neha.mehta@company.com','9876543215',
'2022-09-01',102,42000,1005,10),

(1007,'Karan','Singh','karan.singh@company.com','9876543216',
'2020-04-15',106,48000,NULL,30),

(1008,'Pooja','Deshmukh','pooja.deshmukh@company.com','9876543217',
'2023-01-10',107,46000,NULL,40),

(1009,'Rohan','Patel','rohan.patel@company.com','9876543218',
'2022-02-15',110,90000,1001,50),

(1010,'Anjali','Gupta','anjali.gupta@company.com','9876543219',
'2023-05-05',108,65000,1001,50);


/* ==========================================
   DEPENDENTS
========================================== */

INSERT INTO Dependents
(dependent_id, first_name, last_name, relationship, employee_id)
VALUES
(1,'Aarav','Sharma','Son',1001),
(2,'Anaya','Patil','Daughter',1002),
(3,'Riya','Verma','Spouse',1003),
(4,'Aditya','Joshi','Son',1005),
(5,'Meera','Mehta','Daughter',1006);
