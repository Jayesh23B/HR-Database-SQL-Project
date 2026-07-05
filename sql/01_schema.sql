/*
===========================================
HR Database Management System
Schema Creation Script
Author : Jayesh Bacchav
Database : HR_Database
===========================================
*/

CREATE DATABASE HR_Database;
GO

USE HR_Database;
GO

-- ==========================================
-- REGIONS
-- ==========================================

CREATE TABLE Regions
(
    region_id INT PRIMARY KEY,
    region_name VARCHAR(50) NOT NULL
);

-- ==========================================
-- COUNTRIES
-- ==========================================

CREATE TABLE Countries
(
    country_id CHAR(2) PRIMARY KEY,
    country_name VARCHAR(50) NOT NULL,
    region_id INT NOT NULL,

    CONSTRAINT FK_Countries_Regions
        FOREIGN KEY(region_id)
        REFERENCES Regions(region_id)
);

-- ==========================================
-- LOCATIONS
-- ==========================================

CREATE TABLE Locations
(
    location_id INT PRIMARY KEY,
    street_address VARCHAR(100),
    postal_code VARCHAR(20),
    city VARCHAR(50) NOT NULL,
    state_province VARCHAR(50),
    country_id CHAR(2) NOT NULL,

    CONSTRAINT FK_Locations_Countries
        FOREIGN KEY(country_id)
        REFERENCES Countries(country_id)
);

-- ==========================================
-- DEPARTMENTS
-- ==========================================

CREATE TABLE Departments
(
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL,
    location_id INT NOT NULL,

    CONSTRAINT FK_Departments_Locations
        FOREIGN KEY(location_id)
        REFERENCES Locations(location_id)
);

-- ==========================================
-- JOBS
-- ==========================================

CREATE TABLE Jobs
(
    job_id VARCHAR(10) PRIMARY KEY,
    job_title VARCHAR(50) NOT NULL,
    min_salary DECIMAL(10,2),
    max_salary DECIMAL(10,2)
);

-- ==========================================
-- EMPLOYEES
-- ==========================================

CREATE TABLE Employees
(
    employee_id INT PRIMARY KEY,

    first_name VARCHAR(50),

    last_name VARCHAR(50) NOT NULL,

    email VARCHAR(100) UNIQUE,

    phone_number VARCHAR(20),

    hire_date DATE NOT NULL,

    job_id VARCHAR(10) NOT NULL,

    salary DECIMAL(10,2),

    manager_id INT NULL,

    department_id INT,

    CONSTRAINT FK_Employees_Jobs
        FOREIGN KEY(job_id)
        REFERENCES Jobs(job_id),

    CONSTRAINT FK_Employees_Departments
        FOREIGN KEY(department_id)
        REFERENCES Departments(department_id)
);

-- Self Reference

ALTER TABLE Employees
ADD CONSTRAINT FK_Employees_Manager
FOREIGN KEY(manager_id)
REFERENCES Employees(employee_id);

-- ==========================================
-- DEPENDENTS
-- ==========================================

CREATE TABLE Dependents
(
    dependent_id INT PRIMARY KEY,

    first_name VARCHAR(50),

    last_name VARCHAR(50),

    relationship VARCHAR(30),

    employee_id INT NOT NULL,

    CONSTRAINT FK_Dependents_Employees
        FOREIGN KEY(employee_id)
        REFERENCES Employees(employee_id)
);
