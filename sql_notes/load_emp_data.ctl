LOAD DATA
INFILE 'C:\Users\selva\Documents\sql_notes\emp_data.dat'
TRUNCATE
INTO TABLE EMPS
fields terminated by ","
(
	emp_id,
	emp_name,
	dept_id
)