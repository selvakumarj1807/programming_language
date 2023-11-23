INDEX 

    It is used to improve the performance of the query or used to reduce the cost of the query
    
TYPES OF INDEX 

    1.B-Tree Index 
    2.Bitmap Index 
    3.Composite Index
    4.Unique Index 
    5.Function based Index 
    6.Index organized table
    
--__________________________________________________________
1.B-Tree Index

    -- Balanced tree index, (ie) it is an ordered list of values that are divided into Range associated with rowid 
    -- It is created on high cardinality column/s 
	-- high cardinality column/s  = Unique RECORS in a column/s
    
Syntax:
    Create index index_name on table_name(column_name);

select * from employees;
   
create table employ as select * from employees;
   
select * from employ;

select * from employ where first_name='David';

create index idx_1 on employ(first_name);

select * from user_indexes;

select * from user_indexes where table_name='EMPLOY';

select * from user_ind_columns where table_name='EMPLOY';


--_________________________________________


2.Bitmap index

    -- Stores the data in a form of bitmap array .ie. stores the index key column in formation along with its rowid
    -- It is created on low cardinality columns
    -- low cardinality columns = large number of duplicate records in a columns
    
Syntax:
    Create bitmap index index_name on table_name(column_name);
    
--______________________________

3.Composite Index

    -- Created on multiple columns in a table
    -- It is also called as concatenated index
    
Syntax:
    Create index index_name on table_name(column_name(1),,,...,,column_name(n));
    
--______________________________

4.Unique Index

    -- Does not allow duplicate values and allow null values

    
Syntax:
    Create unique index index_name on table_name(column_name(1),,,...,,column_name(n));
    
--______________________________

5.Function based Index

    -- If an index is created using the function or expression or expression then it is function based index
    -- It can be either B-tree index or a Bit-map index

    
Syntax:
    Create index index_name on table_name(Function | Expreeion);
    
--______________________________

6.Index Organized Table

    -- Organizing the data at the time of inserting
    -- You must have primary key on the table
    -- Cannot able to partition an index organized table

    
Syntax:
    Create table table_name(column_name datatype,,,..,,,columnname datatype) organization index ;
    
--______________________________






