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
   
