-- CREATE DATABASE

create database hrproject;

use hrproject;

select * from employees;

-- TOTAL EMPLOYEES

select count(*)as total_employees
from employees;

-- TOTAL OLD EMPLOYEES

SELECT COUNT(*) AS TOTAL_OLD_EMPLOYEES
FROM EMPLOYEES
WHERE DATEOFTERMINATION !='';

-- TOTAL CURRENT EMPLOYEES

SELECT COUNT(*) AS TOTAL_CURRENT_EMPLOYEES
FROM EMPLOYEES
WHERE DATEOFTERMINATION='';

-- AVERAGE SALARY

SELECT AVG(SALARY) AS AVG_SALARY
FROM EMPLOYEES;

-- AVERAGE AGE

SELECT AVG(TIMESTAMPDIFF(YEAR, STR_TO_DATE(DOB,'%d-%m-%Y'),CURDATE()))
AS AVG_AGE
FROM EMPLOYEES;

-- AVERAGE YEARS IN COMPANY 

SELECT AVG(TIMESTAMPDIFF(YEAR, STR_TO_DATE(DATEOFHIRE,'%d-%m-%Y'),CURDATE()))
AS AVG_YEARS_IN_COMPANY
FROM EMPLOYEES;

-- ADDING NEW COLUMN FOR EMPLOYEE CURRENT STATUS

ALTER TABLE EMPLOYEES
ADD EMPLOYEECURRENTSTATUS INT;

-- UPDATING VALUES FOR NEW COLUMN 

SET SQL_SAFE_UPDATES=0;
UPDATE EMPLOYEES
SET EMPLOYEECURRENTSTATUS = CASE
WHEN DATEOFTERMINATION= '' THEN 1
ELSE 0
END;

-- CALCULATE ATTRITION RATE BASED ON CUSTOM EMPSTATUSID VALUES

SELECT
(CAST(COUNT(CASE WHEN EMPLOYEECURRENTSTATUS = 0 THEN 1 END) AS 
FLOAT) / COUNT(*)) * 100 AS ATTRITION_RATE
FROM EMPLOYEES;

-- GET COLUMN NAMES AND DATA TYPES

DESCRIBE EMPLOYEES;

-- PRINT 1 ST 5 ROWS

SELECT *
FROM EMPLOYEES
LIMIT 5;

-- PRINT LAST  5 ROWS

SELECT *
FROM EMPLOYEES 
ORDER BY EMPID DESC 
LIMIT 5; 

-- CHANGING DATA TYPES OF SALARY

ALTER TABLE EMPLOYEES
MODIFY COLUMN SALARY DECIMAL(10,2);

-- FORMATING COLUMNS FOR PROPER DATES

-- CONVERT ALL DATE COLUMNS IN PROPER DATES 

UPDATE EMPLOYEES
SET DOB = STR_TO_DATE(DOB,'%d-%m-%Y');
UPDATE EMPLOYEES
SET DATEOFHIRE = STR_TO_DATE(Dateofhire,'%d-%m-%Y');
UPDATE EMPLOYEES
SET LASTPERFORMANCEREVIEW_DATE = STR_TO_DATE(Lastperformancereview_date,
'%Y-%m-%d');

-- ALTER TABLE

ALTER TABLE EMPLOYEES
MODIFY COLUMN DOB DATE,
MODIFY COLUMN DateofHire DATE,
MODIFY COLUMN LastperformanceReview_date  DATE;


-- SELECT COLUMNS TO CHECK CHANGES

SELECT DOB,DATEOFHIRE,DATEOFTERMINATION,LASTPERFORMANCEREVIEW_DATE
FROM EMPLOYEES;

-- FILL EMPTY VALUES IN DATE OF TERMINATION

UPDATE EMPLOYEES
SET DATEOFTERMINATION ='CURRENTLYWORKING'
WHERE DATEOFTERMINATION IS NULL OR DATEOFTERMINATION='';

-- COUNT OF EACH UNIQUE VALUE IN THE MARITALDESC

select maritaldesc,count(*)as count
from employees
group by maritaldesc
order by count desc;

-- COUNT OF EACH UNIQUE VALUE IN THE DEPARTMENT

select department,count(*)as count
from employees
group by department
order by count desc;

-- COUNT OF EACH UNIQUE VALUE IN THE POSITION

select position,count(*)as count
from employees
group by position
order by count desc;

-- COUNT OF EACH UNIQUE VALUE IN THE MANAGER

select managername,count(*)as count
from employees
group by managername
order by count desc;


-- SALARY DISTRIBUTION BY EMPLOYEES

select case
when salary<30000 then'<30k'
when salary between 30000 and 49999 then '30k-49k'
when salary between 50000 and 69999 then '50k-69k'
when salary between 70000 and 89999 then '70k-89k'
when salary>=90000 then '90k and above'
end as salary_range,
count(*) as frequency
from employees group by salary_range order by frequency desc;

-- PERFORMANCE SCORE

select performancescore,count(*)as count
from employees
group by performancescore
order by count desc;

-- AVERAGE SALARY BY DEPARTMENT

select department,
avg(salary)as averagesalary
from employees
group by department
order by averagesalary desc;

-- COUNT TERMINATION BY CAUSE

select 
      termreason,
      count(*) as count
from employees
where termreason is not null
group by termreason
order by count desc;

-- EMPLOYEE COUNT OF STATE

SELECT STATE,COUNT(*) AS COUNT
FROM EMPLOYEES
GROUP BY STATE
ORDER BY COUNT DESC;

-- GENDER DESTRIBUTION

SELECT SEX,COUNT(*)AS COUNT
FROM EMPLOYEES
GROUP BY SEX
ORDER BY COUNT DESC;

-- GETTING AGE DESTRIBUTION
-- ADD A NEW COLUMN AGE

alter table employees
add column age int;

-- UPDATE THE AGE COLUMN WITH CALCULATED AGE

update employees
set age=timestampdiff(YEAR,DOB,CURDATE());

-- AGE DISTRIBUTION

select case
when age<20 then'20'
when age between 20 and 29 then '20-29k'
when age between 30 and 39 then '30-39'
when age between 40 and 49 then '40-49'
when age between 50 and 59 then '50-59'
when age>=60 then '60 and above'
end as age_range,
count(*) as count
from employees group by age_range order by count desc;

-- ABSENCES BY DEPARTMENT

SELECT DEPARTMENT,
SUM(absences)as totalabsences
from employees
group by department
order by totalabsences desc;

-- SALARY DESTRIBUTION BY GENDER

select sex,sum(salary)as totalsalary
from employees
group by sex
order by totalsalary desc;

-- COUNT OF EMPLOYEES TERMINATED AS PER MARITAL STATUS

select maritaldesc,
count(*) as terminatedcount
from employees
where termd=1
group by maritaldesc
order by terminatedcount desc;

-- AVERAGE ABSENCE BY PERFORMANCE SCORE

select performancescore,
avg(absences)as avrageabsences
from employees
group by performancescore
order by performancescore desc;

-- EMPLOYEES COUNT BY RECRUITMENT SCORE

select recruitmentsource,
count(*)as employeecount
from employees
group by recruitmentsource
order by employeecount desc;