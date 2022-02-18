DESC sakila.film;
DESC sakila.actor;
DESC sakila.film_actor;
DESC sakila.language;

SELECT film_id, title
FROM sakila.film;

--------------------------3.Inside sakila db modify 2 film records values------------------------------------------------
UPDATE sakila.film
SET title = 'ACADEMY DINOSAUR 2'
WHERE film_id = 1;

SELECT film_id, 
		title
FROM sakila.film
WHERE film_id = 1;

UPDATE sakila.film
SET title = 'AMERICAN EGG'
WHERE film_id = 5;

SELECT film_id, 
		title
FROM sakila.film
WHERE film_id = 5;
--------------------------------------------------------------------------------------------------------------------------------
--------------------------4.	List of movies by actor------------------------------------------------
--List of actor and movies
SELECT CONCAT( a.first_name,' ', a.last_name) AS actor_name,
		f.title AS film_title
FROM sakila.film_actor fa 
INNER JOIN sakila.actor a 
ON a.actor_id = fa.actor_id
INNER JOIN sakila.film f 
ON f.film_id = fa.film_id;

--List of movies from a certain actor_id
SELECT f.title AS film_title
FROM sakila.film_actor fa 
INNER JOIN sakila.actor a 
ON a.actor_id = fa.actor_id
INNER JOIN sakila.film f 
ON f.film_id = fa.film_id
WHERE a.actor_id = 1;
--------------------------------------------------------------------------------------------------------------------------------
----------------------------5. Count number of movies per actor------------------------------------------------
SELECT CONCAT( a.first_name,' ', a.last_name) AS actor_name,
		COUNT(f.title) AS films
FROM sakila.film_actor fa 
INNER JOIN sakila.actor a 
ON a.actor_id = fa.actor_id
INNER JOIN sakila.film f 
ON f.film_id = fa.film_id
GROUP BY actor_name;

--------------------------------------------------------------------------------------------------------------------------------
----------------------------6.	Count movie languages------------------------------------------------
SELECT COUNT(DISTINCT(language_id)) AS unique_languages
FROM sakila.film;

SELECT COUNT(language_id) AS all_languages
from sakila.language;

--------------------------------------------------------------------------------------------------------------------------------
----------------------------7.	Calculate average cost for replacement of a film------------------------------------------------
SELECT AVG(replacement_cost) AS average_replacement_cost
from sakila.film;

--------------------------------------------------------------------------------------------------------------------------------
----------------------------8.	do a store procedure to update the film------------------------------------------------
CREATE PROCEDURE spSakila_UpdateFilm (IN id smallint, IN newTitle varchar(128))
   BEGIN
     	UPDATE sakila.film
		SET title = newTitle
		WHERE film_id = id;
   END
   
SELECT film_id, 
		title
FROM sakila.film
WHERE film_id = 1;

CALL spSakila_UpdateFilm(1,'ACADEMY DINOSAUR 3');

SELECT film_id, 
		title
FROM sakila.film
WHERE film_id = 1;

