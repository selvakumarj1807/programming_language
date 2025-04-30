

/*
1. What is a Synonym in Oracle SQL?
A Synonym is an alias (alternate name) for another database object like:

Table

View

Sequence

Procedure

Function

Package

This allows you to reference the object without using its full name or schema.


2. Types of Synonyms

Two types of synonyms:
----------------------

Private -	Available only to the user who created it
Public -	Available to all users in the database

3. Why Use Synonyms?
  1. Simplify access to remote or complex object names

  2. Hide object owner details (schema abstraction)

  3. Improve readability of code
*/

-- Creating a Private Synonym

CREATE SYNONYM emp FOR hr.employees;

SELECT * FROM emp;

-- Creating a Public Synonym

CREATE PUBLIC SYNONYM emp FOR hr.employees;

GRANT SELECT ON hr.employees TO PUBLIC;

-- Check another user

SELECT * FROM emp;

--------------------------------------------------------------------------------------------------
-- SYNONYM

        -- A synonym is a simple alias for a table,view,squence or other database objects.
        -- A public synonym that is available to evey user in a database.
        -- A private synonym is a synonym within the shema of a specific user.
        
    --Syntax
            -- CREATE [PUBLIC] SYNONYM [SCHEMA] SYNONYM_NAME FOR [SCHEMA] OBJECT

select * from employees;
   
create table employ as select * from employees;
   
select * from employ;

create synonym employ_synonym for employ;

desc employ_synonym;

select * from employ_synonym;

drop synonym employ_synonym;
   
