--Joins:

  -- Joins are used to retrive data from multiple table.
  
  4 Types of Equi join:
=====================

Inner Join
Left Outer join
Right Outer Join
Full Outer Join

create table customer
(
cust_id	number,
cust_name	varchar2(50),
mob_no	number(10),
email	varchar2(50),
country_id number(3)
);

Insert into customer (CUST_ID,CUST_NAME,MOB_NO,EMAIL,COUNTRY_ID) values (1000,'Kannan',8989898989,'kannan@gmail.com',200);
Insert into customer (CUST_ID,CUST_NAME,MOB_NO,EMAIL,COUNTRY_ID) values (1001,'Arun',8989898990,'arun@gmail.com',204);
Insert into customer (CUST_ID,CUST_NAME,MOB_NO,EMAIL,COUNTRY_ID) values (1002,'Karthik',8989898991,'Karthik@gmail.com',202);
Insert into customer (CUST_ID,CUST_NAME,MOB_NO,EMAIL,COUNTRY_ID) values (1003,'Shankar',8989898992,'shankar@gmail.com',203);
Insert into customer (CUST_ID,CUST_NAME,MOB_NO,EMAIL,COUNTRY_ID) values (1004,'Sree',8989898993,'Sree@gmail.com',205);
Insert into customer (CUST_ID,CUST_NAME,MOB_NO,EMAIL,COUNTRY_ID) values (1005,'Babu',8989898994,'Babu@gmail.com',200);
Insert into customer (CUST_ID,CUST_NAME,MOB_NO,EMAIL,COUNTRY_ID) values (1006,'Radha',8989898995,'Radha@gmail.com',202);
Insert into customer (CUST_ID,CUST_NAME,MOB_NO,EMAIL,COUNTRY_ID) values (1007,'Senthil',8989898996,'Senthil@gmail.com',200);


create table region
(
Country_id	number(3),
Country_name varchar2(50)
);

Insert into region (COUNTRY_ID,COUNTRY_NAME) values (200,'INDIA');
Insert into region (COUNTRY_ID,COUNTRY_NAME) values (201,'CHINA');
Insert into region (COUNTRY_ID,COUNTRY_NAME) values (202,'USA');
Insert into region (COUNTRY_ID,COUNTRY_NAME) values (203,'SINGAPORE');
Insert into region (COUNTRY_ID,COUNTRY_NAME) values (204,'UK');

============================================
select * from region;

select * from customer order by country_id;

Inner Join:
------------

  -- implicit method

select
c.cust_id,
c.cust_name,
c.mob_no,
c.email,
c.country_id,
r.country_name
from customer c, region r
where c.country_id=r.country_id order by c.country_id;


Inner Join:
------------
  -- ANSI Method


select
c.cust_id,
c.cust_name,
c.mob_no,
c.email,
c.country_id,
r.country_name
from customer c inner join region r
on c.country_id=r.country_id order by c.country_id;

*******************************************************

Left Outer Join:
------------
select * from region;

select * from customer order by country_id;


-- select all from the left table and select matche from the right table
-- first table is left and second is right table
  -- implicit


select
c.cust_id,
c.cust_name,
c.mob_no,
c.email,
c.country_id,
r.country_name
from customer c, region r
where c.country_id=r.country_id(+);


Left Outer Join:
------------
  -- ANSI


select
c.cust_id,
c.cust_name,
c.mob_no,
c.email,
c.country_id,
r.country_name
from customer c Left Outer join region r
on c.country_id=r.country_id;


***************************************************************
Right Outer Join:
------------
select * from region;

select * from customer order by country_id;


-- select all from the right table and select matched from the left table 
  -- implicit


select
c.cust_id,
c.cust_name,
c.mob_no,
c.email,
c.country_id,
r.country_name
from customer c, region r
where c.country_id(+)=r.country_id order by c.country_id;


Right Outer Join:
------------
  -- ANSI


select
c.cust_id,
c.cust_name,
c.mob_no,
c.email,
c.country_id,
r.country_id region_country_id,
r.country_name
from customer c Right Outer join region r
on c.country_id=r.country_id order by c.country_id;

*****************************************************
Full Outer Join:
------------
select * from region;

select * from customer order by country_id;

  -- ANSI


select
c.cust_id,
c.cust_name,
c.mob_no,
c.email,
c.country_id,
r.country_id region_country_id,
r.country_name
from customer c Full Outer join region r
on c.country_id=r.country_id order by c.country_id;


--implicit method in full outer join
 
 select
c.cust_id,
c.cust_name,
c.mob_no,
c.email,
c.country_id,
r.country_id region_country_id,
r.country_name
from customer c, region r
where c.country_id=r.country_id(+)
union 
select
c.cust_id,
c.cust_name,
c.mob_no,
c.email,
c.country_id,
r.country_id region_country_id,
r.country_name
from customer c, region r
where c.country_id(+)=r.country_id;

 -----------------------------------------------------------




