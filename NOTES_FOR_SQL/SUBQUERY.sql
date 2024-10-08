-- SUB QUERY
         ---- Query with in another query
         ---- inner query execute first based on that result the outer query will execute.
         ---- It is a query or select query inside another query
         ---- To improve the maintainablity and performance of your query
         
-- Types of sub query
    
    -- Single row sub query
    -- Multi row sub query
    -- Scalar sub query
    -- Inline sub query
    -- Correlated sub query
    -- Multi column sub query
    
    
-- Single row subquery

        -- A sub query returning only one row/value
        -- Relational operators supported (=,<,>,<=,>=)
        
    -- Syntax
        --SELECT COLUMN1,COLUMN2,...FROM TABLE_NAME WHERE CONDITION = (SELECT COLUMN1 FROM TABLE_NAME WHERE CONDITION);
        
        
SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME,SALARY FROM EMPLOYEES WHERE FIRST_NAME = 'Lex'; -- LEX , 17000

SELECT FIRST_NAME,SALARY FROM EMPLOYEES WHERE SALARY > 17000;

SELECT FIRST_NAME,SALARY FROM EMPLOYEES WHERE SALARY > (SELECT SALARY FROM EMPLOYEES WHERE FIRST_NAME = 'Lex');

-- Multi row sub query
        -- A sub query returning more than one row/value.
        -- Relational operator supported (IN,NOT IN,ALL,ANY).
        
    -- SYNTAX
    -- SELECT COLUMN1,COLUMN2,... FROM TABLE_NAME WHERE CONDITION IN|NOT IN (SELECT COLUMN1 FROM TABLE_NAME WHERE CONDITION);

select first_name,salary  from EMPLOYEES where first_name='Alexander' order by salary asc;

 select employee_id,first_name,hire_date,salary,department_id from EMPLOYEES 
where salary IN (select salary  from EMPLOYEES where first_name='Alexander') order by salary asc;

select employee_id,first_name,hire_date,salary,department_id from EMPLOYEES 
where salary  NOT IN (select salary  from EMPLOYEES where first_name='Alexander') order by salary asc;

select employee_id,first_name,hire_date,salary,department_id from EMPLOYEES 
where salary >ALL (select salary  from EMPLOYEES where first_name='Alexander') order by salary asc;

select employee_id,first_name,hire_date,salary,department_id from EMPLOYEES 
where salary >ANY (select salary  from EMPLOYEES where first_name='Alexander') order by salary asc;

--SCALAR SUB QUERY
        -- A sub query inside a select clause
        -- A scalar subquery returns exactly one row as output
        -- If the scalar subquery finds no match, it returns null
        -- If the scalar subquery finds more than one match, it returns an error.
    --Synta
        -- select column,column2,(select colum1 from table_name where condition) from table_name where condition
        
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID = 40;

SELECT MIN(SALARY) FROM EMPLOYEES;
SELECT MAX(SALARY) FROM EMPLOYEES;

SELECT FIRST_NAME,SALARY,(SELECT MIN(SALARY) FROM EMPLOYEES),(SELECT MAX(SALARY) FROM EMPLOYEES),DEPARTMENT_ID FROM EMPLOYEES WHERE DEPARTMENT_ID = 40;

-- INLINE VIEW / INLINE SUB QUERY
        -- A SUB QUERY INSIDE A FROM CLAUSE
        -- IN-LINE VIEWS ARE USED TO SIMPLIFY COMPLEX QUERIES
    --SYNTAX
    -- SELECT COLUMN1,COLUMN2,.. FROM TABLE_NAME, (SELECT COLUM1,.. FROM TABLE_NAME)WHERE CONDITON
    
SELECT * FROM EMPLOYEES;

SELECT ROWNUM RN , E.*FROM EMPLOYEES E ;

SELECT ROWNUM , E.*FROM EMPLOYEES E WHERE ROWNUM <= 5;

SELECT ROWNUM , E.*FROM EMPLOYEES E WHERE ROWNUM = 5;

SELECT RN,FIRST_NAME,EMPLOYEE_ID FROM(SELECT ROWNUM RN, E.*FROM EMPLOYEES E ORDER BY E.EMPLOYEE_ID) WHERE RN = 5;
       
-- Correlated sub query
        -- if a subquery depands on outer query or the outer query depends on inner query
        
SELECT * FROM EMPLOYEES;

SELECT * FROM DEPARTMENTS;

SELECT EMPLOYEE_ID,FIRST_NAME,DEPARTMENT_ID FROM EMPLOYEES E WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM DEPARTMENTS D WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID);

--MULTI COLUMN SUBQUERY
        -- THE SUBQUERY THAT RETURNS MORE THAN ONE COLUMN.

SELECT * FROM EMPLOYEES;

SELECT * FROM EMPLOYEES where department_id= 90;

SELECT * FROM EMPLOYEES where manager_id= 100;

SELECT * FROM EMPLOYEES where department_id= 90 and manager_id= 100;

select employee_id,first_name,hire_date,salary,department_id,manager_id
			from employees 
where(manager_id,department_id) = (SELECT manager_id,department_id from employees where first_name='Neena');


--DECODE

SELECT * FROM EMPLOYEES;

SELECT EMPLOYEES.*,DECODE(JOB_ID,'AD_PRES','AD_PRESIDENT') JOB_FULL_NAME FROM EMPLOYEES;

SELECT EMPLOYEE_ID,FIRST_NAME,JOB_ID,
        DECODE(JOB_ID,
                    'AD_PRES','AD_PRESIDENT',
                    'AD_VP','AD_VICEPRESIDENT',
                    'IT_PROG','IT_PROGRAMMER',
                    'OTHER JOB NAME') JOB_FULL_NAME FROM EMPLOYEES;
                    
--CASE

SELECT EMPLOYEE_ID,FIRST_NAME,JOB_ID,
        CASE JOB_ID
                    WHEN 'AD_PRES' THEN 'AD_PRESIDENT'
                    WHEN 'AD_VP' THEN 'AD_VICEPRESIDENT'
                    WHEN 'IT_PROG' THEN 'IT_PROGRAMMER'
                    ELSE 'OTHER JOB NAME'
        END
                    JOB_FULL_NAME FROM EMPLOYEES;
                    

SELECT EMPLOYEE_ID,FIRST_NAME,SALARY,
        CASE 
             WHEN SALARY > 10000 THEN 'HIGH SALARY'
             WHEN SALARY > 5000 AND SALARY < 10000 THEN 'AVERAGE SALARY'
             ELSE ' LOW SALARY '
        END
                    SALARY_TYPE FROM EMPLOYEES;




    





