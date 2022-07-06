USE vk;

/*
Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..
Определить кто больше поставил лайков (всего): мужчины или женщины.*/


-- Задание 1. Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений).--

# первым шагом найду пользователя у которого больше всего сообщений

SELECT to_user_id, COUNT(*) FROM messages m GROUP BY to_user_id ;

# теперь для пользователя под ID = 1 и проведем выборку

SELECT firstname, lastname FROM users u WHERE id = (SELECT from_user_id as id FROM (SELECT from_user_id, COUNT(from_user_id) as count_messages 
	FROM messages m WHERE to_user_id = 1 GROUP BY from_user_id 
	ORDER BY count_messages DESC LIMIT 1) AS Messages(from_user_id, count_messages));

-- Задание 2. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.. --

SELECT COUNT(*) FROM likes l WHERE user_id IN (SELECT user_id FROM profiles p WHERE (birthday + INTERVAL 10 YEAR) > NOW());


-- Задание 3. Определить кто больше поставил лайков (всего): мужчины или женщины. --

-- Повтрю решение с прошлого урока - добавлю колонку и женщину определю 0 --

ALTER TABLE likes ADD COLUMN gender BIT DEFAULT 1;

UPDATE likes SET gender = 0 WHERE user_id IN (SELECT user_id FROM profiles p WHERE gender = "f");

SELECT 
	CASE (gender)
         WHEN 1 THEN 'male'
         WHEN 0 THEN 'female'
    END AS gender,
   	COUNT(gender) 
FROM likes l 
GROUP BY gender;

-- В результате видим что женщины чаще лайкали --

























