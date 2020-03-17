SELECT * FROM EMPLOYEES;
SELECT * FROM JOB_HISTORY; 
SELECT * FROM JOBS;
SELECT * FROM DEPARTMENTS;

--1A; Select the names and job start dates of all employees who work for the department number 5.
SELECT E.F_NAME,E.L_NAME,J.START_DATE FROM EMPLOYEES E INNER JOIN JOB_HISTORY J ON E.EMP_ID =J.EMPL_ID WHERE J.DEPT_ID=5;

--1B:Select the names, job start dates, and job titles of all employees who work for the department number 5.
SELECT E.F_NAME,E.L_NAME,J.START_DATE, JOBS.JOB_TITLE FROM EMPLOYEES E INNER JOIN JOB_HISTORY J ON E.EMP_ID =J.EMPL_ID  INNER JOIN JOBS ON JOBS.JOB_IDENT=J.JOBS_ID WHERE J.DEPT_ID=5;

--2A: Perform a Left Outer Join on the EMPLOYEES and DEPARTMENT tables and select employee id, 
--last name, department id and department name for all employees

SELECT E.EMP_ID,E.L_NAME,E.DEP_ID, D.DEP_NAME FROM EMPLOYEES AS E LEFT JOIN DEPARTMENTS AS D ON E.DEP_ID = D.DEPT_ID_DEP; 

--2B: Re-write the query for 2A to limit the result set to include only the
--rows for employees born before 1980.
SELECT E.EMP_ID,E.L_NAME,E.DEP_ID, D.DEP_NAME,E.B_DATE FROM EMPLOYEES AS E LEFT JOIN DEPARTMENTS AS D ON E.DEP_ID = D.DEPT_ID_DEP WHERE E.B_DATE LIKE '197%' ;
SELECT E.EMP_ID,E.L_NAME,E.DEP_ID, D.DEP_NAME,E.B_DATE FROM EMPLOYEES AS E LEFT JOIN DEPARTMENTS AS D ON E.DEP_ID = D.DEPT_ID_DEP WHERE 1980 > YEAR(E.B_DATE)  ;

--2C: Re-write the query for 2A to have the result set include all the
--employees but department names for only the employees who were born before 1980.
SELECT E.EMP_ID,E.L_NAME,E.DEP_ID,  D.DEP_NAME  , E.B_DATE FROM EMPLOYEES AS E 
	LEFT JOIN DEPARTMENTS AS D ON E.DEP_ID = D.DEPT_ID_DEP 
	AND  1980 > YEAR(E.B_DATE);

--3A: Perform a Full Join on the EMPLOYEES and DEPARTMENT tables
--and select the First name, Last name and Department name of all employees.
SELECT E.EMP_ID,E.F_NAME, E.L_NAME,  D.DEP_NAME  FROM EMPLOYEES AS E 
	FULL OUTER JOIN DEPARTMENTS AS D ON E.DEP_ID = D.DEPT_ID_DEP;
	
	--3B: Re-write Query 3A to have the result set include all employee names but department id 
	--and department names only for male employees.
SELECT E.F_NAME, E.L_NAME, D.DEPT_ID_DEP, D.DEP_NAME,E.SEX  FROM EMPLOYEES AS E 
	FULL OUTER JOIN DEPARTMENTS AS D ON E.DEP_ID = D.DEPT_ID_DEP AND E.SEX= 'M' ;
SELECT E.F_NAME, E.L_NAME, D.DEPT_ID_DEP, D.DEP_NAME,E.SEX  FROM EMPLOYEES AS E 
	LEFT OUTER JOIN DEPARTMENTS AS D ON E.DEP_ID = D.DEPT_ID_DEP AND SEX= 'M' ;