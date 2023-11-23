CREATE TABLE CUS(CUS_ID NUMBER(3),CUS_NAME VARCHAR2(10));

INSERT INTO CUS (CUS_ID,CUS_NAME)VALUES(101,'RAM');
INSERT INTO CUS (CUS_ID,CUS_NAME)VALUES(101,'SAM');
INSERT INTO CUS (CUS_ID,CUS_NAME)VALUES(102,'JAM');
INSERT INTO CUS (CUS_ID,CUS_NAME)VALUES(103,'MAM');
INSERT INTO CUS (CUS_ID,CUS_NAME)VALUES(104,'BAM');

SELECT * FROM CUS;
SELECT COUNT (*)FROM CUS;
SELECT COUNT(DISTINCT CUS_NAME)FROM CUS;
SELECT COUNT(DISTINCT CUS_ID)FROM CUS;

SELECT DISTINCT CUS_ID FROM CUS;
SELECT DISTINCT CUS_NAME FROM CUS;

SELECT CUS_ID || Q'['S NAME IS]',CUS_NAME FROM CUS;

SELECT Q'[ID]',CUS_ID || Q'['S NAME IS]',CUS_NAME FROM CUS;

SELECT CUS_NAME FROM CUS WHERE CUS_NAME LIKE 'R%';

TRUNCATE TABLE CUS;