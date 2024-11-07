/*
Index :
-------
      1. Fast retrieval by effectively managing data
      2. It is used retrive the data faster depands on optimizer's decision(Count of retrieval data)
      
Type's of index :
-----------------
      1. b-tree
      2. bitmap
      3. unique
      4. function based
      5. composite 
      6. index organized table 

--1. b-tree index :
-------------------
    1. Balanced tree index 
    2. It is created for high cardinality column/s 
    3. high cardinality column/s  = Unique RECORS in a column/s
    4. declare Less Duplicate value column 
    
Syntax:
    Create index index_name on table_name(column_name);

*/
create table employee_copy as select * from employees;

select * from employee_copy;

select * from user_indexes;

select * from user_indexes where table_name = 'EMPLOYEE_COPY';

select * from user_ind_columns where table_name = 'EMPLOYEE_COPY';

-- Check before index creation

select * from employee_copy where first_name like 'A%';

explain plan for select * from employee_copy where first_name like 'A%';

select dbms_xplan.display from dual;

-- Check after index creation

create index fname_idx1 on employee_copy(first_name);

select * from user_indexes where table_name = 'EMPLOYEE_COPY';

select * from user_ind_columns where table_name = 'EMPLOYEE_COPY';

select * from employee_copy where first_name like 'A%';

explain plan for select * from employee_copy where first_name like 'A%';

select dbms_xplan.display from dual;

--------------------------------------------------------------------------------

/*
--2. bitmap index :
-------------------
      1. It is created for low cardinality columns
      2. low cardinality columns = large number of duplicate records in a columns
      3. declare More Duplicate value column

Syntax:
    Create bitmap index index_name on table_name(column_name);
            
*/
-- Check before index creation

select * from employee_copy where department_id = 90;

explain plan for select * from employee_copy where department_id = 90;

select dbms_xplan.display from dual;

-- Check after index creation

create bitmap index depid_idx1 on employee_copy(department_id);

select * from employee_copy where department_id = 90;

explain plan for select * from employee_copy where department_id = 90;

select dbms_xplan.display from dual;

select * from employee_copy where department_id = 50;

explain plan for select * from employee_copy where department_id = 50;

select dbms_xplan.display from dual;

--------------------------------------------------------------------------------

/*
--3. unique index :
          declare unique value column
*/
-- Check before index creation

select * from employee_copy where employee_id = 100;

explain plan for select * from employee_copy where employee_id = 100;

select dbms_xplan.display from dual;

-- Check after index creation

create unique index empid_idx1 on employee_copy(employee_id);

select * from employee_copy where employee_id = 100;

explain plan for select * from employee_copy where employee_id = 100;

select dbms_xplan.display from dual;

--------------------------------------------------------------------------------

/*
--4 Function based Index :
--------------------------

    If an index is created using the function or expression then it is function based index
    
Syntax:
    Create index index_name on table_name(Function | Expreeion);
 
*/

-- Check before index creation

select * from employee_copy where upper(first_name) = 'LEX';

explain plan for select * from employee_copy where upper(first_name) = 'LEX';

select dbms_xplan.display from dual;

-- Check after index creation

create index idx_fname on employee_copy(upper(first_name));

select * from employee_copy where upper(first_name) = 'LEX';

explain plan for select * from employee_copy where upper(first_name) = 'LEX';

select dbms_xplan.display from dual;

--------------------------------------------------------------------------------

/*
--5. Composite Index :
----------------------
      1. Index created for multiple columns 
      2. It is also called as concatenated index
      3. Accepted 32 columns
      
Syntax:
    Create index index_name on table_name(column_name(1),,,...,,column_name(n));
    
*/

-- Check before index creation

select * from employee_copy where department_id = 50 and manager_id = 120;

explain plan for select * from employee_copy where department_id = 50 and manager_id = 120;

select dbms_xplan.display from dual;

-- Check after index creation

create index idx_did_mid on employee_copy(department_id, manager_id);

select * from employee_copy where department_id = 50 and manager_id = 120;

explain plan for select * from employee_copy where department_id = 50 and manager_id = 120;

select dbms_xplan.display from dual;

--------------------------------------------------------------------------------

/*
--6 IndexOrganized table :
--------------------------
      1. Organizing the data at the time of inserting
      2. You must have primary key on the table
      3. Cannot able to partition an index organized table

Syntax:
    Create table table_name(column_name datatype,,,..,,,columnname datatype) organization index ;
    
*/

-- Check before IndexOrganized table creation

create table studentDetails(stud_id number, stud_name varchar2(50));

select * from studentDetails;

insert into studentDetails values(2, 'name2');

insert into studentDetails values(4, 'name4');

insert into studentDetails values(3, 'name3');

insert into studentDetails values(5, 'name5');

insert into studentDetails values(1, 'name1');

select * from studentDetails;

-- Check after IndexOrganized table creation

create table studentDetails02(stud_id number primary key, stud_name varchar2(50)) organization index;

select * from studentDetails02;

insert into studentDetails02 values(2, 'name2');

insert into studentDetails02 values(4, 'name4');

insert into studentDetails02 values(3, 'name3');

insert into studentDetails02 values(5, 'name5');

insert into studentDetails02 values(1, 'name1');

select * from studentDetails02;

--------------------------------------------------------------------------------

drop table studentDetails;

drop index depid_idx1;

--------------------------------------------------------------------------------

/*
Table Partitioning :
--------------------
    Based on data we can split table into multiple parts.
    
Types of Table Partition :
--------------------------

    1. List
    2. Range
    3. Hash

*/

--1. List Partition :
---------------------

create table table_cutomer_list
(
cust_id number,
cust_name varchar2(50),
cust_mobile number,
cust_country varchar2(50)
)

partition by list(cust_country)
(
partition c1 values('india'),
partition c2 values('china'),
partition c3 values('srilanka'),
partition d1 values(default) -- default partition
);

select * from user_tab_partitions;

select * from V$VERSION;

--------------------------------------------------------------------------------

--1. Range Partition :
---------------------

create table table_cutomer_range
(
cust_id number,
cust_name varchar2(50),
cust_mobile number,
cust_country varchar2(50),
cust_amount number
)
partition by range(cust_amount)
interval(3000) --create(add) partition range values. If insert 16000. then add 15000 + 3000 and now insert 16000 range values
(
partition a1 values less than(5000),
partition a2 values less than(10000),
partition a3 values less than(15000)
);


select * from user_tab_partitions;

--------------------------------------------------------------------------------
