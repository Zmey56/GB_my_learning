use vk;

/* 
 * Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..
 * Определить кто больше поставил лайков (всего): мужчины или женщин
 */
-- Задание 1. Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека,-- 
-- который больше всех общался с выбранным пользователем (написал ему сообщений).-- 
SELECT to_user_id, COUNT(*) FROM messages m GROUP BY to_user_id ;

# Добавлю людей, которые общались со вторым
INSERT INTO messages (from_user_id, to_user_id, body) VALUES (FLOOR(1 + RAND() * 5), 2, 'Hello');

# Найдем кто максимально общался с пользователем 2 и выведем его имя

SELECT CONCAT(u2.firstname,' ',u2.lastname) as name
FROM users u2 
JOIN (SELECT user_id, COUNT(*) as value
	FROM
(SELECT m.from_user_id as user_id
FROM users u 
JOIN messages m ON u.id = m.to_user_id
WHERE u.id = 1 AND m.from_user_id != 1 # выбираем пользователя и убираем его сообщения себе же
UNION ALL # в отличие от прошлого раза возьму не только тех, кто ему писал, но и так же тех кому он писал
SELECT m.from_user_id as user_id
FROM users u 
JOIN messages m ON u.id = m.from_user_id
WHERE u.id = 1 AND m.to_user_id != 1) AS all_mess # выбираем пользователя и убираем его сообщения себе же
GROUP BY user_id
ORDER BY value DESC
LIMIT 1) as all_mess_max ON u2.id = all_mess_max.user_id;

# кажется перемудрил

-- Задание 2. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.. --

SELECT COUNT(*) 
FROM likes l
JOIN profiles p ON l.user_id = p.user_id
WHERE (p.birthday + INTERVAL 10 YEAR) > NOW();


-- Задание 3. Определить кто больше поставил лайков (всего): мужчины или женщин --

# Сначало удалим вспомогательную колонку сделанную в прошлом задании

ALTER TABLE likes DROP COLUMN gender;

# пол сидит в profiles
SELECT * FROM profiles p ;

SELECT gender, COUNT(*) 
FROM profiles p
JOIN likes l ON p.user_id = l.user_id 
GROUP BY gender ;






































