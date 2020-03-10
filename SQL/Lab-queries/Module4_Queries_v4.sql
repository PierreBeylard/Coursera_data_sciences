-- Query 1------
;
select F_NAME , L_NAME
from EMPLOYEES
where ADDRESS LIKE '%Elgin,IL%' ;
--Query 2--
;
select F_NAME , L_NAME
from EMPLOYEES
where B_DATE LIKE '197%' ;
---Query3--
;
select *
from EMPLOYEES
where (SALARY BETWEEN 60000 and 70000)  and DEP_ID = 5 ;
--Query4A--
;
select F_NAME, L_NAME, DEP_ID 
from EMPLOYEES
order by DEP_ID;
--Query4B--
;
select F_NAME, L_NAME, DEP_ID 
from EMPLOYEES
order by DEP_ID desc, L_NAME desc;
--Query5A--
;
select DEP_ID, COUNT(*)
from EMPLOYEES
group by DEP_ID;
--Query5B--
;
select DEP_ID, COUNT(*), AVG(SALARY)
from EMPLOYEES
group by DEP_ID;
--Query5C--
;
select DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY"
from EMPLOYEES
group by DEP_ID;
--Query5D--
;
select DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY"
from EMPLOYEES
group by DEP_ID
order by AVG_SALARY;
--Query5E--
;
select DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY"
from EMPLOYEES
group by DEP_ID
having count(*) < 4
order by AVG_SALARY;
--5E alternative: if you want to use the label
select DEP_ID, NUM_EMPLOYEES, AVG_SALARY from
  ( select DEP_ID, COUNT(*) AS NUM_EMPLOYEES, AVG(SALARY) AS AVG_SALARY from EMPLOYEES group by DEP_ID)
  where NUM_EMPLOYEES < 4
order by AVG_SALARY;
--BONUS Query6--
;
select D.DEP_NAME , E.F_NAME, E.L_NAME
from EMPLOYEES as E, DEPARTMENTS as D
where E.DEP_ID = D.DEPT_ID_DEP
order by D.DEP_NAME, E.L_NAME desc ;

select * from employees;
select avg(salary) from employees;
--SUB SELECT EPRESSION list of employees earning less than average salary : 
SELECT * FROM EMPLOYEES WHERE SALARY < (SELECT AVG(SALARY) FROM EMPLOYEES);

-- we want to compare the salary of each employee with the average salary
SELECT F_NAME, SALARY, (SELECT AVG(SALARY) FROM EMPLOYEES) AS AVG_SALARY FROM EMPLOYEES;

--SUB QUERIES in FROM CLAUSE - RETREIVE NON SENSITIVE INFORMATION FROM EMPLOYEES
SELECT * FROM (SELECT EMP_ID,F_NAME,L_NAME, DEP_ID FROM EMPLOYEES ) AS EMPLOYEES4ALL;

--QUERRING MULTIPLE TABLE
--Retrieve only the employee records from the employees table for which a department ID exists 
SELECT * FROM EMPLOYEES WHERE DEP_ID IN (SELECT DEPT_ID_DEP FROM DEPARTMENTS);

--Retrieve only the employee records from A SPECIFIC LOCATION
SELECT * FROM DEPARTMENTS;  
SELECT * FROM EMPLOYEES  WHERE DEP_ID IN (SELECT DEPT_ID_DEP FROM DEPARTMENTS WHERE LOC_ID= 'L0001' );

--retrieve name and dpt id for employees who earn more than 70k
SELECT DEP_NAME, DEPT_ID_DEP FROM DEPARTMENTS WHERE DEPT_ID_DEP IN (SELECT DEP_ID FROM EMPLOYEES WHERE SALARY >70000);

--implicit join (full join - too many rows displayed) : 
SELECT * FROM EMPLOYEES , DEPARTMENTS ;
--implicit join with additional operands to limit the result set
SELECT * FROM EMPLOYEES E, DEPARTMENTS D WHERE E.DEP_ID = D.DEPT_ID_DEP;
--SEE DEPARTMENT NAME FOR EACH EMPLOYEE
SELECT E.L_NAME, D.DEP_NAME FROM EMPLOYEES E, DEPARTMENTS D  WHERE E.DEP_ID = D.DEPT_ID_DEP;
