-- SEQUENCE

    -- sequence is a database object that is used to generate unique numbers
    -- mainly used to generate the sequences to the PK columns
    -- it can be used in any columns of any table
    
-- SYNTAX
    
    CREATE SEQUENCE <SEQUENCE_NAME>
    START WITH <STARTVAL>
    INCREMENT BY <INCREMENTVAL>
    MINVALUE <MINVAL> | NOMINVALUE
    MAXVALUE <MAXVAL> | NOMAXVALUE
    CYCLE | NOCYCLE
    CACHE <CACHE_VAL> | NOCACHE
    ORDER | NOORDER;
    
    
-- CYCLE

        To allow the sequence to generate value after it reaches the limit.(i.e) from the starting
        
-- CACHE

        will pre-allocate and keep in the memory for access
        
        (ceil (maxvalue - minvalue)) / abs(increment)
        
--Alter sequence

    ALTER SEQUENCE <SEQUENCE_NAME>
    INCREMENT BY <INCREMENTVAL>
    MINVALUE <MINVAL> | NOMINVALUE
    MAXVALUE <MAXVAL> | NOMAXVALUE
    CYCLE | NOCYCLE
    CACHE <CACHE_VAL> | NOCACHE
    ORDER | NOORDER;
    
    -- ONCE THE SEQUENCE IS STARTED , IT IS NOT POSSIBLE TO ALTER / CHANGE THE START VALUE
--___________________________________________________________________________
-- Exmple1:

create sequence seq1
start with 1
increment by 1
minvalue 1
maxvalue 3;

select seq1.nextval from dual;

select seq1.currval from dual;

drop sequence seq1;

--______________________________________

--Example 2:

select ceil(3 - 1)/abs(1) from dual; --2 put in the cache value

create sequence seq1
start with 1
increment by 1
minvalue 1
maxvalue 3
cycle
cache 2;

select seq1.nextval from dual;

select seq1.currval from dual;

drop sequence seq1;

--___________________________

CREATE TABLE A1(A1_ID NUMBER (10),A1_NAME VARCHAR2 (20),A1_AGE NUMBER (2));

SELECT * FROM A1;

INSERT INTO A1 VALUES (seq1.nextval,'NAME1',10);

SELECT * FROM A1;

INSERT INTO A1 VALUES (seq1.nextval,'NAME2',20);

INSERT INTO A1 VALUES (seq1.nextval,'NAME3',30);

INSERT INTO A1 VALUES (seq1.nextval,'NAME4',40);

SELECT * FROM A1;

DROP TABLE A1;

drop sequence seq1;

--__________________________________________


