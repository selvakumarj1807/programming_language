Constraints In Oracle:
======================

Data validation before inserting the data into the table


1. Primary Key

  -- It will not allow duplicate record
  -- It will not allow null
  -- Only one primary key in a table
  
    composite Key: (A composite unique key is a unique key made up of a combination of columns. it have a  maximum of 16 columns) 

    cust_id+mobile_no   ---> Primary key(cust_id,mobile_no)

2. Not Null     

  -- It will not allow null value
  -- It will allow duplicate
  
3. Unique

   -- It will not allow duplicate
   -- It will allow null  

4. Check

   -- data validation
   
   check (age >=18)

5. Foreign Key

  --- Relationship between two tables
  -- It will accept duplicate value
  -- It should be a primary key in another table
  -- Any no of foreign key in a table
  
  Constraints:
	   
	       ADD
		   DROP
		   DISABLE
		   ENABLE 
--------------------------------------------------------------------------------

create table city
(
city_id number(4),
city_name varchar2(30)
);

alter table city add primary key(city_id);

insert into city values (10,'Chennai');
insert into city values (20,'Pune');
insert into city values (30,'Hyd');
insert into city values (40,'Delhi');

create table customer
(
cust_id number(6) primary key,
cust_name varchar2(30) not null,
mobile_no number(10) unique check (length(mobile_no)=10),
age number(3) check (age>=18),
city_id number(4) references city(city_id) 
);

select * from city;

select * from customer;

insert into customer values (100000,'Arun',9090909090,28,20);
insert into customer values (100000,'Arun',9090909090,28,20);

insert into customer values (100001,'',8080808080,31,30);
insert into customer values (100001,'Arun',8080808080,31,30);

insert into customer values (100006,'Vijay',50505050501,31,10);
insert into customer values (100006,'Vijay',505050505,31,10);
insert into customer values (100002,'Vijay',5050505050,31,10);
insert into customer values (100006,'Vijay',5050505050,31,10);

insert into customer values (100003,'Ajith',2894738243,13,30);
insert into customer values (100003,'Ajith',2894738243,19,30);

insert into customer values (100004,'Ramesh',2894738789,31,60);
insert into customer values (100004,'Ramesh',2894738789,31,10);

---- COMPOSITE PK

CREATE TABLE DEMO_tb
( first_name VARCHAR2(20)
,last_name VARCHAR2(20)
,s_name VARCHAR2(20)
 ,Constraints demo_id_pk PRIMARY KEY(first_name,last_name,s_name)
);

select * from demo_tb;

insert into demo_tb values('aa','bb','cc');
insert into demo_tb values('aa','bbb','cc');
insert into demo_tb values('aa','bbb','ccc');

select * from demo_tb;

insert into demo_tb values('aa','bb','cc');

alter table demo_tb disable constraint demo_id_pk;

insert into demo_tb values('aa','bb','cc');

select * from demo_tb;

alter table demo_tb enable constraint demo_id_pk;

SELECT ROWNUM,ROWID,E.* FROM demo_tb E;

delete from demo_tb where rowid='AAAE7TAAEAAAAJdAAD';

select * from demo_tb;

alter table demo_tb enable constraint demo_id_pk;

insert into demo_tb values('aa','bb','cc');
___________________________________________________________________________________

--On delete cascade

select * from all_constraints where owner='HR' and table_name='CUSTOMER';


ALTER TABLE customer
drop CONSTRAINT SYS_C007011;

ALTER TABLE customer 
  ADD CONSTRAINT city_fk 
  FOREIGN KEY (city_id) 
  REFERENCES city(city_id) 
  ON DELETE CASCADE;

select * from all_constraints where owner='HR' and table_name='CUSTOMER';

select * from city;

select * from customer;

delete from city where city_id = 20;

select * from city;

select * from customer;
------------------------------------------------------------------------------------
select * from all_constraints where owner='HR' and table_name='CUSTOMER';

select * from all_cons_columns where owner='HR' and table_name='CUSTOMER';

select
a.owner,a.constraint_name,a.constraint_type,b.table_name,b.column_name
from all_constraints a , all_cons_columns b where a.constraint_name=b.constraint_name 
and a.owner='HR' and a.table_name='CUSTOMER';

---------------------------------------------------------------------------------------
--suppose i want to drop the city table.oracle through the relationship between parrent table and child table
-- first child table drop (customer).
-- next to drop the parrent table (city).

select * from all_cons_columns where owner='HR' and table_name='CITY';

select * from all_constraints where owner='HR' and table_name='CITY'; -- choose the constraint name SYS_C007005

select * from all_constraints where owner='HR' and r_constraint_name='SYS_C007005';

------------------------------------------------------------------------------------

--Meta data tables will have all table & column level details

select * from all_tables where owner='HR'; 

select * from all_tab_columns where owner='HR'; 

------------------------------------------------------------------------------------

drop table CUSTOMER;

drop table CITY;

drop table DEMO_tb;

