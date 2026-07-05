<p align="center">
  <img src="banner hr.png" alt="HR Database Management System Banner" width="100%">
</p>

# 🏢 HR Database Management System

A SQL-based Human Resource Management System that demonstrates relational database design, data management, and business analysis using Microsoft SQL Server. This project simulates a real-world HR database for storing employee information and generating meaningful workforce insights through SQL queries.

---

## 📌 Project Overview

Human Resource departments manage large volumes of employee data, including departments, job roles, salaries, reporting hierarchies, and office locations. This project demonstrates how a normalized relational database can efficiently organize this information while supporting business reporting and analytical decision-making.

The project covers database design, table relationships, sample data creation, and SQL queries that answer common HR business questions.

---

# 🎯 Business Problem

Organizations require a centralized HR database to:

- Store employee information
- Manage departments and job roles
- Maintain reporting hierarchies
- Analyze salary distribution
- Track hiring trends
- Support HR decision-making through analytics

This project simulates these real-world requirements using SQL Server.

---

# 🗺️ Database Architecture

<p align="center">
<img src="screenshots/hr er diagram.png" width="900">
</p>

---

# 📊 Database Tables

| Table | Description |
|--------|-------------|
| Employees | Stores employee information |
| Departments | Department details |
| Jobs | Job titles and salary ranges |
| Dependents | Employee dependents |
| Locations | Office locations |
| Countries | Country information |
| Regions | Geographic regions |

---

# ⚙️ Technologies Used

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- SQL (T-SQL)
- Microsoft PowerPoint

---

# 💡 SQL Concepts Demonstrated

- Database Design
- Primary Keys
- Foreign Keys
- Data Integrity Constraints
- INNER JOIN
- LEFT JOIN
- Aggregate Functions
- GROUP BY
- HAVING
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
SQL Analysis
      ↓
Business Insights
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

# 📈 Business Questions Answered

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

## 📊 Department-wise Employee Count

<p align="center">
<img src="screenshots/Query-01-Department-Count.png" width="850">
</p>

---

## 💰 Top 5 Highest Paid Employees

<p align="center">
<img src="screenshots/Query-02-Highest-Salary.png" width="850">
</p>

---

## 👥 Manager Reporting Hierarchy

<p align="center">
<img src="screenshots/Query-03-Manager-Hierarchy.png" width="850">
</p>

---

## 📈 Average Salary by Department

<p align="center">
<img src="screenshots/Query-04-Average-Salary.png" width="850">
</p>

---

## 📅 Hiring Trends

<p align="center">
<img src="screenshots/Query-05-Hiring-Trends.png" width="850">
</p>

---

# 📊 Key Insights

- Employee distribution varies across departments.
- The IT department contains the highest number of employees in the sample dataset.
- Salary distribution differs across departments and job roles.
- Reporting hierarchy is maintained using self-referencing foreign keys.
- Aggregate SQL functions provide valuable workforce insights.
- A normalized database structure reduces redundancy and improves data integrity.

---

# 🚀 Future Enhancements

- Payroll Management Module
- Attendance Management System
- Leave Management
- Employee Performance Tracking
- Stored Procedures and Views
- Index Optimization
- Power BI Dashboard Integration

---

# 👨‍💻 Author

**Jayesh Bacchav**

**Data Analyst | SQL | Python | Power BI | Excel**

📧 **LinkedIn:**  
https://linkedin.com/in/jayeshbacchav9

---

⭐ **If you found this project useful, consider giving it a Star.**
