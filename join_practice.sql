Query 1A: Select the names and job start dates of all employees who work for
the department number 5.
[Hint: Use the Inner join operation with the EMPLOYEES table as the left table and
the JOB_HISTORY table as the right table.]
Query 1B: Select the names, job start dates, and job titles of all employees
who work for the department number 5.
[Hint: Perform an INNER JOIN with 3 tables – EMPLOYEES, JOB_HISTORY,
JOBS]
Query 2A: Perform a Left Outer Join on the EMPLOYEES and DEPARTMENT
tables and select employee id, last name, department id and department name
for all employees
[Hint: Use the Left Outer Join operation with the EMPLOYEES table as the left table
and the DEPARTMENTS table as the right table.]
Query 2B: Re-write the query for 2A to limit the result set to include only the
rows for employees born before 1980.
[Hint: use a WHERE clause. Could also use an INNER JOIN]
Query 2C: Re-write the query for 2A to have the result set include all the
employees but department names for only the employees who were born
before 1980.
[Hint: use an AND in the INNER JOIN ON clause]
Query 3A: Perform a Full Join on the EMPLOYEES and DEPARTMENT tables
and select the First name, Last name and Department name of all employees.
[Hint: Use the Full Outer Join operation with the EMPLOYEES table as the left table
and the DEPARTMENTS table as the right table.]
Query 3B: Re-write Query 3A to have the result set include all employee
names but department id and department names only for male employees.
[Hint: Add an AND in Query 3A to filter on male employees in the ON clause. Can
also use Left Outer Join] 

------------------------------------
-----ANSWER------
------------------------------------


--- Query1A ---
select E.F_NAME,E.L_NAME, JH.START_DATE 
	from EMPLOYEES as E 
	INNER JOIN JOB_HISTORY as JH on E.EMP_ID=JH.EMPL_ID 
	where E.DEP_ID ='5'
;	
--- Query1B ---	
select E.F_NAME,E.L_NAME, JH.START_DATE, J.JOB_TITLE 
	from EMPLOYEES as E 
	INNER JOIN JOB_HISTORY as JH on E.EMP_ID=JH.EMPL_ID 
	INNER JOIN JOBS as J on E.JOB_ID=J.JOB_IDENT
	where E.DEP_ID ='5'
;
--- Query 2A ---
select E.EMP_ID,E.L_NAME,E.DEP_ID,D.DEP_NAME
	from EMPLOYEES AS E 
	LEFT OUTER JOIN DEPARTMENTS AS D ON E.DEP_ID=D.DEPT_ID_DEP
;	
--- Query 2B ---
select E.EMP_ID,E.L_NAME,E.DEP_ID,D.DEP_NAME
	from EMPLOYEES AS E 
	LEFT OUTER JOIN DEPARTMENTS AS D ON E.DEP_ID=D.DEPT_ID_DEP 
	where YEAR(E.B_DATE) < 1980
;
--- alt Query 2B ---
select E.EMP_ID,E.L_NAME,E.DEP_ID,D.DEP_NAME
	from EMPLOYEES AS E 
	INNER JOIN DEPARTMENTS AS D ON E.DEP_ID=D.DEPT_ID_DEP 
	where YEAR(E.B_DATE) < 1980
;
--- Query 2C ---
select E.EMP_ID,E.L_NAME,E.DEP_ID,D.DEP_NAME
	from EMPLOYEES AS E 
	LEFT OUTER JOIN DEPARTMENTS AS D ON E.DEP_ID=D.DEPT_ID_DEP 
	AND YEAR(E.B_DATE) < 1980
;
--- Query 3A ---
select E.F_NAME,E.L_NAME,D.DEP_NAME
	from EMPLOYEES AS E 
	FULL OUTER JOIN DEPARTMENTS AS D ON E.DEP_ID=D.DEPT_ID_DEP
;
--- Query 3B ---
select E.F_NAME,E.L_NAME,D.DEPT_ID_DEP, D.DEP_NAME
	from EMPLOYEES AS E 
	FULL OUTER JOIN DEPARTMENTS AS D ON E.DEP_ID=D.DEPT_ID_DEP AND E.SEX = 'M'
;
--- alt Query 3B ---
select E.F_NAME,E.L_NAME,D.DEPT_ID_DEP, D.DEP_NAME
	from EMPLOYEES AS E 
	LEFT OUTER JOIN DEPARTMENTS AS D ON E.DEP_ID=D.DEPT_ID_DEP AND E.SEX = 'M'
;
