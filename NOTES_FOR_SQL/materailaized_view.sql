-- Materialized View 
        -- Is a view that stores the results of the view's query.
        -- Snapshot of the data 
        -- DML operations not applicable 
-- Advantages 
        -- Used to improve the efficiency of a query. 
-- Disadvantages 
        -- The data needs to be refreshed/ the data needs to be updated
        -- Data May Be Inconsistent 
        -- Stores data physically
        
--Materialized View Syntax 
        -- CREATE MATERIALIZED VIEW viewname AS select_query; 
        
        -- CREATE MATERIALIZED VIEW viewname 
            -- [BUILD IMMEDIATE | BUILD DEFERRED] 
            -- (REFRESH [FAST | COMPLETE | FORCE] [ON DEMAND ON COMMIT]) 
            --  AS select_query;
			
-- any error to run the create materialaized view
sqlplus / as sysdba

grant create materialized view to HR;


-- any error to run the create materialaized View with on commit

alter table employ add primary key(employee_id);
____________________________________________________________________________________________________________ 

 
select * from employees;
   
create table employ as select * from employees;
   
select * from employ;

create materialized view M_emp as select * from employ;

select * from user_mviews;

select * from M_emp;

DELETE from EMPLOY where EMPLOYEE_ID=102;

select * from employ;

select * from M_emp;
-------------------------------------------------------------
drop materialized view M_emp;

drop table employ;
-------------------------------------------------------------

-- Materialized View Refresh Methods 
        -- Complete Refresh 
        -- Fast Refresh
        -- Force Refresh
        
-- 1.Complete Refresh
        -- Scans the whole table and then do the refresh
        
    -- CREATE MATERIALIZED VIEW viewname [BUILD IMMEDIATE | BUILD DEFERRED] [REFRESH COMPLETE] [ON DEMAND | ON COMMIT] AS select_query;
    
    -- BUILD IMMEDIATE 
    
select * from employees;
   
create table employ as select * from employees;
   
select * from employ;

-- create materialized view M_emp as select * from employ;

create materialized view employ_mtd1 REFRESH COMPLETE as select * from employ;

select * from user_mviews;

select * from employ_mtd1;

DELETE from EMPLOY where EMPLOYEE_ID=102;

select * from employ;

select * from employ_mtd1;
------------------------------------
--Complete refresh syntax
-- type1
        Begin 
        Dbms_mview.refresh('mview_name', 'C');
        End; 
        /
-- type2
        Exec Dbms_mview.refresh('mview_name', 'C');
------------------------------------

        begin 
        dbms_mview.refresh('employ_mtd1', 'C');
        end;   
        /
        
select * from employ_mtd1;

DELETE from EMPLOY where EMPLOYEE_ID=103;

select * from employ;

select * from employ_mtd1;

 Exec Dbms_mview.refresh('employ_mtd1', 'C');

select * from employ_mtd1;
-----------------------------------------------------------------------------------
drop materialized view employ_mtd1;

drop table employ;
-------------------------------------------------------------------------------------
     -- BUILD DEFERRED
     
select * from employees;
   
create table employ as select * from employees;
   
select * from employ;

create materialized view employ_mtd2 BUILD DEFERRED REFRESH COMPLETE as select * from employ;

select * from user_mviews;  -- check the last Refresh date , last Refresh type

select * from employ_mtd2;

begin 
    dbms_mview.refresh('employ_mtd2');
End;
/

select * from user_mviews;

select * from employ_mtd2;

drop materialized view employ_mtd2;

drop table employ;

----------------------------------------------------------------
 -- BUILD DEFERRED and ON COMMIT
 
select * from employees;
   
create table employ as select * from employees;
   
select * from employ;
 
create materialized view employ_mtd3 BUILD DEFERRED REFRESH COMPLETE ON COMMIT as select * from employ; 
 
select * from user_mviews;

select * from employ_mtd3;

begin 
    dbms_mview.refresh('employ_mtd3');
End;
/

select * from user_mviews;

select * from employ_mtd3;

DELETE from EMPLOY where EMPLOYEE_ID=102;

select * from employ;

select * from employ_mtd3;

commit;

select * from employ_mtd3;


drop materialized view employ_mtd3;

drop table employ;

___________________________________________________________________________________________________________________


Fast Refresh  :

	updates only the changes we have changed.
	Refresh the particular changes
	
	





