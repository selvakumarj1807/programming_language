-- Set OPERATORS:
-- =============
   -- it is used to retrive data from single or multiple tables.
  
  -- Types:
 --  ======
 -- UNION-It returns unique value and also sorting those values.
 --  UNION ALL-Unique + duplicate values
  -- INTERSECT-common values
 -- MINUS- returns values from first query those values not in second query.

create table t1(t1_id number(3));

create table t2(t2_id number(3));

select * from t1;

select * from t2;

insert into t1 (t1_id)values(2);
insert into t1 (t1_id)values(1);
insert into t1 (t1_id)values(1);
insert into t1 (t1_id)values(3);
insert into t1 (t1_id)values(4);
insert into t1 (t1_id)values(2);
insert into t1 (t1_id)values(5);

insert into t2 (t2_id)values(2);
insert into t2 (t2_id)values(1);
insert into t2 (t2_id)values(1);
insert into t2 (t2_id)values(3);
insert into t2 (t2_id)values(4);

-- Union:
-- =======

select * from t1 UNION select * from t2;

-- Union All:
-- ==========

select * from t1 UNION ALL select * from t2;

-- Intersect:
-- ==========

select * from t1 INTERSECT select * from t2;

-- Minus:
-- =====

select * from t1 MINUS select * from t2;



