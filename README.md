# HR-Data-Analysis-in-SQL

📊 HR Analytics SQL Project

🧾 Project Overview
This project analyzes employee data using SQL to extract insights related to employee demographics, employment status, attrition, salary, performance, and more. The purpose is to derive meaningful patterns to aid HR decision-making.

🛠️ Tools & Technologies
Database: MySQL / MariaDB

Language: SQL

Data Source: employees table in hrproject database

📂 Project Structure
The project consists of multiple SQL operations categorized as follows:

1. Database Setup
Create and use hrproject database.

View and explore the employees table.

2. Employee Statistics
Total number of employees.

Current vs. terminated employees.

Average salary, age, and tenure (years in company).

3. Data Cleaning & Transformation
Format and convert date fields (DOB, DateOfHire, DateOfTermination, etc.).

Add and calculate age from DOB.

Update and standardize DateOfTermination for consistency.

4. Attrition Analysis
Add EmployeeCurrentStatus (1 = active, 0 = terminated).

Calculate attrition rate based on employment status.

5. Demographic Distributions
Marital status, gender, age groups, state-wise employee counts.

6. Job & Department Insights
Department-wise distribution and average salaries.

Absence records by department.

Performance scores and their distribution.

Recruitment source effectiveness.

7. Salary Analysis
Salary range distribution.

Salary by gender.

8. Termination Analysis
Reasons for termination.

Termination count by marital status.

📊 Key Metrics Calculated
Average employee salary & tenure

Attrition rate

Age and salary distributions

Department-wise absences

Gender-wise salary totals

Performance-related absence trends

🧩 Usage Instructions
Create the database using:

sql
Copy
Edit
CREATE DATABASE hrproject;
USE hrproject;
Import your dataset into the employees table.

Run the script in any MySQL-compatible environment.

View results to extract insights and build HR reports or dashboards.

📌 Notes
Ensure date fields are in correct format (%d-%m-%Y or %Y-%m-%d) before running the STR_TO_DATE() conversions.

The column termd is used to indicate termination (likely a binary flag).

NULL and blank values are standardized (e.g., DateOfTermination).

✅ Outcomes
By the end of this project, you will be able to:

Understand workforce trends and demographics

Identify attrition causes and performance patterns

Segment employee data for detailed HR analytics

Support HR strategies with actionable SQL insights

🧠 Further Improvements
Visualize insights using Tableau/Power BI

Automate reports through stored procedures

Integrate with HR platforms or APIs for real-time analytics

