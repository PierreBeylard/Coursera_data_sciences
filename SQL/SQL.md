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

## PRIMARY AND FOREIGN KEY 
__referencing__ is a relationship between table. example : table book and table author: To look up the author information, the book entity refers to the author entity. To look up the book information, the author entity refers to the book entity. 
__A primary key__ uniquely identify each row of table.
__A foreign key__ is a set of columns referring to a primary key of another table
__Parent table__ A table containing a primary key that is related to at least one foreign key is called a parent table. 
__dependent or child table__ A table containing one or more foreign keys is called a dependent table. It might also be referred to as a child table.

## CONSTRAINTS - 6 in total  
__entity integrity constraint__: similar to _primary key constraint_ or _unique constraint_.The primary key is a unique value that identifies each topple or row in a table. CANNOT ACCEPT NULL VALUES
__referential integrity constraint__: The Referential Integrity Constraint ensures the validity of the data using a combination of Primary Keys and Foreign Keys.It defines relationships between tables and ensures that these relationships remain valid
__semantic integrity constraint__: The semantic integrity constraint is related to the correctness of the data. Avoid garbage value in table (**$ùù^ in age column violate the semantic integrity constraint)
__domain constraint__ : A domain constraint specifies the permissible values for a given attribute. for example : age must contain digits and no varchar
__null constraint__ :The null constraint specifies that attribute values cannot be null.
__check constraint__: The check constraint enforces domain integrity by limiting the values that are accepted by an attribute. example in the relation book, the attribute year is the year in which a particular book is published. If this was still the year 2010, it would not be meaningful to have a year greater than the current year. 


## JOIN ON MULTIPLE TABLE 

__inner join__ : display only the rows that match the criteria - SELECT B.BORROWER_ID, B.LAST_NAME, L_BORROWER_ID, L_LOAN_DATE from BORROWER B INNER JOIN LOAN L ON B.BORROWER_ID = L.BORROWER_ID;  
SELECT B.BORROWER_ID, B.LAST_NAME, L_BORROWER_ID, L_LOAN_DATE,C_STATUS from BORROWER B INNER JOIN LOAN L ON B.BORROWER_ID = L.BORROWER_ID INNER JOIN COPY CON L.COPY_ID=C.COPY_ID;
__outer join__ : 3 types of outer joins 
_left outer join or left join_ display all rows of left table and matching rows from right table  SELECT B.BORROWER_ID, B.LAST_NAME, L_BORROWER_ID, L_LOAN_DATE from BORROWER B LEFT JOIN LOAN L ON B.BORROWER_ID = L.BORROWER_ID
_right outer join or right join_ display all rows of right table and matchin rows form left table  SELECT B.BORROWER_ID, B.LAST_NAME, L_BORROWER_ID, L_LOAN_DATE from BORROWER B RIGHT JOIN LOAN L ON B.BORROWER_ID = L.BORROWER_ID
_full outer join or full join_ : return all rows from both tables SELECT B.BORROWER_ID, B.LAST_NAME, L_BORROWER_ID, L_LOAN_DATE from BORROWER B FULL JOIN LOAN L ON B.BORROWER_ID = L.BORROWER_ID
