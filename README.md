<p align="center">
  <img src="banner hr.png" alt="HR Database Management System Banner" width="100%">
</p>

# 🏢 HR Database Management System

A SQL-based Human Resource Management System developed using Microsoft SQL Server to demonstrate relational database design, data management, and business analytics. The project models a real-world HR environment by managing employee information, departments, job roles, salaries, office locations, and reporting hierarchies while generating meaningful business insights through SQL.

---

# 📌 Project Overview

As organizations grow, managing employee information efficiently becomes increasingly important. This project demonstrates how a normalized relational database can organize HR data while supporting workforce analytics and business reporting.

The system models multiple HR entities such as employees, departments, jobs, locations, countries, regions, and dependents, using well-defined relationships and database constraints to maintain data integrity.

---

# 🎯 Business Problem

Organizations require a centralized Human Resource database to:

- Store employee records
- Manage departments and job roles
- Maintain reporting hierarchies
- Analyze salary distribution
- Track hiring trends
- Support HR decision-making through business analytics

This project simulates these real-world business requirements using SQL Server.

---

# 🗺️ Database Architecture

The HR database follows a **normalized relational database design** that minimizes redundancy while maintaining referential integrity through Primary Keys and Foreign Keys.

The system consists of seven interconnected tables representing different components of an organization's HR operations.

<p align="center">
<img src="diagrams/hr er diagram.png" width="900">
</p>

### Database Relationships

- **Regions** → Stores geographical regions.
- **Countries** → Linked to regions where the organization operates.
- **Locations** → Represents office locations.
- **Departments** → Connected to office locations.
- **Jobs** → Stores job titles and salary ranges.
- **Employees** → Central table containing employee information.
- **Dependents** → Stores employee dependent details.

This structure demonstrates relational database modeling using normalization and referential integrity constraints.

---

# 📊 Database Tables

| Table | Purpose |
|--------|----------|
| Employees | Stores employee information including salary, department, manager, and job role. |
| Departments | Stores department details within the organization. |
| Jobs | Stores job titles along with minimum and maximum salary ranges. |
| Dependents | Maintains employee dependent records. |
| Locations | Stores office locations. |
| Countries | Stores countries where company offices are located. |
| Regions | Groups countries into geographical regions. |

---

# ⚙️ Technologies Used

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- SQL (T-SQL)
- Microsoft PowerPoint

---

# 💡 SQL Concepts Demonstrated

- Database Design
- Table Relationships
- Primary Keys
- Foreign Keys
- Data Integrity Constraints
- INSERT
- SELECT
- INNER JOIN
- LEFT JOIN
- GROUP BY
- HAVING
- Aggregate Functions
- Subqueries
- Self Join
- Sorting & Filtering
- HR Data Analysis

---

# 🔄 Project Workflow

```text
Database Design
      ↓
Table Creation
      ↓
Relationship Mapping
      ↓
Data Insertion
      ↓
Business Query Execution
      ↓
HR Analytics & Insights
```

---

# 📂 Repository Structure

```text
HR-Database-SQL-Project
│
├── sql
│   ├── 01_schema.sql
│   ├── 02_insert_data.sql
│   └── 03_analysis_queries.sql
│
├── screenshots
│
├── presentation
│
├── assets
│
└── README.md
```

---

# 📄 SQL Files

The project is organized into separate SQL scripts for better readability and maintainability.

| File | Description |
|------|-------------|
| **01_schema.sql** | Creates the database, tables, relationships, and constraints. |
| **02_insert_data.sql** | Inserts sample HR records into each table. |
| **03_analysis_queries.sql** | Contains SQL queries used to analyze HR data and generate business insights. |

---

# 📈 Business Questions Answered

This project answers several practical HR business questions, including:

- How many employees work in each department?
- Which departments have the highest employee count?
- Which managers supervise the largest teams?
- What is the average salary by department?
- Which employees receive the highest salaries?
- What are the hiring trends based on joining dates?
- Which employees have dependents?
- How is the reporting hierarchy maintained?

---

# 📷 Sample Query Results

The following examples demonstrate how SQL queries can be used to analyze HR data and support business decision-making.

<p align="center">
<img src="screenshots/SQL Query Results.png" width="850">
</p>
---

## 📊 Department-wise Employee Count

This query calculates the number of employees working in each department.

**Insight**

- The IT department contains the highest number of employees in the sample dataset.

---

## 💰 Top 5 Highest Paid Employees

This query retrieves the highest-paid employees by sorting salaries in descending order.

**Insight**

- Senior roles receive significantly higher salaries than entry-level positions.

---

## 👥 Manager Reporting Hierarchy

This query uses a Self Join to display employees along with their reporting managers.

**Insight**

- Reporting relationships are maintained using the `manager_id` foreign key.

---

## 📈 Average Salary by Department

This query calculates the average salary of employees within each department.

**Insight**

- Salary distribution varies across departments depending on job roles and responsibilities.

---

## 📅 Hiring Trends

This query groups employees by hiring year to identify recruitment trends.

**Insight**

- Hiring trends help HR understand periods of organizational growth and workforce expansion.

---

# 📊 Key Insights

- Employee distribution differs across departments.
- The IT department has the largest workforce in the sample dataset.
- Salary distribution varies across departments and job roles.
- Reporting hierarchy is implemented using self-referencing foreign keys.
- Aggregate SQL functions enable meaningful workforce analysis.
- Database normalization minimizes redundancy and improves data consistency.

---

# 🚀 Future Enhancements

- Payroll Management Module
- Attendance Management
- Leave Management
- Employee Performance Tracking
- Stored Procedures
- Views
- Index Optimization
- Power BI Dashboard Integration

---

# 👨‍💻 Author

**Jayesh Bacchav**

**Data Analyst | SQL | Python | Power BI | Excel**

📧 **LinkedIn**

https://linkedin.com/in/jayeshbacchav9

---

⭐ **If you found this project useful, consider giving it a Star!**
