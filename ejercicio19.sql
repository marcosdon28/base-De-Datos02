
-- 1. Create a user data_analyst
CREATE USER data_analyst IDENTIFIED BY 'password';

-- 2. Grant permissions only to SELECT, UPDATE and DELETE to all sakila tables to it.

SHOW GRANTS FOR 'data_analyst'@'%';

GRANT SELECT, UPDATE, DELETE ON sakila.* TO 'data_analyst'@'%';

-- 3. Login with this user and try to create a table. Show the result of that operation.
USE sakila;

CREATE TABLE test(
    test_field INT(11) NOT NULL
);  
-- ERROR 1142 (42000): CREATE command denied to user 'data_analyst'@'localhost' for table 'test'

-- 4. Try to update a title of a film. Write the update script.
SELECT * FROM film LIMIT 10;
UPDATE film SET title = 'ACADEMY DINOSAUR 2' WHERE film_id = 28;

-- 5. With root or any admin user revoke the UPDATE permission.

REVOKE UPDATE ON sakila.* FROM data_analyst;

SHOW GRANTS FOR 'data_analyst'@'%';

-- 6. Login again with data_analyst and try again the update done in step 4. Show the result.
USE sakila;

SELECT * FROM film LIMIT 10;

UPDATE film SET title = 'Hola Mundo' WHERE film_id = 13;
-- ERROR 1142 (42000): UPDATE command denied to user 'data_analyst'@'localhost' for table 'film'
