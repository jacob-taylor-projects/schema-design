INSERT INTO location (city,state,country)
	values ('Nashville','Tennessee','United States'),
('Memphis','Tennessee','United States'),
	('Pheonix','Arizona','United States'),
('Denver','Colorado','United States');

INSERT INTO person ("firstName","lastName" ,age,location_id) values
('Chickie','Ourtic',21,1),
('Hilton','O''Hanley',37,1),
('Barbe','Purver',50,3),
('Reeta','Sammons',34,2),
('Abbott','Fisbburne',49,1),
('Winnie','Whines',19,4),
('Samantha','Leese',35,2),
('Edouard','Lorimer',29,1),
('Mattheus','Shaplin',27,3),
('Donnell','Corney',25,3),
('Wallis','Kauschke',28,3),
('Melva','Lanham',20,2),
('Amelina','McNirlan',22,4),
('Courtney','Holley',22,1),
('Sigismond','Vala',21,4),
('Jacquelynn','Halfacre',24,2),
('Alanna','Spino',25,3),
('Isa','Slight',32,1),
('Kakalina','Renne',26,3);

INSERT INTO interest (title) values ('Programming'),('Gaming'),
('Computers'),
('Music'),('Movies'),('Cooking'),('Sports');

INSERT INTO person_interest (person_id,interest_id) values
(1,1),(1,2),(1,6),
(2,1),(2,7),(2,4),
(3,1),(3,3),(3,4),
(4,1),(4,2),(4,7),
(5,6),(5,3),(5,4),
(6,2),(6,7),
(7,1),(7,3),
(8,2),(8,4),
(9,5),(9,6),
(10,7),(10,5),
(11,1),(11,2),(11,5),
(12,1),(12,4),(12,5),
(13,2),(13,3),(13,7),
(14,2),(14,4),(14,6),
(15,1),(15,5),(15,7),
(16,2),(16,3),(16,4),
(17,1),(17,3),(17,5),(17,7),
(18,2),(18,4),(18,6),
(19,1),(19,2),(19,3),(19,4),(19,5),(19,6),(19,7);

UPDATE person set age=age+1
	WHERE "firstName"='Chickie';
UPDATE person set age=age+1
WHERE "firstName"='Winnie';
UPDATE person set age=age+1
WHERE "firstName"='Edouard';
UPDATE person set age=age+1
WHERE "firstName"='Courtney';
UPDATE person set age=age+1
WHERE "firstName"='Melva';
UPDATE person set age=age+1
WHERE "firstName"='Isa';
UPDATE person set age=age+1
WHERE "firstName"='Abbott';
UPDATE person set age=age+1
WHERE "firstName"='Reeta';


ALTER TABLE person_interest
DROP CONSTRAINT person_id;
ALTER TABLE person_interest
ADD CONSTRAINT person_id
FOREIGN KEY (person_id) REFERENCES person(id)
	ON DELETE CASCADE;

ALTER TABLE person_interest
DROP CONSTRAINT interest_id;
ALTER TABLE person_interest
ADD CONSTRAINT interest_id
FOREIGN KEY (interest_id) REFERENCES interest(id)
	ON DELETE CASCADE;

DELETE FROM person where "firstName"='Hilton';
DELETE FROM person where "firstName"='Alanna';


SELECT "firstName","lastName" from person;
SELECT "firstName","lastName",city,state from person
JOIN location ON person.location_id=location.id WHERE location.city='Nashville';

SELECT city,COUNT(*) from person
JOIN location ON person.location_id=location.id
	GROUP BY city;

SELECT title,COUNT(*) FROM person_interest
JOIN interest ON interest.id=person_interest.interest_id
GROUP BY title;

SELECT "firstName","lastName",city,state,title from person
JOIN location ON person.location_id=location.id
JOIN person_interest ON person.id=person_interest.person_id
JOIN interest ON person_interest.interest_id=interest.id
WHERE location.city='Nashville' AND interest.title='Programming';

SELECT 
    CASE 
        WHEN age BETWEEN 20 AND 30 THEN '20-30'
        WHEN age BETWEEN 30 AND 40 THEN '30-40'
        WHEN age BETWEEN 40 AND 50 THEN '40-50'
    END AS "range",
    COUNT(*) AS "count"
FROM 
    person
GROUP BY 
    CASE 
        WHEN age BETWEEN 20 AND 30 THEN '20-30'
        WHEN age BETWEEN 30 AND 40 THEN '30-40'
        WHEN age BETWEEN 40 AND 50 THEN '40-50'
    END;