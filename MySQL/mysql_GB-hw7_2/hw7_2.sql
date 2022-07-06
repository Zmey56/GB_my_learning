/* 

(по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). Поля from, to и label содержат английские названия городов, поле name — русское. Выведите список рейсов flights с русскими названиями городов.*/

USE shop;

-- Задание 1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине. --

# Проверю есть ли что в двух таблицах
SELECT * FROM users u ;
SELECT * FROM orders o ;
SELECT * FROM orders_products op ;

DESC orders ;

# Получается если есть хоть одна запись в таблице order, то это означает что был заказ. Добавлю случайных пользователей

INSERT INTO orders 
	(user_id)
VALUES
	(FLOOR(1 + RAND() * 7)),
	(FLOOR(1 + RAND() * 7)),
	(FLOOR(1 + RAND() * 7)),
	(FLOOR(1 + RAND() * 7)),
	(FLOOR(1 + RAND() * 7)),
	(FLOOR(1 + RAND() * 7)),
	(FLOOR(1 + RAND() * 7)),
	(FLOOR(1 + RAND() * 7)),
	(FLOOR(1 + RAND() * 7)),
	(FLOOR(1 + RAND() * 7)),
	(FLOOR(1 + RAND() * 7));

# Следующим шагом выберу только тех, у кого есть хоть один заказ 

SELECT name FROM users u WHERE id IN (SELECT user_id FROM orders o);

-- Задание 2. Выведите список товаров products и разделов catalogs, который соответствует товару. --

# Первым шагом проверю эти таблицы

SELECT * FROM products p ;
SELECT * FROM catalogs c ;
DESC products ;

# Вторым шагом выполню задание

SELECT name, (SELECT name FROM catalogs c WHERE catalog_id = id) AS catalogs FROM products p ;




















