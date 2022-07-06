CREATE DATABASE if not exists shop;

use shop;

SELECT * FROM users u ;

# 1. Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.

-- Первым делом обновлю данные в таблице на Null

DESC users ;

UPDATE users SET created_at = NULL, updated_at =NULL ; 

-- Установлю текущее время для created_at

UPDATE users SET created_at = CURRENT_TIMESTAMP, updated_at = CURRENT_TIMESTAMP;

# 2. Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения 
# в формате 20.10.2017 8:10. Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения.

-- Преобразую данные в указанных колонках в Varchar 

ALTER TABLE users 
	MODIFY updated_at VARCHAR(255),
	MODIFY created_at VARCHAR(255);
	
DESC users;

ALTER TABLE users 
	MODIFY updated_at DATETIME,
	MODIFY created_at DATETIME;

# 3. В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0,
# если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким образом, 
# чтобы они выводились в порядке увеличения значения value. Однако нулевые запасы должны выводиться в конце, после всех

SELECT * FROM storehouses_products sp ;

DESC storehouses_products ;

TRUNCATE storehouses_products;

-- добавляю данные
INSERT INTO storehouses_products (storehouse_id, product_id, value) VALUES (FLOOR(1 + RAND() * 100), FLOOR(1 + RAND() * 100), FLOOR(0 + RAND() * 5));

SELECT * FROM storehouses_products
  ORDER BY CASE WHEN value = 0 THEN 123456789 ELSE value END;

 # 1. Подсчитайте средний возраст пользователей в таблице users.
 
SELECT * FROM users u ;
DESC users;

SELECT FLOOR(AVG(TIMESTAMPDIFF(YEAR,birthday_at,CURDATE()))) AS avg_age FROM users;

# 2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. Следует учесть, что необходимы дни недели текущего года, 
# а не года рождения.

SELECT
    DAYNAME(CONCAT(YEAR(NOW()), '-', SUBSTRING(birthday_at, 6, 10))) AS week_day_of_birthday_in_this_Year,
    COUNT(*) AS amount_of_birthday
FROM
    users
GROUP BY 
    week_day_of_birthday_in_this_Year
ORDER BY
	amount_of_birthday DESC;











