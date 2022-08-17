USE sakila;

#1
SELECT *
FROM address ad
    INNER JOIN city ci USING(city_id)
    INNER JOIN country
WHERE ad.postal_code IN(
        SELECT postal_code
        FROM address
        WHERE
            address LIKE '%y'
            AND postal_code IN(
                SELECT
                    postal_code
                FROM address
                WHERE
                    postal_code LIKE '%9'
            )
    );


CREATE INDEX addressIndex ON address(postal_code);

DROP INDEX addressIndex ON address;

#2
#Marcos don
SELECT first_name
FROM actor;

SELECT last_name FROM actor;

#3 
CREATE FULLTEXT INDEX descIndex ON film(description);

DROP INDEX descIndex ON film;

SELECT f.description
FROM film f
WHERE
    f.description LIKE '%Epic%';

SELECT f.description
FROM film f
WHEREAdds the filetype django-html

    MATCH(f.description) AGAINST('Epic' IN NATURAL LANGUAGE MODE);
