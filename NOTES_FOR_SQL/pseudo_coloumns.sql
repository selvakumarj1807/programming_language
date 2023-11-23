-- PSEUDO - COLOUMS
    
    -- IT BEHAVES LIKE A TABLE COLUMN BUT IS NOT ACTUALLY STORED IN THE TABLE
    -- YOU CANNOT DO DML OPRATION
    -- IT IS ALSO CALLED AS SYSTEM VARIABLE
    -- USED TO GET THE SYSTEM RELATED DATA
    
-- TYPES OF PSEUDO-COLOUMNS
    -- ROWID
        -- UNIQUE NUMBER GENARATED BY THE ORACLE FOR EACH DATA OR OBJECT AND HAS 18 DIGIT IN LENGTH.
        
         select rowid,e.* from employees e;

        
    -- ROWNUM
        -- NUMBER TO THE ROWS  IN THE ORDER THEY ARE INSERTED IN THE DATABASE
        
                 select rownum,e.* from employees e;

        
    -- SYSDATE
        -- TO FIND THE CURRENT DATE OF OUR SYSTEM
        
        select sysdate from dual;
        
    -- SYSTIMESTAMP
        -- TO FIND THE CURRENT DATE AND TIME OF OUR SYSTEM
        
                select systimestamp from dual;

        
    -- USER
        -- TO PULL THE NAME OF THE CURRENT USER OF OUR DATABASE
        
                select user from dual;
                
                select * from all_users;


    -- UID
        -- TO GET THE CURRENT USER ID FROM THE DATABASE
        
                        select uid from dual;

        
    -- DISTINCT / UNIQUE
        -- USED TO REMOVE THE DUPLICATE FROM THE RESULT
        
        select department_id from employees where department_id=30;
        
        select distinct department_id from employees where department_id=30;