USE shop;

# Выполнял только обязательные!!!
# Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение” --
# Задание 1 Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем. --

-- Сначало посмотрю --
SELECT * FROM users u ;

-- Обнулю значения в полях created_at и updated_at --
UPDATE users SET created_at = NULL, updated_at =NULL;

-- Установлю текущее время и дату -- 
UPDATE users SET created_at = CURRENT_TIMESTAMP, updated_at = CURRENT_TIMESTAMP;


# Задание 2. Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR и
# в них долгое время помещались значения в формате "20.10.2017 8:10". Необходимо преобразовать поля к типу DATETIME, 
#  сохранив введеные ранее значения.

-- проверю формат столбцов сейчас --
DESC users ;

-- преобразую в неудачно спроектированный --
ALTER TABLE users 
	MODIFY updated_at VARCHAR(255),
	MODIFY created_at VARCHAR(255);

-- преобразую в требуемый --
ALTER TABLE users 
	MODIFY updated_at DATETIME,
	MODIFY created_at DATETIME;

# Задание 3. В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 
# 0, если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким образом, 
# чтобы они выводились в порядке увеличения значения value. Однако, нулевые запасы должны выводиться в конце, после всех записей.

-- посмотрю что в таблице --
SELECT * FROM storehouses_products sp ;

-- так как таблица пустая, то надо ее наполнить данными. Нажимаю на ввод пока не достанет --
INSERT INTO storehouses_products (storehouse_id, product_id, value) VALUES (FLOOR(1 + RAND() * 100), FLOOR(1 + RAND() * 100), FLOOR(0 + RAND() * 5));

-- дальше применю сортировку предложенную на https://stackoverflow.com/, но не совсем разобрал работу --
SELECT * FROM storehouses_products
  ORDER BY CASE WHEN value = 0 THEN 123456789 ELSE value END;
 
# Задание 4. (первое во втором блоку): Подсчитайте средний возраст пользователей в таблице users
 
-- начну с вывода всего --
 SELECT * FROM users u ;

-- подсчитаю средний возраст --
SELECT FLOOR(AVG(TIMESTAMPDIFF(YEAR,birthday_at,CURDATE()))) AS avg_age FROM users;

# Задание 5. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
# Следует учесть, что необходимы дни недели текущего года, а не года рождения.
SELECT
    DAYNAME(CONCAT(YEAR(NOW()), '-', SUBSTRING(birthday_at, 6, 10))) AS week_day_of_birthday_in_this_Year,
    COUNT(*) AS amount_of_birthday
FROM
    users
GROUP BY 
    week_day_of_birthday_in_this_Year
ORDER BY
	amount_of_birthday DESC;










































