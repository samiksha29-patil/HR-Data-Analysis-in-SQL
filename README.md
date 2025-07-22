# HR-Data-Analysis-in-SQL

📊 HR Analytics SQL Project
A comprehensive SQL-based data analysis project to uncover HR insights, drive business decisions, and support workforce strategies.

🧾 Overview
This project leverages SQL to analyze an HR dataset and extract actionable insights about employee demographics, attrition, performance, salary distribution, and recruitment sources. It includes data cleaning, transformation, aggregation, and analysis to support human resources decision-making with real-time metrics and trends.

🎯 Objectives
Identify key drivers of employee attrition

Analyze employee performance, tenure, and absenteeism

Understand salary distribution and compensation trends

Explore demographic patterns and hiring sources

Enable data-informed HR policy and strategic planning

🛠️ Tech Stack
Tool	Purpose
MySQL	Query language & data processing
SQL Workbench / VS Code	Query execution environment
CSV Dataset	Employee data source

📂 Dataset Features
Table Name: employees

Column	Description
EmpID	Unique Employee ID
DOB, DateOfHire, DateOfTermination	Date fields for lifecycle analysis
Salary, Absences	Compensation and absenteeism details
PerformanceScore	Recent performance rating
Sex, MaritalDesc, State	Demographic indicators
Department, Position, ManagerName	Job role & hierarchy
RecruitmentSource	Source of hiring
TermReason, Termd	Termination info

🧹 Data Cleaning & Preparation
Converted date strings (DOB, DateOfHire, etc.) to proper DATE format

Replaced blank/null termination dates with 'CurrentlyWorking'

Added computed fields:

Age from DOB

EmployeeCurrentStatus (1 = active, 0 = former)

Updated salary data type to DECIMAL(10,2)

🔍 Key Insights & Queries
1. 📌 Employee Counts
Total, current, and former employees

Count of terminations by reason, state, or marital status

2. 📊 Demographics
Gender, age, and state distribution

Age segmentation into ranges (20s, 30s, etc.)

3. 💰 Salary Analysis
Salary distribution by range

Salary breakdown by gender and department

Average salary per department

4. 📉 Attrition & Tenure
Attrition rate calculation

Average tenure (years in company)

Termination analysis by department & demographics

5. 🧲 Recruitment Source Performance
Employee count by recruitment source

Analysis of hires by source vs attrition

6. 📈 Performance & Absenteeism
Absences by department

Average absences by performance score

Performance score frequency

🧠 Insights Generated
Departments with highest absenteeism or attrition

Gender pay gap trends

States with high employee counts or terminations

Correlation between performance and absenteeism

🗃️ Folder Structure (Suggestion)
bash
Copy
Edit
hr-analytics-sql/
├── README.md
├── hr_analysis_script.sql
├── employees.csv
├── visuals/               # Optional: graphs, dashboards
└── documentation/         # Optional: ER diagrams, notes
🚀 How to Use
Create the database:

sql
Copy
Edit
CREATE DATABASE hrproject;
USE hrproject;
Import the CSV into a table called employees.

Run the script: hr_analysis_script.sql.

View and export the query results or use them in Power BI/Tableau.

🔮 Future Enhancements
Automate monthly HR reporting using stored procedures

Build a Power BI dashboard from these queries

Integrate machine learning to predict attrition

Implement role-based access for secure HR data handling

📄 License
Licensed under the MIT License.

🙋‍♂️ Author
Your Name
📧 your.email@example.com
🔗 LinkedIn | GitHub
