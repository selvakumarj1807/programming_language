CREATE table std_detail 
(
std_name varchar2(20),
std_m1 number(10),
std_m2 number(10),
total_mark GENERATED ALWAYS as (std_m1+std_m2) VIRTUAL

);

insert into std_detail (std_name,std_m1,std_m2) values ('lela',10,20);

select * from std_detail;