-- VIEW
   -- VIEW is a logical/virtual table that does not physically exist in the database and stored in oracle data dictionary. 
   -- View stores SQL statement/queries in the database
   -- No data is stored in the view
   -- VIEW IS A OBJECT
   
-- Advantages
    -- To make complex query to look simple
    -- View used to increase the security.
    
-- Types of View
    -- Simple view
    -- Complex view
    
-- Syntax
    -- CREATE [OR REPLACE] VIEW View_Name AS SELECT Select_Query;
    

-- 1. SIMPLE VIEW

        -- If a view is  created based on single table
        -- it should not have any group function,aggregate function etc..
        -- It should not contain distinct keyword or any pseudo columns expression on the based columns
        -- DML are allowed

SELECT * FROM EMPLOYEES;

CREATE VIEW EMP_VIEW_1 AS SELECT FIRST_NAME,SALARY FROM EMPLOYEES; 

SELECT * FROM EMP_VIEW_1;

SELECT * FROM USER_VIEWS;

CREATE OR REPLACE VIEW EMP_VIEW_1 AS SELECT FIRST_NAME,SALARY,DEPARTMENT_ID FROM EMPLOYEES WHERE DEPARTMENT_ID=20; 

SELECT * FROM EMP_VIEW_1; -- Pat, 6000, 20

UPDATE EMP_VIEW_1 SET SALARY = 8000 WHERE FIRST_NAME = 'Pat';

SELECT * FROM EMP_VIEW_1;

UPDATE EMP_VIEW_1 SET SALARY = 6000 WHERE FIRST_NAME = 'Pat';

SELECT * FROM EMP_VIEW_1;

-- 2.COMPLEX VIEW

    -- If the SELECT clause has any DISTINCT keywords, aggregate functions, or analytic functions 
    -- If the SELECT clause uses set operators (e.g. UNION) 
    -- If the SELECT clause use subqueries, Joins, Functions 
    -- Use the GROUP BY, HAVING, ORDER BY, START WITH clause Contain pseudo columns or expressions 
    -- If the query uses the Data dictionary table. (oracle provide the table. example-user_constraints)
-- SYNTAX
    -- CREATE [OR REPLACE] VIEW View_Name AS SELECT Select_Query;
    
create view emp_sal_1 as 
    SELECT 
    d.department_id, d.department_name, SUM(e.salary) total_salary 
    FROM departments d INNER JOIN employees e 
    ON d.department_id = e.department_id 
    GROUP BY d.department_id, d.department_name;
    
select * from emp_sal_1;
    
select * from user_views;

-- View with Read Only 
        -- Used to restrict Insert and Update performed through the view. 
        -- Only select statements is allowed against the views.
-- SYNTAX
    -- CREATE [OR REPLACE] VIEW view_name AS SELECT select_query WITH READ ONLY;
    
CREATE TABLE Test_1(TEST_ID NUMBER(3),TEST_NAME VARCHAR2(20));

insert into Test_1 values (1, 'A');
insert into Test_1 values (2, 'B');
insert into Test_1 values (3, 'C');
insert into Test_1 values (4, 'D');
insert into Test_1 values (5, 'E');

select * from Test_1; 

create view view_read as select * from Test_1; 

select * from view_read;

select * from user_views;

insert into view_read values (6, 'F');

select * from view_read;

create or replace view view_read as select * from Test_1 with read only;

select * from view_read;

insert into view_read values (7, 'G'); -- cannot perform a DML operation on a read-only view

-- View with Check option
        -- Where clause is mandatory for check option
        -- Used to allow DML operation based on the check condition through the view.
        
--SYNTAX 
        -- CREATE [OR REPLACE] VIEW view_name AS SELECT select query WITH CHECK OPTION;
     
SELECT * FROM Test_1;

create view view_check as select * from Test_1 where TEST_ID in (2,5,6) with check option; 

select * from view_check;

select * from user_views;

insert into view_check values (5,'SK');

select * from view_check;

insert into view_check values (8, 's'); -- NOT ACCEPT - view WITH CHECK OPTION where-clause violation

insert into Test_1 values (8, 'S'); 

select * from Test_1;

-- Force View 
        -- Creating a view without having base table
        -- Example for using deployment purpose
       
-- Syntax
    -- CREATE [OR REPLACE] FORCE VIEW view_name AS SELECT select_query;
    
select * from menu; -- table or view does not exist

create view dummy_view as select * from menu; --table or view does not exist

create force view dummy_view as select * from menu;

select * from dummy_view; -- view "HR.DUMMY_VIEW" has errors

select * from user_views ;

select * from user_objects ; -- example. user_objects- table,views,,

select * from user_objects where object_type ='VIEW' and object_name='DUMMY_VIEW'; -- STATUS - INVALID

create table menu ( MENU_id number(3), menu_name varchar (30));

select * from dummy_view;

select * from user_objects where object_type ='VIEW' and object_name='DUMMY_VIEW'; -- STATUS - VALID



