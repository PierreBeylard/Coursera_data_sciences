--Supression d'une table 
drop table instructor;

-- Création d'une table 
CREATE table instructor (ins_id INT PRIMARY KEY not null,  lastname varchar(15) not null, firstname varchar(15) not null, city  varchar (15), country  CHAR(2));

--insérer une ligne de données 
INSERT INTO instructor (ins_id,lastname,firstname,city,country)VALUES ('1','Ahuja','Rav','Toronto','CA') ;

SELECT * FROM instructor;

-- insérer plusieurs lignes de données
INSERT INTO instructor (ins_id,lastname,firstname,city,country)VALUES ('2','Chong','Raul','Toronto','CA'),('4','Vasan','Hima','Chicago','US');

-- Select the firstname, lastname and country where the city is Toronto;
SELECT lastname,firstname,country FROM instructor where city='Toronto';

--Update the row for Rav Ahuja and change his city to Markham 
 UPDATE instructor  SET city = 'Markham' WHERE lastname='Ahuja'; 
 
 --Delete the row for Raul Chong from the table.
 DELETE FROM instructor WHERE lastname='Chong';
 
--Compter le nombre de lignes : 
SELECT COUNT(*) from instructor WHERE city='Chicago';

--Compter le nombre de lignes unique: 
SELECT COUNT(DISTINCT country) from instructor where city = 'Chicago';

-- limiter les données retournées ici 1 : 
SELECT * FROM instructor 	LIMIT(1);