2 methods to write join query: 
==============================

1. Implicit method
2. ANSI Method

select * from employees;

select * from departments;

Inner Join:
------------
--- It displays only matching record.
  -- implicit method

select
e.employee_id,
e.first_name,
e.email,
e.SALARY,
e.department_id,
d.DEPARTMENT_NAME,
d.LOCATION_ID
from Employees e,departments d
where e.department_id=d.department_id;

Inner Join:
------------
  -- ANSI Method

select
e.employee_id,
e.first_name,
e.email,
e.SALARY,
e.department_id,
d.DEPARTMENT_NAME,
d.LOCATION_ID
from employees e inner join DEPARTMENTS d
on e.department_id=d.department_id;
  
------------------------------------------

-- Left Outer Join
 -- implicit method

select
e.employee_id,
e.first_name,
e.job_id,
e.salary,
e.department_id,
d.DEPARTMENT_NAME
from employees e, departments d
where e.department_id=d.department_id(+);

 -- ANSI Method

select
e.employee_id,
e.first_name,
e.job_id,
e.salary,
e.department_id,
d.DEPARTMENT_NAME
from employees e Left Outer join departments d
on e.department_id=d.department_id;

--------------------------------------------------------

-- Right outer join
-- implicit method
select
e.employee_id,
e.first_name,
e.job_id,
e.salary,
d.department_id,
d.DEPARTMENT_NAME
from employees e, departments d
where e.department_id(+)=d.department_id;

 -- ANSI Method
 select
e.employee_id,
e.first_name,
e.job_id,
e.salary,
e.department_id,
d.DEPARTMENT_NAME
from employees e Right Outer join departments d
on e.department_id=d.department_id;

 ********************************************************************************

--select the departmet_id where no employees are working

select
d.department_id,
d.DEPARTMENT_NAME
from employees e, departments d
where e.department_id(+)=d.department_id and e.employee_id is null;

================================================================================
 
 --------------------------------------------------------------------------------------------------
 -- Full Outer Join
-- -- ANSI Method
select
e.employee_id,
e.first_name,
e.job_id,
e.salary,
e.department_id,
d.DEPARTMENT_NAME
from employees e full join departments d
on e.department_id=d.department_id order by d.department_id;

 --------------------------------------------------------------------------------------------------
 --------------------------------------------------------------------------------

--Cross Join or Cartesian product

select * from departments;
select
e.employee_id,
e.first_name,
e.email,
e.SALARY,
e.department_id,
d.DEPARTMENT_NAME,
d.LOCATION_ID
from employees e, departments d;
--where e.department_id=d.department_id;

107*27=2889

--------------------------------------------------------------------------------
-- self Join


select * from employees;


select
e1.employee_id,
e1.first_name,
e1.manager_id,
'reports to',
e2.employee_id,
e2.first_name
from employees e1,employees e2
where e1.manager_id=e2.employee_id order by e1.employee_id;

SELECT 
	        e.employee_id,
	       e.first_name,
		   e.hire_date,
		   e.salary,
           e.MANAGER_ID,
		   m.first_name "Manager Name",
		   m.salary "M_Sal",
		   m.hire_date "M_hire_date"
	  FROM employees e,employees m
	  WHERE e.MANAGER_ID=m.EMPLOYEE_ID;

--------------------------------------------------------------------

--Non-Equi Join
select * from employees order by department_id;

select * from departments order by department_id;



select
e.employee_id,
e.first_name,
e.email,
e.SALARY,
e.department_id,
d.department_id,
d.DEPARTMENT_NAME,
d.LOCATION_ID
from employees e, departments d
where e.department_id!=d.department_id;

-------------------------------

NATURAL JOIN:
=============

 select * from employees natural join departments order by department_id;
--------------------------------------------

3 tables join
select * from EMPLOYEES;
select * from DEPARTMENTS;
select * from locations;

select
e.employee_id,
e.first_name,
e.job_id,
e.salary,
e.department_id,
d.DEPARTMENT_NAME,
d.location_id,
l.country_id
from employees e, departments d, locations l
where e.department_id=d.department_id and d.location_id=l.location_id and l.country_id='UK';

select
e.employee_id,
e.first_name,
e.job_id,
e.salary,
e.department_id,
d.DEPARTMENT_NAME,
d.location_id,
l.country_id,
c.COUNTRY_NAME
from employees e inner join departments d
on e.department_id=d.department_id 
inner join locations l 
on  d.location_id=l.location_id 
inner join COUNTRIES c on l.COUNTRY_ID=c.COUNTRY_ID
where l.country_id='CA' and e.salary >10000;
