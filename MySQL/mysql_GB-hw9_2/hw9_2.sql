
/* Решил перевести сразу все на English*/
/* Task 1.1. The shop and sample databases contain the same tables, 
 * the training database. Move the entry id = 1 from the shop table.users to 
 * the sample table.users. Use transactions.*/

# The first step was to create a sample database and fill it with the same data as in shop
DROP DATABASE IF EXISTS sample;
CREATE DATABASE sample;

use shop;

SELECT * FROM users u ;

SELECT * FROM sample.users u ;

START TRANSACTION;
INSERT INTO sample.users SELECT * FROM shop.users WHERE id = 1;
COMMIT;

SELECT * FROM users;

/* Task 1.2. Create a view that outputs the name of the item name from the products 
 * table and the corresponding name of the name catalog from the catalogs table. */


USE shop;

# use join 
CREATE VIEW name_cat AS
	(SELECT p.name, c.name AS cat_name
	FROM products p 
	JOIN catalogs c ON p.catalog_id = c.id );

# let's check it out

SELECT * FROM name_cat ;

Создайте двух пользователей которые имеют доступ к базе данных shop. 
Первому пользователю shop_read должны быть доступны только запросы на чтение данных, 
второму пользователю shop — любые операции в пределах базы данных shop.

/* Task 2.1. Create two users who have acess to the sop database. The first user of shop_read should only be able to read data requests, 
 * the second user of shop_reader shold be able to perform any operations within shop database.
 */ 

# create two users
CREATE USER 'shop_read'@'localhost' IDENTIFIED WITH sha256_password BY '123';
CREATE USER 'shop'@'localhost' IDENTIFIED WITH sha256_password BY '123';

GRANT ALL ON shop.* TO 'shop'@'localhost';
GRANT GRANT OPTION ON shop.* TO 'shop'@'localhost';

/* */


-- ex 01 с использ. IF ELSE
DROP PROCEDURE IF EXISTS hello;
DELIMITER //
CREATE PROCEDURE hello()
BEGIN
	IF(CURTIME() BETWEEN '06:00:00' AND '12:00:00') THEN
		SELECT 'Доброе утро';
	ELSEIF(CURTIME() BETWEEN '12:00:00' AND '18:00:00') THEN
		SELECT 'Добрый день';
	ELSEIF(CURTIME() BETWEEN '18:00:00' AND '00:00:00') THEN
		SELECT 'Добрый вечер';
	ELSE
		SELECT 'Доброй ночи';
	END IF;
END //

CALL hello();

/* Task 3.2. There are two text fields in the products table: name with the product name and description with its description. 
 * The presence of both fields or one of them is allowed. The situation when both fields take an undefined NULL value is unacceptable. 
 * Using triggers, make sure that one of these fields or both fields are filled in. If you try to assign a NULL value to the fields, you must cancel the operation 
*/

-- *************** ex 02 ***************
-- ex 2. В таблице products есть два текстовых поля: name с названием товара и description с его описанием. 
-- Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное
-- значение NULL неприемлема. Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля
-- были заполнены. При попытке присвоить полям NULL-значение необходимо отменить операцию.

DROP TRIGGER IF EXISTS nullTrigger;
DELIMITER //
CREATE TRIGGER nullTrigger BEFORE INSERT ON products
FOR EACH ROW
BEGIN
	IF(ISNULL(NEW.name) AND ISNULL(NEW.description)) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'NULL in both fields!';
	END IF;
END //

INSERT INTO products (name, description, price, catalog_id)
VALUES (NULL, NULL, 4000, 2); 

INSERT INTO products (name, description, price, catalog_id)
VALUES ("GeForce GTX 1080", NULL, 15000, 12); 

INSERT INTO products (name, description, price, catalog_id)
VALUES ("GeForce GTX 1080", "Мощная видеокарта", 15000, 12); 






