##Cours SQL-Commandes de base

-- 0. Drop table INSTRUCTOR in case it already exists
__drop__
drop table INSTRUCTOR
;
--1. Create table INSTRUCTOR
__create__ 
CREATE TABLE INSTRUCTOR
  (ins_id INTEGER PRIMARY KEY NOT NULL, 
   lastname VARCHAR(15) NOT NULL, 
   firstname VARCHAR(15) NOT NULL, 
   city VARCHAR(15), 
   country CHAR(2)
  )
;
--2A. Insert single row for Rav Ahuja
INSERT INTO INSTRUCTOR
  (ins_id, lastname, firstname, city, country)
  VALUES 
  (1, 'Ahuja', 'Rav', 'Toronto', 'CA')
;
--2B. Insert the two rows for Raul and Hima
__insert__
INSERT INTO INSTRUCTOR
  VALUES
  (2, 'Chong', 'Raul', 'Toronto', 'CA'),
  (3, 'Vasudevan', 'Hima', 'Chicago', 'US')
;
--3. Select all rows in the table
SELECT * FROM INSTRUCTOR
;
--3b. Select firstname, lastname and country where city is Toronto
__where__
SELECT firstname, lastname, country from INSTRUCTOR where city='Toronto'
;
--4. Change the city for Rav to Markham
__update__
UPDATE INSTRUCTOR SET city='Markham' where ins_id=1
;
--5. Delete the row for Raul Chong
__delete__
DELETE FROM INSTRUCTOR where ins_id=2;

--Compter le nombre de lignes : 
__count__
SELECT COUNT( * ) from instructor WHERE city='Chicago';

--Compter le nombre de lignes unique: 
__distinct__ 
SELECT COUNT(DISTINCT country) from instructor where city = 'Chicago';

-- limiter les données retournées ici 1 : 
__limit__
SELECT * FROM instructor LIMIT(1);

--5b. Retrieve all rows from the table
SELECT * FROM INSTRUCTOR 
;
--retrieve firstnames begining by an 'R': 
__like__
SELECT * FROM instructor where like 'R%'; 

-- retrieve lines where values are between two numbers : 
__between and__
SELECT * FROM instructor where ins_id between 1 and 2; 

-- retrieve lines where city is toronto and chicago : 
__in__
SELECT * FROM instructor WHERE city in ('Toronto','Chicago');

-- sorting results sets : 
__order by__
_Ascending Order_ : by default  
_Descending Order_ : key word desc 
SELECT * FROM instructor ORDER BY lastname DESC
_select on which column we want to order the results (here on lastname)_ :
SELECT firstname, lastname FROM instructor ORDER BY 2; 



